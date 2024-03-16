local assets =
{
    Asset("ANIM", "anim/dubloon.zip"),
    Asset("IMAGE", "images/slotm_inventory.tex"),
    Asset("ATLAS", "images/slotm_inventory.xml"),
}

local prefabs =
{

}

local function shine(inst)
    -- if inst.task then
    -- inst.task:Cancel()
    inst.task = nil
    -- end

    if inst.components.floater:IsFloating() then
        inst.AnimState:PlayAnimation("sparkle_water")
        inst.AnimState:PushAnimation("idle_water")
    else
        inst.AnimState:PlayAnimation("sparkle")
        inst.AnimState:PushAnimation("idle")
    end

    if inst.entity:IsAwake() then
        inst.task = inst:DoTaskInTime(4 + math.random() * 5, shine)
    end
end

local function onwake(inst)
    inst.task = inst:DoTaskInTime(4 + math.random() * 5, function() shine(inst) end)
end

local function onsleep(inst)
end

local function fn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddPhysics()
    inst.entity:AddNetwork()

    inst.OnEntityWake = onwake
    inst.OnEntitySleep = onsleep

    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, "med", nil, 0.68)

    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst.AnimState:SetBank("dubloon")
    inst.AnimState:SetBuild("dubloon")
    inst.AnimState:PlayAnimation("idle")

    inst.pickupsound = "metal" --New pickup sounds!

    inst:AddTag("currency")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("edible") --Now feedable to moles again, by request!
    inst.components.edible.foodtype = "ELEMENTAL"
    inst.components.edible.hungervalue = 1

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")

    inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/slotm_inventory.xml"

    inst:AddComponent("tradable")

    inst:AddComponent("bait")

    MakeHauntableLaunchAndSmash(inst)

    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)

    local ATTACHDIST = 2

    inst:DoPeriodicTask(30, function(inst)
        local x, y, z = inst.Transform:GetWorldPosition()
        local players = TheSim:FindEntities(x, y, z, 80, { "player" })
        inst.target = players[#players >= 2 and math.random(#players) or 1]
    end, math.random())

    local function OnUpdate(inst, dt)
        if inst.target and inst.target:IsValid() and inst.target.components.inventory ~= nil and inst.components.inventoryitem:GetGrandOwner() == nil and inst.target.components.inventory:CanAcceptCount(inst) > 0 then
            local dist = inst:GetDistanceSqToInst(inst.target)
            if dist < 100 * 100 then
                if dist < ATTACHDIST * ATTACHDIST then
                    inst.target.components.inventory:GiveItem(inst, nil, inst:GetPosition())
                else
                    local x, y, z = inst.target.Transform:GetWorldPosition()
                    local angle = inst:GetAngleToPoint(x, y, z) * DEGREES
                    local dist = math.sqrt(dist)
                    local speed = math.max(Remap(dist, 0, 10, 20, 1) * dt, 10 * dt)
                    if speed > 0 then
                        local offset = Vector3((speed * math.cos(angle)) * 3, 0, (-speed * math.sin(angle)) * 3)
                        local x1, y1, z1 = inst.Transform:GetWorldPosition()
                        inst.Transform:SetPosition(x1 + offset.x, 0, z1 + offset.z)
                    end
                end
            end
        end
    end

    inst:AddComponent("updatelooper")
    inst.components.updatelooper:AddOnUpdateFn(OnUpdate)

    return inst
end

return Prefab("dubloon", fn, assets, prefabs)
