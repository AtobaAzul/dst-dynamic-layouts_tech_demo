GLOBAL.TUNING.PISLAND_SIZE = 150

AddTile(
    "DUNGEONSTONE",
    "LAND",
    {
        ground_name = "dungeonstone",
    },
    {
        name = "dungeonstone",
        noise_texture = "noise_dungeonstone.tex",
        runsound = "dontstarve/movement/run_marble",
        walksound = "dontstarve/movement/run_marble",
        snowsound = "dontstarve/movement/run_ice",
        mudsound = "dontstarve/movement/run_mud",
        colors = GROUND_OCEAN_COLOR,
        flooring = true,
        hard = true,

    },
    {
        name = "map_edge",
        noise_texture = "mini_mud_noise",
    }
)

AddTile(
    "DUNGEON",
    "LAND",
    {
        ground_name = "dungeon",
    },
    {
        name = "dungeon",
        noise_texture = "noise_dungeon.tex",
        runsound = "dontstarve/movement/run_marble",
        walksound = "dontstarve/movement/run_marble",
        snowsound = "dontstarve/movement/run_ice",
        mudsound = "dontstarve/movement/run_mud",
        colors = GROUND_OCEAN_COLOR
    },
    {
        name = "map_edge",
        noise_texture = "mini_mud_noise",
    }

)
local Layouts = GLOBAL.require("map/layouts").Layouts
local StaticLayout = GLOBAL.require("map/static_layout")

ChangeTileRenderOrder(GLOBAL.WORLD_TILES.DUNGEONSTONE, GLOBAL.WORLD_TILES.DUNGEON)

AddTaskSetPreInitAny(function(tasksetdata)
    if tasksetdata ~= nil then
        if tasksetdata.location ~= "forest" then
            return
        end

        if tasksetdata.overrides ~= nil then
            tasksetdata.overrides["has_ocean"] = false
        end

        if tasksetdata.required_prefabs ~= nil then
            tasksetdata.required_prefabs = {}
        end
    end
end)

