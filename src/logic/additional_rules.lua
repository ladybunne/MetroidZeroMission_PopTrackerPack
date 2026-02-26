additional_access_rules = {
    -- This is to convince PopTracker to show us locations are in logic if the boss they are behind is
    -- also in logic, just not defeated yet.
    ["Kraid Speed Booster"] = CanReachLocation("Kraid")
}