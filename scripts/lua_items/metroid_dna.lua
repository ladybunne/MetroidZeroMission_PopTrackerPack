-- This is my first attempt at making a LuaItem. It's probably clunky in spots. Oh well!

METROID_DNA = ScriptHost:CreateLuaItem()
METROID_DNA.Name = "Metroid DNA"

-- Cached table of various item values.
METROID_DNA.ItemState = {
    ["current"] = 0, -- `Metroid DNA` item
    ["required"] = 5, -- `metroid_dna_required` option
    ["available"] = 5, -- `metroid_dna_available` option
}

METROID_DNA:SetOverlayBackground("000000");

METROID_DNA_DONE_CHECKMARK = "✓"

-- Boilerplate.
METROID_DNA.CanProvideCodeFunc = function(self, code) return code == self.Name end
METROID_DNA.ProvidesCodeFunc = function(self, code) return self.CanProvideCodeFunc(self, code) end

-- These update `Metroid DNA` directly, which updates this via a watch.
METROID_DNA.OnLeftClickFunc = function(self)
    if self.ItemState.current < self.ItemState.available then
        self.ItemState.current = self.ItemState.current + 1
        UpdateMetroidDNA()
    end
end

METROID_DNA.OnRightClickFunc = function(self)
    if self.ItemState.current > 0 then
        self.ItemState.current = self.ItemState.current -1
        UpdateMetroidDNA()
    end
end

METROID_DNA.OnMiddleClickFunc = function(self)
    if self.ItemState.current > 0 then
        self.ItemState.current = 0
        UpdateMetroidDNA()
    end
end

-- Triggered by `metroid_dna_required` changing.
function UpdateRequiredDNA()
    local amount = Tracker:FindObjectForCode("metroid_dna_required").AcquiredCount
    if amount < 0 or amount > 25 then
        return
    end

    METROID_DNA.ItemState.required = amount

    -- If required is higher than available, increase available to required.
    if amount > METROID_DNA.ItemState.available then
        Tracker:FindObjectForCode("metroid_dna_available").AcquiredCount = amount
    else
        -- Only update if the above isn't true, since the subsequent call to UpdateAvailableDNA will
        -- do its own update.
        UpdateMetroidDNA()
    end
end

-- Triggered by `metroid_dna_available` changing.
function UpdateAvailableDNA()
    local amount = Tracker:FindObjectForCode("metroid_dna_available").AcquiredCount
    if amount < 0 or amount > 25 then
        return
    end

    METROID_DNA.ItemState.available = amount

    -- Adjust current down if it's higher than available.
    if METROID_DNA.ItemState.current > amount then
        METROID_DNA.ItemState.current = amount
    end

    -- If available is less than required, reduce required to available.
    -- This can go to zero, since if available is zero then Metroid DNA is off and no amount is required.
    if amount < METROID_DNA.ItemState.required then
        Tracker:FindObjectForCode("metroid_dna_required").AcquiredCount = amount
    else
        -- Same as above.
        UpdateMetroidDNA()
    end
end

-- Update the item's visual appearance.
function UpdateMetroidDNA()
    -- Icon
    if METROID_DNA.ItemState.available > 0 then
        METROID_DNA.Icon = ImageReference:FromPackRelativePath("images/items/MetroidDNA.png")
    else
        METROID_DNA.Icon = ""
    end

    -- Image mod (disabled if current == 0)
    if(METROID_DNA.ItemState.current > 0) then
        METROID_DNA.IconMods = ""
    else
        METROID_DNA.IconMods = "@disabled"
    end

    -- Overlay text
    local overlay_text = ""
    if METROID_DNA.ItemState.current >= METROID_DNA.ItemState.required then
        overlay_text = METROID_DNA_DONE_CHECKMARK .. tostring(METROID_DNA.ItemState.current)
    elseif METROID_DNA.ItemState.current > 0 then
        overlay_text = tostring(METROID_DNA.ItemState.current) .. "/" .. tostring(METROID_DNA.ItemState.required)
    else
        overlay_text = tostring(METROID_DNA.ItemState.current) .. "/" .. tostring(METROID_DNA.ItemState.required)
        -- overlay_text = ""
    end
    METROID_DNA:SetOverlay(overlay_text)

    -- Overlay font size
    if string.len(overlay_text) >= 5 and METROID_DNA.ItemState.current < METROID_DNA.ItemState.required then
        METROID_DNA:SetOverlayFontSize(9);
    else
        METROID_DNA:SetOverlayFontSize(12);
    end

    -- Overlay text colour
    if METROID_DNA.ItemState.current >= METROID_DNA.ItemState.available then
        METROID_DNA:SetOverlayColor("#00FF00")
    elseif METROID_DNA.ItemState.current >= METROID_DNA.ItemState.required then
        METROID_DNA:SetOverlayColor("#FFFF00")
    else
        METROID_DNA:SetOverlayColor("#FFFFFF")
    end

end

function ResetMetroidDNA()
    METROID_DNA.ItemState.current = 0
end
