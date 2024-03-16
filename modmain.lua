print("HELP")
GLOBAL.TUNING.DL_TD = {
    MODROOT = MODROOT,
}

PrefabFiles = {
    "room_mobspawner",
    "dubloon"
}

Assets = {
    Asset("ANIM", "anim/chandelier_wxdungeon.zip"),
    Asset("ANIM", "anim/wall_dungeon.zip"),
    Asset("ANIM", "anim/dubloon.zip"),
    Asset("ATLAS", "images/slotm_inventory.xml"),
    Asset("IMAGE", "images/slotm_inventory.tex"),
	Asset("ATLAS", "images/Slotmachine.xml"),
	Asset("IMAGE", "images/Slotmachine.tex"),
	Asset("ATLAS", "images/dubloons.xml"),
	Asset("IMAGE", "images/dubloons.tex"),

}


modimport("init/init_postinit")
modimport("init/init_shop")
--modimport("init/init_shop2")

GLOBAL.TUNING.NONLETHAL_TEMPERATURE = true
GLOBAL.TUNING.NONLETHAL_HUNGER = true
GLOBAL.TUNING.NONLETHAL_DARKNESS = true
GLOBAL.TUNING.NONLETHAL_PERCENT = 0.5
GLOBAL.STRINGS.NAMES.DUBLOON = "Dubloons"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUBLOON = "Coins!"

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

    if inst.components.stackable ~= nil then
        inst.components.stackable:SetIgnoreMaxSize(true)
    end

    if inst.components.container ~= nil then
        inst.components.container:EnableInfiniteStackSize(true)
    end
end)
