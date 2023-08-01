
if GLOBAL.TheFrontEnd then
    print("first")
	local CurrentScreen = GLOBAL.TheFrontEnd:GetOpenScreenOfType("ServerCreationScreen")
	if CurrentScreen and CurrentScreen.server_settings_tab and CurrentScreen.server_settings_tab.game_mode.spinner.enabled then
        print("second")
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

    if not forest_tab or not cave_tab and GLOBAL.KnownModIndex:IsModEnabled(modname) then  -- IsModEnabled fix quick turn on-off mod crash
        return
    end

    if not servercreationscreen:CanResume() then -- Only when first time creating the world
        LoadPreset(forest_tab.worldsettings_widgets, "LAVAARENA_DUNGEON")  -- Automatically try switching to the dungeon Preset
    end

    if not servercreationscreen:CanResume() and cave_tab:IsLevelEnabled() then  -- Only when first time creating the world and auto add cave
        LoadPreset(cave_tab.worldsettings_widgets, "LAVAARENA_DUNGEON")  -- Automatically try switching to the dungeon Preset
    end -- wait, shouldn`t I just prevent caves?
end)
