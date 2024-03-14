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

if GLOBAL.TheFrontEnd then
   
	local CurrentScreen = GLOBAL.TheFrontEnd:GetOpenScreenOfType("ServerCreationScreen")
	if CurrentScreen and CurrentScreen.server_settings_tab and CurrentScreen.server_settings_tab.game_mode.spinner.enabled then
       
		CurrentScreen.server_settings_tab.game_mode.spinner:SetOptions(GLOBAL.GetGameModesSpinnerData(GLOBAL.ModManager:GetEnabledServerModNames()))
		CurrentScreen.server_settings_tab.game_mode.spinner:SetSelected("lavaarena_dungeon")
        CurrentScreen.server_settings_tab.game_mode.spinner:Changed()
        CurrentScreen.server_settings_tab.game_mode.spinner:Disable()
	end
end

local function LoadPreset(worldsettings_widgets, preset)
    for _, v in ipairs(worldsettings_widgets) do
        v:OnPresetButton(preset)
    end
end

GLOBAL.scheduler:ExecuteInTime(0, function() -- Delay a frame so we can get ServerCreationScreen when entering a existing world
    local servercreationscreen = GLOBAL.TheFrontEnd:GetOpenScreenOfType("ServerCreationScreen") -- TheFrontEnd:GetActiveScreen()

    if not servercreationscreen or not servercreationscreen.world_tabs then
        return
    end

    local forest_tab = servercreationscreen.world_tabs[1]
    local cave_tab = servercreationscreen.world_tabs[2]

    if not forest_tab or not cave_tab  or not GLOBAL.KnownModIndex:IsModEnabled(modname) then -- IsModEnabled fix quick turn on-off mod crash
        return
    end

    if not servercreationscreen:CanResume() then -- Only when first time creating the world
        LoadPreset(forest_tab.worldsettings_widgets, "LAVAARENA_DUNGEON")  -- Automatically try switching to the dungeon Preset
    end

    if not servercreationscreen:CanResume() and cave_tab:IsLevelEnabled() then  -- Only when first time creating the world and auto add cave
        LoadPreset(cave_tab.worldsettings_widgets, "LAVAARENA_DUNGEON")  -- Automatically try switching to the dungeon Preset
    end -- wait, shouldn`t I just prevent caves?
end)