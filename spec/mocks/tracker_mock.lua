-- This file needs to mock out anything that would touch PopTracker's functions,
-- so that tests can run independently of PopTracker running.

TEST_PACK_STATE = {}

---@class Tracker
Tracker = {}

function Tracker:FindObjectForCode()
    ;
end

function Tracker:ProviderCountForCode(self, code)
    return 1
end