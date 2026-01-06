-- Regional connection requirements

-- brinstar main to past-hives, top to past-hives is different
function brinstar_past_hives()
    return All(
        MorphBall,
        Missiles,
        Any(
            NormalCombat,
            MissileCount(10),
            SuperMissiles,
            LongBeam,
            ChargeBeam,
            IceBeam,
            WaveBeam,
            PlasmaBeam,
            ScrewAttack
        )
    )


end
function brinstar_main_to_brinstar_top()
    return Any(
        All(
            CanSingleBombBlock,
            CanBallJump
        ),
        Trick("Brinstar Top Access Damage Boost")
    )


end
function brinstar_pasthives_to_brinstar_top()
    return All(
        Any(
            CanFly,
            All(
                IceBeam,
                CanHiWallJump
            )
        ),
        CanBallJump
    )


end
function brinstar_top_to_varia()
    return All(
        Any(
            SpaceJump,
            CanHorizontalIBJ,
            CanHiGrip,
            Trick("Varia Area Access Enemy Freeze"),
            Trick("Varia Area Access Get-Around Walljump"),
            Trick("Varia Area Access Tricky Spark")
        ),
        CanBallJump
    )


end
-- this works for now. it's kind of tricky, cause all you need just to get there is PBs and bombs,
-- but to actually do anything (including get to ship) you need IBJ/speed/sj. it only checks for speed
-- for now since the only thing you'd potentially need this entrance for is Landing Site Ballspark
-- (this assumption changes if/when entrance/elevator rando happens)
function brinstar_crateria_ballcannon()
    return All(
         PowerBombs,
         CanBallCannon,
         CanVerticalWall,
         SpeedBooster
     )


end
-- used for the items in this area as well as determining whether the ziplines can be activated
function kraid_upper_right()
    return All(
        Missiles,
        CanBallCannon,
        Any(  -- Getting to the top of the right shaft
            CanFlyWall,
            PowerGrip,
            Trick("Kraid Right Shaft Balljump Climb")
        ),
        Any(  -- Getting up to the top door of the right shaft
            CanVertical,
            Trick("Kraid Right Shaft Enemy Freeze")
        ),
        Any(  -- Getting through the hole in the next room
            CanHorizontalIBJ,
            PowerGrip,
            All(
                IceBeam,
                CanBallJump
            ),
            All(
                GravitySuit,
                CanIBJ
            ),
            All(
                Any(
                    HazardRuns,
                    VariaSuit
                ),
                Trick("Balljump to IBJ From Acid")
            )
        )
    )


end
-- access to lower kraid
function kraid_left_shaft_access()
    return All(
        Any(
            CanHorizontalIBJ,
            PowerGrip,
            All(
                GravitySuit,
                CanIBJ
            ),
            All(
                NormalLogic,
                CanHiSpringBall
            ),
            Trick("Kraid Left Shaft Access Space Jump Only")
        ),
        CanBallJump,
        CanBombTunnelBlock,
        Any(
            Ziplines,
            SpaceJump,
            All(
                GravitySuit,
                Any(
                    CanIBJ,
                    Trick("Acid Worm Skip Tricky Spark")
                )
            ),
            Trick("Acid Worm Skip Grip Only"),
            Trick("Acid Worm Skip Grip And Bombs"),
            Trick("Acid Worm Skip Bomb Only")
        )
    )


end
function kraid_left_shaft_to_bottom()
    return UnknownItem2


end
function kraid_bottom_to_lower_norfair()
    return Trick("Kraid-Norfair Shortcut")


end
function norfair_main_to_crateria()
    return All(
        MorphBall,
        Any(
            CanLongBeam(1),
            CanBallspark
        ),
        Any(
            LayoutPatches("crateria_water_speedway"),
            CanEnterMediumMorphTunnel
        )
    )


end
function norfair_right_shaft_access()
    return Any(
        CanVertical,
        SpeedBooster,
        Trick("Norfair Big Room Entrance Enemy Freeze")
    )


end
function norfair_upper_right_shaft()
    return Any(
        CanVerticalWall,
        IceBeam
    )


end
function norfair_behind_ice_beam()
    return All(
        CanReachLocation("Norfair Ice Beam"),
        Any(
            CanLongBeam(2),
            WaveBeam
        ),
        MorphBall,
        Any(
            All(
                PowerGrip,
                Any(
                    CanWallJump,
                    SpaceJump,
                    IceBeam
                )
            ),
            CanIBJ,
            All(
                IceBeam,
                CanHiSpringBall,
                Any(
                    NormalMode,
                    CanWallJump,
                    Trick("Behind Ice Beam Shaft Hard Mode Enemy Freeze")
                )
            )
        )
    )


end
function norfair_behind_ice_to_bottom()
    return Trick("Norfair-Ridley Shortcut")


end
function norfair_shaft_to_under_elevator()
    return Any(
        SpeedBooster,
        All(
            ScrewAttack,
            Any(
                CanFlyWall,
                CanHiGrip
            )
        )
    )


end
-- under elevator to lower right shaft
function norfair_lower_right_shaft()
    LRSByHiJumpRule = norfair_lower_right_shaft_to_lrs_by_hijump()
    LowerNorfairAccess = norfair_lower_right_shaft_to_lower_norfair()
    return Any(
        All(
            ScrewAttack,
            Any(
                CanFlyWall,
                CanHiGrip
            )
        ),
        All(
            SpeedBooster,
            Any(  -- escape via ballcannon
                All(
                    LRSByHiJumpRule,
                    Any(
                        Missiles,
                        CanVertical
                    ),
                    CanBallCannon
                ),
                -- to reach a save station and warp out
                LowerNorfairAccess
            )
        )
    )


end
-- This region only contains the Lower Right Shaft By Hi-Jump item, and serves a pathfinding purpose
function norfair_lower_right_shaft_to_lrs_by_hijump()
    return All(
        Any(
            CanIBJ,
            CanHiGrip,
            All(
                SpaceJump,
                PowerGrip
            ),
            Trick("Norfair Right Shaft Get-Around Walljump")
        ),
        Any(  -- escape
            CanIBJ,
            All(
                PowerGrip,
                Any(
                    SpaceJump,
                    CanWallJump
                )
            ),
            All(
                CanBallCannon,
                Any(
                    Missiles,
                    CanVertical
                )
            )
        )
    )


end
function by_hijump_to_lower_right_shaft()
    return Any(
        CanIBJ,
        All(
            MorphBall,
            PowerGrip,
            CanFlyWall
        )
    )


end
function norfair_lower_shaft_to_under_elevator()
    return All(
        ScrewAttack,
        Any(
            CanFlyWall,
            CanHiGrip
        )
    )


end
function norfair_lower_right_shaft_to_lower_norfair()
    return All(
        Missiles,
        CanBombTunnelBlock,
        Any(
            VariaSuit,
            Trick("Norfair Right Shaft to Lower Hellrun - Normal"),
            Trick("Norfair Right Shaft to Lower Hellrun - Minimal")
        ),
        Any(  -- First heated room
            SpaceJump,
            CanWallJump,
            CanHorizontalIBJ,
            All(
                GravitySuit,
                Any(
                    CanHiGrip,
                    CanIBJ
                )
            ),
            All(
                HazardRuns,
                Trick("Balljump to IBJ From Acid")
            ),
            All(
                CanEnterMediumMorphTunnel,
                CanBallJump,
                Any(
                    PowerGrip,
                    All(
                        CanBallJump,
                        NormalLogic  -- Slightly tight bomb jump, but you can do it with just one bomb
                    )
                )
            )
        ),
        Any(  -- Second heated room
            SpaceJump,
            Any(
                CanHorizontalIBJ,
                All(
                    GravitySuit,
                    CanIBJ
                )
            ),
            All(
                CanSingleBombBlock,
                SpeedBooster
            )
        )
    )


end
function lower_norfair_to_screwattack()
    return Any(
        All(
            ScrewAttack,
            Any(
                CanWallJump,
                SpaceJump
            )
        ),
        All(
            NormalLogic,
            MissileCount(5),
            Any(
                CanFlyWall,
                Trick("Screw Attack Access Enemy Freeze")
            )
        ),
        Trick("Screw Attack Access Shinespark")
    )


end
-- This is necessary if your only way to the Screw Attack region is the ballcannon near the Ridley elevator
-- e.g. you don't have Varia/hellruns but can take the Ridley shortcut
function screw_to_lower_norfair()
    return Any(
        MissileCount(4),
        ScrewAttack
    )


end
function lower_norfair_to_kraid()
    return All(
        Trick("Kraid-Norfair Shortcut"),
        Any(
            CanIBJ,
            PowerGrip,
            CanBallspark,
            All(
                CanSpringBall,
                IceBeam
            )
        )
    )


end
-- The two items in Lower Norfair behind the Super Missile door right under the Screw Attack area
function lower_norfair_to_spaceboost_room()
    return All(
        SuperMissiles,
        Any(
            SpeedBooster,
            Bomb,
            PowerBombCount(2),
            All(
                WaveBeam,
                LongBeam,
                Any(
                    PowerGrip,
                    All(
                        GravitySuit,
                        CanEnterMediumMorphTunnel
                    )
                )
            )
        ),
        CanVertical
    )


end
function lower_norfair_to_bottom_norfair()
    return All(
        MissileCount(2),
        SpeedBooster,
        Any(
            VariaSuit,
            HazardRuns
        ),
        Any(
            WaveBeam,
            Trick("Lower Norfair Wave Beam Skip Tricky Spark"),
            Trick("Lower Norfair Wave Beam Skip With Bombs")
        ),
        Any(  -- Escape from under the first larva
            CanBallJump,
            LayoutPatches("norfair_larvae_room")
        ),
        CanEnterMediumMorphTunnel,
        Any(  -- First larva
            WaveBeam,
            PowerBombCount(2),
            All(
                PowerBombs,
                Any(
                    PlasmaBeam,
                    Bomb
                )
            ),
            Trick("Norfair Larvae Room Missiles")
        ),
        Any(  -- Second larva
            PlasmaBeam,
            CanBombTunnelBlock
        )
    )


end
-- Needed for Kraid -> Norfair shortcut, so this rule is for getting to Hi-Jump location from that entrance
function lower_norfair_to_lower_right_shaft()
    return All(
        Any(
            PowerGrip,
            HiJump,
            SpaceJump,
            CanWallJump,
            CanHorizontalIBJ,
            All(
                CanIBJ,
                Any(
                    IceBeam,
                    GravitySuit
                )
            )
        ),
        CanBombTunnelBlock,
        Any(
            VariaSuit,
            Trick("Lower Norfair to Right Shaft Hellrun - Normal"),
            Trick("Lower Norfair to Right Shaft Hellrun - Minimal")
        )
    )


end
function bottom_norfair_to_lower_shaft_by_hijump()
    return Any(
        All(
            Missiles,
            CanReachLocation("Norfair Right Shaft Bottom"),
            Any(
                CanBombTunnelBlock,
                WaveBeam
            ),
            CanFlyWall
        ),
        All(
            NormalLogic,
            SpeedBooster,
            CanFlyWall
        )
    )


end
function bottom_norfair_to_right_shaft()
    return SpeedBooster


end
function bottom_norfair_to_ridley()
    return Any(
        PowerBombs,
        All(
            Any(
                MissileCount(20),
                SuperMissileCount(8),
                All(
                    NormalCombat,
                    Any(
                        MissileTanks(1),
                        SuperMissileCount(6)
                    )
                )
            ),
            Any(
                IceBeam,
                SpaceJump,
                NormalLogic  -- You can hit the vines without any items, it's just a little tricky
            )
        )
    )


end
function bottom_norfair_to_screw()
    return All(
        RidleyBoss,
        SpeedBooster,
        Any(
            CanBallCannon,
            NormalLogic
        ),
        Any(
            IceBeam,
            CanVerticalWall
        )
    )


end
function ridley_main_to_left_shaft()
    return All(
        SuperMissiles,
        Any(
            CanVerticalWall,
            IceBeam
        ),
        Any(
            VariaSuit,
            Trick("Ridley Hellrun - Normal"),
            Trick("Ridley Hellrun - Minimal"),
            All(
                CanBombTunnelBlock,
                Any(
                    CanFly,
                    Trick("Ridley Fake Floor Skip")
                )
            )
        ),
        MorphBall,
        Any(
            NormalCombat,
            EnergyTanks(2),
            VariaSuit,
            GravitySuit
        )
    )


end
-- shortcut to the right of elevator
function ridley_main_to_right_shaft()
    return All(
        Trick("Ridley Right Shaft Shortcut"),
        Any(
            NormalCombat,
            EnergyTanks(2),
            VariaSuit,
            GravitySuit
        )
    )


end
function ridley_left_shaft_to_sw_puzzle()
    return All(
        SpeedBooster,
        Any(
            CanVerticalWall,
            IceBeam
        )
    )


end
-- The alcove to the right of the right shaft
function ridley_speed_puzzles_access()
    return All(
        SpeedBooster,
        CanVerticalWall
    )


end
-- getting into the gap at the start of "ball room" and subsequently into the general area of ridley himself
function ridley_right_shaft_to_central()
    return CanEnterMediumMorphTunnel


end
function ridley_right_shaft_to_left_shaft()
    return Any(
        CanIBJ,
        All(
            SpaceJump,
            Any(
                PowerGrip,
                All(
                    NormalLogic,
                    CanBallspark
                )
            )
        ),
        Trick("Ridley Left Shaft Climb Tricky Spark")
    )


end
-- Ridley, Unknown 3, and the item behind Unknown 3
function ridley_central_to_ridley_room()
    return All(
        Any(
            Missiles,
            ChargeBeam  -- Fun fact! you can kill the eye door with charge beam
        ),
        RidleyCombat,
        Any(
            CanFly,
            All(
                IceBeam,
                CanVerticalWall
            )
        )
    )


end
-- TODO: Disabled for now since this warp is one-time. Later it may be repeatable, and then it might matter rarely
function tourian_to_chozodia()
    return All(
        MotherBrainBoss,
        RuinsTestEscape
    )


end
-- From elevator to above the Unknown Item block by the Chozo statue
function crateria_lower_to_crateria_upper_right()
    return Any(
        All(
            Any(
                CanVerticalWall,
                CanBombTunnelBlock
            ),
            CanBallJump
        ),
        All(
            NormalLogic,
            ScrewAttack,
            Any(
                SpaceJump,
                CanHiWallJump,
                Trick("Crateria Upper Access Tricky Spark")
            ),
            CanFlyWall  -- Getting up the pillars after the screw blocks
        )
    )


end
-- From elevator to the left door of the Power Grip tower room
function crateria_lower_to_crateria_upper_left()
    return Any(
        All(
            CanFly,
            Any(
                All(
                    PowerBombs,
                    SpeedBooster,
                    GravitySuit
                ),
                All(
                    NormalLogic,  -- not in Simple level logic because this requires meta knowledge of the rando
                    LayoutPatches("crateria_water_speedway")
                )
            ),
            Any(
                LayoutPatches("crateria_left_of_grip"),
                CanEnterHighMorphTunnel
            )
        ),
        All(  -- Shinespark up landing site
            Any(
                PowerBombs,
                LayoutPatches("crateria_water_speedway")
            ),
            SpeedBooster,
            GravitySuit,
            Any(
                All(
                    LayoutPatches("crateria_left_of_grip"),
                    CanVertical
                ),
                CanEnterHighMorphTunnel
            )
        )
    )


end
-- This rule is mostly escape logic, so it's the same for both upper left and upper right
function crateria_upper_to_powergrip()
    return All(
        CanBallJump,
        Any(
            All(
                CanVertical,
                LayoutPatches("crateria_left_of_grip")
            ),
            CanEnterHighMorphTunnel,
            CanFly
        )
    )


end
-- Getting across the Power Grip tower room
function crateria_upper_leftright_connection()
    return Any(
        CanFly,
        All(
            NormalLogic,  -- Tight jump
            CanHiGrip
        )
    )


end
-- Upper Crateria door to Ruins, the two items right by it, and the Triple Crawling Pirates
function crateria_upper_to_chozo_ruins()
    return All(
        PowerBombs,
        MorphBall,
        Missiles,
        Any(
            CanFly,
            CanReachLocation("Crateria Northeast Corner"),
            Trick("Crateria-Chozodia Door Get-Around Walljump")
        ),
        Any(
            MotherBrainBoss,
            OptionIs("chozodia_access", 0)
        )
    )


end
-- Ruins to Chozo Ghost, the three items in that general area, and the lava dive item
function chozo_ruins_to_ruins_test()
    return All(
        MorphBall,
        PowerBombCount(2),  -- 2 PBs ALWAYS required at minimum, but you may need many more
        Any(
            All(
                Bomb,
                Any(
                    NormalMode,
                    PowerBombCount(4)  -- on Hard a save room is disabled, so you cannot refill PBs, requiring more
                )
            ),
            PowerBombCount(8),
            All(
                NormalMode,
                PowerBombCount(5)
            ),
            All(  -- Skips one PB on the slow-crumble morph tunnel
                Any(
                    PowerBombCount(7),
                    All(
                        NormalMode,
                        PowerBombCount(4)
                    )
                ),
                Any(
                    ScrewAttack,
                    WaveBeam
                ),
                NormalLogic
            ),
            All(  -- Skips the Triple Crawling Pirates room and a bomb chain but doesn't skip the crumble tunnel
                Any(
                    PowerBombCount(5),  -- Saves 2 on Hard
                    All(
                        NormalMode,
                        PowerBombCount(4)  -- Only saves 1 on Normal because you can refill
                    )
                ),
                CanFlyWall,
                MissileCount(3),
                Missiles,
                Trick("Chozo Ghost Access Reverse")
            ),
            All(  -- Skips everything possible, but still only PBs
                CanFlyWall,
                Any(
                    ScrewAttack,
                    WaveBeam
                ),
                Missiles,
                PowerBombCount(4),  -- technically should be 3 on Normal, but Normal can't have 3 max without having 4
                NormalLogic,
                Trick("Chozo Ghost Access Reverse")
            )
        ),
        CanVerticalWall,
        ChozodiaCombat
    )


end
-- Potentially useful for closed Chozodia post-MB warp, if that ever becomes a valid path
function ruins_test_to_ruins()
    return All(
        ChozoGhostBoss,
        RuinsTestEscape,
        Any(
            All(  -- Through the lava
                Any(
                    CanWallJump,
                    All(
                        GravitySuit,
                        CanFly
                    )
                ),
                Any(
                    ScrewAttack,
                    All(
                        NormalLogic,
                        Missiles,
                        Any(
                            Bomb,
                            PowerBombCount(2)
                        )
                    )
                ),
                Any(
                    GravitySuit,
                    Trick("Chozodia Lava Dive Escape - Normal"),
                    Trick("Chozodia Lava Dive Escape - Minimal")
                )
            ),
            All(  -- Or going all the way back through the ruins
                NormalLogic,
                Any(
                    PowerBombCount(4),
                    All(
                        Bomb,
                        PowerBombCount(2)
                    )
                ),
                CanFlyWall,
                ScrewAttack
            )
        )
    )


end
function chozo_ruins_to_chozodia_tube()
    return Any(
        All(
            NormalLogic,  -- It's a kinda tricky walljump but not really trick worthy
            CanWallJump
        ),
        CanFly
    )


end
-- Specifically getting to the room with Crateria Upper Door location. Might need another empty region for region rando
function chozodia_tube_to_chozo_ruins()
    return All(
        Any(
            CanFlyWall,
            CanHiGrip
        ),
        CanBombTunnelBlock
    )


end
function crateria_to_under_tube()
    return All(
        PowerBombs,
        MorphBall,
        Any(
            SpeedBooster,
            CanFlyWall,
            CanHiGrip
        ),
        Any(
            MotherBrainBoss,
            OptionIs("chozodia_access", 0)
        )
    )


end
function under_tube_to_tube()
    return Any(
        SpeedBooster,
        All(
            CanFly,
            PowerBombs
        )
    )


end
function under_tube_to_crateria()
    return Any(
        CanIBJ,
        All(
            PowerGrip,
            CanFlyWall
        ),
        Trick("Chozodia Under Tube Items Ballspark")  -- Not an item but same idea so might as well reuse it
    )


end
function tube_to_under_tube()
    return Any(
        PowerBombCount(3),  -- most paths here require breaking a bomb chain on the way here and back
        All(
            Bomb,
            PowerBombs
        )
    )


end
function chozodia_tube_to_mothership_central()
    return All(
        ChozodiaCombat,
        Any(
            CanFly,
            CanHiWallJump,
            Trick("Chozodia Pirates Enemy Freezes")
        )
    )


end
-- access to the map station
function mothership_central_to_lower()
    return All(
        Any(
            PowerBombCount(2),
            All(
                Bomb,
                PowerBombs
            )
        ),
        Any(  -- Getting to the save room
            Missiles,
            CanHiGrip,
            CanHiWallJump,
            CanFly,
            All(
                Trick("Chozodia Pirates Enemy Freezes"),
                Any(
                    HiJump,
                    PowerGrip,
                    CanWallJump
                )
            )
        )
    )


end
-- accessing the missile door just under the Behind Workbot item
function mothership_central_to_upper()
    return All(
        Missiles,
        Any(
            Bomb,
            PowerBombCount(2)
        ),
        Any(
            All(
                ScrewAttack,
                Any(
                    CanWallJump,
                    SpaceJump,
                    All(
                        HiJump,
                        Any(
                            PowerGrip,
                            CanIBJ
                        )
                    )
                )
            ),
            All(
                MissileCount(5),
                Any(
                    CanFly,
                    CanHiGrip,
                    CanHiWallJump,
                    All(
                        Trick("Chozodia Pirates Enemy Freezes"),
                        CanVerticalWall
                    )
                )
            ),
            -- the low% way
            All(
                Any(
                    MissileCount(4),
                    ScrewAttack
                ),
                Any(
                    CanFly,
                    CanHiGrip,
                    CanHiWallJump
                ),
                Any(
                    Bomb,
                    PowerBombCount(3)
                ),
                Any(
                    ScrewAttack,
                    MissileCount(5),
                    Bomb,
                    PowerBombCount(4)
                )
            )
        )
    )


end
function mothership_lower_to_upper()
    return All(
        CanBombTunnelBlock,
        Any(
            CanFly,
            CanHiGrip,
            CanHiWallJump  -- HJWJ required to get from the blue ship to the room under workbot; just WJ doesn't work
        )
    )


end
-- the long way around - in case you don't have enough PBs
function mothership_upper_to_lower()
    return All(
        Any(
            CanFlyWall,
            CanHiGrip
        ),
        Any(
            All(
                NormalMode,
                MissileCount(2),
                CanBombTunnelBlock
            ),
            All(
                MissileCount(4),
                Bomb  -- On Hard, you'd need 2 PBs to go this way, so the more direct central -> lower route is better
            )
        )
    )


end
-- to the room right past Pirate Pitfall Trap
function mothership_upper_to_deep_mothership()
    return Any(
        All(
            Missiles,
            Any(
                CanFly,
                Trick("Mothership Upper Access Walljump")
            )
        ),
        -- shortcut, going through Pirate Pitfall Trap
        All(
            SuperMissiles,
            PowerBombs,
            Any(
                CanFlyWall,
                NormalLogic  -- Leave and return to the room after PBing, the bomb blocks never reform
            )
        )
    )


end
function deep_mothership_to_cockpit()
    return All(
        CanFlyWall,
        Any(
            Bomb,
            PowerBombCount(4)
        ),
        ChozodiaCombat
    )


end
function cockpit_to_original_pb()
    return All(
        Any(  -- cannot IBJ to escape to cockpit
            CanWallJump,
            HiJump,
            PowerGrip,
            SpaceJump
        ),
        Any(
            Bomb,
            PowerBombCount(2)
        ),
        Any(
            CanIBJ,
            All(
                PowerGrip,
                Any(
                    CanFlyWall,
                    HiJump
                )
            ),
            Trick("Alpha PB Area Ice Escape")
        )
    )


end
function cockpit_to_mecha_ridley()
    return All(
        CanBombTunnelBlock,
        Any(
            All(
                PowerBombs,
                CanVertical
            ),
            CanIBJ,
            PowerGrip,
            Trick("Chozodia Pirates Enemy Freezes")
        ),
        Any(
            CanBallJump,
            PowerGrip
        ),
        Any(
            All(
                PowerBombs,
                Any(
                    Bomb,
                    PowerBombCount(2),
                    All(
                        NormalLogic,
                        MissileCount(4)
                    )
                )
            ),
            Trick("Mecha Ridley Hall PB Skip")
        )
    )
end
