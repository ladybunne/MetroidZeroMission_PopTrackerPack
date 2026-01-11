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

    -- Enable selected patches.
    if layout_patches.CurrentStage == 2 then
        for k, v in pairs(SELECTED_PATCHES) do
            local obj = Tracker:FindObjectForCode(v)
            if obj then
                -- Because patches default to on, this needs to invert them,
                -- then we need to invert all of them.
                obj.CurrentStage = 1 - obj.CurrentStage
            end
        end
    end

    -- Set all patches to their correct values.
    for k, v in pairs(LAYOUT_PATCH_ITEMS) do
        local obj = Tracker:FindObjectForCode(v)
        if obj then
            if layout_patches.CurrentStage ~= 2 then
                -- 0 = disabled, 1 = enabled, 2 = choice
                obj.CurrentStage = layout_patches.CurrentStage
            else
                -- This flips it so that the ones we disabled are now active, and
                -- all others are disabled.
                obj.CurrentStage = 1 - obj.CurrentStage
            end
        end
    end
end