DEBUG = true
ENABLE_DEBUG_LOG = true

-- Items
Tracker:AddItems("items/equipment.json")
Tracker:AddItems("items/events.json")
Tracker:AddItems("items/options.json")

-- Maps
Tracker:AddMaps("maps/maps.json")

-- Locations
Tracker:AddLocations("locations/locations.json")

-- Non-logic helpers
ScriptHost:LoadScript("scripts/utils.lua")

ScriptHost:LoadScript("scripts/tab_switching.lua")
ScriptHost:LoadScript("scripts/yaml_options.lua")
ScriptHost:LoadScript("scripts/events.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/helpers.lua")

    -- From apworld
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/requirements.lua")
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/location_region_mappings.lua")
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/location_rules.lua")
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/region_rules.lua")
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/create_regions.lua")

ScriptHost:LoadScript("scripts/logic/logic.lua")
ScriptHost:LoadScript("scripts/logic/load_apworld_data.lua")
ScriptHost:LoadScript("scripts/logic/additional_rules.lua")
ScriptHost:LoadScript("scripts/logic/scout_rules.lua")
ScriptHost:LoadScript("scripts/logic/out_of_logic_rules.lua")

ScriptHost:LoadScript("scripts/watches.lua")

-- Layouts
Tracker:AddLayouts("layouts/maps.json")
Tracker:AddLayouts("layouts/equipment.json")
Tracker:AddLayouts("layouts/equipment_vertical.json")
Tracker:AddLayouts("layouts/major_bosses.json")
Tracker:AddLayouts("layouts/major_bosses_vertical.json")
Tracker:AddLayouts("layouts/major_bosses_supervertical.json")
-- Tracker:AddLayouts("layouts/minor_bosses.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/options.json")

-- Autotracking
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end


-- Extra init stuff


-- Watch for auto swap tab option changing
-- This is the nichest of niche UX improvements, but I like it, and that's what matters.
ScriptHost:AddWatchForCode("AutoSwitchTabOnOptionEnabled", "auto_switch_tabs", SwitchTabOnAutoSwitchOptionEnabled)

-- Watch for either a change to Chozo Ghost Defeated or Unknown Items Always Usable,
-- then update their item graphics in the tracker to reflect whether they're usable.
ScriptHost:AddWatchForCode("UnknownItemsIconsChozoGhost", "fully_powered_suit", UpdateUnknownItemIcons)
ScriptHost:AddWatchForCode("UnknownItemsIconsOption", "unknown_items", UpdateUnknownItemIcons)

-- Also do so for the items in particular.
ScriptHost:AddWatchForCode("UnknownItemsIconsPlasmaBeam", "PlasmaBeam", UpdateUnknownPlasmaBeam)
ScriptHost:AddWatchForCode("UnknownItemsIconsSpaceJump", "SpaceJump", UpdateUnknownSpaceJump)
ScriptHost:AddWatchForCode("UnknownItemsIconsGravitySuit", "GravitySuit", UpdateUnknownGravitySuit)