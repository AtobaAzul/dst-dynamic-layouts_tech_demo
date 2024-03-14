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


modimport("init/init_postinit")
modimport("init/init_shop")
--modimport("init/init_shop2")

GLOBAL.TUNING.NONLETHAL_TEMPERATURE = true
GLOBAL.TUNING.NONLETHAL_HUNGER = true
GLOBAL.TUNING.NONLETHAL_DARKNESS = true
GLOBAL.TUNING.NONLETHAL_PERCENT = 0.5


AddPrefabPostInit("world", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

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



GLOBAL.TUNING.PISLAND_SIZE = 30


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
    inst.MiniMapEntity:SetDrawOverFogOfWar(true)
    inst.MiniMapEntity:SetIsFogRevealer(true)
    inst.MiniMapEntity:SetCanUseCache(false)
    inst.MiniMapEntity:SetPriority(11)

    inst:AddTag("maprevealer")
    inst:AddTag("fogrevealer")

    if not GLOBAL.TheWorld.ismastersim then return end

    inst:AddComponent("maprevealer")
end)

--modifer mod overwrites:

GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_6"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_7"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_8"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_9"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_13"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_14"] = false
GLOBAL.TUNING.MOD_MODIFIER["ATTRIBUTE_15"] = false

--functioning helmsplitter and multithrust

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
