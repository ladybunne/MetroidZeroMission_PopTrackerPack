-- Will need to distribute socket myself, apparently, including dlls.
-- local socket = require("socket")

-- Items

local ITEMS_DOMAIN = "IWRAM"

local KEY_BEAM_UPGRADES = "beams"
local KEY_SUIT_UPGRADES = "suit"
local KEY_ENERGY_TANKS = "etanks"
local KEY_MISSILE_TANKS = "mtanks"
local KEY_SUPERMISSILE_TANKS ="smtanks"
local KEY_POWERBOMB_TANKS = "pbtanks"

local ITEM_ADDRESSES = {
    [KEY_BEAM_UPGRADES] = 0x153C,
    [KEY_SUIT_UPGRADES] = 0x153E,
    [KEY_ENERGY_TANKS] = 0x1530, -- 2 bytes
    [KEY_MISSILE_TANKS] = 0x1532, -- 2 bytes
    [KEY_SUPERMISSILE_TANKS] = 0x1534,
    [KEY_POWERBOMB_TANKS] = 0x1535,
}

local ITEM_MEMORY_FUNCS = {
    [KEY_BEAM_UPGRADES] = memory.readbyte,
    [KEY_SUIT_UPGRADES] = memory.readbyte,
    [KEY_ENERGY_TANKS] = memory.read_u16_le,
    [KEY_MISSILE_TANKS] = memory.read_u16_le,
    [KEY_SUPERMISSILE_TANKS] = memory.readbyte,
    [KEY_POWERBOMB_TANKS] = memory.readbyte,
}

-- Locations

local LOCATIONS_DOMAIN = "EWRAM"

local KEY_BRINSTAR = "brinstar"
local KEY_KRAID = "kraid"
local KEY_NORFAIR = "norfair"
local KEY_RIDLEY = "ridley"
local KEY_TOURIAN = "tourian"
local KEY_CRATERIA = "crateria"
local KEY_CHOZODIA = "chozodia"

local LOCATION_ADDRESSES = {
    [KEY_BRINSTAR] = 0x036C00,
    [KEY_KRAID] = 0x036D00,
    [KEY_NORFAIR] = 0x036E00,
    [KEY_RIDLEY] = 0x036F00,
    [KEY_TOURIAN] = 0x037000,
    [KEY_CRATERIA] = 0x037100,
    [KEY_CHOZODIA] = 0x037200,
}

local LOCATION_MEMORY_LENGTH = {
    [KEY_BRINSTAR] = 19,
    [KEY_KRAID] = 13,
    [KEY_NORFAIR] = 21,
    [KEY_RIDLEY] = 20,
    [KEY_TOURIAN] = 2,
    [KEY_CRATERIA] = 7,
    [KEY_CHOZODIA] = 18,
}

local LOCATION_MAPPING = {
    [KEY_BRINSTAR] = {1227, 1307, 807, 2802, 518, 525, 410, 704, 807, 1907, 1816, 5406, 406, 1423, 1110, 3905, 1105, 2306, 3906}
}

local state = {}
local last_state = {}

-- Return true if tables are the same. Return false if not.
local function compare_tables(a, b, keys)
    for k, _ in pairs(keys) do
        if not a[k] or not b[k] or a[k] ~= b[k] then
            return false
        end
    end
    return true
end

local function update_items()
    for k, v in pairs(ITEM_ADDRESSES) do
        last_state[k] = state[k]
        state[k] = ITEM_MEMORY_FUNCS[k](v, ITEMS_DOMAIN)
    end

    return not compare_tables(state, last_state, ITEM_ADDRESSES)
end

local function update_locations()
    for k, v in pairs(LOCATION_ADDRESSES) do
        last_state[k] = state[k]
        local bitmask = 1 << LOCATION_MEMORY_LENGTH[k]
        local addr = v
        for i=1,LOCATION_MEMORY_LENGTH[k] do
            local loc_x = memory.readbyte(addr + 2, LOCATIONS_DOMAIN)
            local loc_y = memory.readbyte(addr + 3, LOCATIONS_DOMAIN)
            if k == KEY_BRINSTAR then
                print(bitmask, loc_x * 100 + loc_y, LOCATION_MAPPING[k][loc_x * 100 + loc_y])
                bitmask = bitmask | 1 << LOCATION_MAPPING[k][loc_x * 100 + loc_y] - 1
                
            end
            addr = addr + 4
        end
        state[k] = bitmask
    end

    return not compare_tables(state, last_state, LOCATION_ADDRESSES)
end

local function update_events()
    return false
end

local function update_current_map()
    return false
end

local function update_samus_position()
    return false
end

-- Updates state and returns true if state has changed since last update.
local function update()
    local items = update_items()
    -- local locations = update_locations()
    local events = update_events()
    local current_map = update_current_map()
    local samus_position = update_samus_position()
end

local function init()
    for k, _ in pairs(ITEM_ADDRESSES) do
        state[k] = 0
    end

    for k, _ in pairs(LOCATION_ADDRESSES) do
        state[k] = 0
    end

    for k, v in pairs(state) do
        last_state[k] = v
    end

    -- Invert LOCATION_MAPPING to allow easier access for bitmasking
    for k, _ in pairs(LOCATION_MAPPING) do
        local temp_table = {}
        for k2, v2 in pairs(LOCATION_MAPPING[k]) do
            temp_table[v2] = k2
        end
        LOCATION_MAPPING[k] = temp_table
    end

    -- print(LOCATION_MAPPING["brinstar"])
end

local function main()
    local outcome = update()
    if outcome then
        -- print("State updated, printing:")
        -- print(state)
    end
end

init()
update_locations()
print(state)
while true do
    main()
    emu.frameadvance()
end
