local DUNGEON_CC =
{
    day = "images/colour_cubes/summer_dusk_cc.tex",
    dusk = "images/colour_cubes/summer_dusk_cc.tex",
    night = "images/colour_cubes/summer_dusk_cc.tex",
    full_moon = "images/colour_cubes/summer_dusk_cc.tex",
}

AddPlayerPostInit(function(inst)
    inst.components.playervision:SetCustomCCTable(DUNGEON_CC)

    inst:DoTaskInTime(0, function(inst)
        inst.Transform:SetPosition(0, 0, 0)
    end)


    if not GLOBAL.TheWorld.ismastersim then return end

    inst.components.eater:SetAbsorptionModifiers(1, 1, 1)
    inst.components.combat:SetAttackPeriod(0)

    inst:ListenForEvent("death", function(inst)
        local all_dead = true

        for k, v in pairs(GLOBAL.AllPlayers) do
            if v.components.health ~= nil and not v.components.health:IsDead() then
                all_dead = false
            end
        end

        if all_dead then
            inst:DoTaskInTime(5, function()
                GLOBAL.c_regenerateshard()
            end)
        end
    end)

    inst.components.grue:AddImmunity("nogrue")
end)
