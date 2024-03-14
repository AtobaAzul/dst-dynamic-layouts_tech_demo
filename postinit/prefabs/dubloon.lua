AddPrefabPostInit("dubloon", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(GLOBAL.COLLISION.WORLD)

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
                    local angle = inst:GetAngleToPoint(x, y, z) * GLOBAL.DEGREES
                    local dist = math.sqrt(dist)
                    local speed = math.max(GLOBAL.Remap(dist, 0, 10, 20, 1) * dt, 10 * dt)
                    if speed > 0 then
                        local offset = GLOBAL.Vector3((speed * math.cos(angle)) * 3, 0, (-speed * math.sin(angle)) * 3)
                        local x1, y1, z1 = inst.Transform:GetWorldPosition()
                        inst.Transform:SetPosition(x1 + offset.x, 0, z1 + offset.z)
                    end
                end
            end
        end
    end

    inst:AddComponent("updatelooper")
    inst.components.updatelooper:AddOnUpdateFn(OnUpdate)
end)
