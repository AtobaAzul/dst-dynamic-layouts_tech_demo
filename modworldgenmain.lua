GLOBAL.TUNING.PISLAND_SIZE = 30

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


local size = GLOBAL.TUNING.PISLAND_SIZE

if GLOBAL.rawget(GLOBAL, "WorldSim") then
	local idx = GLOBAL.getmetatable(GLOBAL.WorldSim).__index

	local OldSetWorldSize = idx.SetWorldSize

	idx.SetWorldSize = function(self, width, height)
		print("[Prison Island Override] Setting world size to " .. (size or width))
		OldSetWorldSize(self, size or width, size or height)
	end

	local OldConvertToTileMap = idx.ConvertToTileMap
	idx.ConvertToTileMap = function(self, length)
		OldConvertToTileMap(self, size or length)
	end
end
