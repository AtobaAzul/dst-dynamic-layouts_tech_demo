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
                v.ingredients = { Ingredient("dubloon", 2) }
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
end)
