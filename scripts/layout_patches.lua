LAYOUT_PATCH_ITEMS = {
    "brinstar_long_beam_hall", "brinstar_top", "brinstar_bridge", "kraid_speed_jump", "kraid_map_ballcannon",
    "kraid_right_shaft", "norfair_brinstar_elevator", "norfair_larvae_room", "norfair_behind_superdoor",
    "ridley_ballcannon", "crateria_moat", "crateria_water_speedway", "crateria_left_of_grip"
}

SELECTED_PATCHES = {}

function UpdateLayoutPatches()
    layout_patches = Tracker:FindObjectForCode("layout_patches")

    if layout_patches.Type ~= "progressive" then
        return
    end

    -- Set all patches to their correct values.
    for k, v in pairs(LAYOUT_PATCH_ITEMS) do
        local obj = Tracker:FindObjectForCode(v)
        if obj then
            -- Set on if all patches are enabled, otherwise set off.
            obj.CurrentStage = layout_patches.CurrentStage == 1 and 1 or 0
        end
    end

    -- Enable selected patches.
    if layout_patches.CurrentStage == 2 then
        for k, v in pairs(SELECTED_PATCHES) do
            local obj = Tracker:FindObjectForCode(v)
            if obj then
                obj.CurrentStage = 1
            end
        end
    end
end