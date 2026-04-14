rockspec_format = "3.0"
package = "MetroidZeroMission_PopTrackerPack"
version = "dev-1"
source = {
   url = "https://github.com/ladybunne/MetroidZeroMission_PopTrackerPack.git"
}
description = {
   detailed = "This is a [PopTracker](https://github.com/black-sliver/PopTracker) pack for Metroid: Zero Mission! It's designed to be used with [the Archipelago randomiser for Metroid: Zero Mission](https://github.com/lilDavid/Archipelago-Metroid-Zero-Mission), which itself depends on [Archipelago](https://github.com/ArchipelagoMW/Archipelago).",
   homepage = "https://github.com/ladybunne/MetroidZeroMission_PopTrackerPack",
   license = "*** please specify a license ***"
}
dependencies = {
   "lua = 5.4"
}
build_dependencies = {}
build = {
   type = "builtin",
   modules = {
      ["autotracking.archipelago"] = "src/autotracking/archipelago.lua",
      ["autotracking.autotracking"] = "src/autotracking/autotracking.lua",
      ["autotracking.item_mapping"] = "src/autotracking/item_mapping.lua",
      ["autotracking.location_mapping"] = "src/autotracking/location_mapping.lua",
      ["from_apworld.create_regions"] = "src/from_apworld/create_regions.lua",
      ["from_apworld.location_region_mappings"] = "src/from_apworld/location_region_mappings.lua",
      ["from_apworld.location_rules"] = "src/from_apworld/location_rules.lua",
      ["from_apworld.region_rules"] = "src/from_apworld/region_rules.lua",
      ["from_apworld.requirements"] = "src/from_apworld/requirements.lua",
      ["from_apworld.tricks"] = "src/from_apworld/tricks.lua",
      ["logic.additional_rules"] = "src/logic/additional_rules.lua",
      ["logic.helpers"] = "src/logic/helpers.lua",
      ["logic.load_apworld_data"] = "src/logic/load_apworld_data.lua",
      ["logic.logic"] = "src/logic/logic.lua",
      ["logic.out_of_logic_rules"] = "src/logic/out_of_logic_rules.lua",
      ["logic.scout_rules"] = "src/logic/scout_rules.lua",
      ["lua_items.lua_items"] = "src/lua_items/lua_items.lua",
      ["lua_items.metroid_dna"] = "src/lua_items/metroid_dna.lua",
      ["setup.events"] = "src/setup/events.lua",
      ["setup.layout_patches"] = "src/setup/layout_patches.lua",
      ["setup.load_tricks"] = "src/setup/load_tricks.lua",
      ["setup.tab_switching"] = "src/setup/tab_switching.lua",
      ["setup.watches"] = "src/setup/watches.lua",
      ["setup.yaml_options"] = "src/setup/yaml_options.lua",
      utils = "src/utils.lua"
   }
}
test_dependencies = {}
