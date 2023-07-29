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
        runsound = "dontstarve/movement/run_rock",
        walksound = "dontstarve/movement/walk_rock",
        snowsound = "dontstarve/movement/run_ice",
        mudsound = "dontstarve/movement/run_mud",
        colors = GROUND_OCEAN_COLOR,
        flooring = true,
        hard = true,

    },
    {
        name = "map_edge",
        noise_texture = "mini_ruinstrim_noise",
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
        runsound = "dontstarve/movement/run_rock",
        walksound = "dontstarve/movement/walk_rock",
        snowsound = "dontstarve/movement/run_ice",
        mudsound = "dontstarve/movement/run_mud",
        colors = GROUND_OCEAN_COLOR
    },
    {
        name = "map_edge",
        noise_texture = "mini_ruinstrim_noise",
    }

)

ChangeTileRenderOrder(GLOBAL.WORLD_TILES.DUNGEONSTONE, GLOBAL.WORLD_TILES.DUNGEON)

AddTaskSetPreInitAny(function(tasksetdata)
    if tasksetdata.location ~= "forest" then
        return
    end

    tasksetdata.overrides["has_ocean"] = false
end)
