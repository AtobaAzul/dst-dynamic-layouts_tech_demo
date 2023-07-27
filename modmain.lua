GLOBAL.TUNING.DL_TD = {
    MODROOT = MODROOT,
}

PrefabFiles = {
    "room_mobspawner"
}

GLOBAL.TUNING.PISLAND_SIZE = 250
local recipes = {
    "forginghammer",
    "forgedarts",
    "pithpike",
    "livingstaff",
    "moltendarts",
    "infernalstaff",
    "spiralspear",
    "bacontome",
    "hearthsfire_crystals",
    "blacksmith_edge",
    "featheredtunic",
    "jaggedarmor",
    "forge_woodarmor",
    "silkenarmor",
    "splintmail",
    "steadfastarmor",
    "barbedhelm",
    "reedtunic",
    "armor_hpdamager",
    "armor_hpextraheavy",
    "armor_hprecharger",
    "armor_hppetmastery",
    "featheredwreath",
    "resplendentnoxhelm",
    "blossomedwreath",
    "clairvoyantcrown",
    "noxhelm",
    "crystaltiara",
    "wovengarland",
    "flowerheadband",
    "wereitem_beaver",
    "wereitem_goose",
    "wereitem_moose",
    "ghostlyelixir_slowregen",
    "ghostlyelixir_fastregen",
    "ghostlyelixir_shield",
    "ghostlyelixir_retaliation",
    "ghostlyelixir_attack",
    "ghostlyelixir_speed",
    "battlesong_healthgain",
    "battlesong_durability",
    "battlesong_sanitygain",
    "battlesong_fireresistance",
    "battlesong_instant_taunt",
    "battlesong_instant_panic",
    "battlesong_sanityaura",
    "wx78module_maxhealth",
    "wx78module_maxhealth2",
    "wx78module_maxsanity",
    "wx78module_maxsanity1",
    "wx78module_maxhunger",
    "wx78module_maxhunger1",
    "wx78module_bee",
    "wx78module_taser",
    "wx78module_cold",
    "wx78module_heat",
    "wx78module_music",
    "wx78module_movespeed",
    "wx78module_movespeed2",
    "wx78module_light",
    "wx78module_nightvision",
    "book_tentacles",
    "book_brimstone",
    "book_sleep",
    "book_fire",
    "book_web",
    "dumbbell",
    "dumbbell_bluegem",
    "dumbbell_gem",
    "dumbbell_golden",
    "dumbbell_heat",
    "dumbbell_marble",
    "dumbbell_redgem",
    "wolfgang_whistle",
}

local function AddShop(prefab, cost, qty, character)
    AddRecipe2(prefab .. "2", { GLOBAL.Ingredient("dubloon", math.ceil(cost ~= nil and cost or 1)) }, GLOBAL.TECH.MAGIC_THREE, { nil, nil, nounlock = true, numtogive = qty ~= nil and qty or 1, nil, nil, nil, nil, product = prefab, builder_tag = character, nil, sg_state = "give" }, { "DUBLOONSHOP" })
end

AddShop("forginghammer", 30, 1)
AddShop("forgedarts", 30, 1)
AddShop("pithpike", 30, 1)
AddShop("livingstaff", 45, 1)
AddShop("moltendarts", 45, 1)
AddShop("infernalstaff", 60, 1)
AddShop("spiralspear", 45, 1)
AddShop("bacontome", 30, 1)
AddShop("hearthsfire_crystals", 30, 1)
AddShop("blacksmith_edge", 60, 1)
AddShop("featheredtunic", 30, 1)
AddShop("jaggedarmor", 30, 1)
AddShop("forge_woodarmor", 30, 1)
AddShop("silkenarmor", 45, 1)
AddShop("splintmail", 45, 1)
AddShop("steadfastarmor", 60, 1)
AddShop("barbedhelm", 30, 1)
AddShop("reedtunic", 30, 1)
AddShop("armor_hpdamager", 60, 1)
AddShop("armor_hpextraheavy", 60, 1)
AddShop("armor_hprecharger", 60, 1)
AddShop("armor_hppetmastery", 60, 1)
AddShop("featheredwreath", 45, 1)
AddShop("resplendentnoxhelm", 60, 1)
AddShop("blossomedwreath", 45, 1)
AddShop("clairvoyantcrown", 45, 1)
AddShop("noxhelm", 45, 1)
AddShop("crystaltiara", 45, 1)
AddShop("wovengarland", 45, 1)
AddShop("flowerheadband", 45, 1)

AddShop("wereitem_beaver", 20, 1, "werehuman")
AddShop("wereitem_goose", 20, 1, "werehuman")
AddShop("wereitem_moose", 20, 1, "werehuman")

AddShop("ghostlyelixir_slowregen", 20, 1, "elexirbrewer")
AddShop("ghostlyelixir_fastregen", 40, 1, "elexirbrewer")
AddShop("ghostlyelixir_shield", 20, 1, "elexirbrewer")
AddShop("ghostlyelixir_retaliation", 20, 1, "elexirbrewer")
AddShop("ghostlyelixir_attack", 20, 1, "elexirbrewer")
AddShop("ghostlyelixir_speed", 20, 1, "elexirbrewer")

AddShop("battlesong_healthgain", 30, 1, "battlesinger")
AddShop("battlesong_durability", 30, 1, "battlesinger")
AddShop("battlesong_sanitygain", 30, 1, "battlesinger")
AddShop("battlesong_fireresistance", 30, 1, "battlesinger")
AddShop("battlesong_instant_taunt", 30, 1, "battlesinger")
AddShop("battlesong_instant_panic", 30, 1, "battlesinger")
AddShop("battlesong_sanityaura", 30, 1, "battlesinger")

AddShop("wx78module_maxhealth", 30, 1, "upgrademoduleowner")
AddShop("wx78module_maxhealth2", 60, 1, "upgrademoduleowner")
AddShop("wx78module_maxsanity", 30, 1, "upgrademoduleowner")
AddShop("wx78module_maxsanity1", 60, 1, "upgrademoduleowner")
AddShop("wx78module_maxhunger", 30, 1, "upgrademoduleowner")
AddShop("wx78module_maxhunger1", 60, 1, "upgrademoduleowner")
AddShop("wx78module_bee", 60, 1, "upgrademoduleowner")
AddShop("wx78module_taser", 60, 1, "upgrademoduleowner")
AddShop("wx78module_cold", 30, 1, "upgrademoduleowner")
AddShop("wx78module_heat", 30, 1, "upgrademoduleowner")
AddShop("wx78module_music", 30, 1, "upgrademoduleowner")
AddShop("wx78module_movespeed", 30, 1, "upgrademoduleowner")
AddShop("wx78module_movespeed2", 60, 1, "upgrademoduleowner")
AddShop("wx78module_light", 30, 1, "upgrademoduleowner")
AddShop("wx78module_nightvision", 60, 1, "upgrademoduleowner")

AddShop("book_tentacles", 30, 1, "bookbuilder")
AddShop("book_brimstone", 30, 1, "bookbuilder")
AddShop("book_sleep", 30, 1, "bookbuilder")
AddShop("book_fire", 30, 1, "bookbuilder")
AddShop("book_web", 30, 1, "bookbuilder")

AddShop("dumbbell", 30, 1, "strongman")
AddShop("dumbbell_bluegem", 30, 1, "strongman")
AddShop("dumbbell_gem", 30, 1, "strongman")
AddShop("dumbbell_golden", 30, 1, "strongman")
AddShop("dumbbell_heat", 30, 1, "strongman")
AddShop("dumbbell_marble", 30, 1, "strongman")
AddShop("dumbbell_redgem", 30, 1, "strongman")
AddShop("wolfgang_whistle", 30, 1, "strongman")

AddShop("pocketwatch_heal", 60, 1, "clockmaker")
AddShop("pocketwatch_weapon", 120, 1, "clockmaker")
AddShop("pocketwatch_revive", 60, 1, "clockmaker")
AddShop("pocketwatch_recall", 30, 1, "clockmaker")

AddShop("slingshot", 30, 1, "pebblemaker")
AddShop("slingshot_matilda", 60, 1, "pebblemaker")
AddShop("slingshot_gnasher", 120, 1, "pebblemaker")


local slingshotammo = {}

local TechTree = GLOBAL.require("techtree")

AddPrefabPostInit("world", function(inst)
    inst:DoTaskInTime(0.0000001, function()
        for k, v in pairs(GLOBAL.AllRecipes) do
            if string.find(v.name, "slingshotammo_") then
                v.ingredients = { Ingredient("dubloon", 5) }
                v.level = TechTree.Create(GLOBAL.TECH.NONE)
                v.nounlock = true
                table.insert(slingshotammo, v.name)
            elseif string.find(v.name, "randommod") then
                v.ingredients = { Ingredient("dubloon", 10) }
            end
        end

        for k, v in pairs(recipes) do
            AddRecipeToFilter(v .. "2", "DUBLOONSHOP")
        end
        for k, v in pairs(slingshotammo) do
            AddRecipeToFilter(v, "DUBLOONSHOP")
        end
    end)

    if not GLOBAL.TheWorld.ismastersim then return end

    inst:DoTaskInTime(0, function(inst)
        GLOBAL.c_emptyworld()
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
    inst.Physics:CollidesWith(GLOBAL.COLLISION.GROUND)

    local ATTACHDIST = 2

    inst:DoTaskInTime(0, function(inst)
        inst.target = #GLOBAL.AllPlayers >= 2 and GLOBAL.AllPlayers[math.random(#GLOBAL.AllPlayers)] or inst:GetNearestPlayer(true)
    end)

    local function OnUpdate(inst, dt)
        if inst.target and inst.target:IsValid() and inst.target.components.inventory ~= nil and inst.components.inventoryitem:GetGrandOwner() == nil then
            local dist = inst:GetDistanceSqToInst(inst.target)
            if dist < ATTACHDIST * ATTACHDIST then
                inst.target.components.inventory:GiveItem(inst, nil, inst:GetPosition())
            else
                local x, y, z = inst.target.Transform:GetWorldPosition()
                local angle = inst:GetAngleToPoint(x, y, z) * GLOBAL.DEGREES
                local dist = math.sqrt(dist)
                local speed = math.max(GLOBAL.Remap(dist, 0, 10, 20, 1) * dt, 10 * dt)
                if speed > 0 then
                    local offset = GLOBAL.Vector3(speed * math.cos(angle), 0, -speed * math.sin(angle))
                    local x1, y1, z1 = inst.Transform:GetWorldPosition()
                    inst.Transform:SetPosition(x1 + offset.x, 0, z1 + offset.z)
                end
            end
        end
    end

    inst:AddComponent("updatelooper")
    inst.components.updatelooper:AddOnUpdateFn(OnUpdate)
end)
