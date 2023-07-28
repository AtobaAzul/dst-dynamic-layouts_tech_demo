GLOBAL.TUNING.DL_TD = {
    MODROOT = MODROOT,
}

PrefabFiles = {
    "room_mobspawner"
}

--[[
TODO


]]


local recipes = {
    ["forginghammer"] = { cost = 30, quantity = 1, character = nil },
    ["forgedarts"] = { cost = 30, quantity = 1, character = nil },
    ["pithpike"] = { cost = 30, quantity = 1, character = nil },
    ["livingstaff"] = { cost = 60, quantity = 1, character = nil },
    ["moltendarts"] = { cost = 45, quantity = 1, character = nil },
    ["infernalstaff"] = { cost = 60, quantity = 1, character = nil },
    ["spiralspear"] = { cost = 45, quantity = 1, character = nil },
    ["bacontome"] = { cost = 30, quantity = 1, character = nil },
    ["hearthsfire_crystals"] = { cost = 30, quantity = 1, character = nil },
    ["blacksmith_edge"] = { cost = 30, quantity = 1, character = nil },
    ["featheredtunic"] = { cost = 15, quantity = 1, character = nil },
    ["jaggedarmor"] = { cost = 15, quantity = 1, character = nil },
    ["forge_woodarmor"] = { cost = 15, quantity = 1, character = nil },
    ["silkenarmor"] = { cost = 15, quantity = 1, character = nil },
    ["splintmail"] = { cost = 15, quantity = 1, character = nil },
    ["steadfastarmor"] = { cost = 30, quantity = 1, character = nil },
    ["barbedhelm"] = { cost = 15, quantity = 1, character = nil },
    ["reedtunic"] = { cost = 15, quantity = 1, character = nil },
    ["armor_hpdamager"] = { cost = 100, quantity = 1, character = nil },
    ["armor_hpextraheavy"] = { cost = 120, quantity = 1, character = nil },
    ["armor_hprecharger"] = { cost = 120, quantity = 1, character = nil },
    ["armor_hppetmastery"] = { cost = 45, quantity = 1, character = nil },
    ["featheredwreath"] = { cost = 30, quantity = 1, character = nil },
    ["resplendentnoxhelm"] = { cost = 60, quantity = 1, character = nil },
    ["blossomedwreath"] = { cost = 120, quantity = 1, character = nil },
    ["clairvoyantcrown"] = { cost = 100, quantity = 1, character = nil },
    ["noxhelm"] = { cost = 45, quantity = 1, character = nil },
    ["crystaltiara"] = { cost = 15, quantity = 1, character = nil },
    ["wovengarland"] = { cost = 30, quantity = 1, character = nil },
    ["flowerheadband"] = { cost = 30, quantity = 1, character = nil },

    ["wereitem_beaver"] = { cost = 15, quantity = 1, character = "werehuman" },
    ["wereitem_goose"] = { cost = 15, quantity = 1, character = "werehuman" },
    ["wereitem_moose"] = { cost = 15, quantity = 1, character = "werehuman" },

    ["ghostlyelixir_slowregen"] = { cost = 30, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_fastregen"] = { cost = 60, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_shield"] = { cost = 15, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_retaliation"] = { cost = 15, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_attack"] = { cost = 15, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_speed"] = { cost = 15, quantity = 1, character = "elixirbrewer" },

    ["battlesong_healthgain"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_durability"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_sanitygain"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_fireresistance"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_instant_taunt"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_instant_panic"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_sanityaura"] = { cost = 30, quantity = 1, character = "battlesinger" },

    ["wx78module_maxhealth"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxhealth2"] = { cost = 60, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxsanity"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxsanity1"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxhunger"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxhunger1"] = { cost = 60, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_bee"] = { cost = 60, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_taser"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_cold"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_heat"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_music"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_movespeed"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_movespeed2"] = { cost = 60, quantity = 1, character = "upgrademoduleowner" },

    ["book_tentacles"] = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_brimstone"] = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_sleep"] = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_fire"] = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_web"] = { cost = 30, quantity = 1, character = "bookbuilder" },

    ["dumbbell"] = { cost = 15, quantity = 1, character = "strongman" },
    ["dumbbell_bluegem"] = { cost = 45, quantity = 1, character = "strongman" },
    ["dumbbell_gem"] = { cost = 60, quantity = 1, character = "strongman" },
    ["dumbbell_golden"] = { cost = 30, quantity = 1, character = "strongman" },
    ["dumbbell_heat"] = { cost = 30, quantity = 1, character = "strongman" },
    ["dumbbell_marble"] = { cost = 45, quantity = 1, character = "strongman" },
    ["dumbbell_redgem"] = { cost = 60, quantity = 1, character = "strongman" },
    ["wolfgang_whistle"] = { cost = 15, quantity = 1, character = "strongman" },

    ["recycled_7"] = { cost = 120, quantity = 1, character = nil },
    ["recycled_8"] = { cost = 240, quantity = 1, character = nil },
    ["recycled_9"] = { cost = 480, quantity = 1, character = nil },

    ["compostwrap"] = { cost = 30, quantity = 1, character = "plantkin" },
}

local function AddShop(prefab, cost, qty, character)
    AddRecipe2(prefab .. "2", { GLOBAL.Ingredient("dubloon", math.ceil(cost ~= nil and cost or 1)) }, GLOBAL.TECH.MAGIC_THREE, { nil, nil, nounlock = true, numtogive = qty ~= nil and qty or 1, nil, nil, nil, nil, product = prefab, builder_tag = character, nil, sg_state = "give" }, { "DUBLOONSHOP" })
end

for item, data in pairs(recipes) do
    AddShop(item, data.cost, data.quantity, data.character)
    AddRecipeToFilter(item .. "2", "DUBLOONSHOP")
end

local NOREMOVETAGS = { "player", "CLASSIFIED", "FX", "INLIMBO", "playerghost", "abigail" }

function GLOBAL.EmptyTheWorld()
    for k, v in pairs(GLOBAL.Ents) do
        if not v:HasOneOfTags(NOREMOVETAGS) and not v.isplayer and v.entity:GetParent() == nil and v.widget == nil and v.Network ~= nil then
            v:Remove()
        end
    end
end

local slingshotammo = {}

local TechTree = GLOBAL.require("techtree")

AddPrefabPostInit("world", function(inst)
    GLOBAL.TUNING.STACK_SIZE_TINYITEM = GLOBAL.TUNING.STACK_SIZE_SMALLITEM



    inst:DoTaskInTime(0.0000001, function()
        for k, v in pairs(GLOBAL.AllRecipes) do
            if string.find(v.name, "slingshotammo_") then
                v.ingredients = { Ingredient("dubloon", 5) }
                v.level = TechTree.Create(GLOBAL.TECH.NONE)
                v.nounlock = true
                table.insert(slingshotammo, v.name)
            end
        end
        
        for item, data in pairs(recipes) do
            AddRecipeToFilter(item .. "2", "DUBLOONSHOP")
        end

        local theingredients = {
            "petals",
            "saltrock",
            "flint",
            "marble",
            "nightmarefuel",
            "rocks",
            "twigs",
            "slurper_pelt",
            "batwing",
            "feather_robin_winter",
            "purplegem",
            "houndstooth",
            "boneshard",
            "rope",
        }

        for k, recipe in pairs(GLOBAL.AllRecipes) do
            if string.find(recipe.name, "@") then
                for k, v in pairs(recipe.ingredients) do
                    if table.contains(theingredients, v.type) then
                        v.type = "dubloon"
                        v.amount = 45
                    end
                end
            end
        end

        for k, v in pairs(slingshotammo) do
            AddRecipeToFilter(v, "DUBLOONSHOP")
        end
    end)

    if not GLOBAL.TheWorld.ismastersim then return end

    GLOBAL.TheWorld:DoTaskInTime(0, function(inst)

        if not GLOBAL.TheWorld.ismastersim then return end

        GLOBAL.EmptyTheWorld()
        GLOBAL.SpawnPrefab("multiplayer_portal")
        GLOBAL.TheWorld:PushEvent("revertterraform", "clockwork_dungeon")
        local tx, ty = GLOBAL.TheWorld.Map:GetTileCoordsAtPoint(0, 0, 0)
        GLOBAL.TheWorld.Map:SetTile(tx, ty, 4)
        for k, v in pairs(GLOBAL.AllPlayers) do
            v.Transform:SetPosition(0, 0, 0)
            v.components.health:SetInvincible(true)
        end

        GLOBAL.TheWorld:ListenForEvent("finishedterraform", function(inst)
            local start = GLOBAL.SpawnPrefab("dl_spawner")
            start.Transform:SetPosition(0, 0, 0)
            start.components.writeable.text = "Start"
            start.SpawnLayout(start, { file_path_override = GLOBAL.TUNING.DL_TD.MODROOT .. "scripts/clockwork_dungeon.json" })

            for k, v in pairs(GLOBAL.AllPlayers) do
                v.Transform:SetPosition(0, 0, 0)
                v.components.health:SetInvincible(false)
            end
        end)

        if GLOBAL.TheWorld.dl_setpieces["clockwork_dungeon"] == nil then
            local start = GLOBAL.SpawnPrefab("dl_spawner")
            start.Transform:SetPosition(0, 0, 0)
            start.components.writeable.text = "Start"
            start.SpawnLayout(start, { file_path_override = GLOBAL.TUNING.DL_TD.MODROOT .. "scripts/clockwork_dungeon.json" })
        end
    end)
end)

AddPlayerPostInit(function(inst)
    inst:DoTaskInTime(0, function(inst)
        inst.Transform:SetPosition(0, 0, 0)
    end)
end)

AddPrefabPostInit("wall_moonrock", function(inst)
    inst:RemoveComponent("workable")
    inst:AddTag("NOTARGET")
    inst:AddTag("notarget")
    if not GLOBAL.TheWorld.ismastersim then return end

    inst.components.health.absorb = 0.95
end)

AddPrefabPostInitAny(function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end
    if inst.components.combat ~= nil then
        local _keeptargetfn = inst.components.combat.keeptargetfn
        inst.components.combat.keeptargetfn = function(inst, target)
            return _keeptargetfn ~= nil and _keeptargetfn(inst, target) and not target:HasTag("dungeon_mob") or _keeptargetfn == nil and not target:HasTag("dungeon_mob")
        end
    end
end)

local STARTING_ITEMS = GLOBAL.TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT

table.insert(STARTING_ITEMS.WILSON, "forgedarts")
table.insert(STARTING_ITEMS.WILSON, "forge_woodarmor")

table.insert(STARTING_ITEMS.WILLOW, "forgedarts")
table.insert(STARTING_ITEMS.WILLOW, "featheredtunic")

table.insert(STARTING_ITEMS.WOLFGANG, "forginghammer")
table.insert(STARTING_ITEMS.WOLFGANG, "forge_woodarmor")

table.insert(STARTING_ITEMS.WENDY, "forgedarts")
table.insert(STARTING_ITEMS.WENDY, "featheredtunic")

table.insert(STARTING_ITEMS.WX78, "forginghammer")
table.insert(STARTING_ITEMS.WX78, "forge_woodarmor")

table.insert(STARTING_ITEMS.WICKERBOTTOM, "bacontome")
table.insert(STARTING_ITEMS.WICKERBOTTOM, "reedtunic")

table.insert(STARTING_ITEMS.WOODIE, "forge_woodarmor")

table.insert(STARTING_ITEMS.WES, "forgedarts")
table.insert(STARTING_ITEMS.WES, "featheredtunic")

table.insert(STARTING_ITEMS.WAXWELL, "bacontome")
table.insert(STARTING_ITEMS.WAXWELL, "reedtunic")

table.insert(STARTING_ITEMS.WATHGRITHR, "pithpike")
table.insert(STARTING_ITEMS.WATHGRITHR, "featheredtunic")

table.insert(STARTING_ITEMS.WEBBER, "forgedarts")
table.insert(STARTING_ITEMS.WEBBER, "featheredtunic")

table.insert(STARTING_ITEMS.WINONA, "forginghammer")
table.insert(STARTING_ITEMS.WINONA, "forge_woodarmor")

table.insert(STARTING_ITEMS.WARLY, "forgedarts")
table.insert(STARTING_ITEMS.WARLY, "forge_woodarmor")

table.insert(STARTING_ITEMS.WORTOX, "livingstaff")
table.insert(STARTING_ITEMS.WORTOX, "reedtunic")

table.insert(STARTING_ITEMS.WORMWOOD, "livingstaff")
table.insert(STARTING_ITEMS.WORMWOOD, "reedtunic")

table.insert(STARTING_ITEMS.WURT, "forginghammer")
table.insert(STARTING_ITEMS.WURT, "forge_woodarmor")

table.insert(STARTING_ITEMS.WALTER, "forgedarts")
table.insert(STARTING_ITEMS.WALTER, "featheredtunic")

table.insert(STARTING_ITEMS.WANDA, "forgedarts")
table.insert(STARTING_ITEMS.WANDA, "reedtunic")

STARTING_ITEMS.WATHOM = { "forginghammer", "forge_woodarmor" }
STARTING_ITEMS.WINKY = { "forgedarts", "featheredtunic" }

table.insert(STARTING_ITEMS.WIXIE, "forgedarts")
table.insert(STARTING_ITEMS.WIXIE, "featheredtunic")


AddPrefabPostInit("dubloon", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(GLOBAL.COLLISION.WORLD)

    local ATTACHDIST = 2

    inst:DoPeriodicTask(30, function(inst)
        local num = #GLOBAL.AllPlayers >= 2 and math.random(#GLOBAL.AllPlayers)
        inst.target = #GLOBAL.AllPlayers >= 2 and GLOBAL.AllPlayers[num].components.inventory ~= nil and GLOBAL.AllPlayers[num].components.inventory:CanAcceptCount(inst) > 0 and GLOBAL.AllPlayers[num] or inst:GetNearestPlayer(true)
    end, .5)

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


AddPrefabPostInit("cursed_monkey_token", function(inst)
    inst:Remove() --Fuck. You.
end)

local fastcharge = {
    ["forginghammer"] = -10,
    ["forgedarts"] = -0.75,
    ["pithpike"] = -20,
    ["moltendarts"] = -10,
    ["spiralspear"] = -0.5,
    ["blacksmith_edge"] = -10,
}

for k, v in pairs(fastcharge) do
    print("HERE", k, v)
    AddPrefabPostInit(k, function(inst)
        if not GLOBAL.TheWorld.ismastersim then return end

        inst.components.rechargeable:SetChargeTimeMod(inst, "fastcharge", v)
    end)
end

local fastproj = {
    "moltendarts_projectile_explosive"
}