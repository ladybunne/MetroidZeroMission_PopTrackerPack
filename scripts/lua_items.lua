METROID_DNA = ScriptHost:CreateLuaItem()
METROID_DNA.Name = "Metroid DNA"
METROID_DNA.ItemState = {
    ["current"] = 0,
    ["required"] = 3,
    ["available"] = 10,
}
METROID_DNA.Icon = ImageReference:FromPackRelativePath("images/items/MetroidDNA.png")
METROID_DNA:SetOverlayBackground("000000");
METROID_DNA:SetOverlayFontSize(10);

METROID_DNA.CanProvideCodeFunc = function(self, code) return code == self.Name end
METROID_DNA.ProvidesCodeFunc = function(self, code) return self.CanProvideCodeFunc(self, code) end

METROID_DNA.OnLeftClickFunc = function(self)
    if self.ItemState["current"] < self.ItemState["available"] then
        self.ItemState["current"] = self.ItemState["current"] + 1
        UpdateDNAOverlay()
    end
end

METROID_DNA.OnRightClickFunc = function(self)
    if self.ItemState["current"] > 0 then
        self.ItemState["current"] = self.ItemState["current"] - 1
        UpdateDNAOverlay()
    end
end

METROID_DNA.OnMiddleClickFunc = function(self)
    if self.ItemState["current"] > 0 then
        self.ItemState["current"] = 0
        UpdateDNAOverlay()
    end
end

function UpdateDNAOverlay()
    if(METROID_DNA.ItemState["current"] >= METROID_DNA.ItemState["available"]) then
        METROID_DNA:SetOverlayColor("#00FF00")
    elseif (METROID_DNA.ItemState["current"] >= METROID_DNA.ItemState["required"]) then
        METROID_DNA:SetOverlayColor("#FFFF00")
    else
        METROID_DNA:SetOverlayColor("#FFFFFF")
    end
    if (METROID_DNA.ItemState["current"] >= METROID_DNA.ItemState["required"]) then
        METROID_DNA:SetOverlay("✓" .. tostring(METROID_DNA.ItemState["current"]))
    else
        METROID_DNA:SetOverlay(tostring(METROID_DNA.ItemState["current"]) .. "/" .. tostring(METROID_DNA.ItemState["required"]))
    end
end