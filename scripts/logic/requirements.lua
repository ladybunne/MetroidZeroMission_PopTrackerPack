-- Requirements

-- Ziplines = Event("ziplines")
Ziplines = CanReachEntrance("Kraid Main -> Acid Worm Area")
KraidBoss = Event("kraid")
RidleyBoss = Event("ridley")
MotherBrainBoss = Event("mother_brain")
ChozoGhostBoss = Event("fully_powered_suit")
MechaRidleyBoss = Event("mecha_ridley")

-- Figure out something better for these.
UnknownItem1 = CanReachLocation("Crateria Unknown Item Statue")
UnknownItem2 = CanReachLocation("Kraid Unknown Item Statue")
UnknownItem3 = CanReachLocation("Ridley Unknown Item Statue")

CanUseUnknownItems = Any(
    OptionIs("unknown_items", 1),
    ChozoGhostBoss
)

LayoutPatches = OptionIs("layout_patches", 1)

EnergyTanks = function(n) return Has("EnergyTank", n) end
MissileTanks = function(n) return Has("MissileTank", n) end
SuperMissileTanks = function(n) return Has("SuperMissileTank", n) end
PowerBombTanks = function(n) return Has("PowerBombTank", n) end

LongBeam = Has("LongBeam")
ChargeBeam = Has("ChargeBeam")
IceBeam = Has("IceBeam")
WaveBeam = Has("WaveBeam")
PlasmaBeam = All(
    Has("PlasmaBeam"),
    CanUseUnknownItems
)
Bomb = Has("Bomb")
VariaSuit = Has("VariaSuit")
GravitySuit = All(
    Has("GravitySuit"),
    CanUseUnknownItems
)
MorphBall = Has("MorphBall")
SpeedBooster = Has("SpeedBooster")
HiJump = Has("HiJump")
ScrewAttack = Has("ScrewAttack")
SpaceJump = All(
    Has("SpaceJump"),
    CanUseUnknownItems
)
PowerGrip = Has("PowerGrip")

Missiles = Any(
    MissileTanks(1),
    SuperMissileTanks(1)
)

MissileCount = function(n)
    local count = n
    return function()
        return Tracker:ProviderCountForCode("MissileTank") * 5 +
            Tracker:ProviderCountForCode("SuperMissileTank") * 2 >= count
    end
end

SuperMissiles = SuperMissileTanks(1)
SuperMissileCount = function(n) return SuperMissileTanks(n // 2) end
PowerBombs = PowerBombTanks(1)
PowerBombCount = function(n) return PowerBombTanks(n // 2) end

CanRegularBomb = All(
    MorphBall,
    Bomb
)
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
CanLongBeam = Any(
    LongBeam,
    MissileCount(2),
    CanBombTunnelBlock
)

NormalLogic = OptionAtLeast("logic_difficulty", 1)
AdvancedLogic = OptionAtLeast("logic_difficulty", 2)
NormalCombat = OptionAtLeast("combat_logic_difficulty", 1)
MinimalCombat = OptionAtLeast("combat_logic_difficulty", 2)
CanIBJ = All(
    OptionAtLeast("ibj_logic", 1),
    CanRegularBomb
)
CanHorizontalIBJ = All(
    CanIBJ,
    OptionAtLeast("ibj_logic", 2)
)
CanWallJump = OptionAtLeast("walljump_logic", 1)
CanTrickySparks = All(
    OptionIs("tricky_shinesparks", 1),
    SpeedBooster
)
Hellrun = function(n)
    return All(
        OptionIs("heatruns", 1),
        EnergyTanks(n)
    )
end

CanFly = Any(
    CanIBJ,
    SpaceJump
)
CanFlyWall = Any(
    CanFly,
    CanWallJump
)
CanVertical = Any(
    HiJump,
    PowerGrip,
    CanFly
)
CanVerticalWall = Any(
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
        Has("SpaceJump")
    ),
    CanEnterMediumMorphTunnel
)

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
        ChargeBeam,
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
            MissileTanks(2),
            IceBeam,
            PlasmaBeam
        ),
        EnergyTanks(2)
    ),
    All(
        Any(
           IceBeam,
           PlasmaBeam
        ),
        EnergyTanks(4)
    )
)

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
