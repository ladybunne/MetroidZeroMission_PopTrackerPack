local tabs = {
    [0] = "Brinstar", "Kraid", "Norfair", "Ridley", "Tourian", "Crateria", "Chozodia",
}

-- Currently there's no way to know if we're on Combined, so there's no way to
-- prevent a swap from it. If that changes I'll update this behaviour.

CURRENT_TAB_VALUE = 0

function GetAreaSwitchingKey()
    return string.format("mzm_area_%s_%s", Archipelago.TeamNumber, Archipelago.PlayerNumber)
end

function SwitchTab(value)
    -- Only switch tabs if it's enabled.
    CURRENT_TAB_VALUE = value
    if Tracker:FindObjectForCode("auto_switch_tabs").CurrentStage == 1 then
        if value then
            Tracker:UiHint("ActivateTab", tabs[value])
        -- Don't auto-swap to Brinstar on nil, that's annoying for dev.
        -- Update: actually, do. I changed my mind.
        else
            Tracker:UiHint("ActivateTab", tabs[0])
        end
    end
end
