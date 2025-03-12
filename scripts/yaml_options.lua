local options = {
    ["chozodia_access"] = "chozodia_access",
    ["combat_logic_difficulty"] = "combat_logic_difficulty",
    ["unknown_items"] = "unknown_items_always_usable",
    ["death_link"] = "death_link",
    ["hazard_runs"] = "hazard_runs",
    ["walljump_logic"] = "walljumps_in_logic",
    ["ibj_logic"] = "ibj_in_logic",
    ["logic_difficulty"] = "logic_difficulty",
    ["remote_items"] = "remote_items",
    ["tricky_shinesparks"] = "tricky_shinesparks",
    ["selected_layout_patches"] = "selected_layout_patches", -- No idea what we're doing with this one.
    ["game_difficulty"] = "game_difficulty",
    ["goal"] = "goal",
    ["layout_patches"] = "layout_patches"
}

function LoadOptions(slot_data)
    if not slot_data then
        return
    end

    for k, v in pairs(slot_data) do
        local game_difficulty_offset = 0
        -- Don't do this yet.
        if k == "selected_layout_patches" then
        else
            if k == "game_difficulty" then
                game_difficulty_offset = -1
            end
            local obj = Tracker:FindObjectForCode(options[k])
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
