-- This file needs to mock out anything that would touch PopTracker's functions,
-- so that tests can run independently of PopTracker running.

JSON = require("JSON")
inspect = require("inspect")
require("src.utils")

-- We need to track current items.
TEST_PACK_STATE = {}

-- It would be useful to have some example sets of data.
EMPTY_INVENTORY = {}
FULL_INVENTORY = {}

NO_EVENTS = {}
ALL_EVENTS = {}

DEFAULT_YAML_OPTIONS = {}
MOST_PERMISSIVE_YAML_OPTIONS = {}
LEAST_PERMISSIVE_YAML_OPTIONS = {}

ALL_LAYOUT_PATCHES = {}
NO_LAYOUT_PATCHES = {}

DEFAULT_TRICKS = {}
ALL_TRICKS = {}
NO_TRICKS = {}

local function GetFullInventory()
    -- Probably easier to just parse the equipment file.
    local table = LoadJSONToTable("items/equipment.json")
    local output = {}

    for k, v in pairs(table) do
        if v["type"] == "consumable" then
            output[v["codes"]] = v["max_quantity"]
        elseif v["type"] == "toggle" then
            output[v["codes"]] = 1
        end
    end

    return output
end

FULL_INVENTORY = GetFullInventory()

local function GetAllEvents()
    local table = LoadJSONToTable("items/events.json")
    local output = {}

    for k, v in pairs(table) do
        output[v["codes"]] = 1
    end

    return output
end

ALL_EVENTS = GetAllEvents()

-- We need a table that has all the items/locations that can be looked up.
-- This is a bit more complex, will need to think about how to structure it.
local function GetAllItems()
    local item_files = { "equipment.json", "events.json", "layout_patches.json", "options.json", "tricks.json" }
    local output = {}

    for _, v in ipairs(item_files) do
        local loaded_table = LoadJSONToTable("items/" .. v)
        for _, v2 in pairs(loaded_table) do
            output[v2["codes"]] = v2
        end
    end

    return output
end

ALL_ITEMS = GetAllItems()


function NewJsonItem(type, active, acquired_count, current_stage)
    -- Artificially creating a JsonItem.
    -- local item = {
    --     Active = false,
    --     AcquiredCount = 0,
    --     CurrentStage = 0,
    --     Type = "",
    -- }
    return {
        Active = active ~= nil and active or false,
        AcquiredCount = acquired_count ~= nil and acquired_count or 0,
        CurrentStage = current_stage ~= nil and current_stage or 0,
        Type = type,
    }
end

function SetTestPackState(table)
    -- Need to clone the table.
    TEST_PACK_STATE = {}
    for k, v in pairs(table) do TEST_PACK_STATE[k] = v end
end

---@class Tracker
Tracker = {}

---@diagnostic disable-next-line: duplicate-set-field
function Tracker:FindObjectForCode(code)
    -- So, this is the hard one.
    local active = false
    local acquired_count = 0
    local current_stage = 0

    -- Lookup object from the items table.
    local object = ALL_ITEMS[code]
    if object == nil then
        return nil
    end

    local state_copy = TEST_PACK_STATE[code]
    if state_copy ~= nil then
        if object.Type == "toggle" then
            active = state_copy ~= nil and state_copy > 0 or false
        elseif object.Type == "consumable" then
            acquired_count = state_copy ~= nil and state_copy or 0
        elseif object.Type == "progressive" then
            current_stage = state_copy ~= nil and state_copy or 0
        end
    end

    return NewJsonItem(object.Type, active, acquired_count, current_stage)
end

---@diagnostic disable-next-line: duplicate-set-field
function Tracker:ProviderCountForCode(code)
    return TEST_PACK_STATE[code] ~= nil and TEST_PACK_STATE[code] or 0
end