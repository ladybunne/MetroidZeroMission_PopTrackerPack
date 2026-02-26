TRICK_ITEMS = { "Norfair-Ridley Shortcut", "Kraid-Norfair Shortcut", "Ridley Right Shaft Shortcut",
    "Chozo Ghost Access Reverse", "Mecha Ridley Hall PB Skip", "Varia Area Access Enemy Freeze",
    "Brinstar Varia Suit Power Bomb", "Kraid Right Shaft Enemy Freeze", "Kraid Quad Ball Cannon No Bombs",
    "Kraid Bottom Escape Enemy Freeze", "Norfair Under Crateria Elevator Enemy Freeze", "Norfair Big Room Walljump",
    "Norfair Bomb Trap PB Only", "Norfair Right Shaft Get-Around Walljump", "Screw Attack Access Shinespark",
    "Norfair Behind Super Door Left Enemy Freeze", "Norfair Larvae Room Missiles", "Ridley Fake Floor Skip",
    "Mother Brain Access Wall Jump", "Chozo Ghost Shinespark No Screw", "Chozodia Pirates Enemy Freezes",
    "Chozodia Under Tube Items Ballspark", "Mothership Upper Access Walljump", "Balljump to IBJ From Acid",
    "Brinstar Ripper Climb Zoomer Freeze", "Brinstar Top Access Damage Boost", "Varia Area Access Get-Around Walljump",
    "Kraid Zipline Morph Jump Without Ziplines", "Kraid Right Shaft Balljump Climb",
    "Kraid Left Shaft Access Space Jump Only", "Acid Worm Skip Grip Only", "Acid Worm Skip Grip And Bombs",
    "Kraid Quad Ball Cannon Crumble Grip", "Kraid Unknown Item Spaceboost", "Kraid Unknown Item With 2 PBs",
    "Kraid Bottom Escape Get-Around Walljump", "Norfair Big Room Entrance Enemy Freeze", "Norfair Ice Beam Hi-Jump Only",
    "Behind Ice Beam Shaft Hard Mode Enemy Freeze", "Screw Attack Access Enemy Freeze",
    "Lower Norfair Wave Beam Skip With Bombs", "Ridley Southwest Puzzle Crumble Jump",
    "Ridley Northeast Corner Get-Around Walljump", "Ridley Bomb Puzzle No Grip", "Ridley Bomb Puzzle Power Bombs",
    "Mother Brain Access Ice Only", "Tourian Escape Shinespark", "Tourian Escape Hard Mode IBJ",
    "Crateria-Chozodia Door Get-Around Walljump", "Alpha PB Area Ice Escape", "Acid Worm Skip Bomb Only",
    "Ridley Speed Jump No Wave", "Brinstar Ceiling E-Tank Tricky Spark", "Brinstar Ripper Climb Tricky Spark",
    "Varia Area Access Tricky Spark", "Acid Worm Skip Tricky Spark", "Lower Norfair Wave Beam Skip Tricky Spark",
    "Ridley Left Shaft Climb Tricky Spark", "Crateria Upper Access Tricky Spark",
    "Crateria Northeast Corner Tricky Spark", "Brinstar Acid Near Varia Acid Dive - Normal",
    "Norfair Above Ice Hellrun - Normal", "Norfair Under Elevator Hellrun - Normal",
    "Norfair Right Shaft to Lower Hellrun - Normal", "Lower Norfair to Right Shaft Hellrun - Normal",
    "Norfair Under Wave Hellrun Left - Normal", "Norfair Under Wave Hellrun Right - Normal",
    "Lower Norfair Lava Dive - Normal", "Ridley Hellrun - Normal", "Chozodia Lava Dive Item - Normal",
    "Chozodia Lava Dive Escape - Normal", "Brinstar Acid Near Varia Acid Dive - Minimal",
    "Norfair Above Ice Hellrun - Minimal", "Norfair Under Elevator Hellrun - Minimal",
    "Norfair Right Shaft to Lower Hellrun - Minimal", "Lower Norfair to Right Shaft Hellrun - Minimal",
    "Norfair Under Wave Hellrun Left - Minimal", "Norfair Under Wave Hellrun Right - Minimal",
    "Lower Norfair Lava Dive - Minimal", "Ridley Hellrun - Minimal", "Chozodia Lava Dive Item - Minimal",
    "Chozodia Lava Dive Escape - Minimal"
}

ALLOWED_TRICKS = {}
DENIED_TRICKS = {}

function UpdateTricks()
    -- Set all tricks to logic-dependent.
    for k, v in pairs(TRICK_ITEMS) do
        local obj = Tracker:FindObjectForCode(v)
        if obj then
            obj.CurrentStage = 1
        end
    end

    -- Allow all allowed tricks.
    for k, v in pairs(ALLOWED_TRICKS) do
        local obj = Tracker:FindObjectForCode(v)
        if obj then
            obj.CurrentStage = 2
        end
    end

    -- Deny all denied tricks.
    for k, v in pairs(DENIED_TRICKS) do
        local obj = Tracker:FindObjectForCode(v)
        if obj then
            obj.CurrentStage = 0
        end
    end
end
