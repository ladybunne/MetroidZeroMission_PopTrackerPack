---@diagnostic disable: undefined-global, undefined-field

require("spec.mocks.tracker_mock")
require("src.logic.helpers")
inspect = require("inspect")

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

end)
