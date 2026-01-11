-- File for watches, which can be loaded last.

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
    elseif CanUseUnknownItems() then
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
    UpdateUnknownPlasmaBeam()
    UpdateUnknownSpaceJump()
    UpdateUnknownGravitySuit()
end

-- The function for updating layout patches is in `layout_patches.lua`.