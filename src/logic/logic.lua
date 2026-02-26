-- Regular access rules.
access_rules = {}
location_regions = {}

-- Tricks.
tricks = {}

-- Additional access rules that live on PopTracker's side (not inherited from apworld).
additional_access_rules = {}

-- Out of logic locations are those which can be accessed through glitches
-- or otherwise non-logical means.
out_of_logic_access_rules = {}
out_of_logic_access_rules_ignore_region = {}

-- Scoutable locations are those which can be seen, but not collected.
scout_rules = {}
scout_rules_ignore_region = {}

-- Ingress point for locations.json asking for logic.
-- Takes a string, runs it through predicates and returns the most suitable accessibility level.
function CanReach(location)
    -- Very jank, but... if it's the first check, update accessible_regions.
    if location == "Brinstar Morph Ball" then
        UpdateAccessibleRegions()
    end

    -- Get access rules for the location.
    local access_rule = access_rules[location]
    local additional_access_rule = additional_access_rules[location]
    local out_of_logic_access_rule = out_of_logic_access_rules[location]
    local out_of_logic_access_rule_ignore_region = out_of_logic_access_rules_ignore_region[location]
    local scout_rule = scout_rules[location]
    local scout_rule_ignore_region = scout_rules_ignore_region[location]

    -- If the regular access rule isn't present, the location doesn't exist in logic.
    -- Whether or not that means it's accessible is, at this point, a philosophical exercise.
    -- I've decided to go with "no".
    if not access_rule then
        print(string.format("Location %s doesn't exist in logic.", location))
        return AccessibilityLevel.None
    end

    -- Test that its region is accessible.
    if not CanReachRegion(location_regions[location])() then
        -- Some locations can be scouted or out-of-logic accessible from outside their region.
        if out_of_logic_access_rule_ignore_region and out_of_logic_access_rule_ignore_region() then
            return AccessibilityLevel.SequenceBreak
        elseif scout_rule_ignore_region and scout_rule_ignore_region() then
            return AccessibilityLevel.Inspect
        end
        return AccessibilityLevel.None
    end

    -- Test each subsequent rule.
    if access_rule() then
        return AccessibilityLevel.Normal
    elseif additional_access_rule and additional_access_rule() then
        return AccessibilityLevel.Normal
    elseif out_of_logic_access_rule and out_of_logic_access_rule() then
        return AccessibilityLevel.SequenceBreak
    elseif out_of_logic_access_rule_ignore_region and out_of_logic_access_rule_ignore_region() then
        return AccessibilityLevel.SequenceBreak
    elseif scout_rule and scout_rule() then
        return AccessibilityLevel.Inspect
    -- Need to test this as well for cases when you _can_ reach their region.
    elseif scout_rule_ignore_region and scout_rule_ignore_region() then
        return AccessibilityLevel.Inspect
    end

    -- Otherwise it's not accessible.
    return AccessibilityLevel.None
end
