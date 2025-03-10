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
        All(
            AdvancedLogic,
            IceBeam,
            CanWallJump,
            PowerBombs
        )
    )


end
function brinstar_pasthives_to_brinstar_top()
    return All(
        Any(
            CanFly,
            All(
                HiJump,
                IceBeam,
                CanWallJump
            )
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
        Any(
            CanHorizontalIBJ,
            PowerGrip,
            All(
                NormalLogic,
                IceBeam,
                CanBallJump,
                CanVerticalWall
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
                NormalLogic,
                HiJump
            )
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
                    All(
                        CanTrickySparks,
                        Any(
                            HiJump,
                            CanWallJump
                        )
                    )
                )
            ),
            All(  -- Acid Worm Skip
                AdvancedLogic,
                PowerGrip
            )
        )
    )


end
function kraid_left_shaft_to_bottom()
    return UnknownItem2


end
function kraid_bottom_to_lower_norfair()
    return All(
        NormalLogic,
        ScrewAttack,
        PowerBombs,
        Missiles,
        MorphBall
    )


end
function norfair_main_to_crateria()
    return All(
        MorphBall,
        Any(
            CanLongBeam(1),
            CanBallspark
        ),
        Any(
            LayoutPatches,
            CanEnterMediumMorphTunnel
        )
    )


end
function norfair_right_shaft_access()
    return Any(
        CanVertical,
        SpeedBooster,
        All(
            SuperMissiles,
            IceBeam,
            CanWallJump,
            AdvancedLogic
        )
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
            CanLongBeam(1),
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
                HiJump,
                Any(
                    NormalMode,
                    CanWallJump,
                    AdvancedLogic  -- Finicky enemy freeze to get up the triple ripper room with just HJ on Hard
                )
            )
        )
    )


end
function norfair_behind_ice_to_bottom()
    return All(
        NormalLogic,
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
                HiJump
            ),
            All(
                PowerGrip,
                Any(
                    CanWallJump,
                    SpaceJump
                )
            )
        )
    )


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
    RightShaftNearHiJumpRule = norfair_lowerrightshaft["Norfair Right Shaft Near Hi-Jump"]
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
            Any(  -- escape
                All(
                    RightShaftNearHiJumpRule,  -- shorthand for accessing that area of the room
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
            SpaceJump,
            CanWallJump,
            CanHorizontalIBJ,
            All(
                GravitySuit,
                CanHiGrip
            ),
            All(
                Any(
                    HiJump,
                    PowerGrip,
                    CanIBJ
                ),
                Any(
                    PowerGrip,
                    CanHorizontalIBJ,
                    All(
                        AdvancedLogic,
                        IceBeam
                    )
                )
            )
        ),
        Any(
            VariaSuit,
            Hellrun(6)
        ),
        Any(
            SpaceJump,
            CanHorizontalIBJ,
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
                All(
                    AdvancedLogic,
                    IceBeam,
                    HiJump
                )
            )
        ),
        All(
            NormalLogic,
            SpeedBooster
        )
    )


end
-- This is necessary if your only way to the Screw Attack region is the ballcannon near the Ridley elevator
function screw_to_lower_norfair()
    return Any(
        MissileCount(4),
        ScrewAttack
    )


end
function lower_norfair_to_kraid()
    return All(
        NormalLogic,
        ScrewAttack,
        PowerBombs,
        Missiles,
        Any(
            CanIBJ,
            PowerGrip,
            All(
                HiJump,
                IceBeam
            ),
            All(
                AdvancedLogic,
                CanBallspark
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
                        HiJump
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
            Hellrun(1)
        ),
        Any(
            WaveBeam,
            All(
                NormalMode,
                CanTrickySparks
            ),
            All(
                ScrewAttack,  -- Hard mode adds extra enemies to the hardest room for this spark
                CanTrickySparks
            )
        ),
        CanEnterMediumMorphTunnel,
        Any(  -- defeating the larvae
            PowerBombCount(2),
            All(
                WaveBeam,
                CanBombTunnelBlock
            ),
            All(
                AdvancedLogic,
                Missiles,  -- you can defeat the first larva by jumping and shooting missiles up into the ceiling
                Any(
                    PlasmaBeam,
                    CanBombTunnelBlock
                )
            )
        )
    )


end
-- Needed for Kraid -> Norfair shortcut, so rules assume getting to Hi-Jump location from that entrance
function lower_norfair_to_lower_right_shaft()
    return All(
        CanVerticalWall,
        CanBombTunnelBlock,
        Any(
            VariaSuit,
            Hellrun(2)  -- TODO: may be possible with even just 1
        )
    )


end
function bottom_norfair_to_lower_shaft()
    BottomShaftLocationRule = norfair_bottom["Norfair Right Shaft Bottom"]
    return Any(
        All(
            Missiles,
            Any(
                CanFlyWall,
                All(
                    BottomShaftLocationRule,
                    Any(
                        HiJump,
                        PowerGrip,
                        All(
                            NormalLogic,
                            Bomb
                        )
                    )
                )
            ),
            Any(
                PowerGrip,
                CanIBJ
            ),
            Any(
                CanBombTunnelBlock,
                WaveBeam
            )
        ),
        All(
            SpeedBooster,
            NormalLogic
        )
    )


end
function bottom_norfair_to_ridley()
    return Any(
        All(
            Any(
                MissileTanks(1),
                SuperMissileCount(6)
            ),
            Any(
                IceBeam,
                NormalLogic
            )
        ),
        PowerBombs
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
            Hellrun(1),
            All(
                CanFly,
                CanBombTunnelBlock
            )
        ),
        MorphBall,
        Any(
            NormalCombat,
            EnergyTanks(1)
        )
    )


end
-- shortcut to the right of elevator
function ridley_main_to_right_shaft()
    return All(
        Missiles,
        Any(
            CanIBJ,
            All(
                PowerGrip,
                CanBombTunnelBlock,
                Any(
                    SpaceJump,
                    HiJump,
                    IceBeam
                )
            )
        ),
        Any(
            NormalCombat,
            EnergyTanks(1)
        )
    )


end
function ridley_left_shaft_to_sw_puzzle()
    return All(
        SpeedBooster,
        CanVerticalWall
    )


end
-- The alcove to the right of the right shaft
function ridley_speed_puzzles_access()
    return All(
        SpeedBooster,
        Any(
            CanVerticalWall,
            IceBeam
        )
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
            PowerGrip
        ),
        All(
            PowerGrip,
            CanWallJump,
            CanTrickySparks
        )
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
function tourian_to_chozodia()
    return All(
        MotherBrainBoss,
        RuinsTestEscape
    )


end
-- Getting to Unknown 1 and everything above
function crateria_main_to_crateria_upper()
    return Any(
        CanBallJump,
        All(
            NormalLogic,
            LayoutPatches,
            CanFly
        ),
        All(
            NormalLogic,
            ScrewAttack,
            Any(
                SpaceJump,
                All(
                    PowerBombs,
                    CanTrickySparks,
                    CanWallJump
                )
            )
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
            CanReachLocation("Crateria Northeast Corner")
        ),
        Any(
            MotherBrainBoss,
            OptionIs("chozodia_access", 0)
        )
    )


end
-- Ruins to Chozo Ghost, the three items in that general area, and the lava dive item
function chozo_ruins_to_ruins_test()  -- TODO: Hard mode + Chozodia forced post-charlie will need this to change
    return All(
        MorphBall,
        PowerBombs,
        Any(
            Bomb,
            PowerBombCount(4),
            All(
                PowerBombCount(3),
                Any(
                    CanFlyWall,
                    ScrewAttack
                ),
                NormalLogic
            ),
            All(
                PowerBombCount(2),
                CanFlyWall,
                ScrewAttack,
                NormalLogic
            )
        ),
        CanVerticalWall,
        ChozodiaCombat,
        RuinsTestEscape
    )


end
function chozo_ruins_to_chozodia_tube()
    return Any(
        All(
            NormalLogic,
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
        Any(  -- To get to the save station and warp out
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
            PowerBombs,
            ChozoGhostBoss  -- Change if basepatch makes the tube breakable before MB/Charlie
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
        All(
            NormalLogic,
            CanBallspark
        )
    )


end
function tube_to_under_tube()
    return All(
        ChozoGhostBoss,
        PowerBombs
    )


end
function chozodia_tube_to_mothership_central()
    return All(
        ChozodiaCombat,
        Any(
            CanFly,
            All(
                CanWallJump,
                HiJump
            ),
            All(
                NormalLogic,
                IceBeam
            )
        )
    )


end
-- access to the map station
function mothership_central_to_lower()
    return Any(
        PowerBombCount(2),
        All(
            Bomb,
            PowerBombs
        )
    )


end
-- accessing the missile door just under the Behind Workbot item
function mothership_central_to_upper()
    return All(
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
                    All(
                        HiJump,
                        CanWallJump
                    )
                )
            ),
            -- the low% way
            All(
                Any(
                    MissileCount(2),
                    ScrewAttack
                ),
                Any(
                    CanFly,
                    CanHiGrip,
                    All(
                        HiJump,
                        CanWallJump
                    )
                ),
                Any(
                    Bomb,
                    PowerBombCount(3)
                ),
                Any(
                    ScrewAttack,
                    MissileCount(4),
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
            All(
                HiJump,
                CanWallJump
            )
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
        MissileCount(4),
        CanBombTunnelBlock
    )


end
-- to the room right past Pirate Pitfall Trap
function mothership_upper_to_deep_mothership()
    return Any(
        All(
            Missiles,
            Any(
                CanFly,
                All(
                    AdvancedLogic,  -- very tight midair morph
                    HiJump,
                    CanWallJump
                )
            )
        ),
        -- shortcut, going through Pirate Pitfall Trap
        All(
            SuperMissiles,
            PowerBombs,
            CanFlyWall
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
        Any(
            MinimalCombat,
            All(
                NormalCombat,
                EnergyTanks(3)
            ),
            EnergyTanks(6)
        )
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
            All(
                AdvancedLogic,
                IceBeam,
                CanBallJump
            )
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
            All(
                NormalLogic,
                IceBeam
            )
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
            All(
                NormalLogic,
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
                )
            )
        )
    )
end
