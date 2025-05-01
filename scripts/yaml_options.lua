function LoadOptions(slot_data)
    if not slot_data then
        return
    end

    for k, v in pairs(slot_data) do
        local game_difficulty_offset = 0
        -- Don't do this yet.
        if k == "selected_patches" then
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
    end
end
