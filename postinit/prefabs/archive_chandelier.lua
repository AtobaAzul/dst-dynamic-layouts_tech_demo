AddPrefabPostInit("archive_chandelier", function(inst)
    inst.AnimState:SetBuild("chandelier_wxdungeon")
    inst:PushEvent("arhivepoweron")
    inst.Light:SetIntensity(.1)
    inst.widthscale = 2
    inst:DoTaskInTime(1, function(inst)
        if inst.updatelight then
            inst.updatelight(inst)
        end
    end)

    if not GLOBAL.TheWorld.ismastersim then
        return
    end

    inst.components.playerprox:SetDist(44, 50) --15,17
end)

AddPrefabPostInit("chandelier_fire", function(inst)
    inst.AnimState:SetMultColour(1, 0.5, 0, 1)
end)
