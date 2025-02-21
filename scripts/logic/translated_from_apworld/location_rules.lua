brinstar_start = {
    ["Brinstar Morph Ball"] = True,
    ["Brinstar Morph Ball Cannon"] = CanBallCannon,
    ["Brinstar Ceiling E-Tank"] = Any(
        All(
            IceBeam,
            RidleyBoss
        ),
        CanFly,
        All(
            MorphBall,
            CanTrickySparks
        )
    ),
}

brinstar_main = {
    ["Brinstar Long Beam"] = All(
        MorphBall,
        Any(
            CanLongBeam,
            LayoutPatches
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
            CanEnterHighMorphTunnel,
            Any(
                IceBeam,
                CanFlyWall
            )
        ),
        CanIBJ,
        All(
            CanBallspark,
            CanTrickySparks,
            CanWallJump,
            AdvancedLogic
        )
    ),
    ["Brinstar Speed Booster Shortcut"] = All(
        Any(
            CanBallspark,
            All(
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
    ["Brinstar Varia Suit"] = All(
        Any(
            SpaceJump,
            CanHorizontalIBJ,
            CanHiGrip,
            All(
                IceBeam,
                NormalLogic,
                Any(
                    CanVertical,
                    CanTrickySparks
                )
            )
        ),
        CanBallJump,
        Any(
            CanHorizontalIBJ,
            PowerGrip,
            All(
                HiJump,
                Any(
                    CanWallJump,
                    GravitySuit
                )
            )
        ),
        Any(
            Bomb,
            All(
                PowerBombs,
                NormalLogic
            )
        ),
        Missiles
    ),
    ["Brinstar Acid Near Varia"] = All(
        Any(
            SpaceJump,
            CanHorizontalIBJ,
            CanHiGrip,
            All(
                IceBeam,
                NormalLogic,
                Any(
                    CanVertical,
                    CanTrickySparks
                )
            )
        ),
        CanBallJump,
        CanLongBeam,
        Any(
            VariaSuit,
            GravitySuit,
            Hellrun(1)
        )
    ),
    ["Brinstar Upper Pillar"] = True
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
    ["Kraid Zipline Morph Jump"] = All(
        Ziplines,
        CanBallJump
    ),
    ["Kraid Acid Ballspark"] = All(
        Any(
            CanHorizontalIBJ,
            PowerGrip,
            All(
                HiJump,
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
                MissileCount(25),
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
        All(
            NormalLogic,
            Ziplines,
            SpeedBooster,
            HiJump
        ),
        All(
            AdvancedLogic,
            PowerGrip,
            Any(
                HiJump,
                SpaceJump
            )     -- Quick jumps and gripping the crumble blocks prevents them from reforming
        )
    ),
    ["Kraid Unknown Item Statue"] = All(
        Any(
            Bomb,
            PowerBombCount(2)
        ),
        Any(
            PowerGrip,
            HiJump,
            CanIBJ,
            All(
                IceBeam,
                Bomb
            )
        ),
        Missiles     -- required for escape - covers both cases of only hijump or only grip
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
        -- to escape, or to get to the upper door if you take the speed booster exit into the room
        Any(
            SpeedBooster,
            CanHiGrip,
            CanFlyWall
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
            CanLongBeam,
            CanBallspark
        ),
        Any(
            CanEnterHighMorphTunnel,
            All(
                NormalLogic,
                IceBeam,
                Any(
                    HiJump,
                    All(
                        Bomb,
                        CanWallJump
                    )
                )
            )
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
        All(     -- this method requires some jump extends
            AdvancedLogic,
            CanHiGrip,
            CanWallJump
        )
    )
}

norfair_upper_right = {
    ["Norfair Ice Beam"] = Any(
        CanFlyWall,
        PowerGrip,
        All(
            HiJump,
            AdvancedLogic
        )
    ),
    ["Norfair Heated Room Above Ice Beam"] = Any(
        VariaSuit,
        Hellrun(1)
    )
}

norfair_behind_ice = {
    ["Norfair Behind Top Chozo Statue"] = True,
}

norfair_under_brinstar_elevator = {
    ["Norfair Bomb Trap"] = All(
        Any(
            Bomb,
            All(
                PowerBombs,
                Any(
                    SpaceJump,
                    NormalLogic     -- Placing a PB in a specific place by the door hits only the top bomb chain
                )
            )
        ),
        CanReachLocation("Norfair Heated Room Under Brinstar Elevator")
    ),
    ["Norfair Heated Room Under Brinstar Elevator"] = All(
        SuperMissiles,
        Any(
            VariaSuit,
            Hellrun(4),
            All(
                SpeedBooster,
                Hellrun(1)
            )
        )
    ),
}

norfair_lowerrightshaft = {
    ["Norfair Hi-Jump"] = Missiles,
    ["Norfair Right Shaft Near Hi-Jump"] = Any(
        CanIBJ,
        CanHiGrip,
        All(
            PowerGrip,
            CanWallJump,
            NormalLogic
        )
    )
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
            All(
                VariaSuit,
                Hellrun(5)
            ),
            Hellrun(9)
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
            All(
                HiJump,
                CanWallJump
            )
        )
    ),
    ["Norfair Wave Beam"] = MissileCount(4),
    ["Norfair Heated Room Below Wave - Left"] = All(
        CanVerticalWall,
        Any(
            VariaSuit,
            Hellrun(2)
        ),
        Any(
            CanIBJ,
            HiJump,
            PowerGrip,
            All(
                IceBeam,
                Bomb
            )
        )
    ),
    ["Norfair Heated Room Below Wave - Right"] = All(
        CanVerticalWall,
        Any(
            VariaSuit,
            Hellrun(2)
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
            All(
                NormalLogic,
                IceBeam,
                Any(
                    CanEnterMediumMorphTunnel,
                    Bomb
                ),
                CanReachLocation("Norfair Behind Lower Super Missile Door - Right")
            )
        ),
        Any(
            SpeedBooster,
            CanBallJump
        )
    ),
    ["Norfair Behind Lower Super Missile Door - Right"] = Any(
        CanFly,
        All(
            HiJump,
            Any(
                IceBeam,
                All(
                    GravitySuit,
                    CanWallJump
                )
            )
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
            Any(
                CanFlyWall,
                IceBeam
            ),
            PowerGrip
        )
    )
}

ridley_main = {
    ["Ridley Imago Super Missile"] = All(
        CanVerticalWall,
        Any(
            All(
                MissileCount(35),
                EnergyTanks(1)
            ),
            All(
                NormalCombat,
                MissileCount(20)
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
        CanBombTunnelBlock,     -- the long way
        CanFly,                 -- the short way
        All(
            AdvancedLogic,
            CanWallJump
        )
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
            All(
                AdvancedLogic,
                Any(
                    SpaceJump,
                    CanWallJump
                )
            )
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
            AdvancedLogic,
            CanWallJump,
            HiJump     -- disable hi-jump mid walljump to get this, might be possible without
        ),
        All(
            IceBeam,
            Any(
                CanWallJump,
                CanHiGrip
            )
        )
    )
}

ridley_right_speed_puzzles = {
    ["Ridley Bomb Puzzle"] = All(
        PowerGrip,
        Any(
            All(
                Bomb,
                Any(
                    CanWallJump,
                    SpaceJump
                )
            ),
            All(
                AdvancedLogic,
                PowerBombCount(2),
                HiJump
            )
        )
    ),
    ["Ridley Speed Jump"] = WaveBeam
}

ridley_central = {
    ["Ridley Upper Ball Cannon Puzzle"] = All(
        Any(
            HiJump,
            CanIBJ,
            All(
                PowerGrip,
                Any(
                    CanWallJump,
                    SpaceJump
                )
            )
        ),
        Any(
            CanBallCannon,
            LayoutPatches
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
                LayoutPatches,
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
    ["Ridley Center Pillar"] = True,
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
        CanEnterMediumMorphTunnel     -- to escape
    ),
    ["Mother Brain"] = All(
        IceBeam,
        CanRegularBomb,     -- only bomb can unlatch metroids
        MotherBrainCombat,
        Any(                -- to get through the tunnel right before Mother Brain
            CanEnterHighMorphTunnel,
            All(
                CanWallJump,
                NormalLogic
            ),
            AdvancedLogic     -- it is possible to freeze Rinkas in such a way that you don't need grip IBJ or walljumps
        ),
        CanVertical,          -- to get through escape shaft
        Any(                  -- to get to ship
            SpeedBooster,
            CanFly,
            All(
                NormalLogic,
                HiJump,
                CanWallJump
            )
        )
    )
}

crateria_main = {
    ["Crateria Landing Site Ballspark"] = All(
        ChozoGhostBoss,
        MotherBrainBoss,
        CanBallspark,
        CanBallJump,
        PowerBombs,
        Any(
            GravitySuit,
            CanReachEntrance("Brinstar -> Crateria Ballcannon")
        )
    ),
    ["Crateria Moat"] = True
}

crateria_upper = {
    ["Crateria Power Grip"] = All(
        CanBallJump,
        Any(
            All(
                CanVertical,
                LayoutPatches
            ),
            CanEnterHighMorphTunnel
        )
    ),
    ["Crateria Statue Water"] = UnknownItem1,
    ["Crateria Unknown Item Statue"] = CanBallJump,
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
            CanTrickySparks
        )
    )
}

chozodia_ruins_crateria_entrance = {
    ["Chozodia Upper Crateria Door"] =
        CanReachEntrance("Crateria -> Chozodia Upper Door"),     -- Specifically need to access this entrance, not just the region as it's one-way
    ["Chozodia Ruins East of Upper Crateria Door"] = Missiles,
    ["Chozodia Triple Crawling Pirates"] = All(
        Missiles,
        Any(
            Bomb,
            PowerBombCount(3)
        ),
        Any(
            CanHiGrip,
            CanFlyWall,
            All(
                NormalLogic,
                IceBeam
            )
        ),
        ChozodiaCombat
    ),
}

chozodia_ruins_test = {
    ["Chozodia Chozo Ghost Area Morph Tunnel Above Water"] = All(
        ChozoGhostBoss,     -- The room leading to this item is inaccessible until the Chozo Ghost is defeated
        Missiles,
        CanBallJump
    ),
    ["Chozodia Chozo Ghost Area Underwater"] = All(
        ChozoGhostBoss,     -- This item is fake until the Chozo Ghost is defeated
        SpeedBooster,
        GravitySuit
    ),
    ["Chozodia Chozo Ghost Area Long Shinespark"] = All(
        ChozoGhostBoss,     -- The room leading to this item is inaccessible until the Chozo Ghost is defeated
        SpeedBooster,
        GravitySuit,
        Any(
            NormalLogic,
            ScrewAttack
        )
    ),
    ["Chozodia Lava Dive"] = All(     -- TODO redo this whole lava dive
        ChozoGhostBoss,
        Any(
            GravitySuit,
            All(
                Hellrun(4),
                VariaSuit,
                CanHiGrip
            ),
            All(
                AdvancedLogic,
                Hellrun(6),
                CanHiGrip
            )
        ),
        CanEnterHighMorphTunnel,
        CanBallJump,
        Any(
            CanWallJump,
            All(
                GravitySuit,
                CanFly
            )
        )
    ),
    ["Chozo Ghost"] = Any(
        MotherBrainBoss,
        AdvancedLogic
    )
}

chozodia_under_tube = {
    ["Chozodia Bomb Maze"] = All(
        MorphBall,
        Any(
            CanIBJ,
            All(
                CanBallspark,
                NormalLogic
            ),
            All(
                PowerGrip,
                Any(
                    CanWallJump,
                    SpaceJump
                )
            )
        ),
        Any(
            Bomb,
            PowerBombCount(3)
        ),
        CanBallJump
    ),
    ["Chozodia Zoomer Maze"] = Any(
        CanIBJ,
        All(
            PowerGrip,
            CanBallJump
        ),
        All(
            CanBallspark,
            NormalLogic
        )
    ),
    ["Chozodia Left of Glass Tube"] = All(
        SpeedBooster,
        CanReachEntrance("Chozodia Glass Tube -> Chozo Ruins")     -- Required to access a save station after collecting to warp if necessary
    ),
    ["Chozodia Right of Glass Tube"] = All(
        PowerBombs,
        CanFly
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
                CanFlyWall,
                CanEnterHighMorphTunnel
            ),
            All(
                AdvancedLogic,     -- doable without falling down using screw, but can get softlocked without infinite vertical
                ScrewAttack
            )
        )
    ),
    ["Chozodia Behind Workbot"] = MissileCount(5),
}

chozodia_lower_mothership = {
    ["Chozodia Ceiling Near Map Station"] = Missiles,
    ["Chozodia Southeast Corner in Hull"] = All(
        Any(
            SuperMissiles,
            All(
                ChozoGhostBoss,
                Any(
                    Bomb,
                    PowerBombCount(2)
                )
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
        PlasmaBeam,     -- To defeat black pirates
        ReachedGoal
    ),
    ["Chozodia Space Pirate's Ship"] = MechaRidleyBoss
}
