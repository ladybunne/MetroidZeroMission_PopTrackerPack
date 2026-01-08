-- Because some options are strings now, we need to map them to ints.
OPTION_MAPPING = {
    ["goal"] = {"mecha_ridley", "bosses", "metroid_dna"},
    ["game_difficulty"] = {"normal", "hard", "either"},
}

function LoadOptions(slot_data)
    local selected_patches

    if not slot_data then
        return
    end

    for k, v in pairs(slot_data) do
        -- Ignore tables for now, this is more complex.
        -- if type(v) == "table" then
        --     goto continue
        -- end

        -- Map strings to ints.
        if OPTION_MAPPING[k] ~= nil then
            for i, str in ipairs(OPTION_MAPPING) do
                if str == v then
                    v = i
                end
            end
        end

        local game_difficulty_offset = 0
        -- Don't do this yet.
        if k == "selected_patches" and type(v) == "table" then
            selected_patches = v
        else
            if k == "game_difficulty" then
                game_difficulty_offset = -1
            end
            local obj = Tracker:FindObjectForCode(k)
            if obj then
                if obj.Type == "toggle" then
                    obj.Active = v >= 1
                elseif obj.Type == "progressive" then
                    obj.CurrentStage = v + game_difficulty_offset
                end
            end
        end
        ::continue::
    end

    if not selected_patches then
        return
    end

    layout_patches = Tracker:FindObjectForCode("layout_patches")
    
    -- Something has gone wrong if this fails.
    if not layout_patches.Type == "progressive" then
        return
    end

    -- Need to rewrite this to actually work properly.
    for k, v in pairs(selected_patches) do
        local obj = Tracker:FindObjectForCode(v)
        if obj then
            local obj = Tracker:FindObjectForCode(v)
            if layout_patches.CurrentStage ~= 3 then
                obj.Active = layout_patches.CurrentStage == 2
            else
                obj.Active = true
            end
        end
    end
end
