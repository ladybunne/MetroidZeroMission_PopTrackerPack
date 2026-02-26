tricks_normal = {
    -- Less a trick, more a secret path.
    -- Use a tunnel hidden by a missile block to go straight from the top right of Norfair all the way down to the
    -- bottom right, allowing access to Ridley with far fewer items.
    ["Norfair-Ridley Shortcut"] =
        All(
            Missiles,
            CanBombTunnelBlock,
            Any(
                PowerGrip,
                CanHorizontalIBJ,
                All(
                    IceBeam,
                    CanBallJump
                )
            ),
            Any(
                CanIBJ,
                All(
                    PowerBombs,
                    CanHiSpringBall
                ),
                All(
                    PowerGrip,
                    Any(
                        HiJump,
                        CanWallJump,
                        SpaceJump
                    )
                )
            )
        ),

    -- Also not a trick, but a shortcut path you can easily miss.
    -- The save station at the top of the Kraid escape shaft connects to Lower Norfair, guarded by Screw Attack, Power
    -- Bomb, and Missile blocks. This being enabled makes this a logical path, which can let you defeat Kraid without
    -- ziplines or access Lower Norfair with different items.
    ["Kraid-Norfair Shortcut"] =
        All(
            MorphBall,
            ScrewAttack,
            PowerBombs,
            Missiles
        ),

    -- Less a trick, more a secret path.
    -- A missile block in the ceiling in the room just right of the elevator allows you to go "backwards" through Ridley
    ["Ridley Right Shaft Shortcut"] =
        All(
            Missiles,
            Any(
                CanIBJ,
                SpaceJump,
                CanHiGrip,
                IceBeam,
                All(
                    NormalLogic,
                    CanBallspark
                )
            ),
            CanBombTunnelBlock,
            CanEnterHighMorphTunnel
        ),

    -- Not quite a trick, but a rando-exclusive path.
    -- Climb up a tall shaft in the Chozo Ruins to access the Chozo Ghost area from the right side instead of the left
    ["Chozo Ghost Access Reverse"] =
        CanFlyWall,

    -- Less a trick, more a secret path.
    -- An invisible tunnel in the ceiling of a room by the cockpit allows you to go around the Power Bomb blocks
    -- that otherwise block your path to Mecha Ridley
    ["Mecha Ridley Hall PB Skip"] =
        Any(
            CanIBJ,
            All(
                PowerGrip,
                Any(
                    HiJump,
                    SpaceJump,
                    CanWallJump
                )
            )
        ),

    -- Freeze the enemy in the room to climb up with few other items
    ["Varia Area Access Enemy Freeze"] =
        All(
            IceBeam,
            CanVertical
        ),

    -- Precisely place a Power Bomb in the acid to break the bomb chain but not kill the bugs to open the Geron
    ["Brinstar Varia Suit Power Bomb"] =
        PowerBombs,

    -- Freeze a zeela to get just enough height to walljump up the last jump. You might have to wait a while for it
    ["Kraid Right Shaft Enemy Freeze"] =
        All(
            IceBeam,
            CanWallJump
        ),

    -- Use a midair shinespark instead of the ballcannons to break the blocks blocking the zipline
    ["Kraid Quad Ball Cannon No Bombs"] =
        All(
            Missiles,
            Ziplines,
            SpeedBooster,
            CanHiSpringBall
        ),

    -- Freeze an enemy to climb up Kraid right shaft without Speed Booster
    -- This trick only applies if the "kraid_right_shaft" layout patch is not on
    ["Kraid Bottom Escape Enemy Freeze"] =
        All(
            IceBeam,
            Any(
                CanWallJump,
                PowerGrip
            )
        ),

    -- Go down and back up through the ceiling tunnel under the Norfair-Crateria Elevator with an enemy freeze
    ["Norfair Under Crateria Elevator Enemy Freeze"] =
        All(
            IceBeam,
            Any(
                CanHiSpringBall,
                All(
                    CanBallJump,
                    CanWallJump
                )
            )
        ),

    -- Use a precise Hi-Jump walljump to grab the ledge without Speed, Ice, or flight
    ["Norfair Big Room Walljump"] =
        All(
            CanHiGrip,
            CanWallJump
        ),

    -- Lay a PB in a specific place to only start the top bomb chain, then time your jump to the item
    ["Norfair Bomb Trap PB Only"] =
        PowerBombs,

    -- Access Norfair Right Shaft Near Hi-Jump or the ballcannon by walljumping around an outcropping and gripping up
    ["Norfair Right Shaft Get-Around Walljump"] =
        All(
            PowerGrip,
            CanWallJump
        ),

    -- Access Screw Attack area with just Speed Booster by using a one-tile-wide chain of speed boost blocks intended
    -- for the ballcannon from Ridley
    ["Screw Attack Access Shinespark"] =
        SpeedBooster,

    -- Get in the morph tunnel to Norfair Behind Lower Super Missile Door - Left using a well-timed enemy freeze
    -- from the center platform, then a precise jump or balljump off the enemy
    ["Norfair Behind Super Door Left Enemy Freeze"] =
        All(
            CanReachLocation("Norfair Behind Lower Super Missile Door - Right"),
            IceBeam,
            Any(
                PowerGrip,
                CanBallJump
            )
        ),

    -- Jump into the ceiling and shoot missiles to kill the first larva in the room with two
    ["Norfair Larvae Room Missiles"] =
        Missiles,

    -- Cross the fake floor in Ridley without flight or going the long way -- not that hard, but punishing to miss
    ["Ridley Fake Floor Skip"] =
        Any(
            CanWallJump,
            PowerGrip
        ),

    -- Use wall jumps and a midair morph to access the tunnel leading to Mother Brain's chamber
    ["Mother Brain Access Wall Jump"] =
        CanWallJump,

    -- Complete the long Chozo Ghost Shinespark puzzle with the hidden tunnel rather than using Screw Attack,
    -- which requires speed and precision to keep the charge through
    ["Chozo Ghost Shinespark No Screw"] =
        MissileCount(3),

    -- Freezing Space Pirates to get enough height to collect items or traverse areas. Generally requires some
    -- simple AI manipulation but not too precise positioning.
    -- Generalized unlike other freezes since there are many places where this is useful without much difference
    ["Chozodia Pirates Enemy Freezes"] =
        IceBeam,

    -- Use ballsparks instead of Grip or IBJs to enter high morph tunnels near the lower Crateria-Chozodia door
    ["Chozodia Under Tube Items Ballspark"] =
        CanBallspark,

    -- Walljump and midair morph to access the morph tunnel above the blue escape ship the mothership
    -- Only relevant if you don't have Supers+PBs to take the shortcut
    ["Mothership Upper Access Walljump"] =
        CanHiWallJump,
}

-- tricks allowed by default in Advanced logic
tricks_advanced = {
    -- General trick for several similar cases where this would be useful
    -- Balljump out of acid to drop a bomb right above liquid, then jump back out to begin a vertical IBJ
    ["Balljump to IBJ From Acid"] =
        All(
            CanIBJ,
            CanSpringBall
        ),

    -- Dislodge a Zoomer with a Super Missile then freeze it along the wall to grip, springball, or bomb jump up
    ["Brinstar Ripper Climb Zoomer Freeze"] =
        All(
            IceBeam,
            SuperMissiles,
            Any(
                PowerGrip,
                All(
                    CanBallJump,
                    Any(
                        NormalMode,
                        CanVerticalWall  -- On Hard, one ripper is missing, so need vertical
                    )
                )
            )
        ),

    -- Access the Brinstar Top area by freezing zoomers in two different spots to use knockback to skip balljumps
    ["Brinstar Top Access Damage Boost"] =
        All(
            IceBeam,
            CanWallJump,
            CanSingleBombBlock
        ),

    -- Do a very tricky walljump around a one-tile outcropping to access the Varia area
    ["Varia Area Access Get-Around Walljump"] =
        CanHiWallJump,

    -- Frame-perfectly climb up a crumble block with Power Grip and Hi-Jump or Space Jump
    ["Kraid Zipline Morph Jump Without Ziplines"] =
        All(
            PowerGrip,
            Any(
                HiJump,
                SpaceJump
            )
        ),

    -- Climb up the right shaft of Kraid using hi-balljumps into the divots in the walls
    ["Kraid Right Shaft Balljump Climb"] =
        CanHiSpringBall,

    -- Get into the high morph tunnel leading to the left shaft of Kraid with a space jump into very tight midair morph
    ["Kraid Left Shaft Access Space Jump Only"] =
        SpaceJump,

    -- Access Kraid's left shaft without ziplines by using some precise grips and jump extends. Harder than it sounds!
    ["Acid Worm Skip Grip Only"] =
        PowerGrip,

    -- Acid Worm Skip with bombs. A bit easier. Technically an IBJ; last bomb hits in midair to give extra distance.
    ["Acid Worm Skip Grip And Bombs"] =
        All(
            PowerGrip,
            Bomb,
            CanIBJ
        ),

    -- Climb into the tunnel of crumble blocks, then repeatedly jump up and quickly grip the next one
    ["Kraid Quad Ball Cannon Crumble Grip"] =
        All(
            Missiles,
            PowerGrip,
            Any(
                HiJump,
                SpaceJump
            )
        ),

    -- Use a spaceboost to break one of the bomb blocks leading down to the Unknown Item Statue, saving a PB
    ["Kraid Unknown Item Spaceboost"] =
        All(
            Missiles,
            SpeedBooster,
            SpaceJump,
            PowerBombCount(3)
        ),

    -- Go through the "T" room with the short zipline to refill PBs, then come back through that room to go down
    -- This saves the 2 PBs you need to get down the left shaft, so you can use 2 to get down to the Unknown statue
    ["Kraid Unknown Item With 2 PBs"] =
        All(
            Missiles,
            Any(
                PowerGrip,  -- Crumble grip shenanigans
                All(
                    Ziplines,
                    CanBallJump
                )
            )
        ),

    -- Get up Kraid right shaft without Speed Booster by using HiJump and Walljumps to get around an outcropping
    -- This trick only applies if the "kraid_right_shaft" layout patch is not on
    ["Kraid Bottom Escape Get-Around Walljump"] =
        CanHiWallJump,

    -- Knock an enemy off the wall with a Super Missile, wait for it to move into position, then
    -- freeze it and walljump up the first jump of the big room leading to the right shaft; skips other vertical
    ["Norfair Big Room Entrance Enemy Freeze"] =
        All(
            SuperMissiles,
            IceBeam,
            CanWallJump
        ),

    -- Traverse the room before Norfair Ice Beam with only Hi-Jump, no walljumps; 2 very tight jumps + jump extends
    ["Norfair Ice Beam Hi-Jump Only"] =
        HiJump,

    -- Hard Mode only
    -- Freeze a Sova on the wall (with a low chance of being frozen) in a certain spot to jump up with just Hi-Jump
    -- More annoying than difficult
    ["Behind Ice Beam Shaft Hard Mode Enemy Freeze"] =
        IceBeam,

    -- Kinda cursed enemy freeze to get up to Screw Attack area with just Hi-Jump. Requires very precise freeze
    -- positions for the Sova, and good RNG (you need to freeze it twice and it resists freezing).
    -- Fortunately, you can just reload the room.
    ["Screw Attack Access Enemy Freeze"] =
        All(
            IceBeam,
            HiJump
        ),

    -- Use Long Beam to destroy the top row of blocks, then place bombs along the top of the other row to clear out
    -- enough shot blocks to let you shoot the others out as you run through to get a speed charge
    ["Lower Norfair Wave Beam Skip With Bombs"] =
        All(
            Bomb,
            LongBeam,
            CanSpringBall,
            VariaSuit  -- I don't want to figure out reasonable hellruns doing this
        ),

    -- Access the items in the Ridley Southwest Puzzle area without Power Grip by using a one-frame crumble jump
    -- after breaking the missile block
    ["Ridley Southwest Puzzle Crumble Jump"] =
        Any(
            SpaceJump,
            CanWallJump
        ),

    -- Collect Ridley Northeast Corner without Ice Beam or flight by wall-jumping around a 1-block outcropping
    -- Disable Hi-Jump once you're walljumping on the upper part -- no Grip needed!
    ["Ridley Northeast Corner Get-Around Walljump"] =
        CanHiWallJump,

    -- Use Hi-Jump balljumps and some tricky IBJs to collect Ridley Bomb Puzzle without Power Grip
    ["Ridley Bomb Puzzle No Grip"] =
        All(
            CanHiSpringBall,
            CanHorizontalIBJ
        ),

    -- Place PBs in specific spots to break the bomb chains in certain ways to skip Bomb
    ["Ridley Bomb Puzzle Power Bombs"] =
        All(
            PowerBombCount(2),
            CanHiSpringBall
        ),

    -- It's possible to freeze Rinkas in such a way that you can just roll into the tunnel right before MB
    ["Mother Brain Access Ice Only"] =
        IceBeam,

    -- Build up speed by running against Mother Brain's tank after the final hit, then shinespark up (part of)
    -- the escape shaft and use walljumps for the rest
    ["Tourian Escape Shinespark"] =
        All(
            SpeedBooster,
            CanWallJump
        ),

    -- Only relevant on Hard/Either difficulty
    -- Use a combination of IBJ and walljumps to escape. IBJ is pretty slow and the time is tight on Hard, so this is
    -- not as simple as it might sound.
    ["Tourian Escape Hard Mode IBJ"] =
        All(
            CanIBJ,
            CanWallJump
        ),

    -- Really precise walljump to barely grip the outcropping for the upper Crateria-Chozodia door
    ["Crateria-Chozodia Door Get-Around Walljump"] =
        All(
            CanHiWallJump,
            PowerGrip
        ),

    -- Freeze a space pirate in such a way that you can get back up with only a regular balljump and no IBJ/Grip.
    -- Requires manipulating its AI in a certain way, then freezing it partway up the wall while inside its hitbox.
    -- Not super hard, but pretty annoying, and it hurts to attempt
    ["Alpha PB Area Ice Escape"] =
        All(
            IceBeam,
            CanBallJump,
            Any(
                CanWallJump,
                SpaceJump
            ),
            EnergyTanks(3)  -- You need to take a direct hit from the pirate to get this to work
        ),
}

-- Super hard tricks - Off by default, opt-in only
-- TODO
tricks_ludicrous = {
    -- Cross the big acid pool with a series of almost-pure-horizontal bomb jumps
    ["Acid Worm Skip Bomb Only"] =
        All(
            Bomb,
            CanHorizontalIBJ
        ),

    -- Set up a clip into the floor to get a speed boost to the right with less space
    ["Ridley Speed Jump No Wave"] =
        All(
            SpeedBooster,
            CanHiSpringBall
        ),

}

-- Tricky Shinesparks from previous versions and MZMR
tricky_shinesparks = {
    -- Arm a shinespark starting in the first save room, store it through the tunnel, then spark up to the item
    ["Brinstar Ceiling E-Tank Tricky Spark"] =
        All(
            MorphBall,
            SpeedBooster
        ),

    -- Arm a shinespark frame perfectly starting in the hive room, then keep it up the shaft and ballspark up
    -- Very challenging! You need clean movement and some enemy pattern luck
    ["Brinstar Ripper Climb Tricky Spark"] =
        All(
            Missiles,
            CanBallspark,
            CanWallJump
        ),

    -- Use a shinespark to access the Varia Suit area without any other height-gain items
    ["Varia Area Access Tricky Spark"] =
        All(
            SpeedBooster,
            Missiles,  -- To kill the enemy, which otherwise gets in your way when gaining charge
            Any(
                IceBeam,
                CanHiWallJump
            )
        ),

    -- With Gravity, charge near Kraid Acid Ballspark, then climb back up and shinespark left to skip ziplines
    ["Acid Worm Skip Tricky Spark"] =
        All(
            SpeedBooster,
            Any(
                HiJump,
                CanWallJump
            )
        ),

    -- Charge next to the Wave Beam Chozo statue, then quickly jump up and restore, continually refreshing charge until
    -- the final heated room before the larvae room to speed through the beam blocks
    ["Lower Norfair Wave Beam Skip Tricky Spark"] =
        All(
            SpeedBooster,
            Any(
                NormalMode,
                ScrewAttack  -- Hard mode adds extra enemies to the hardest room for this spark
            )
        ),

    -- Charge in Zebbo Nest, re-store in the map room just before the door, enter the door and walljump up the right wall
    -- then land on the platform and spark up
    -- This is super niche and likely only matters if hazard runs are all off or with a Ridley start location
    ["Ridley Left Shaft Climb Tricky Spark"] =
        All(
            SpeedBooster,
            CanWallJump,
            Any(
                PowerGrip,
                All(
                    HiJump,
                    CanBallspark
                )
            )
        ),

    -- Charge in the Norfair-Crateria elevator room, then head right, keeping the spark while going over the moat
    -- before finally sparking upwards to the shortcut with the Screw Attack blocks. Remember to walljump at the end.
    ["Crateria Upper Access Tricky Spark"] =
        All(
            SpeedBooster,
            PowerBombs,
            CanWallJump
        ),

    -- Use a precise diagonal shinespark in Crateria to access the Northeast Corner item without walljumps or Space Jump
    ["Crateria Northeast Corner Tricky Spark"] =
        SpeedBooster,
}

-- Hazard runs
hazard_runs_normal = {
    ["Brinstar Acid Near Varia Acid Dive - Normal"] =
        Energy(199),
    ["Norfair Above Ice Hellrun - Normal"] =
        Energy(199),
    ["Norfair Under Elevator Hellrun - Normal"] =
        Any(  -- Note that this area requires either Screw or Speed to access in the first place
            All(
                ScrewAttack,
                Energy(399)
            ),
            All(
                SpeedBooster,
                Energy(199)
            ),
            All(
                ScrewAttack,
                SpaceJump,
                Energy(299)
            )
        ),
    ["Norfair Right Shaft to Lower Hellrun - Normal"] =
        Any(
            Energy(449),
            All(
                Energy(399),
                Any(
                    CanHorizontalIBJ,
                    All(
                        GravitySuit,
                        CanIBJ
                    )
                )
            ),
            All(
                SpeedBooster,
                PowerBombs,
                Energy(349)
            ),
            All(
                SpaceJump,
                Energy(249)
            )
        ),
    ["Lower Norfair to Right Shaft Hellrun - Normal"] =
        Any(
            All(
                CanHorizontalIBJ,
                Energy(399)
            ),
            All(
                Energy(299),
                Any(
                    PowerGrip,
                    HiJump,
                    SpaceJump,
                    CanWallJump,
                    All(
                        CanIBJ,
                        Any(
                            IceBeam,
                            GravitySuit
                        )
                    )
                )
            )
        ),
    ["Norfair Under Wave Hellrun Left - Normal"] =
        Energy(199),
    ["Norfair Under Wave Hellrun Right - Normal"] =
        Energy(299),
    ["Lower Norfair Lava Dive - Normal"] =
        Any(
            All(
                PowerGrip,
                Energy(799)
            ),
            All(
                CanHiWallJump,
                Energy(949)  -- Much harder to execute well without Grip, even if similar speed when done optimally
            ),
            All(
                VariaSuit,
                PowerGrip,
                Energy(499)
            ),
            All(
                VariaSuit,
                CanHiWallJump,
                Energy(599)
            )
        ),
    ["Ridley Hellrun - Normal"] =
        Any(
            MissileCount(6),
            PlasmaBeam,
            Energy(199)
        ),
    -- This is for collecting the item and getting out
    ["Chozodia Lava Dive Item - Normal"] =
        All(
            PowerGrip,
            CanSpringBall,
            Any(
                Energy(649),
                All(
                    VariaSuit,
                    Energy(399)
                )
            )
        ),
    -- This is for just getting through the lava
    ["Chozodia Lava Dive Escape - Normal"] =
        Any(
            Energy(399),
            All(
                VariaSuit,
                Energy(249)
            )
        ),
}

hazard_runs_minimal = {
    ["Brinstar Acid Near Varia Acid Dive - Minimal"] =
        Energy(149),
    ["Norfair Above Ice Hellrun - Minimal"] =
        Any(
            Energy(149),
            ScrewAttack  -- Screw makes traversing the room much faster and safer, so only 1 etank is needed
        ),
    --TODO: Theoretically Hard mode lets this be done with less by farming in Bomb Trap room, but I'm not sure I want that in logic
    ["Norfair Under Elevator Hellrun - Minimal"] =
        Any(
            All(
                ScrewAttack,
                Energy(299)
            ),
            All(
                SpeedBooster,
                Energy(149)
            ),
            All(
                ScrewAttack,
                SpaceJump,
                Energy(249)
            )
        ),
    ["Norfair Right Shaft to Lower Hellrun - Minimal"] =
        Any(
            Energy(299),
            All(
                Energy(249),
                SpeedBooster,
                PowerBombs,
                Any(
                    PowerGrip,
                    CanWallJump
                )
            ),
            All(
                SpaceJump,
                Energy(199)
            )
        ),
    ["Lower Norfair to Right Shaft Hellrun - Minimal"] =
        Any(
            All(
                Energy(149),
                Any(
                    HiJump,
                    SpaceJump
                )
            ),
            All(
                Energy(199),
                Any(
                    PowerGrip,
                    CanWallJump
                )
            ),
            All(
                CanIBJ,
                IceBeam,
                Energy(249)
            ),
            All(
                Energy(299),
                Any(
                    CanHorizontalIBJ,
                    All(
                        CanIBJ,
                        GravitySuit
                    )
                )
            )
        ),
    ["Norfair Under Wave Hellrun Left - Minimal"] =
        Energy(149),
    ["Norfair Under Wave Hellrun Right - Minimal"] =
        Any(
            Energy(249),
            All(
                Any(
                    MissileCount(4),
                    ScrewAttack
                ),
                Energy(199)
            )
        ),
    ["Lower Norfair Lava Dive - Minimal"] =
        Any(  -- Both Grip and HiWJs are about as fast optimally
            Energy(599),  -- TODO: this could maybe go down 50 if you're extremely clean but I can't do it
            All(
                VariaSuit,
                Energy(349)
            )
        ),
    ["Ridley Hellrun - Minimal"] =
        Any(
            NormalMode,  -- Just tank hits
            Energy(149),
            MissileCount(6),
            PlasmaBeam
        ),
    -- This is for collecting the item and getting out
    ["Chozodia Lava Dive Item - Minimal"] =
        All(
            PowerGrip,
            CanSpringBall,
            Any(
                Energy(499),
                All(
                    VariaSuit,
                    Energy(299)
                )
            )
        ),
    -- This is for just getting through the lava
    ["Chozodia Lava Dive Escape - Minimal"] =
        Any(
            Energy(299),
            All(
                VariaSuit,
                Energy(199)
            )
        ),
}

