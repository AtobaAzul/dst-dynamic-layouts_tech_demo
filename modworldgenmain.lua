GLOBAL.TUNING.PISLAND_SIZE = 150

AddTaskSetPreInitAny(function(tasksetdata)
    if tasksetdata.location ~= "forest" then
        return
    end

    tasksetdata.overrides["has_ocean"] = false
end)