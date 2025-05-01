-- Helpers - these all return functions, keep in mind.

function True()
    return true
end

function False()
    return false
end

function Has(item, amount)
    return function()
        local count = Tracker:ProviderCountForCode(item)
        amount = tonumber(amount)
        if not amount then
            return count > 0
        else
            return count >= amount
        end
    end
end

function Count(item)
    return function()
        return Tracker:ProviderCountForCode(item)
    end
end

function Event(flag)
    return function()
        local obj = Tracker:FindObjectForCode(flag)
        if not obj then
            return false
        end
        if obj.Type == "toggle" then
            return obj.Active
        end
        return false
    end
end

function OptionEnabled(option)
    return OptionAtLeast(option, 1)
end

function OptionIs(option, value)
    return function()
        local obj = Tracker:FindObjectForCode(option)
        if not obj then
            return false
        end
        if obj.Type == "toggle" then
            return obj.Active == value
        elseif obj.Type == "progressive" then
            return obj.CurrentStage == value
        end
        return false
    end
end

function OptionAtLeast(option, value)
    return function()
        local obj = Tracker:FindObjectForCode(option)
        if not obj then
            return false
        end
        if obj.Type == "toggle" then
            return obj.Active == value
        elseif obj.Type == "progressive" then
            return obj.CurrentStage >= value
        end
        return false
    end
end


function Any(...)
    local args = {...}
    return function()
        if not args then
            return true
        end
        for _, element in pairs(args) do
            if element() then
                return true
            end
        end
        return false
    end
end

function All(...)
    local args = {...}
    return function()
        if not args then
            return true
        end
        for _, element in pairs(args) do
            if not element() then
                return false
            end
        end
        return true
    end
end

--- Region stuff

REGIONS = {}
local start_region = "Menu"

function CreateRegion(name)
    REGIONS[name] = {}
end

function ConnectRegions(entrance_name, source, target, rule)
    REGIONS[source][entrance_name] = {
        ["rule"] = rule and rule or True,
        ["region"] = target
    }
end

ACCESSIBLE_REGIONS = {}

function UpdateAccessibleRegions()
    ACCESSIBLE_REGIONS = {start_region}
    local inverted = {[start_region] = true}
    local region = 1
    while ACCESSIBLE_REGIONS[region] do
        for k,v in pairs(REGIONS[ACCESSIBLE_REGIONS[region]]) do
            if not inverted[v.region] then
                if not v.rule or v.rule() then
                    ACCESSIBLE_REGIONS[#ACCESSIBLE_REGIONS+1] = v.region
                    inverted[v.region] = true
                end
            end
        end
        region = region + 1
    end
end

function CanReachRegion(region)
    return function()
        for _,v in pairs(ACCESSIBLE_REGIONS) do
            if v == region then
                return true
            end
        end
        return false
    end
end

function CanReachEntrance(entrance)
    return function()
        for _,v in pairs(ACCESSIBLE_REGIONS) do
            for k2, v2 in pairs(REGIONS[v]) do
                if k2 == entrance and v2.rule() then
                    return true
                end
            end
        end
        return false
    end
end

require("logic.logic")

function CanReachLocation(location)
    return function()
        return CanReach(location) == AccessibilityLevel.Normal
    end
end
