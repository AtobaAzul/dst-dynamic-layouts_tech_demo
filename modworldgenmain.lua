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

ChangeTileRenderOrder(GLOBAL.WORLD_TILES.DUNGEONSTONE, GLOBAL.WORLD_TILES.DUNGEON)

AddTaskSetPreInitAny(function(tasksetdata)
    if tasksetdata ~= nil then
        if tasksetdata.location ~= "forest" then
            return
        end


        tasksetdata.overrides["has_ocean"] = false
    end
end)


--don't ask. I don't know either.
GLOBAL.LEVELTYPE.LAVAARENA_DUNGEON = "LAVAARENA_DUNGEON"

local overrides =
{
    location = "forest",
    day                        = "onlynight",
    winter                     = "noseason",
    spring                     = "noseason",
    summer                     = "noseason",
    specialevent               = "none",
    --monsters
    spiders                    = "never",
    cave_spiders               = "never",
    houndmound                 = "never",
    merm                       = "never",
    tentacles                  = "never",
    chess                      = "never",
    walrus                     = "never",
    bats                       = "never",
    fissure                    = "never",
    worms                      = "never",
    moon_spiders               = "never",
    ocean_waterplant           = "never",
    angrybees                  = "never",
    tallbirds                  = "never",
    --animals
    rabbits                    = "never",
    moles                      = "never",
    buzzard                    = "never",
    catcoon                    = "never",
    pigs                       = "never",
    lightninggoat              = "never",
    beefalo                    = "never",
    bees                       = "never",
    slurper                    = "never",
    bunnymen                   = "never",
    rocky                      = "never",
    monkey                     = "never",
    moon_carrot                = "never",
    moon_fruitdragon           = "never",
    ocean_shoal                = "never",
    ocean_wobsterden           = "never",
    --resources =
    flowers                    = "never",
    grass                      = "never",
    sapling                    = "never",
    marshbush                  = "never",
    tumbleweed                 = "never",
    reeds                      = "never",
    trees                      = "never",
    flint                      = "never",
    rock                       = "never",
    rock_ice                   = "never",
    meteorspawner              = "never",
    mushtree                   = "never",
    fern                       = "never",
    flower_cave                = "never",
    wormlights                 = "never",
    berrybush                  = "never",
    carrot                     = "never",
    mushroom                   = "never",
    cactus                     = "never",
    banana                     = "never",
    lichen                     = "never",
    moon_tree                  = "never",
    moon_sapling               = "never",
    moon_berrybush             = "never",
    moon_rock                  = "never",
    moon_hotspring             = "never",
    moon_starfish              = "never",
    moon_bullkelp              = "never",
    ponds                      = "never",
    cave_ponds                 = "never",
    ocean_bullkelp             = "never",
    ocean_seastack             = "never",
    palmconetree               = "never",

    --misc
    task_set                   = "default",
    start_location             = "default",
    world_size                 = "small",
    branching                  = "never",
    loop                       = "never",
    roads                      = "never",
    touchstone                 = "never",
    boons                      = "never",
    cavelight                  = "never",
    prefabswaps_start          = "never",
    moon_fissure               = "never",
    terrariumchest             = "never",
    stageplays                 = "never",
    --global
    season_start               = "default",

    --worldsettings

    --giants
    leifs                      = "never",
    deciduousmonster           = "never",
    bearger                    = "never",
    deerclops                  = "never",
    goosemoose                 = "never",
    dragonfly                  = "never",
    antliontribute             = "never",
    crabking                   = "never",
    beequeen                   = "never",
    malbatross                 = "never",
    fruitfly                   = "never",
    spiderqueen                = "never",
    daywalker                  = "never",
    nightmarecreatures         = "never",
    birds                      = "never",
    regrowth                   = "never",
    evergreen_regrowth         = "never",
    deciduoustree_regrowth     = "never",
    moon_tree_regrowth         = "never",
    flowers_regrowth           = "never",
    carrots_regrowth           = "never",
    reeds_regrowth             = "never",
    cactus_regrowth            = "never",
    saltstack_regeowth         = "never",
    palmconetree_regrowth      = "never",
    flower_cave_regrowth       = "never",
    lightlfier_flower_regrowth = "never",
    mushtree_regrowth          = "never",
    mushtree_moon_regrowth     = "never",
    basicresource_regrowth     = "none",

    --misc
    lightning                  = "never",
    frograin                   = "never",
    wildfires                  = "never",
    petrification              = "never",
    meteorshowers              = "never",
    hunt                       = "never",
    anternatehunt              = "never",
    hounds                     = "never",
    winterhounds               = "never",
    summerhounds               = "never",
    weather                    = "never",
    earthquakes                = "never",

    extrastartingitems         = "none",
    seasonalstartingitems      = "never",
    spawnprotection            = "never",
    dropeverythingondespawn    = "default",
    healthpenalty              = "always",
    lessdamagetaken            = "none",
    shadowcreatures            = "never",
    brightmarecreatures        = "never",

}

GLOBAL.AddWorldGenLevel(GLOBAL.LEVELTYPE.LAVAARENA_DUNGEON, {
    id = "LAVAARENA_DUNGEON",
    name = "The Forge's Catacombs",
    desc = "Fight through endless hordes in an ever-expanding dungeon.",
    location = "forest",
    version = 4,
    overrides = overrides
})

GLOBAL.AddSettingsPreset(GLOBAL.LEVELTYPE.LAVAARENA_DUNGEON, {
    id = "LAVAARENA_DUNGEON",
    name = "The Forge's Catacombs",
    desc = "Fight through endless hordes in an ever-expanding dungeon.",
    location = "forest", -- this is actually the prefab name
    version = 4,
    overrides = overrides
})

AddLevel(GLOBAL.LEVELTYPE.LAVAARENA_DUNGEON, { --I don't even know anymore
    id = "LAVAARENA_DUNGEON",
    name = "The Forge's Catacombs",
    desc = "Fight through endless hordes in an ever-expanding dungeon.",
    location = "forest",
    version = 4,
    overrides = overrides,
})

