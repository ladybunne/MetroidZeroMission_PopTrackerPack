local events = {
    [0] = "Deorem Defeated", "Acid Worm Defeated", "Kraid Defeated",
          "Imago Cocoon Defeated", "Imago Defeated", "Ridley Defeated",
          "Mother Brain Defeated", "Escaped Zebes",
          "Chozo Ghost Defeated", "Mecha Ridley Defeated", "Escaped Chozodia"
}

function GetEventKey()
    return string.format("mzm_events_%s_%s", Archipelago.TeamNumber, Archipelago.PlayerNumber)
end

function HandleNewEvent(value)
    print(string.format("Received new value for HandleNewEvent: %s", value))

    if value then
        -- For each index...
        for i=0,#events do
            -- Take it to the power of two, then AND it against the flag?
            -- This is jank, but it seems to work, and I don't really use bitwise operators often, so...
            -- print(string.format("value: %s, i: %s, 2^i: %s", value, i, 2^i))
            -- print(value & 2^i)
            if value & 2^i > 0 then
                Tracker:FindObjectForCode(events[i]).Active = true
            end
        end
    end
end

function ResetEvents()
    for i=0,#events do
        Tracker:FindObjectForCode(events[i]).Active = false
    end
end
