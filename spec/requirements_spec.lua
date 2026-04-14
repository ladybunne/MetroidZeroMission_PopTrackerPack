---@diagnostic disable: undefined-global, undefined-field

require("spec.mocks.tracker_mock")
require("src.logic.helpers")
require("src.from_apworld.requirements")

require("src.from_apworld.location_region_mappings")
require("src.from_apworld.tricks")
require("src.from_apworld.location_rules")
require("src.from_apworld.region_rules")
require("src.from_apworld.create_regions")

require("src.logic.logic")
require("src.logic.load_apworld_data")
require("src.logic.additional_rules")
require("src.logic.scout_rules")
require("src.logic.out_of_logic_rules")

describe("requirements functions: ", function()
    it("Events", function()
        SetTestPackState(NO_EVENTS)
        assert.falsy(Any(Ziplines, KraidBoss, RidleyBoss,
            MotherBrainBoss, ChozoGhostBoss, MechaRidleyBoss)())
        SetTestPackState(ALL_EVENTS)
        assert.truthy(All(Ziplines, KraidBoss, RidleyBoss,
            MotherBrainBoss, ChozoGhostBoss, MechaRidleyBoss)())
    end)

    it("Unknown Items", function()
        SetTestPackState(EMPTY_INVENTORY)
        assert.falsy(Any(UnknownItem1, UnknownItem2, UnknownItem3)())
        SetTestPackState(FULL_INVENTORY, ALL_EVENTS)
        assert.truthy(UnknownItem1())
        assert.truthy(UnknownItem2())
        assert.truthy(UnknownItem3())
    end)
end)
