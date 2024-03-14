AddPrefabPostInit("wall_stone", function(inst)
    inst.AnimState:SetBuild("wall_dungeon")
    inst:DoPeriodicTask(1, function(inst)
        inst.AnimState:PlayAnimation("fullA")
    end)
    --inst.AnimState:SetMultColour(0.75, 0.45, 0, 1)
    inst:RemoveComponent("workable")
    inst:AddTag("NOTARGET")
    inst:AddTag("notarget")
    inst:AddTag("NOCLICK")

    if not GLOBAL.TheWorld.ismastersim then return end

    inst.components.health.absorb = 1
end)
