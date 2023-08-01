local prefabs = {
    "lavaarena_portal_activefx",
    "lavaarena_portal_player_fx",
}

TheSim:LoadPrefabs(prefabs)

local threatlevel_preset =
{
    {
        choices =
        {
            knight_nightmare = 2.5,
            rook_nightmare = 5,
            bishop_nightmare = 7.5,
            bight = 10,
            knook = 10,
            roship = 10,
        },
        minimum = 2.5
    },
    {
        choices =
        {
            spider = 0.5,
            spider_warrior = 1.5,
            spider_dropper = 2,
            spider_healer = 1.5,
            spider_moon = 2,
            spider_trapdoor = 2,
            spider_spitter = 1.5,
            spiderqueen = 10,
        },
        minimum = 0.5
    },
    {
        choices = {
            hound           = 1,
            icehound        = 1.5,
            firehound       = 1.5,
            magmahound      = 2,
            glacialhound    = 2,
            sporehound      = 2,
            lightninghound  = 2,
            warg            = 10,
            mutatedhound    = 1,
            hedgehound      = 0.25,
            warglet         = 3,
            claywarg        = 5,
            gingerbreadwarg = 5,
        },
        minimum = 0.25
    },
    {
        choices = {
            pigman = 2,
            pigguard = 3.5,
            koalefant_summer = 7.5,
            beefalo = 5,
            lightninggoat = 3,
            alpha_lightninggoat = 6,
            tallbird = 3,
        },
        minimum = 2
    },
    {
        choices =
        {
            worm = 5,
            shockworm = 10,
            viperworm = 7.5,
        },
        minimum = 2,
    },
    {
        choices = {
            shadowthrall_wings = 2.5,
            shadowthrall_horns = 10,
            shadowthrall_hands = 7.5,
            shadow_bishop = 7.5,
            shadow_rook = 7.5,
            shadow_knight = 7.5,
            fused_shadeling = 3,
            crawlingnightmare = 1,
            nightmarebeak = 3,
            swilson = 3,
        },
        minimum = 1
    },

    {
        choices =
        {
            leif = 15,
            grassgator = 7.5,
            lunarthrall_plant = 5,
            lordfruitfly = 2.5,
            mushgnome = 1,
        },
        minimum = 1
    },
    {
        choices =
        {
            powder_monkey = 1,
        },
        minimum = 1
    }
}


local function OnDungeonMobDeath(inst)
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

                if v.prefab == "dl_spawner" then
                    spawned = true
                    regen = false
                    spawner_count = spawner_count + 0.5

                    v:DoTaskInTime(spawner_count, function()
                        v:PushEvent("spawn_dl_forge_dungeon", { angle_override = v.angle_away, file_path_override = TUNING.DL_TD.MODROOT .. "scripts/forge_dungeon.json" })
                    end)
                end
            end

            for k, v in pairs(AllPlayers) do
                for i = 0, TheWorld.threat_level * 0.66 do
                    v.components.inventory:GiveItem(SpawnPrefab("dubloon"), nil, v:GetPosition())
                end
            end

            if regen ~= false then
                TheNet:Announce("The dungeon shifts!")

                TheWorld:PushEvent("revertterraform", "forge_dungeon")
                TheWorld.threat_level = TheWorld.threat_level * 1.5
                for k, v in pairs(AllPlayers) do
                    v.Transform:SetPosition(0, 0, 0)
                    v.components.health:SetInvincible(true)
                end
            else
                if math.random() > 0.25 then
                    TheWorld.threat_level = TheWorld.threat_level + ((math.random() / 2) * (#AllPlayers / 2))
                    TheNet:Announce("Threat level increased! " .. tostring(RoundToNearest(TheWorld.threat_level, 0.05)))
                end
                if spawned then
                    TheNet:Announce("The dungeon grows...")
                end
            end
        end
    end)
end


function PickDungeonMob()
    if type(TheWorld.threat_level) ~= "number" then
        TheWorld.threat_level = 1
    end

    local current_tr = TheWorld.threat_level
    print("current_tr", current_tr)
    local preset = threatlevel_preset[math.random(#threatlevel_preset)]
    printwrap("preset", preset)
    if preset.minimum > current_tr then
        print("minimum is too high!")
        return PickDungeonMob()
    end

    local mobs_to_spawn = {}
    local threat_level = 0

    local available_mobs = {}

    for mob, score in pairs(preset.choices) do
        print("mob, score", mob, score)
        table.insert(available_mobs, { mob = mob, score = score })
    end

    print(threat_level >= current_tr)
    print(threat_level, current_tr)

    while current_tr >= threat_level do
        print("while loop")
        local choice = available_mobs[math.random(#available_mobs)]
        printwrap("choice", choice)
        table.insert(mobs_to_spawn, choice.mob)
        if choice.mob == "powder_monkey" and math.random() > 0.9 then
            table.insert(mobs_to_spawn, "boat_cannon")
        end

        threat_level = threat_level + choice.score
        print("new tr", threat_level)
    end

    printwrap("final mobs to spawn", mobs_to_spawn)

    return mobs_to_spawn
end

local boss =
{
    stalker = 1,
    deerclops = 1,
    bearger = 1,
    mock_dragonfly = 1,
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
                if mob.components.lootdropper ~= nil then
                    mob.components.lootdropper.loot = {}
                    mob.components.lootdropper.chanceloot = nil
                    mob.components.lootdropper.randomloot = nil
                    mob.components.lootdropper.numrandomloot = nil
                    mob.components.lootdropper.lootsetupfn = nil
                    mob.components.lootdropper.ifnotchanceloot = nil
                end


                inst:Show()

                if inst.DynamicShadow ~= nil then
                    inst.DynamicShadow:Enable(true)
                end
            end)
            mob.Transform:SetPosition(x, y, z)

            if mob.components.combat ~= nil then
                mob.components.combat:BlankOutAttacks(0.3)

                mob:AddTag("dungeon_mob")
                mob:AddTag("hostile")
                mob:DoTaskInTime(0, function(inst)
                    inst.components.combat:SuggestTarget(inst:GetNearestPlayer())
                end)

                mob.components.health:SetMaxHealth(mob.components.health.currenthealth * math.max((TheWorld.threat_level / 25), 1))
                mob.components.combat.externaldamagemultipliers:SetModifier(mob, math.max((TheWorld.threat_level / 25), 1), "dungeon_scaling")

                mob:ListenForEvent("death", OnDungeonMobDeath)
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

        if TheWorld.threat_level == nil then
            TheWorld.threat_level = 1
        end

        if TheWorld.threat_level >= 15 and math.random() > 0.9 then
            SpawnDungeonMob(inst, weighted_random_choice(boss))
        else
            for k, mob in pairs(PickDungeonMob()) do
                SpawnDungeonMob(inst, mob)
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
        local walls = TheSim:FindEntities(x, y, z, 2, { "wall" })
        for k, v in pairs(walls) do
            v:Remove()
        end
    end, 0)

    return inst
end


return Prefab("room_mobspawner", fn, nil, prefabs), Prefab("wall_remover", fn_remover)
