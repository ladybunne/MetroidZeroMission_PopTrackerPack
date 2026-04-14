---@diagnostic disable: undefined-global, undefined-field

require("spec.mocks.tracker_mock")
require("src.logic.helpers")

describe("helper functions: ", function()
    -- Simple tests to ensure everything's working correctly
    it("Any() should return true with any truthy value", function()
        assert.truthy(Any(False, True, False)())
    end)
    it("Any() should return false with only falsy values", function()
        assert.falsy(Any(False, False, False)())
    end)
    it("All() should return true with only truthy values", function()
        assert.truthy(All(True, True, True)())
    end)
    it("All() should return false with any falsy value", function()
        assert.falsy(All(True, True, False)())
    end)

    -- Testing the PopTracker function mocks
    it("Has() should return false for all items with an empty inventory", function()
        SetTestPackState(EMPTY_INVENTORY)
        for k, _ in pairs(FULL_INVENTORY) do
            assert.falsy(Has(k, 1)())
        end
    end)

    it("Has() should return true for all items with a full inventory", function()
        SetTestPackState(FULL_INVENTORY)
        for k, _ in pairs(FULL_INVENTORY) do
            assert.truthy(Has(k, 1)())
        end
    end)

    it("Count() should return the count of an item", function()
        SetTestPackState(EMPTY_INVENTORY)
        assert.are.equal(Count("Missile Tank")(), 0)
        SetTestPackState(FULL_INVENTORY)
        assert.are.equal(Count("Missile Tank")(), 50)
    end)

    it("Count() should return 0 for an unknown item", function()
        SetTestPackState(EMPTY_INVENTORY)
        assert.are.equal(Count("Fake Item That Doesn't Exist")(), 0)
    end)

    it("Event() should reflect an event's state", function()
        -- Need a way to store events in the pack's current state.
        SetTestPackState(NO_EVENTS)
        assert.falsy(Event("Kraid Defeated")())
        SetTestPackState(ALL_EVENTS)
        assert.truthy(Event("Kraid Defeated")())
    end)

    it("Event() should return false if used on an item of the wrong type", function()
        SetTestPackState(FULL_INVENTORY)
        assert.falsy(Event("Missile Tank")())
    end)

    it("OptionEnabled() should reflect an option's state", function()
        SetTestPackState(DEFAULT_YAML_OPTIONS)
        assert.truthy(OptionEnabled("layout_patches")())
        assert.falsy(OptionEnabled("remote_items")())
    end)

    it("OptionEnabled() should return false if used on an item of the wrong type", function()
        SetTestPackState(DEFAULT_YAML_OPTIONS)
        assert.falsy(OptionEnabled("Missile Tank")())
    end)

    it("OptionIs() should reflect an option's state", function()
        SetTestPackState(DEFAULT_YAML_OPTIONS)
        assert.truthy(OptionIs("game_difficulty", 2)())
    end)

    it("OptionIs() should return false if used on an item of the wrong type", function()
        SetTestPackState(DEFAULT_YAML_OPTIONS)
        assert.falsy(OptionIs("Missile Tank", 1)())
    end)

    it("OptionAtLeast() should reflect an option's state", function()
        SetTestPackState(DEFAULT_YAML_OPTIONS)
        assert.truthy(OptionAtLeast("game_difficulty", 1)())
    end)

    it("OptionAtLeast() should return false if used on an item of the wrong type", function()
        SetTestPackState(DEFAULT_YAML_OPTIONS)
        assert.falsy(OptionAtLeast("Missile Tank", 1)())
    end)
end)
