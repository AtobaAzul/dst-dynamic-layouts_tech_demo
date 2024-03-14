GLOBAL.TUNING.DL_TD = {
    MODROOT = MODROOT,
}

PrefabFiles = {
    "room_mobspawner"
}

Assets = {
    Asset("ANIM", "anim/chandelier_wxdungeon.zip"),
    Asset("ANIM", "anim/wall_dungeon.zip"),

}

AddComponentPostInit("archivemanager", function(self)
    function self:GetPowerSetting()
        return true
    end
end)

AddPrefabPostInit("archive_chandelier", function(inst)
    inst.AnimState:SetBuild("chandelier_wxdungeon")
    inst:PushEvent("arhivepoweron")
    inst.Light:SetIntensity(.1)
    inst.widthscale = 1.5
    inst:DoTaskInTime(1, function(inst)
        if inst.updatelight then
            inst.updatelight(inst)
        end
    end)

    if not GLOBAL.TheWorld.ismastersim then
        return
    end

    inst.components.playerprox:SetDist(35, 44) --15,17
end)

AddPrefabPostInit("chandelier_fire", function(inst)
    inst.AnimState:SetMultColour(1, 0.5, 0, 1)
end)
--[[
TODO


]]

GLOBAL.TUNING.NONLETHAL_TEMPERATURE = true
GLOBAL.TUNING.NONLETHAL_HUNGER = true
GLOBAL.TUNING.NONLETHAL_DARKNESS = true
GLOBAL.TUNING.NONLETHAL_PERCENT = 0.5

local recipes = {
    ["forginghammer"]             = { cost = 30, quantity = 1, character = nil, move = true },
    ["forgedarts"]                = { cost = 30, quantity = 1, character = nil, move = true },
    ["pithpike"]                  = { cost = 30, quantity = 1, character = nil, move = true },
    --["livingstaff"]               = { cost = 60, quantity = 1, character = nil, move = true },
    ["moltendarts"]               = { cost = 45, quantity = 1, character = nil, move = true },
    ["infernalstaff"]             = { cost = 60, quantity = 1, character = nil, move = true },
    ["spiralspear"]               = { cost = 45, quantity = 1, character = nil, move = true },
    ["bacontome"]                 = { cost = 30, quantity = 1, character = nil, move = true },
    ["hearthsfire_crystals"]      = { cost = 30, quantity = 1, character = nil, move = true },
    ["blacksmith_edge"]           = { cost = 30, quantity = 1, character = nil, move = true },
    ["featheredtunic"]            = { cost = 15, quantity = 1, character = nil, move = true },
    ["jaggedarmor"]               = { cost = 15, quantity = 1, character = nil, move = true },
    ["forge_woodarmor"]           = { cost = 15, quantity = 1, character = nil, move = true },
    ["silkenarmor"]               = { cost = 15, quantity = 1, character = nil, move = true },
    ["splintmail"]                = { cost = 15, quantity = 1, character = nil, move = true },
    ["steadfastarmor"]            = { cost = 30, quantity = 1, character = nil, move = true },
    ["barbedhelm"]                = { cost = 15, quantity = 1, character = nil, move = true },
    ["reedtunic"]                 = { cost = 15, quantity = 1, character = nil, move = true },
    ["armor_hpdamager"]           = { cost = 100, quantity = 1, character = nil, move = true },
    ["armor_hpextraheavy"]        = { cost = 120, quantity = 1, character = nil, move = true },
    ["armor_hprecharger"]         = { cost = 120, quantity = 1, character = nil, move = true },
    ["armor_hppetmastery"]        = { cost = 45, quantity = 1, character = nil, move = true },
    ["featheredwreath"]           = { cost = 30, quantity = 1, character = nil, move = true },
    ["resplendentnoxhelm"]        = { cost = 60, quantity = 1, character = nil, move = true },
    ["blossomedwreath"]           = { cost = 120, quantity = 1, character = nil, move = true },
    ["clairvoyantcrown"]          = { cost = 100, quantity = 1, character = nil, move = true },
    ["noxhelm"]                   = { cost = 45, quantity = 1, character = nil, move = true },
    ["crystaltiara"]              = { cost = 15, quantity = 1, character = nil, move = true },
    ["wovengarland"]              = { cost = 30, quantity = 1, character = nil, move = true },
    ["flowerheadband"]            = { cost = 30, quantity = 1, character = nil, move = true },

    ["recycled_7"]                = { cost = 120, quantity = 1, character = nil },
    ["recycled_8"]                = { cost = 240, quantity = 1, character = nil },
    ["recycled_9"]                = { cost = 480, quantity = 1, character = nil },

    ["wereitem_beaver"]           = { cost = 15, quantity = 1, character = "werehuman" },
    ["wereitem_goose"]            = { cost = 15, quantity = 1, character = "werehuman" },
    ["wereitem_moose"]            = { cost = 15, quantity = 1, character = "werehuman" },

    ["ghostlyelixir_slowregen"]   = { cost = 30, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_fastregen"]   = { cost = 60, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_shield"]      = { cost = 15, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_retaliation"] = { cost = 15, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_attack"]      = { cost = 15, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_speed"]       = { cost = 15, quantity = 1, character = "elixirbrewer" },

    ["battlesong_healthgain"]     = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_durability"]     = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_sanitygain"]     = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_fireresistance"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_instant_taunt"]  = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_instant_panic"]  = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_sanityaura"]     = { cost = 30, quantity = 1, character = "battlesinger" },

    ["wx78module_maxhealth"]      = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxhealth2"]     = { cost = 60, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxsanity"]      = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxsanity1"]     = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxhunger"]      = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxhunger1"]     = { cost = 60, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_bee"]            = { cost = 60, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_taser"]          = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_cold"]           = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_heat"]           = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_music"]          = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_movespeed"]      = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_movespeed2"]     = { cost = 60, quantity = 1, character = "upgrademoduleowner" },

    ["book_tentacles"]            = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_brimstone"]            = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_sleep"]                = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_fire"]                 = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_web"]                  = { cost = 30, quantity = 1, character = "bookbuilder" },

    ["dumbbell"]                  = { cost = 15, quantity = 1, character = "strongman" },
    ["dumbbell_bluegem"]          = { cost = 45, quantity = 1, character = "strongman" },
    ["dumbbell_gem"]              = { cost = 60, quantity = 1, character = "strongman" },
    ["dumbbell_golden"]           = { cost = 30, quantity = 1, character = "strongman" },
    ["dumbbell_heat"]             = { cost = 30, quantity = 1, character = "strongman" },
    ["dumbbell_marble"]           = { cost = 45, quantity = 1, character = "strongman" },
    ["dumbbell_redgem"]           = { cost = 60, quantity = 1, character = "strongman" },
    ["wolfgang_whistle"]          = { cost = 15, quantity = 1, character = "strongman" },

    ["compostwrap"]               = { cost = 30, quantity = 1, character = "plantkin" },
}

local function AddShop(prefab, cost, qty, character)
    AddRecipe2(prefab .. "2", { GLOBAL.Ingredient("dubloon", math.ceil(cost ~= nil and cost or 1)) }, GLOBAL.TECH.MAGIC_THREE, { nil, nil, nounlock = true, numtogive = qty ~= nil and qty or 1, nil, nil, nil, nil, product = prefab, builder_tag = character, nil, sg_state = "give" }, { "DUBLOONSHOP" })
end

local TechTree = GLOBAL.require("techtree")

for item, data in pairs(recipes) do
    if not data.move then
        AddShop(item, data.cost, data.quantity, data.character)
        AddRecipeToFilter(item .. "2", "DUBLOONSHOP")
    else --assuming items without data is the forge items.
        AddRecipeToFilter(item, "DUBLOONSHOP")
        GLOBAL.AllRecipes[item].ingredients = { GLOBAL.Ingredient("dubloon", data.cost) }
        GLOBAL.AllRecipes[item].level = TechTree.Create(GLOBAL.TECH.MAGIC_THREE)
        GLOBAL.AllRecipes[item].nounlock = true
        GLOBAL.AllRecipes[item].sg_state = "give"
    end
end

local removeshop = {
    "balloonspeed",
    "bandage",
    "pumpkin_lantern",
    "fireflies",
    "dock_kit",
    "yotc_seedpacket",
    "yotc_seedpacket_rare",
    "trinket_26",
    "trinket_25",
    "balloon",
    "balloonhat",
    "goldenaxe",
    "goldenpickaxe",
    "goldenshovel",
    "goldenhoe",
    "goldenpitchfork",
    "oar",
    "saddlehorn",
    "waterballoon",
    "miniflare",
    "featherpencil",
    "minifan",
    "oar_driftwood",
    "bugnet",
    "fishingrod",
    "birdtrap",
    "grass_umbrella",
    "balloonparty",
    "balloonvest",
    "townportaltalisman",
    "healingsalve",
    "tillweedsalve",
    "reviver",
    "moonrockcrater",
    "moonrockidol",
    "halloweenpotion_moon",
    "boat_grass_item",
    "wall_wood_item",
    "fence_item",
    "lighter",
    "blueamulet",
    "honeycomb",
    "fossil_piece",
    "flowerhat",
    "kelphat",
    "watermelonhat",
    "wall_wood_item",
    "fence_gate_item",
    "beehat",
    "wall_hay_item",
    "minerhat",
    "lantern",
    "giftwrap",
    "bedroll_furry",
    "pig_coin",
    "megaflare",
    "livingtree_root",
    "chum",
    "wall_stone_item",
    "dock_woodposts_item",
    "oar_monkey",
    "moonglassaxe",
    "telestaff",
    "purpleamulet",
    "icehat",
    "onemanband",
    "boatpatch",
    "saddle_basic",
    "fertilizer",
    "ipecacsyrup",
    "mermhat",
    "wall_moonrock_item",
    "wall_ruins_item",
    "featherfan",
    "hawaiianshirt",
    "red_mushroomhat",
    "blue_mushroomhat",
    "green_mushroom",
    "jellybean",
    "wall_dreadstone",
    "cannonball_rock",
    "cane",
    "brush",
    "spiderhat",
    "portabletent_item",
    "stash_map",
    "leif_idol",
    "tacklecontainer",
    "saddle_war",
    "saddle_race",
    "greenstaff",
    "yellowstaff",
    "supertacklecontainer",
    "opalstaff",
    "skeletonhat",
    "hivehat",
    "krampus_sack",
}

for k, v in ipairs(removeshop) do
    GLOBAL.AllRecipes[v .. 2] = nil
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

    local _OnSave = GLOBAL.TheWorld.OnSave
    local _OnLoad = GLOBAL.TheWorld.OnLoad

    GLOBAL.TheWorld.OnSave = function(inst, data)
        if data ~= nil then
            data.threat_level = inst.threat_level
        end
        if _OnSave ~= nil then
            return _OnSave(inst, data)
        end
        return data
    end

    GLOBAL.TheWorld.OnLoad = function(inst, data)
        if data ~= nil and data.threat_level ~= nil then
            inst.threat_level = data.threat_level
        end

        if _OnLoad ~= nil then
            return _OnLoad(inst, data)
        end
    end


    GLOBAL.TheWorld:ListenForEvent("finishedterraform", function()
        GLOBAL.TheWorld:DoTaskInTime(0, function(inst)
            local start = GLOBAL.SpawnPrefab("dl_spawner")
            start.Transform:SetPosition(0, 0, 0)
            start.components.writeable.text = "Start"
            start.SpawnLayout(start, { file_path_override = GLOBAL.TUNING.DL_TD.MODROOT .. "scripts/lavaarena_dungeon.json" })
        end)
    end)

    GLOBAL.TheWorld:DoTaskInTime(0, function(inst)
        if not GLOBAL.TheWorld.ismastersim then return end

        if GLOBAL.TheWorld.components.dynamic_layouts.layouts["lavaarena_dungeon"] == nil then
            local start = GLOBAL.SpawnPrefab("dl_spawner")
            start.Transform:SetPosition(0, 0, 0)
            start.components.writeable.text = "Start"
            start.SpawnLayout(start, { file_path_override = GLOBAL.TUNING.DL_TD.MODROOT .. "scripts/lavaarena_dungeon.json" })
        end
    end)
end)


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

GLOBAL.TUNING.PISLAND_SIZE = 30

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

table.insert(STARTING_ITEMS.WORTOX, "forgedarts")
table.insert(STARTING_ITEMS.WORTOX, "reedtunic")

table.insert(STARTING_ITEMS.WORMWOOD, "forgedarts")
table.insert(STARTING_ITEMS.WORMWOOD, "reedtunic")

table.insert(STARTING_ITEMS.WURT, "forginghammer")
table.insert(STARTING_ITEMS.WURT, "forge_woodarmor")

table.insert(STARTING_ITEMS.WALTER, "forgedarts")
table.insert(STARTING_ITEMS.WALTER, "featheredtunic")

table.insert(STARTING_ITEMS.WANDA, "forgedarts")
table.insert(STARTING_ITEMS.WANDA, "reedtunic")

STARTING_ITEMS.WATHOM = { "forginghammer", "forge_woodarmor" }

table.insert(STARTING_ITEMS.WIXIE, "forgedarts")
table.insert(STARTING_ITEMS.WIXIE, "featheredtunic")


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


AddPrefabPostInit("cursed_monkey_token", function(inst)
    inst:Remove() --Fuck. You.
end)

local fastcharge = {
    ["forginghammer"] = -10,
    ["forgedarts"] = -0.75,
    ["pithpike"] = -20,
    ["moltendarts"] = -0.75,
    ["spiralspear"] = -0.5,
    ["blacksmith_edge"] = -10,
    ["hearthsfire_crystals"] = -10,
}

for prefab, mult in pairs(fastcharge) do
    AddPrefabPostInit(prefab, function(inst)
        if not GLOBAL.TheWorld.ismastersim then return end

        inst.components.rechargeable:SetChargeTimeMod(inst, "fastcharge", mult)
    end)
end

local fastproj = {
    ["moltendarts_projectile_explosive"] = 0.75,
    ["forgedarts_projectile_alt"] = 1.5,
    ["moltendarts_projectile"] = 1.25,
}

for prefab, mult in pairs(fastproj) do
    AddPrefabPostInit(prefab, function(inst)
        if not GLOBAL.TheWorld.ismastersim then return end

        if inst.components.projectile ~= nil then
            inst.components.projectile:SetSpeed(inst.components.projectile.speed * mult)
        elseif inst.components.aimedprojectile ~= nil then
            inst.components.aimedprojectile:SetSpeed(inst.components.aimedprojectile.speed * mult)
        end
    end)
end

local function FixPlanarDamage(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    if inst.components ~= nil and inst.components.planardamage ~= nil then
        if inst.components.weapon ~= nil then
            inst.components.weapon:SetDamage(inst.components.weapon.damage + (inst.components.planardamage:GetDamage() * 1.5))
        end
        if inst.components.combat ~= nil then
            inst.components.combat:SetDefaultDamage(inst.components.combat.defaultdamage + (inst.components.planardamage:GetDamage() * 1.5))
        end
    end
end

AddPrefabPostInitAny(FixPlanarDamage)

AddPrefabPostInit("winky", function(inst)
    inst.starting_inventory = { "forgedarts", "featheredtunic" }
end)

AddPrefabPostInit("bomb_lunarplant", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    inst.components.complexprojectile.onhitfn = function(inst, attacker, target)
        local x, y, z = inst.Transform:GetWorldPosition()

        if inst.components.planardamage == nil then
            inst:AddComponent("planardamage")
            inst.components.planardamage:SetBaseDamage(TUNING.BOMB_LUNARPLANT_PLANAR_DAMAGE)
        end

        inst.SoundEmitter:KillSound("toss")

        inst:AddComponent("explosive")
        inst.components.explosive.explosiverange = TUNING.BOMB_LUNARPLANT_RANGE
        inst.components.explosive.explosivedamage = TUNING.BOMB_LUNARPLANT_PLANAR_DAMAGE * 1.5
        inst.components.explosive.lightonexplode = false
        if inst.ispvp then
            inst.components.explosive:SetPvpAttacker(attacker)
        else
            inst.components.explosive:SetAttacker(attacker)
        end
        inst.components.explosive:OnBurnt()
        --exploding should have removed me

        GLOBAL.SpawnPrefab("bomb_lunarplant_explode_fx").Transform:SetPosition(x, y, z)
    end
end)


AddPrefabPostInit("moltendarts_projectile", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end
    local _OnUpdate = inst.components.projectile.OnUpdate

    inst.components.projectile.OnUpdate = function(self, dt)
        if self.inst.prefab == "moltendarts_projectile" and self.inst.from_explosion then
            local target = GLOBAL.FindEntity(self.inst, 2, nil, { "_combat", "_health" }, { "INLIMBO", "invisible", "playerghost", "player", "companion", "abigail" })
            if target ~= nil and target:IsValid() and target.components.combat ~= nil and target.components.health ~= nil and not target.components.health:IsDead() then
                local weapon = self.owner.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
                self.owner.components.combat:DoAttack(target, weapon, self.inst)
                self.inst:Remove()
            end
        end
        return _OnUpdate(self, dt)
    end

    inst.components.projectile.homing = false

    inst:DoTaskInTime(math.random(), function(inst)
        inst.components.projectile.speed = inst.components.projectile.speed * 0.5
    end)
end)


AddPrefabPostInit("moltendarts_projectile_explosive", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    local __onhit = inst.components.aimedprojectile.onhit
    inst.components.aimedprojectile:SetHitDistance(12)

    inst.components.aimedprojectile.onhit = function(inst, owner, attacker, _target)
        for i = 1, math.random(8, 10) do
            local secondary_proj = GLOBAL.SpawnPrefab("moltendarts_projectile")
            secondary_proj.Transform:SetPosition(inst.Transform:GetWorldPosition())

            local theta = (secondary_proj:GetAngleToPoint(attacker:GetPosition().x, 0.5, attacker:GetPosition().z) + math.random(-45, 45)) * GLOBAL.DEGREES

            secondary_proj.components.projectile:Throw(secondary_proj, inst, attacker)
            local tpos = attacker:GetPosition()
            tpos.x = tpos.x + -90 * math.cos(theta)
            tpos.z = tpos.z - -90 * math.sin(theta)
            secondary_proj.from_explosion = true
            secondary_proj.components.projectile.owner = attacker
            secondary_proj.components.projectile.dest = tpos
            secondary_proj.components.projectile:RotateToTarget(tpos)
            secondary_proj.components.projectile.speed = secondary_proj.components.projectile.speed * GLOBAL.GetRandomWithVariance(1, 0.5)
        end

        __onhit(inst, owner, attacker, _target)
    end
end)

AddPrefabPostInit("blacksmith_edge", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    inst.components.parryweapon.max_angle = 180
    inst.components.parryweapon.duration = 60
end)

AddComponentPostInit("parryweapon", function(self)
    function self:TryParry(inst, e, f, g, h)
        if inst.sg then inst.sg:PushEvent("try_parry") end
        if self.ontryparry then return self.ontryparry(inst, e, f, g, h) end
        local attacker = e or g
        local angleaway = inst.Transform:GetRotation() - inst:GetAngleToPoint(attacker.Transform:GetWorldPosition())
        local angle = math.abs(angleaway + (angleaway > 180 and -360 or angleaway < -180 and 360 or 0))
        return angle <= self.max_angle
    end
end)

local refuel =
{
    ["waxwelljournal"] = 1,
    ["pocketwatch_weapon"] = 1,
}

for k, v in pairs(refuel) do
    AddPrefabPostInit(k, function(inst)
        if not GLOBAL.TheWorld.ismastersim then return end

        inst:DoPeriodicTask(v, function(inst)
            inst.components.fueled:DoDelta(TUNING.LARGE_FUEL * 0.025)
        end)
    end)
end

GLOBAL.TUNING.SHADOWWAXWELL_SANITY_PENALTY.SHADOWWORKER = 0
GLOBAL.TUNING.SHADOWWAXWELL_SANITY_PENALTY.SHADOWPROTECTOR = 0

AddPrefabPostInit("abigail", function(inst)
    inst:AddTag("companion")
end)

AddPrefabPostInit("maxwelllight_area", function(inst)
    inst:Remove()
end)

AddPrefabPostInit("researchlab3", function(inst)
    inst:AddTag("maprevealer")

    inst.MiniMapEntity:SetCanUseCache(false)
    inst.MiniMapEntity:SetDrawOverFogOfWar(true)

    if not GLOBAL.TheWorld.ismastersim then return end

    inst:AddComponent("maprevealer")
end)

local weaponsparks = {
    "weaponsparks",
    "weaponsparks_bounce",
    "weaponsparks_piercing",
    "weaponsparks_thrusting",
    "weaponsparks_fx",
    "spear_gungnir_lungefx",
    "forge_fireball_hit_fx",
    "superjump_fx",
}

local function onupdate_intensity(inst, dt)
    inst.Light:SetIntensity(inst.i)
    inst.i = inst.i - dt * 2
    if inst.i <= 0 then
        if inst.killfx then
            inst:Remove()
        else
            inst.task:Cancel()
            inst.task = nil
        end
    end
end

local function onupdate_radius(inst, dt)
    inst.Light:SetRadius(inst.r)
    inst.r = inst.r - dt * 2
    if inst.r <= 0 then
        if inst.killfx then
            inst:Remove()
        else
            inst.taskr:Cancel()
            inst.taskr = nil
        end
    end
end


for k, v in ipairs(weaponsparks) do
    AddPrefabPostInit(v, function(inst)
        inst.entity:AddLight()
        inst.Light:SetIntensity(.6)
        inst.Light:SetRadius(2)
        inst.Light:SetFalloff(2)
        inst.Light:SetColour(1, 1, 0)

        inst.hue = 0

        local dti = 0.025
        local dtr = 0.025
        inst.i = .9
        inst.r = 2

        inst.sound = inst.SoundEmitter ~= nil
        inst.task = inst:DoPeriodicTask((inst.AnimState:GetCurrentAnimationNumFrames() * GLOBAL.FRAMES) / 12, onupdate_intensity, nil, dti) --takes 12 onupdates for the fx intensity to be 0, I think.
        inst.taskr = inst:DoPeriodicTask((inst.AnimState:GetCurrentAnimationNumFrames() * GLOBAL.FRAMES) / 40, onupdate_radius, nil, dtr)   --takes 80 onupdates for the fx radius to be 0, I think.
    end)
end

local flicker = {
    "forgedarts_projectile_alt",
    "forgedarts_projectile",
    "moltendarts_projectile_explosive",
    "moltendarts_projectile",
    "forge_fireball_projectile",
    "forge_fireball_projectile_fast"
}



for k, v in ipairs(flicker) do
    AddPrefabPostInit(v, function(inst)
        inst.entity:AddLight()
        inst.Light:SetFalloff(3)
        inst.Light:SetColour(1, 1, 0)

        if not string.find(v, "moltendarts") then
            inst.Light:SetIntensity(0)
            inst.Light:SetRadius(0)
            inst.base_intensity = .6
            inst.base_rad = 1
        else
            inst.Light:SetIntensity(0)
            inst.Light:SetRadius(0)
            inst.base_intensity = .6
            inst.base_rad = v == "moltendarts_projectile_explosive" and 3 or 1.25
        end

        inst.task = inst:DoPeriodicTask(GLOBAL.FRAMES, function(inst)
            local curr_i, curr_r = inst.Light:GetIntensity(), inst.Light:GetRadius()
            if curr_i < inst.base_intensity then
                inst.Light:SetIntensity(curr_i + inst.base_intensity / 5)
            end
            if curr_r < inst.base_rad then
                inst.Light:SetRadius(curr_r + inst.base_rad / 5)
            end

            if curr_r > inst.base_rad and curr_i > inst.base_intensity then
                inst.task = inst:DoPeriodicTask(GLOBAL.FRAMES, function(inst)
                    inst.Light:SetIntensity(GLOBAL.GetRandomWithVariance(inst.base_intensity, inst.base_intensity * 0.9))
                    inst.Light:SetRadius(GLOBAL.GetRandomWithVariance(inst.base_rad, inst.base_intensity * 0.9))
                end)
            end
        end)
    end)
end

--modifer mod overwrites:

GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_6"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_7"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_8"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_9"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_13"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_14"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_15"] = false

--functioning helmsplitter and multithrust

AddComponentPostInit("multithruster", function(self)
    function self:DoThrust(owner, target) --target? idk the original code is minified
        local mult = owner.components.combat.damagemultiplier ~= nil and owner.components.combat.damagemultiplier * 1.25 or 1.25
        owner.components.combat:DoAttack(target, nil, nil, "strong", mult)
    end
end)

AddComponentPostInit("helmsplitter", function(self)
    function self:DoHelmSplit(owner, h)
        if owner.sg then owner.sg:PushEvent("do_helmsplit") end
        local i = owner.components.combat.damagemultiplier ~= nil and owner.components.combat.damagemultiplier * 5 or 5
        owner.components.combat:DoSpecialAttack(self.damage, h, "strong", i)
        if self.onhelmsplit then self.onhelmsplit(self.inst, owner, h) end
    end
end)

AddPrefabPostInit("blacksmith_edge", function(inst)
    inst:AddTag("helmsplitter")

    if not GLOBAL.TheWorld.ismastersim then return end

    inst.hits       = 0
    local _onattack = inst.components.weapon.onattack

    local function OnAttack(inst, attacker, target)
        if _onattack ~= nil then
            _onattack(inst, attacker, target)
        end
        inst.hits = inst.hits + 1


        if inst.hits > 3 then
            inst:AddTag("helmsplitter")
            inst.hits = 0
        else
            inst:RemoveTag("helmsplitter") --just a failsafe.
        end
    end
    inst.components.weapon:SetOnAttack(OnAttack)
end)

AddPrefabPostInit("spiralspear", function(inst)
    inst:AddTag("multithruster")

    if not GLOBAL.TheWorld.ismastersim then return end

    inst.hits       = 0

    local _onattack = inst.components.weapon.onattack

    local function OnAttack(inst, attacker, target)
        if _onattack ~= nil then
            _onattack(inst, attacker, target)
        end
        inst.hits = inst.hits + 1


        if inst.hits > 3 then
            inst:AddTag("multithruster")
            inst.hits = 0
        else
            inst:RemoveTag("multithruster") --just a failsafe
        end
    end
    inst.components.weapon:SetOnAttack(OnAttack)
end)


GLOBAL.STRINGS.NAMES.WALL_STONE = "Dungeon Wall"

AddComponentPostInit("temperature", function(self)
    function self:OnUpdate(dt, applyhealthdelta)
        self.current = GLOBAL.TUNING.STARTING_TEMP
        --nothing!
    end
end)

AddPrefabPostInitAny(function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    if inst.components.combat ~= nil and inst.components.combat.targetfn then
        inst.components.combat.targetfn = function(inst)
            return inst:GetNearestPlayer(true)
        end

        inst.components.combat.keeptargetfn = function(inst, target)
            return target
                and target.components.combat
                and target.components.health
                and not target.components.health:IsDead()
        end
    end
end)


AddPrefabPostInitAny(function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    if inst.components.stackable ~= nil then
        inst.components.stackable:SetIgnoreMaxSize(true)
    end

    if inst.components.container ~= nil then
        inst.components.container:EnableInfiniteStackSize(true)
    end
end)
