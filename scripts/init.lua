DEBUG = true
ENABLE_DEBUG_LOG = true

-- Items
Tracker:AddItems("items/equipment.json")
Tracker:AddItems("items/events.json")
Tracker:AddItems("items/options.json")
Tracker:AddItems("items/layout_patches.json")
Tracker:AddItems("items/tricks.json")

-- Maps
Tracker:AddMaps("maps/maps.json")

-- Locations
Tracker:AddLocations("locations/locations.json")

-- Lua items
ScriptHost:LoadScript("scripts/lua_items/metroid_dna.lua")
ScriptHost:LoadScript("scripts/lua_items.lua")
UpdateLuaItems()

-- Non-logic helpers
ScriptHost:LoadScript("scripts/utils.lua")

ScriptHost:LoadScript("scripts/tab_switching.lua")
ScriptHost:LoadScript("scripts/layout_patches.lua")
ScriptHost:LoadScript("scripts/load_tricks.lua")
ScriptHost:LoadScript("scripts/yaml_options.lua")
ScriptHost:LoadScript("scripts/events.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/helpers.lua")

    -- From apworld
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/requirements.lua")
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/location_region_mappings.lua")
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/tricks.lua")
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/location_rules.lua")
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/region_rules.lua")
    ScriptHost:LoadScript("scripts/logic/translated_from_apworld/create_regions.lua")

ScriptHost:LoadScript("scripts/logic/logic.lua")
ScriptHost:LoadScript("scripts/logic/load_apworld_data.lua")
ScriptHost:LoadScript("scripts/logic/additional_rules.lua")
ScriptHost:LoadScript("scripts/logic/scout_rules.lua")
ScriptHost:LoadScript("scripts/logic/out_of_logic_rules.lua")

ScriptHost:LoadScript("scripts/watches.lua")
UpdateFullyPoweredSuitItem()
UpdateUnknownItemIcons()
UpdateWalljumpItem()

-- Layouts
Tracker:AddLayouts("layouts/maps.json")
Tracker:AddLayouts("layouts/equipment.json")
Tracker:AddLayouts("layouts/equipment_vertical.json")
Tracker:AddLayouts("layouts/major_bosses.json")
Tracker:AddLayouts("layouts/major_bosses_vertical.json")
Tracker:AddLayouts("layouts/major_bosses_supervertical.json")
-- Tracker:AddLayouts("layouts/minor_bosses.json")
Tracker:AddLayouts("layouts/options.json")
Tracker:AddLayouts("layouts/layout_patches.json")
Tracker:AddLayouts("layouts/tricks.json")

-- Composite layouts
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/tracker_broadcast.json")
Tracker:AddLayouts("layouts/settings_popup.json")

-- Autotracking
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end


-- Lua item watches

-- Watch for goal changes and disable Metroid DNA options if they're not relevant.
ScriptHost:AddWatchForCode("UpdateMetroidDNAOptions", "goal", UpdateMetroidDNAOptions)

-- Watch for Metroid DNA options changing and update the LuaItem accordingly.
ScriptHost:AddWatchForCode("UpdateMetroidDNARequired", "metroid_dna_required", UpdateRequiredDNA)
ScriptHost:AddWatchForCode("UpdateMetroidDNAAvailable", "metroid_dna_available", UpdateAvailableDNA)


-- Misc watches

-- Watch for auto swap tab option changing
-- This is the nichest of niche UX improvements, but I like it, and that's what matters.
ScriptHost:AddWatchForCode("AutoSwitchTabOnOptionEnabled", "auto_switch_tabs", SwitchTabOnAutoSwitchOptionEnabled)

-- Watch for changes to the option for Fully Powered Suit and force the item's state accordingly.
ScriptHost:AddWatchForCode("FullyPoweredSuitOption", "unknown_items_usable", UpdateFullyPoweredSuitItem)

-- Watch for a change to Fully Powered Suit...
-- then update their item graphics in the tracker to reflect whether they're usable.
ScriptHost:AddWatchForCode("UnknownItemsIconsFullyPoweredSuit", "Fully Powered Suit", UpdateUnknownItemIcons)

-- Also do so for the items in particular.
ScriptHost:AddWatchForCode("UnknownItemsIconsPlasmaBeam", "Plasma Beam", UpdateUnknownPlasmaBeam)
ScriptHost:AddWatchForCode("UnknownItemsIconsSpaceJump", "Space Jump", UpdateUnknownSpaceJump)
ScriptHost:AddWatchForCode("UnknownItemsIconsGravitySuit", "Gravity Suit", UpdateUnknownGravitySuit)

-- Watch for changes to the option for walljumps and force the item's state accordingly.
ScriptHost:AddWatchForCode("WalljumpOption", "walljumps", UpdateWalljumpItem)

-- Prevent removing walljumps if your option forces it on.
ScriptHost:AddWatchForCode("PreventRemovingWalljump", "Wall Jump", PreventRemovingWalljump)

-- Watch the Layout Patches setting and toggle patches accordingly.
ScriptHost:AddWatchForCode("UpdateLayoutPatches", "layout_patches", UpdateLayoutPatches)
