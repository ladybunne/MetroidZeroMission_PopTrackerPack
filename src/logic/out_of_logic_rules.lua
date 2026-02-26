out_of_logic_access_rules = {
    -- These are to suggest that it's very possible to beat bosses without
    -- the prerequisite item counts, so long as you're confident.
    ["Kraid Speed Booster"] = True,
    ["Kraid"] = True,
    ["Kraid Under Acid Worm"] = True,

    -- This needs work.
    ["Mother Brain"] = False,
}

out_of_logic_access_rules_ignore_region = {
    -- This should probably account for requiring remote items, with that toggle I want to implement.
    ["Ridley Behind Unknown Statue"] = CanReachRegion("Central Ridley"),
    ["Ridley Unknown Item Statue"] = CanReachRegion("Central Ridley"),

    -- This needs to account for being able to get out, since event flags don't save even with remote items.
    ["Ridley"] = CanReachRegion("Central Ridley")
}