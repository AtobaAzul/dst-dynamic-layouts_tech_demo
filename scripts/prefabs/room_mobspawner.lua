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
        warg            = .25,
        clayhound       = 1,
        hedgehound      = 3,
        warglet         = .5,
        claywarg        = .25,
        gingerbreadwarg = .25,
    },
    {
        pigman = 1,
        pigguard = 1,
        koalefant_summer = 0.125,
        beefalo = 0.25
    },
    {
        worm = 1,
        shockworm = 0.1,
        viperworm = 0.25,
        viperling = 2,
    },
    {
        shadowthrall_wings = 0.5,
        shadowthrall_horns = 0.25,
        shadowthrall_hands = 0.5,
        shadow_bishop = 0.25,
        shadow_rook = 0.25,
        shadow_knight = 0.25,
        fused_shadeling = 0.5,
        crawlingnightmare = 1,
        nightmarebeak = 1,
    },
    {
        leif = 0.1,
        mandrake_active = 0.1,
        birchnutdrake = 2,
        grassgator = 0.5,
        fruitdragon = 1,
        lunarthrall_plant = 0.5,
        lordfruitfly = 1,
    }
}

local boss =
{
    stalker = 1,
    deerclops = 1,
    bearger = 1,
    mock_dragonfly = 1,
    daywalker = 1,
}

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
        local preset = presets[math.random(#presets)]
        if TheWorld.escalation_mult == nil then
            TheWorld.escalation_mult = 1
        end

        local x, y, z = inst.Transform:GetWorldPosition()
        if TheWorld.escalation_mult >= 15 and math.random() > 0.9 then
            local mob = SpawnPrefab(weighted_random_choice(boss))
            mob.Transform:SetPosition(x + math.random(-8, 8), y, z + math.random(-8, 8))
            mob:AddTag("dungeon_mob")
            mob:AddTag("hostile")
            mob:DoTaskInTime(0, function(inst)
                inst.components.combat:SuggestTarget(inst:GetNearestPlayer())
            end)
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
                            if v.prefab == "dl_spawner" and spawner_count <= 5 or v.prefab == "dl_spawner" and TheSim:FindFirstEntityWithTag("room_mobspawner") == nil then
                                spawned = true

                                v:DoTaskInTime(spawner_count, function()
                                    v:PushEvent("spawn_dl_clockwork_dungeon", { angle_override = v.angle_away, file_path_override = TUNING.DL_TD.MODROOT .. "scripts/clockwork_dungeon.json" })
                                end)
                                spawner_count = spawner_count + 0.5
                            end
                            if TheSim:FindFirstEntityWithTag("room_mobspawner") then
                                regen = false --don't regen if there's spawners left
                            end
                        end

                        for k, v in pairs(AllPlayers) do
                            for i = 0, TheWorld.escalation_mult * 0.66 do
                                v.components.inventory:GiveItem(SpawnPrefab("dubloon"), nil, v:GetPosition())
                            end
                        end

                        if regen == false then
                            if math.random() > 0.25 then
                                TheWorld.escalation_mult = TheWorld.escalation_mult + ((math.random() / 2) * #AllPlayers)
                                TheNet:Announce("Threat level increased! " .. tostring(RoundToNearest(TheWorld.escalation_mult, 0.05)))
                            end
                            if spawned then
                                TheNet:Announce("The dungeon grows...")
                            end
                        else
                            c_emptyworld()
                            TheWorld:PushEvent("revertterraform", "clockwork_dungeon")
                            for k, v in pairs(AllPlayers) do
                                v.Transform:SetPosition(0, 0, 0)
                                v.components.health:SetInvincible(true)
                            end

                            TheNet:Announce("The dungeon shifts!")
                        end
                    end
                end)
            end)
        else
            for i = 1, math.clamp(math.clamp(math.random(TheWorld.escalation_mult) * GetRandomWithVariance(1, 0.25), TheWorld.escalation_mult / 2, 15), 1, 15) do
                local mob =  SpawnPrefab(weighted_random_choice(preset))
                mob.Transform:SetPosition(x + math.random(-8, 8), y, z + math.random(-8, 8))
                mob:AddTag("dungeon_mob")
                mob:AddTag("hostile")
                mob:DoTaskInTime(0, function(inst)
                    inst.components.combat:SuggestTarget(inst:GetNearestPlayer())
                end)
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
                                if v.prefab == "dl_spawner" and spawner_count <= 5 or v.prefab == "dl_spawner" and TheSim:FindFirstEntityWithTag("room_mobspawner") == nil then
                                    spawned = true

                                    v:DoTaskInTime(spawner_count, function()
                                        v:PushEvent("spawn_dl_clockwork_dungeon", { angle_override = v.angle_away, file_path_override = TUNING.DL_TD.MODROOT .. "scripts/clockwork_dungeon.json" })
                                    end)
                                    spawner_count = spawner_count + 0.5
                                end
                                if TheSim:FindFirstEntityWithTag("room_mobspawner") then
                                    regen = false --don't regen if there's spawners left
                                end
                            end

                            for k, v in pairs(AllPlayers) do
                                for i = 0, TheWorld.escalation_mult * 0.66 do
                                    v.components.inventory:GiveItem(SpawnPrefab("dubloon"), nil, v:GetPosition())
                                end
                            end

                            if regen == false then
                                if math.random() > 0.25 then
                                    TheWorld.escalation_mult = TheWorld.escalation_mult + ((math.random() / 2) * #AllPlayers)
                                    TheNet:Announce("Threat level increased! " .. tostring(RoundToNearest(TheWorld.escalation_mult, 0.05)))
                                end
                                if spawned then
                                    TheNet:Announce("The dungeon grows...")
                                end
                            else
                                c_emptyworld()
                                TheWorld:PushEvent("revertterraform", "clockwork_dungeon")
                                for k, v in pairs(AllPlayers) do
                                    v.Transform:SetPosition(0, 0, 0)
                                    v.components.health:SetInvincible(true)
                                end

                                TheNet:Announce("The dungeon shifts!")
                            end
                        end
                    end)
                end)
            end
        end
        inst:Remove()
    end)
    inst.components.playerprox:SetPlayerAliveMode(inst.components.playerprox.AliveModes.AliveOnly)

    return inst
end

return Prefab("room_mobspawner", fn)
