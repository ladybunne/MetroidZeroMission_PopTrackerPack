-- This file needs to mock out anything that would touch PopTracker's functions,
-- so that tests can run independently of PopTracker running.

-- We need a table that has all the items/locations that can be looked up.
-- This is a bit more complex, will need to think about how to structure it.
JSON = require("JSON")
inspect = require("inspect")

-- We also need to track current items.
TEST_PACK_STATE = {}

-- It would be useful to have some example sets of data.
EMPTY_INVENTORY = {}

local function GetFullInventory()
    -- Probably easier to just parse the equipment file.
    local file = io.open("items/equipment.json", "rb")
    assert(file)
    local content = file:read("*a")
    file:close()
    local table = JSON:decode(content)
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

---@class Tracker
Tracker = {}

---@diagnostic disable-next-line: duplicate-set-field
function Tracker:FindObjectForCode()
    ;
end

---@diagnostic disable-next-line: duplicate-set-field
function Tracker:ProviderCountForCode(self, code)
    return 1
end