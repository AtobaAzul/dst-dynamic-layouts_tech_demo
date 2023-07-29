local prefabs = {
    "lavaarena_portal_activefx",
    "lavaarena_portal_player_fx",
}

TheSim:LoadPrefabs(prefabs)

local presets =
{
    {
        knight = 1.875 / 10,
        knight_nightmare = 1.875 / 10,
        rook = 1.875 / 10,
        rook_nightmare = 1.875 / 10,
        bishop_nightmare = 1.25 / 10,
        bight = 1.25 / 10,
        knook = 1.25 / 10,
        roship = 1.25 / 10,
    },
    {
        spider = 3,
        spider_warrior = 2,
        spider_dropper = 2,
        spider_healer = .5,
        spider_moon = 2,
        spider_spitter = 1,
        spiderqueen = 0.125,
    },
    {
        hound           = 2,
        icehound        = 1,
        firehound       = 1,
        magmahound      = .5,
        glacialhound    = .5,
        sporehound      = .5,
        lightninghound  = .5,
        warg            = .25,
        mutatedhound    = 1,
        hedgehound      = 3,
        warglet         = .5,
        claywarg        = .25,
        gingerbreadwarg = .25,
    },
    {
        pigman = 1,
        pigguard = 1,
        koalefant_summer = 0.125,
        beefalo = 0.25,
        lightninggoat = 1,
        alpha_lightninggoat = 0.25,
        tallbird = 0.5,
    },
    {
        worm = 1,
        shockworm = 0.1,
        viperworm = 0.25,
    },
    {
        shadowthrall_wings = 0.125,
        shadowthrall_horns = 0.125,
        shadowthrall_hands = 0.125,
        shadow_bishop = 0.25,
        shadow_rook = 0.25,
        shadow_knight = 0.25,
        fused_shadeling = 0.5,
        crawlingnightmare = 1,
        nightmarebeak = 0.5,
        swilson = 0.5,
    },
    {
        leif = 0.25,
        mandrake_active = 0.1,
        grassgator = 0.5,
        lunarthrall_plant = 0.5,
        lordfruitfly = 0.5,
    },
    {
        powder_monkey = 0.9,
        boat_cannon = 0.1,
    }
}

local boss =
{
    stalker = 1,
    deerclops = 1,
    bearger = 1,
    mock_dragonfly = 1,
    daywalker = 1,
    alterguardian_phase1 = 0.25,
    moonmaw_dragonfly = 0.25,
    hoodedwidow = 1,
}

--This is a mess and I hate it.
local function SpawnDungeonMob(inst, prefab)
    local x, y, z = inst.Transform:GetWorldPosition()
    local x, z = x + math.random(-8, 8), z + math.random(-8, 8)

    TheWorld:DoTaskInTime(math.random(), function()
        local fx = SpawnPrefab("lavaarena_portal_activefx")

        fx.Transform:SetPosition(x, y + 0.1, z)

        fx:DoTaskInTime(1, function(inst)
            local fx2 = SpawnPrefab("lavaarena_portal_player_fx")
            fx2.Transform:SetPosition(inst.Transform:GetWorldPosition())

            local mob = SpawnPrefab(prefab)

            mob:Hide()

            if mob.DynamicShadow ~= nil then
                mob.DynamicShadow:Enable(false)
            end

            mob:DoTaskInTime(0.3, function(inst)
                inst:Show()

                if inst.DynamicShadow ~= nil then
                    inst.DynamicShadow:Enable(true)
                end
            end)
            mob.Transform:SetPosition(x, y, z)

            if mob.components.combat ~= nil then
                mob:AddTag("dungeon_mob")
                mob:AddTag("hostile")
                mob:DoTaskInTime(0, function(inst)
                    inst.components.combat:SuggestTarget(inst:GetNearestPlayer())
                end)

                mob.components.health:SetMaxHealth(mob.components.health.currenthealth * math.max((TheWorld.escalation_mult / 25), 1))
                mob.components.combat.externaldamagemultipliers:SetModifier(mob, math.max((TheWorld.escalation_mult / 25), 1), "dungeon_scaling")

                mob:ListenForEvent("death", function(inst)
                    local x, y, z = inst.Transform:GetWorldPosition()
                    inst:DoTaskInTime(0, function(inst)
                        local ents = TheSim:FindEntities(x, y, z, 64, { "dungeon_mob" })
                        local num = 0
                        local regen = true
                        for k, v in ipairs(ents) do
                            if v.components.health ~= nil and not v.components.health:IsDead() or v.sg ~= nil and v.sg:HasStateTag("dead") then
                                num = num + 1
                            end
                        end
                        local spawner_count = 0
                        local spawned = false
                        if num == 0 then
                            c_remote("c_save()")
                            for k, v in pairs(Ents) do
                                if spawner_count >= 5 then
                                    break
                                end

                                if v.prefab == "dl_spawner" and FindEntity(inst, 480, nil, { "room_mobspawner" }) then
                                    spawned = true
                                    regen = false
                                    spawner_count = spawner_count + 0.5

                                    v:DoTaskInTime(spawner_count, function()
                                        v:PushEvent("spawn_dl_clockwork_dungeon", { angle_override = v.angle_away, file_path_override = TUNING.DL_TD.MODROOT .. "scripts/clockwork_dungeon.json" })
                                    end)

                                end
                            end

                            for k, v in pairs(AllPlayers) do
                                for i = 0, TheWorld.escalation_mult * 0.66 do
                                    v.components.inventory:GiveItem(SpawnPrefab("dubloon"), nil, v:GetPosition())
                                end
                            end

                            if regen ~= false then
                                TheNet:Announce("The dungeon shifts!")

                                EmptyTheWorld()
                                TheWorld:PushEvent("revertterraform", "clockwork_dungeon")
                                TheWorld.escalation_mult = TheWorld.escalation_mult * 2
                                for k, v in pairs(AllPlayers) do
                                    v.Transform:SetPosition(0, 0, 0)
                                    v.components.health:SetInvincible(true)
                                end
                            else
                                if math.random() > 0.25 then
                                    TheWorld.escalation_mult = TheWorld.escalation_mult + ((math.random() / 2) * (#AllPlayers / 2))
                                    TheNet:Announce("Threat level increased! " .. tostring(RoundToNearest(TheWorld.escalation_mult, 0.05)))
                                end
                                if spawned then
                                    TheNet:Announce("The dungeon grows...")
                                end
                            end
                        end
                    end)
                end)
            end

            fx.AnimState:PlayAnimation("portal_pst")
            fx:ListenForEvent("animover", fx.Remove)
        end)
    end)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst.entity:SetPristine()


    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddTag("room_mobspawner")

    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(16, 20)
    inst.components.playerprox:SetOnPlayerNear(function(inst, player)
        local tx, ty = TheWorld.Map:GetTileCoordsAtPoint(inst.Transform:GetWorldPosition())
        local tile = WORLD_TILES.TRIM

        for _x = -2, 2 do
            for _y = -1, 1 do
                TheWorld:DoTaskInTime(math.random(), function()
                    TheWorld.Map:SetTile(tx + _x, ty + _y, tile)
                end)
            end
        end

        for _x = -1, 1 do
            for _y = -2, 2 do
                TheWorld:DoTaskInTime(math.random(), function()
                    TheWorld.Map:SetTile(tx + _x, ty + _y, tile)
                end)
            end
        end

        local preset = presets[math.random(#presets)]
        if TheWorld.escalation_mult == nil then
            TheWorld.escalation_mult = 1
        end

        if TheWorld.escalation_mult >= 15 and math.random() > 0.9 then
            SpawnDungeonMob(inst, weighted_random_choice(boss))
        else
            for i = 1, math.clamp(math.clamp(math.random(TheWorld.escalation_mult) * GetRandomWithVariance(1, 0.25), TheWorld.escalation_mult / 2, 15), 1, 15) do
                SpawnDungeonMob(inst, weighted_random_choice(preset))
            end
        end

        inst:Remove()
    end)
    inst.components.playerprox:SetPlayerAliveMode(inst.components.playerprox.AliveModes.AliveOnly)

    return inst
end

local function fn_remover()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst.entity:SetPristine()


    if not TheWorld.ismastersim then
        return inst
    end

    inst:DoPeriodicTask(5, function(inst)
        local x, y, z = inst.Transform:GetWorldPosition()
        local walls = TheSim:FindEntities(x, y, z, 5, { "wall" })
        for k, v in pairs(walls) do
            v:Remove()
        end
    end, 0)

    return inst
end


return Prefab("room_mobspawner", fn, nil, prefabs), Prefab("wall_remover", fn_remover)
