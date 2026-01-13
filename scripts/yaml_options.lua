-- Because some options are strings now, we need to map them to ints.
OPTION_MAPPING = {
    ["goal"] = { [0] = "mecha_ridley", "bosses", "metroid_dna" },
    ["game_difficulty"] = { [0] = "normal", "hard", "either" },
}

function LoadOptions(slot_data)
    if not slot_data then
        return
    end

    for k, v in pairs(slot_data) do
        -- Map strings to ints.
        if OPTION_MAPPING[k] ~= nil then
            for i, str in ipairs(OPTION_MAPPING[k]) do
                if str == v then
                    v = i
                end
            end
        end

        -- Defer handling of selected patches until after all other options.
        if k == "selected_patches" and type(v) == "table" then
            SELECTED_PATCHES = v
        elseif k == "tricks_allowed" and type(v) == "table" then
            ALLOWED_TRICKS = v
        elseif k == "tricks_denied" and type(v) == "table" then
            DENIED_TRICKS = v
        else
            local obj = Tracker:FindObjectForCode(k)
            if obj then
                if obj.Type == "toggle" then
                    obj.Active = v >= 1
                elseif obj.Type == "progressive" then
                    obj.CurrentStage = v
                elseif obj.Type == "consumable" then
                    obj.AcquiredCount = v
                end
            end
        end
    end

    UpdateLayoutPatches()
    UpdateTricks()
end
