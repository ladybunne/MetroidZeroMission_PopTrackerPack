brinstar_start = {
            ["Brinstar Morph Ball"] = True,
            ["Brinstar Morph Ball Cannon"] = CanBallCannon,
            ["Brinstar Ceiling E-Tank"] = Any(
                All(
                    IceBeam,
                    Any(
                        RidleyBoss,
                        HardMode
                    )
                ),
                CanFly,
                Trick("Brinstar Ceiling E-Tank Tricky Spark")
            ),
        }

    brinstar_main = {
            ["Brinstar Long Beam"] = All(
                MorphBall,
                Any(
                    CanLongBeam(2),
                    LayoutPatches("brinstar_long_beam_hall")
                )
            ),
            ["Brinstar Main Shaft Left Alcove"] = All(
                CanSingleBombBlock,
                Any(
                    CanFlyWall,
                    IceBeam,
                    CanHiGrip
                )
            ),
            ["Brinstar Ballspark"] = All(
                CanBallspark,
                CanBombTunnelBlock
            ),
            ["Brinstar Ripper Climb"] = Any(
                All(
                    PowerGrip,
                    Any(
                        All(
                            IceBeam,
                            NormalMode  -- On Hard, one Ripper is missing
                        ),
                        CanFlyWall
                    ),
                    Any(
                        CanBallJump,
                        CanSingleBombBlock,
                        LayoutPatches("brinstar_top")
                    )
                ),
                CanIBJ,
                Trick("Brinstar Ripper Climb Zoomer Freeze"),
                Trick("Brinstar Ripper Climb Tricky Spark")
            ),
            ["Brinstar Speed Booster Shortcut"] = All(
                Any(
                    CanBallspark,
                    All(  -- Reverse way
                        NormalLogic,
                        CanBallJump
                    )
                ),
                CanBombTunnelBlock,
                CanVerticalWall
            ),
            ["Brinstar Worm Drop"] = All(
                MorphBall,
                Missiles
            ),
            ["Brinstar First Missile"] = MorphBall,
            ["Brinstar Behind Hive"] = All(
                MorphBall,
                Missiles
            ),
            ["Brinstar Under Bridge"] = All(
                Missiles,
                CanSingleBombBlock
            ),
        }

    brinstar_top = {
            ["Brinstar Upper Pillar"] = True
        }

    brinstar_varia_area = {
            ["Brinstar Varia Suit"] = All(
                Any(
                    CanHorizontalIBJ,
                    PowerGrip,
                    All(
                        GravitySuit,
                        CanVerticalWall
                    ),
                    All(
                        Any(
                            HazardRuns,  -- only 99 energy required as you can refill at the Chozo statue
                            VariaSuit
                        ),
                        CanHiWallJump,
                        Any(  -- The walljump up out of the acid is a little tight but doesn't feel worthy of a trick
                            SpaceJump,
                            NormalLogic
                        )
                    )
                ),
                Any(
                    Bomb,
                    Trick("Brinstar Varia Suit Power Bomb")
                ),
                CanEnterMediumMorphTunnel,
                Missiles
            ),
            ["Brinstar Acid Near Varia"] = All(
                Any(
                    CanLongBeam(5),
                    WaveBeam
                ),
                Any(
                    VariaSuit,
                    GravitySuit,
                    Trick("Brinstar Acid Near Varia Acid Dive - Normal"),
                    Trick("Brinstar Acid Near Varia Acid Dive - Minimal")
                )
            ),
    }

    brinstar_pasthives = {
            ["Brinstar Post-Hive in Wall"] = True,
            ["Brinstar Behind Bombs"] = All(
                Missiles,
                CanBombTunnelBlock,
                CanBallJump
            ),
            ["Brinstar Bomb"] = Missiles,
            ["Brinstar Post-Hive Pillar"] = True
        }


    kraid_main = {
            ["Kraid Save Room Tunnel"] = CanBombTunnelBlock,
            ["Kraid Zipline Morph Jump"] = Any(
                All(
                    Ziplines,
                    CanBallJump
                ),
                Trick("Kraid Zipline Morph Jump Without Ziplines")
            ),
            ["Kraid Acid Ballspark"] = All(
                Any(
                    CanIBJ,  -- Gravity is required for this item so regular IBJ works, unlike regional access
                    PowerGrip,
                    All(  -- A bit of a tight jump and kind of unintuitive
                        CanHiSpringBall,
                        NormalLogic
                    )
                ),
                CanBombTunnelBlock,
                GravitySuit,
                CanBallspark
            ),
            ["Kraid Right Hall Pillar"] = Missiles,
            ["Kraid Speed Jump"] = All(
                Missiles,
                SpeedBooster
            ),
            ["Kraid Upper Right Morph Ball Cannon"] = All(
                Missiles,
                CanBallCannon
            )
        }

    kraid_acidworm_area = {
            ["Kraid Under Acid Worm"] = All(
                Missiles,
                Any(
                    NormalCombat,
                    All(
                        MissileTanks(5),
                        EnergyTanks(1)
                    )
                ),
                CanSingleBombBlock,
                CanVerticalWall
            ),
            ["Kraid Zipline Activator Room"] = True,
            ["Kraid Zipline Activator"] = True
        }

    -- past the long acid pool
    kraid_left_shaft = {
            ["Kraid Behind Giant Hoppers"] = CanEnterHighMorphTunnel,
            ["Kraid Quad Ball Cannon Room"] = Any(
                All(
                    CanBombTunnelBlock,
                    Ziplines,
                    Missiles
                ),
                Trick("Kraid Quad Ball Cannon No Bombs"),
                Trick("Kraid Quad Ball Cannon Crumble Grip")
            ),
            ["Kraid Unknown Item Statue"] = All(
                Any(
                    Bomb,
                    PowerBombCount(4),  -- nowhere good to refill PBs between elevator shaft and here
                    ScrewAttack,
                    Trick("Kraid Unknown Item Spaceboost"),  -- 3 PBs
                    Trick("Kraid Unknown Item With 2 PBs")  -- 2 PBs
                ),
                Any(  -- To enter the morph tunnel to leave after getting the item on the statue
                    PowerGrip,
                    CanHiSpringBall,
                    CanIBJ,
                    All(
                        IceBeam,
                        CanBallJump
                    )
                )
            )
        }

    kraid_bottom = {
            ["Kraid Speed Booster"] = Any(
                KraidBoss,
                All(
                    NormalLogic,
                    SpeedBooster
                )
            ),
            ["Kraid Acid Fall"] = True,
            ["Kraid"] = All(
                Any(
                    UnknownItem2,
                    All(
                        NormalLogic,
                        SpeedBooster
                    )
                ),
                Missiles,
                KraidCombat,
                Any(  -- to escape, or to get to the upper door if you take the speed booster exit into the room
                    SpeedBooster,
                    CanHiGrip,
                    CanFlyWall
                ),
                Any(  -- to escape via the bottom right shaft
                    LayoutPatches("kraid_right_shaft"),
                    SpeedBooster,
                    CanFly,
                    Trick("Kraid Bottom Escape Enemy Freeze"),
                    Trick("Kraid Bottom Escape Get-Around Walljump")
                )
            )
        }

    norfair_main = {
            ["Norfair Hallway to Crateria"] = Any(
                PowerGrip,
                CanIBJ,
                All(
                    IceBeam,
                    CanEnterMediumMorphTunnel
                )
            ),
            ["Norfair Under Crateria Elevator"] = All(
                Any(
                    CanLongBeam(1),
                    CanBallspark
                ),
                Any(
                    CanEnterHighMorphTunnel,
                    Trick("Norfair Under Crateria Elevator Enemy Freeze")
                )
            )
        }

    norfair_right_shaft = {
            ["Norfair Big Room"] = Any(
                SpeedBooster,
                CanFly,
                All(
                    IceBeam,
                    CanVerticalWall
                ),
                Trick("Norfair Big Room Walljump")
            )
        }

    norfair_upper_right = {
            ["Norfair Ice Beam"] = All(
                Any(
                    CanFly,
                    PowerGrip,
                    All(
                        HazardRuns,
                        CanWallJump
                    ),
                    All(
                        IceBeam,
                        HardMode
                    ),
                    Trick("Norfair Ice Beam Hi-Jump Only")
                ),
                Any(  -- Escape
                    SuperMissiles,
                    All(
                        Any(
                            CanLongBeam(2),
                            WaveBeam
                        ),
                        Any(
                            IceBeam,
                            CanFlyWall,
                            CanHiGrip
                        )
                    )
                )
            ),
            ["Norfair Heated Room Above Ice Beam"] = Any(
                VariaSuit,
                Trick("Norfair Above Ice Hellrun - Normal"),
                Trick("Norfair Above Ice Hellrun - Minimal")
            )
        }

    norfair_behind_ice = {
            ["Norfair Behind Top Chozo Statue"] = True,  -- TODO Hard has extra considerations
        }

    norfair_under_brinstar_elevator = {
            ["Norfair Bomb Trap"] = All(
                CanReachLocation("Norfair Heated Room Under Brinstar Elevator"),
                Any(
                    Bomb,
                    Trick("Norfair Bomb Trap PB Only"),
                    All(
                        PowerBombs,
                        SpaceJump
                    )
                )
            ),
            ["Norfair Heated Room Under Brinstar Elevator"] = All(
                SuperMissiles,
                Any(
                    VariaSuit,
                    Trick("Norfair Under Elevator Hellrun - Normal"),
                    Trick("Norfair Under Elevator Hellrun - Minimal")
                )
            ),
    }

    norfair_lowerrightshaft = {
            ["Norfair Hi-Jump"] = Missiles,
        }

    norfair_lowerrightshaft_by_hijump = {
        ["Norfair Right Shaft Near Hi-Jump"] = True
    }

    lower_norfair = {
            ["Norfair Lava Dive Left"] = All(
                MissileCount(7),
                GravitySuit,
                CanFly
            ),
            ["Norfair Lava Dive Right"] = All(
                MissileCount(5),
                Any(
                    GravitySuit,
                    Trick("Lower Norfair Lava Dive - Normal"),
                    Trick("Lower Norfair Lava Dive - Minimal")
                ),
                Any(
                    CanBombTunnelBlock,
                    WaveBeam
                ),
                Any(
                    All(
                        GravitySuit,
                        CanVerticalWall
                    ),
                    PowerGrip,
                    CanHiWallJump
                )
            ),
            ["Norfair Wave Beam"] = MissileCount(4),
            ["Norfair Heated Room Below Wave - Left"] = All(
                CanVerticalWall,
                Any(
                    VariaSuit,
                    Trick("Norfair Under Wave Hellrun Left - Normal"),
                    Trick("Norfair Under Wave Hellrun Left - Minimal")
                ),
                Any(
                    CanIBJ,
                    CanHiSpringBall,
                    PowerGrip,
                    All(
                        IceBeam,
                        CanBallJump
                    )
                )
            ),
            ["Norfair Heated Room Below Wave - Right"] = All(
                CanVerticalWall,
                Any(
                    VariaSuit,
                    Trick("Norfair Under Wave Hellrun Right - Normal"),
                    Trick("Norfair Under Wave Hellrun Right - Minimal")
                )
            ),
        }

    norfair_screwattack = {
            ["Norfair Screw Attack"] = True,
            ["Norfair Next to Screw Attack"] = ScrewAttack,
        }

    norfair_behind_superdoor = {
            ["Norfair Behind Lower Super Missile Door - Left"] = All(
                Any(
                    All(
                        CanIBJ,
                        GravitySuit
                    ),
                    All(
                        SpaceJump,
                        PowerGrip
                    ),
                    All(  -- This is a kinda tight and unintuitive walljump but doesn't feel trick-worthy
                        NormalLogic,
                        GravitySuit,
                        CanHiGrip,
                        CanWallJump
                    ),
                    Trick("Norfair Behind Super Door Left Enemy Freeze"),
                    All(
                        HazardRuns,
                        Trick("Balljump to IBJ From Acid")
                    )
                ),
                Any(  -- To get out
                    LayoutPatches("norfair_behind_superdoor"),
                    SpeedBooster,
                    CanBallJump
                )
            ),
            ["Norfair Behind Lower Super Missile Door - Right"] = Any(
                SpaceJump,
                CanHorizontalIBJ,
                All(
                    CanIBJ,
                    GravitySuit
                ),
                All(
                    IceBeam,
                    CanWallJump
                ),
                All(
                    HiJump,
                    IceBeam
                ),
                All(
                    GravitySuit,
                    CanHiWallJump
                ),
                All(
                    HazardRuns,
                    Trick("Balljump to IBJ From Acid")
                )
            )
        }

    norfair_bottom = {
            ["Norfair Larva Ceiling"] = CanReachEntrance("Lower Norfair -> Bottom"),
            ["Norfair Right Shaft Bottom"] = Any(
                -- going from the right "stairs"
                All(
                    Any(
                        CanVerticalWall,
                        IceBeam
                    ),
                    CanBallJump
                ),
                -- using the shot blocks to the left
                All(
                    NormalLogic,
                    Missiles,
                    PowerGrip,
                    Any(
                        CanFlyWall,
                        IceBeam
                    )
                )
            )
        }

    ridley_main = {
            ["Ridley Imago Super Missile"] = All(
                CanVerticalWall,
                Any(
                    All(
                        MissileTanks(7),
                        EnergyTanks(1)
                    ),
                    All(
                        NormalCombat,
                        MissileTanks(4)
                    ),
                    All(
                        MinimalCombat,
                        Any(
                            MissileTanks(1),
                            SuperMissileCount(8)
                        )
                    ),
                    ChargeBeam
                )
            )
        }

    ridley_left_shaft = {
            ["Ridley West Pillar"] = True,
            ["Ridley Fake Floor"] = Any(
                CanBombTunnelBlock,  -- the long way
                CanFly,  -- the short way
                Trick("Ridley Fake Floor Skip")  -- the short way but spicy
            ),
        }

    ridley_sw_puzzle = {
            ["Ridley Southwest Puzzle Top"] = All(
                CanReachLocation("Ridley Southwest Puzzle Bottom"),
                MissileCount(5),
                Any(
                    CanWallJump,
                    PowerGrip,
                    SpaceJump
                )
            ),
            ["Ridley Southwest Puzzle Bottom"] = All(
                SpeedBooster,
                MorphBall,
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
                Missiles,
                Any(
                    PowerGrip,
                    Trick("Ridley Southwest Puzzle Crumble Jump")
                ),
                Any(
                    PowerGrip,
                    PowerBombs,
                    All(
                        LongBeam,
                        WaveBeam
                    )
                )
            )
        }

    ridley_right_shaft = {
            ["Ridley Long Hall"] = True,
            ["Ridley Northeast Corner"] = Any(
                CanFly,
                All(
                    IceBeam,
                    Any(
                        CanWallJump,
                        CanHiGrip
                    )
                ),
                Trick("Ridley Northeast Corner Get-Around Walljump")
            )
        }

    ridley_right_speed_puzzles = {
            ["Ridley Bomb Puzzle"] = All(
                Any(
                    PowerGrip,
                    Trick("Ridley Bomb Puzzle No Grip")
                ),
                Any(
                    All(
                        Bomb,
                        Any(
                            CanWallJump,
                            SpaceJump
                        )
                    ),
                    Trick("Ridley Bomb Puzzle Power Bombs")
                )
            ),
            ["Ridley Speed Jump"] = All(
                Missiles,
                Any(
                    WaveBeam,
                    Trick("Ridley Speed Jump No Wave")
                )
            )
        }

    ridley_central = {
            ["Ridley Upper Ball Cannon Puzzle"] = All(
                Any(
                    CanHiSpringBall,
                    CanIBJ,
                    All(
                        PowerGrip,
                        Any(
                            CanWallJump,
                            SpaceJump,
                            All(  -- A well-placed balljump and well-timed unmorph will grab the ledge
                                NormalLogic,
                                CanBallJump
                            )
                        )
                    )
                ),
                Any(
                    CanBallCannon,
                    LayoutPatches("ridley_ballcannon")
                )
            ),
            ["Ridley Lower Ball Cannon Puzzle"] = All(
                Any(
                    PowerBombs,
                    PowerGrip,
                    All(
                        WaveBeam,
                        Any(
                            CanWallJump,
                            SpaceJump
                        )
                    )
                ),
                Any(
                    CanBallCannon,
                    All(
                        LayoutPatches("ridley_ballcannon"),
                        Any(
                            HiJump,
                            SpaceJump,
                            CanWallJump
                        )
                    )
                )
            ),
            ["Ridley After Sidehopper Hall Upper"] = True,
            ["Ridley After Sidehopper Hall Lower"] = True,
            ["Ridley Center Pillar"] = Any(
                CanWallJump,
                PowerGrip,
                IceBeam,
                SpaceJump,
                CanHorizontalIBJ,
                All(
                    NormalLogic,
                    HiJump
                )
            ),
            ["Ridley Ball Room Lower"] = True,
            ["Ridley Ball Room Upper"] = All(
                SuperMissiles,
                Any(
                    CanFlyWall,
                    CanHiGrip
                ),
                Any(
                    Bomb,
                    PowerBombCount(3)
                )
            ),
            ["Ridley Fake Lava Under Floor"] = All(
                Any(
                    WaveBeam,
                    CanBombTunnelBlock
                ),
                CanEnterHighMorphTunnel
            ),
            ["Ridley Under Owls"] = True,
        }

    ridley_room = {
            ["Ridley Behind Unknown Statue"] = UnknownItem3,
            ["Ridley Unknown Item Statue"] = True,
            ["Ridley"] = UnknownItem3,
        }

    tourian = {
            ["Tourian Left of Mother Brain"] = All(
                ChozoGhostBoss,
                MotherBrainBoss,
                SpeedBooster,
                Any(
                    SpaceJump,
                    NormalLogic
                )
            ),
            ["Tourian Under Mother Brain"] = All(
                ChozoGhostBoss,
                MotherBrainBoss,
                SuperMissiles,
                CanEnterMediumMorphTunnel  -- to escape
            ),
            ["Mother Brain"] = All(
                IceBeam,
                Any(
                    Bomb,  -- only bomb can unlatch metroids
                    NormalCombat  -- or just don't get hit!
                ),
                MotherBrainCombat,
                Any(  -- to get through the tunnel right before Mother Brain
                    CanEnterHighMorphTunnel,
                    Trick("Mother Brain Access Wall Jump"),
                    Trick("Mother Brain Access Ice Only")
                ),
                Any(  -- to get through escape shaft
                    All(
                        NormalMode,
                        CanVertical
                    ),
                    Any(  -- Hard mode escape; much tighter time so rules are different
                        SpaceJump,
                        HiJump,
                        All(
                            PowerGrip,
                            CanWallJump
                        ),
                        Trick("Tourian Escape Hard Mode IBJ")
                    ),
                    Trick("Tourian Escape Shinespark")
                ),
                Any(  -- to get to ship
                    SpeedBooster,
                    CanFly,
                    All(
                        NormalLogic,
                        CanHiWallJump
                    )
                )
            )
        }

    crateria_main = {
            ["Crateria Landing Site Ballspark"] = All(
                CanBallspark,
                PowerBombs,
                Any(
                    GravitySuit,
                    CanReachEntrance("Brinstar -> Crateria Ballcannon")  -- Room load weirdness
                )
            ),
            ["Crateria Moat"] = True,
            ["Crateria Statue Water"] = UnknownItem1,
            ["Crateria Unknown Item Statue"] = All(
                Any(
                    CanVertical,
                    CanBombTunnelBlock
                ),
                CanBallJump
            ),
        }

    crateria_upper_right = {
            ["Crateria East Ballspark"] = All(
                CanBallspark,
                Any(
                    CanReachEntrance("Crateria -> Chozodia Upper Door"),
                    CanReachLocation("Crateria Northeast Corner")
                )
            ),
            ["Crateria Northeast Corner"] = All(
                SpeedBooster,
                Any(
                    SpaceJump,
                    CanWallJump,
                    Trick("Crateria Northeast Corner Tricky Spark")
                )
            )
        }

    crateria_powergrip = {
        ["Crateria Power Grip"] = True
    }

    chozodia_ruins_crateria_entrance = {
            ["Chozodia Upper Crateria Door"] =
                CanReachEntrance("Crateria -> Chozodia Upper Door"),  -- Specifically need to access this entrance, not just the region as it's one-way
            ["Chozodia Ruins East of Upper Crateria Door"] = Missiles,
            ["Chozodia Triple Crawling Pirates"] = All(
                Missiles,
                PowerBombCount(2),  -- 2 PBs ALWAYS required at minimum, but you may need many more
                Any(
                    All(
                        Bomb,
                        Any(
                            NormalMode,
                            PowerBombCount(3)  -- on Hard a save room is disabled, so you cannot refill PBs, requiring more
                        )
                    ),
                    PowerBombCount(7),  -- Hard, no refills, only PBs, no ability to skip any bomb chains
                    All(
                        NormalMode,
                        PowerBombCount(5)  -- no skipping bomb reqs, but with refills
                    ),
                    All(  -- Skips one PB on either the slow-crumble morph tunnel or the bomb chain after
                        Any(
                            PowerBombCount(6),
                            All(
                                NormalMode,
                                PowerBombCount(4)
                            )
                        ),
                        Any(
                            ScrewAttack,
                            WaveBeam,
                            CanFlyWall
                        ),
                        NormalLogic
                    ),
                    All(  -- Skips both but still only PBs
                        Trick("Chozo Ghost Access Reverse"),
                        Any(
                            ScrewAttack,
                            WaveBeam
                        ),
                        Any(
                            PowerBombCount(5),
                            All(
                                NormalMode,
                                PowerBombCount(3)
                            )
                        )
                    )
                ),
                Any(
                    CanHiGrip,
                    CanFlyWall,
                    Trick("Chozodia Pirates Enemy Freezes")
                ),
                ChozodiaCombat
            )
        }

    chozodia_ruins_test = {
            ["Chozodia Chozo Ghost Area Morph Tunnel Above Water"] = All(
                MissileCount(3),
                CanBallJump,
                Any(
                    All(  -- Going up through the water
                        Any(
                            CanWallJump,
                            All(
                                GravitySuit,
                                CanFly
                            )
                        ),
                        Any(
                            ScrewAttack,
                            NormalLogic  -- Skipping the screw attack wall with the missile tunnel
                        )
                    ),
                    Trick("Chozo Ghost Access Reverse")
                )
            ),
            ["Chozodia Chozo Ghost Area Underwater"] = All(
                Missiles,
                SpeedBooster,
                GravitySuit
            ),
            ["Chozodia Chozo Ghost Area Long Shinespark"] = All(
                Missiles,
                SpeedBooster,
                GravitySuit,
                Any(  -- IBJ is too slow to keep charge
                    SpaceJump,
                    CanWallJump
                ),
                Any(
                    ScrewAttack,
                    Trick("Chozo Ghost Shinespark No Screw")
                )
            ),
            ["Chozodia Lava Dive"] = All(
                Any(
                    ScrewAttack,
                    All(
                        Missiles,
                        Any(
                            Bomb,
                            PowerBombCount(2)
                        )
                    )
                ),
                Any(
                    All(
                        GravitySuit,
                        CanEnterHighMorphTunnel,
                        CanBallJump
                    ),
                    Trick("Chozodia Lava Dive Item - Normal"),
                    Trick("Chozodia Lava Dive Item - Minimal")
                ),
                Any(
                    CanWallJump,
                    All(
                        GravitySuit,
                        CanFly
                    )
                )
            ),
            ["Chozodia Ruins Test Reward"] = CanReachLocation("Chozo Ghost"),
            ["Chozo Ghost"] = All(
                MotherBrainBoss,
                RuinsTestEscape
            ),
        }

    chozodia_under_tube = {
            ["Chozodia Bomb Maze"] = All(
                MorphBall,
                CanBallJump,
                Any(
                    CanIBJ,
                    All(
                        PowerGrip,
                        Any(
                            HiJump,
                            CanWallJump,
                            SpaceJump
                        )
                    ),
                    All(
                        Trick("Chozodia Under Tube Items Ballspark"),
                        CanHiSpringBall
                    )
                ),
                Any(
                    Bomb,
                    PowerBombCount(3)
                )
            ),
            ["Chozodia Zoomer Maze"] = Any(
                CanIBJ,
                All(
                    PowerGrip,
                    CanBallJump
                ),
                Trick("Chozodia Under Tube Items Ballspark")
            ),
            ["Chozodia Left of Glass Tube"] = All(
                SpeedBooster,
                CanReachEntrance("Chozodia Glass Tube -> Chozo Ruins")  -- Required to access a save station after collecting to warp if necessary
            ),
            ["Chozodia Right of Glass Tube"] = All(
                PowerBombs,
                Any(
                    CanFly,
                    All(
                        NormalLogic,
                        SpeedBooster,
                        CanVerticalWall
                    )
                )
            )
        }

    chozodia_upper_mothership = {
            ["Chozodia Pirate Pitfall Trap"] = All(
                Missiles,
                Any(
                    SuperMissiles,
                    All(
                        CanReachEntrance("Chozodia Upper Mothership -> Deep Mothership"),
                        PowerBombs
                    )
                ),
                Any(
                    All(
                        CanBombTunnelBlock,
                        CanFlyWall
                    ),
                    All(
                        NormalLogic,  -- doable without falling down using screw or by leaving the room then returning
                        CanSingleBombBlock
                    )
                )
            ),
            ["Chozodia Behind Workbot"] = All(
                Missiles,
                Any(
                    CanFly,
                    CanHiGrip,
                    CanHiWallJump
                )
            )
        }

    chozodia_lower_mothership = {
            ["Chozodia Ceiling Near Map Station"] = Missiles,
            ["Chozodia Southeast Corner in Hull"] = All(
                Any(
                    SuperMissiles,
                    Any(
                        Bomb,
                        PowerBombCount(2)
                    )
                ),
                CanVerticalWall,
                PowerBombs
            )
    }

    chozodia_pb_area = {
            ["Chozodia Original Power Bomb"] = True,
            ["Chozodia Next to Original Power Bomb"] = All(
                Any(
                    Bomb,
                    PowerBombCount(3)
                ),
                CanFly
            )
        }

    chozodia_mecha_ridley_hall = {
            ["Chozodia Under Mecha Ridley Hallway"] = SpeedBooster,
            ["Mecha Ridley"] = All(
                MechaRidleyCombat,
                CanEnterHighMorphTunnel,
                CanBallJump,
                PlasmaBeam,  -- To defeat black pirates
                ReachedGoal
            ),
            ["Chozodia Space Pirate's Ship"] = MechaRidleyBoss
    }

