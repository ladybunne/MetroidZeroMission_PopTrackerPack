Ziplines = CanReachEntrance("Kraid Main -> Acid Worm Area")
KraidBoss = Has("Kraid Defeated")
RidleyBoss = Has("Ridley Defeated")
MotherBrainBoss = Has("Mother Brain Defeated")
ChozoGhostBoss = Has("Chozo Ghost Defeated")
MechaRidleyBoss = Has("Mecha Ridley Defeated")

UnknownItem1 = CanReachLocation("Crateria Unknown Item Statue")
UnknownItem2 = CanReachLocation("Kraid Unknown Item Statue")
UnknownItem3 = CanReachLocation("Ridley Unknown Item Statue")

CanUseUnknownItems = Any(
    OptionEnabled("unknown_items_always_usable"),
    ChozoGhostBoss
)
LayoutPatches = function(n)
    return Any(
        OptionIs("layout_patches", 1),
        All(
            OptionIs("layout_patches", 2),
            OptionIs("selected_patches", n)
        )
    )
end

NormalMode = OptionIs("game_difficulty", 1)
HardMode = OptionIs("game_difficulty", 2)


EnergyTanks = function(n) return Has("Energy Tank", n) end
MissileTanks = function(n) return Has("Missile Tank", n) end
SuperMissileTanks = function(n) return Has("Super Missile Tank", n) end
PowerBombTanks = function(n) return Has("Power Bomb Tank", n) end
LongBeam = Has("Long Beam")
ChargeBeam = Has("Charge Beam")
IceBeam = Has("Ice Beam")
WaveBeam = Has("Wave Beam")
PlasmaBeam = All(
    Has("Plasma Beam"),
    CanUseUnknownItems
)
Bomb = Has("Bomb")
VariaSuit = Has("Varia Suit")
GravitySuit = All(
    Has("Gravity Suit"),
    CanUseUnknownItems
)
MorphBall = Has("Morph Ball")
SpeedBooster = Has("Speed Booster")
HiJump = Has("Hi-Jump")
ScrewAttack = Has("Screw Attack")
SpaceJump = All(
    Has("Space Jump"),
    CanUseUnknownItems
)
PowerGrip = Has("Power Grip")

Missiles = Any(
    MissileTanks(1),
    SuperMissileTanks(1)
)
MissileCount = function(n)
    return function()
        if OptionIs("game_difficulty", 1) then
            return 5 * Count("Missile Tank")() + 2 * Count("Super Missile Tank")() >= n
        else
            return 2 * Count("Missile Tank")() + Count("Super Missile Tank")() >= n
        end
    end
end

SuperMissiles = SuperMissileTanks(1)
SuperMissileCount = function(n)
    return function()
        if OptionIs("game_difficulty", 1) then
            return 2 * Count("Super Missile Tank")() >= n
        else
            return Count("Super Missile Tank")() >= n
        end
    end
end

PowerBombs = PowerBombTanks(1)
PowerBombCount = function(n)
    return function()
        if OptionIs("game_difficulty", 1) then
            return 2 * Count("Power Bomb Tank")() >= n
        else
            return Count("Power Bomb Tank")() >= n
        end
    end
end

Energy = function(n)
    return function()
        if OptionIs("game_difficulty", 1) then
            return 100 * Count("Energy Tank")() + 99 >= n
        else
            return 50 * Count("Energy Tank")() + 99 >= n
        end
    end
end

-- Various morph/bomb rules
CanRegularBomb = All(
    MorphBall,
    Bomb
)
-- Morph tunnels or bomb chains--any block that Screw Attack can't break
CanBombTunnelBlock = All(
    MorphBall,
    Any(
        Bomb,
        PowerBombTanks(1)
    )
)
CanSingleBombBlock = Any(
    CanBombTunnelBlock,
    ScrewAttack
)
CanBallCannon = CanRegularBomb
CanBallspark = All(
    MorphBall,
    SpeedBooster,
    HiJump
)
CanBallJump = All(
    MorphBall,
    Any(
        Bomb,
        HiJump
    )
)
CanLongBeam = function(n)
    return Any(
        LongBeam,
        MissileCount(n),
        CanBombTunnelBlock
    )
end

-- Logic option rules
NormalLogic = OptionAtLeast("logic_difficulty", 1)
AdvancedLogic = OptionAtLeast("logic_difficulty", 2)
NormalCombat = OptionAtLeast("combat_logic_difficulty", 1)
MinimalCombat = OptionAtLeast("combat_logic_difficulty", 2)
CanIBJ = All(
    OptionAtLeast("ibj_in_logic", 1),
    CanRegularBomb
)
CanHorizontalIBJ = All(
    CanIBJ,
    OptionAtLeast("ibj_in_logic", 2)
)
CanWallJump = OptionAtLeast("walljumps_in_logic", 1)
CanTrickySparks = All(
    OptionEnabled("tricky_shinesparks"),
    SpeedBooster
)
Hellrun = function(n)
    return All(
        OptionEnabled("hazard_runs"),
        Energy(n)
    )
end

-- Miscellaneous rules
CanFly = Any(  -- infinite vertical
    CanIBJ,
    SpaceJump
)
CanFlyWall = Any(  -- infinite vertical with a usable wall
    CanFly,
    CanWallJump
)
CanVertical = Any(  -- any way of traversing vertically past base jump height, sans a wall
    HiJump,
    PowerGrip,
    CanFly
)
CanVerticalWall = Any(  -- any way of traversing vertically past base jump height, with a usable wall
    CanVertical,
    CanWallJump
)
CanHiGrip = All(
    HiJump,
    PowerGrip
)
CanEnterHighMorphTunnel = Any(
    CanIBJ,
    All(
        MorphBall,
        PowerGrip
    )
)
CanEnterMediumMorphTunnel = Any(
    CanEnterHighMorphTunnel,
    All(
        MorphBall,
        HiJump
    )
)
RuinsTestEscape = All(
    Any(
        All(
            NormalLogic,
            CanHiGrip,
            CanWallJump
        ),
        CanIBJ,
        Has("Space Jump")  -- Need SJ to escape, but it doesn't need to be active yet
    ),
    CanEnterMediumMorphTunnel
)

-- Boss + difficult area combat logic
-- TODO: Minimal combat on Hard may need tweaking
KraidCombat = Any(
    All(
        MinimalCombat,
        Any(
            MissileCount(1),
            SuperMissileCount(3)
        )
    ),
    All(
        NormalCombat,
        MissileTanks(4),
        EnergyTanks(1)
    ),
    All(
        MissileTanks(6),
        EnergyTanks(2)
    )
)
RidleyCombat = Any(
    MinimalCombat,
    All(
        NormalCombat,
        MissileTanks(5),
        EnergyTanks(3)
    ),
    All(
        VariaSuit,
        MissileTanks(8),
        SuperMissileTanks(2),
        EnergyTanks(4)
    )
)
MotherBrainCombat = Any(
    MinimalCombat,
    All(
        NormalCombat,
        Any(
            PowerGrip,
            GravitySuit,
            HiJump,
            All(
                VariaSuit,
                CanWallJump
            )
        ),
        MissileTanks(8),
        SuperMissileTanks(2),
        EnergyTanks(5)
    ),
    All(
        Any(
            VariaSuit,
            GravitySuit
        ),
        WaveBeam,
        ScrewAttack,
        PowerGrip,
        MissileTanks(10),
        SuperMissileTanks(3),
        EnergyTanks(6)
    )
)
ChozodiaCombat = Any(
    MinimalCombat,
    All(
        NormalCombat,
        Any(
            MissileTanks(4),
            IceBeam,
            PlasmaBeam
        ),
        EnergyTanks(3)
    ),
    All(
        Any(
            MissileTanks(10),
            IceBeam,
            PlasmaBeam
        ),
        Any(
            VariaSuit,
            GravitySuit
        ),
        EnergyTanks(5)
    )
)
-- Currently combat logic assumes non-100% Mecha Ridley
MechaRidleyCombat = Any(
    All(
        MinimalCombat,
        Missiles,
        Any(
            PlasmaBeam,
            ScrewAttack,
            SuperMissileCount(6)
        )
    ),
    All(
        NormalCombat,
        SuperMissileTanks(3),
        MissileTanks(4),
        EnergyTanks(4)
    ),
    All(
        Any(
            HiJump,
            SpaceJump
        ),
        ScrewAttack,
        SuperMissileTanks(4),
        MissileTanks(10),
        EnergyTanks(6)
    )
)

-- Goal
ReachedGoal = Any(
    All(
        OptionIs("goal", 0)
    ),
    All(
        OptionIs("goal", 1),
        MotherBrainBoss,
        ChozoGhostBoss
    )
)
