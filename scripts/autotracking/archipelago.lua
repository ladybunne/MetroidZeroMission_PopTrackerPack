-- this is an example/ default implementation for AP autotracking
-- it will use the mappings defined in item_mapping.lua and location_mapping.lua to track items and locations via thier ids
-- it will also load the AP slot data in the global SLOT_DATA, keep track of the current index of on_item messages in CUR_INDEX
-- addition it will keep track of what items are local items and which one are remote using the globals LOCAL_ITEMS and GLOBAL_ITEMS
-- this is useful since remote items will not reset but local items might
ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

KEYS_TO_WATCH = {}

function OnClear(slot_data)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called OnClear, slot_data:\n%s", DumpTable(slot_data)))
    end
    SLOT_DATA = slot_data
    CUR_INDEX = -1

    -- set options
    LoadOptions(slot_data)

    -- reset locations
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("OnClear: clearing location %s", v[1]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("OnClear: could not find object for code %s", v[1]))
            end
        end
    end

    -- reset items
    ResetLuaItems()
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("OnClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif v[2] == "custom" then
                    ;
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("OnClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("OnClear: could not find object for code %s", v[1]))
            end
        end
    end
    LOCAL_ITEMS = {}
    GLOBAL_ITEMS = {}

    -- reset events
    ResetEvents()

    -- data storage keys
    KEYS_TO_WATCH = {GetAreaSwitchingKey(), GetEventKey()}
    Archipelago:SetNotify(KEYS_TO_WATCH)
    Archipelago:Get(KEYS_TO_WATCH)
end

-- called when an item gets collected
function OnItem(index, itemID, itemName, playerNumber)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called OnItem: %s, %s, %s, %s, %s", index, itemID, itemName, playerNumber, CUR_INDEX))
    end
    if index <= CUR_INDEX then
        return
    end
    local is_local = playerNumber == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[itemID]
    if not v then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("OnItem: could not find item mapping for id %s", itemID))
        end
        return
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("OnItem: code: %s, type %s", v[1], v[2]))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("OnItem: unknown item type %s for code %s", v[2], v[1]))
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("OnItem: could not find object for code %s", v[1]))
    end
    -- track local items via snes interface
    if is_local then
        if LOCAL_ITEMS[v[1]] then
            LOCAL_ITEMS[v[1]] = LOCAL_ITEMS[v[1]] + 1
        else
            LOCAL_ITEMS[v[1]] = 1
        end
    else
        if GLOBAL_ITEMS[v[1]] then
            GLOBAL_ITEMS[v[1]] = GLOBAL_ITEMS[v[1]] + 1
        else
            GLOBAL_ITEMS[v[1]] = 1
        end
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("local items: %s", DumpTable(LOCAL_ITEMS)))
        print(string.format("global items: %s", DumpTable(GLOBAL_ITEMS)))
    end
end

--called when a location gets cleared
function OnLocation(locationID, locationName)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onLocation: %s, %s", locationID, locationName))
    end
    local v = LOCATION_MAPPING[locationID]
    if not v and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("OnLocation: could not find location mapping for id %s", locationID))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[1]:sub(1, 1) == "@" then
            obj.AvailableChestCount = obj.AvailableChestCount - 1
        else
            obj.Active = true
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("OnLocation: could not find object for code %s", v[1]))
    end
end

function OnScout(locationID, locationName, itemID, itemName, itemPlayer)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called OnScout: %s, %s, %s, %s, %s", locationID, locationName, itemID, itemName, itemPlayer))
    end
end

function OnBounce(message)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called OnBounce: %s", DumpTable(message)))
    end
end

function OnRetrieved(key, value)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called OnRetrieved: %s %s", key, value))
    end

    if key == GetAreaSwitchingKey() then
        SwitchTab(value)
    elseif key == GetEventKey() then
        HandleNewEvent(value)
    end
end

function OnSetReply(key, value, oldValue)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called OnSetReply: %s %s %s", key, value, oldValue))
    end

    if key == GetAreaSwitchingKey() then
        SwitchTab(value)
    elseif key == GetEventKey() then
        HandleNewEvent(value)
    end
end

-- add AP callbacks
Archipelago:AddClearHandler("ClearHandler", OnClear)
Archipelago:AddItemHandler("ItemHandler", OnItem)
Archipelago:AddLocationHandler("LocationHandler", OnLocation)
Archipelago:AddScoutHandler("ScoutHandler", OnScout)
Archipelago:AddBouncedHandler("BouncedHandler", OnBounce)
Archipelago:AddRetrievedHandler("RetrievedHandler", OnRetrieved)
Archipelago:AddSetReplyHandler("SetReplyHandler", OnSetReply)
