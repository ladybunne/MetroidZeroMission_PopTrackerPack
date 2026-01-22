-- File for watches, which can be loaded last.

-- Disable Metroid DNA quantity options if we're not on the Metroid DNA goal.
function UpdateMetroidDNAOptions()
    local required = Tracker:FindObjectForCode("metroid_dna_required")
    local available = Tracker:FindObjectForCode("metroid_dna_available")
    if Tracker:FindObjectForCode("goal").CurrentStage == 2 then
        required.MaxCount = 25
        available.MaxCount = 25
    else
        METROID_DNA.ItemState.current = 0
        required.AcquiredCount = 0
        required.MaxCount = 0
        available.AcquiredCount = 0
        available.MaxCount = 0
    end
end

function SwitchTabOnAutoSwitchOptionEnabled(code)
    if Tracker:FindObjectForCode(code).CurrentStage == 1 then
        SwitchTab(CURRENT_TAB_VALUE)
    end
end

-- Caching images for performance reasons.
local unknown_items_known = {
    ["Plasma Beam"] = ImageReference:FromPackRelativePath("images/items/PlasmaBeam.png"),
    ["Space Jump"] = ImageReference:FromPackRelativePath("images/items/SpaceJump.png"),
    ["Gravity Suit"] = ImageReference:FromPackRelativePath("images/items/GravitySuit.png")
}
local unknown_items_known_disabled = {
    ["Plasma Beam"] = ImageReference:FromImageReference(unknown_items_known["Plasma Beam"], "@disabled"),
    ["Space Jump"] = ImageReference:FromImageReference(unknown_items_known["Space Jump"], "@disabled"),
    ["Gravity Suit"] = ImageReference:FromImageReference(unknown_items_known["Gravity Suit"], "@disabled")
}
local unknown_items_unknown = {
    ["Plasma Beam"] = ImageReference:FromPackRelativePath("images/items/UnknownPlasmaBeam.png"),
    ["Space Jump"] = ImageReference:FromPackRelativePath("images/items/UnknownSpaceJump.png"),
    ["Gravity Suit"] = ImageReference:FromPackRelativePath("images/items/UnknownGravitySuit.png")
}
local unknown_items_unknown_disabled = {
    ["Plasma Beam"] = ImageReference:FromImageReference(unknown_items_unknown["Plasma Beam"], "@disabled"),
    ["Space Jump"] = ImageReference:FromImageReference(unknown_items_unknown["Space Jump"], "@disabled"),
    ["Gravity Suit"] = ImageReference:FromImageReference(unknown_items_unknown["Gravity Suit"], "@disabled")
} 

-- You can't change the name of JSON items... apparently... which makes this useless. Unfortunate.
-- If that ever changes I'll wire these up.
local unknown_items_names_known = {
    ["Plasma Beam"] = "Plasma Beam",
    ["Space Jump"] = "Space Jump",
    ["Gravity Suit"] = "Gravity Suit"
}
local unknown_items_names_unknown = {
    ["Plasma Beam"] = "Unknown Item 1 (Plasma Beam)",
    ["Space Jump"] = "Unknown Item 2 (Space Jump)",
    ["Gravity Suit"] = "Unknown Item 3 (Gravity Suit)"
}

function UpdateUnknownItemIcon(item)
    local item_object = Tracker:FindObjectForCode(item)
    if not item_object then
        return
    end

    -- Need to find a way to confirm that these are JsonItems.
    -- They are, but safety and all.
    if CanUseUnknownItems() then
        -- item_object.Name = unknown_items_names_known[item]
        item_object.Icon = item_object.Active and unknown_items_known[item] or unknown_items_known_disabled[item]
        item_object:SetOverlay("")
    else
        -- item_object.Name = unknown_items_names_unknown[item]
        item_object.Icon = item_object.Active and unknown_items_unknown[item] or unknown_items_unknown_disabled[item]
        item_object:SetOverlay("X")
        item_object:SetOverlayFontSize(14)
        item_object:SetOverlayBackground(item_object.Active and "#FF0000" or "#888888")
    end
end

function UpdateUnknownPlasmaBeam() UpdateUnknownItemIcon("Plasma Beam") end
function UpdateUnknownSpaceJump() UpdateUnknownItemIcon("Space Jump") end
function UpdateUnknownGravitySuit() UpdateUnknownItemIcon("Gravity Suit") end

function UpdateUnknownItemIcons()
    -- Putting this here so you can't take off the suit if the option
    -- starts you with it.
    local option = Tracker:FindObjectForCode("unknown_items_usable")
    local item = Tracker:FindObjectForCode("Fully Powered Suit")
    if option and option.CurrentStage > 1 then
        item.Active = true
    end
    UpdateUnknownPlasmaBeam()
    UpdateUnknownSpaceJump()
    UpdateUnknownGravitySuit()
end

function UpdateFullyPoweredSuitItem()
    local option = Tracker:FindObjectForCode("unknown_items_usable")
    local item = Tracker:FindObjectForCode("Fully Powered Suit")
    if not option or not item then
        return
    end
    if option.CurrentStage > 1 then
        item.Active = true
    else
        item.Active = false
    end
end

function UpdateWalljumpItem()
    local option = Tracker:FindObjectForCode("walljumps")
    local item = Tracker:FindObjectForCode("Wall Jump")
    if not option or not item then
        return
    end
    if option.CurrentStage > 1 then
        item.Active = true
    else
        item.Active = false
    end
end

function PreventRemovingWalljump()
    local option = Tracker:FindObjectForCode("walljumps")
    local item = Tracker:FindObjectForCode("Wall Jump")
    if not option or not item then
        return
    end
    if option.CurrentStage > 1 then
        item.Active = true
    end
end
-- The function for updating layout patches is in `layout_patches.lua`.