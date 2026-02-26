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
    it("Has() should return true (for now)", function()
        assert.truthy(Has("any item", 1)())
    end)
end)