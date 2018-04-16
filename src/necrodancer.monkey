'Strict

Import monkey.list
Import monkey.random
Import beastmaster
Import beatanimationdata
Import bombtrap
Import bossmaster
Import bouncer
Import bouncetrap
Import chest
Import confusetrap
Import controller_game
Import crate
Import exitmap
Import familiar
Import firetrap
Import gamedata
Import gargoyle
Import item
Import level
Import level_object
Import logger
Import medic
Import merlin
Import particles
Import player_class
Import player_health
Import point
Import portal_seg
Import rect
Import rect_room
Import rng
Import room_with_door
Import salechest
Import scattertrap
Import shopkeeper
Import shrine
Import slowdowntrap
Import speeduptrap
Import spells
Import sprite
Import swarm_sarcophagus
Import tile
Import tiledata
Import trapdoor
Import travelrune
Import util
Import xml

Const PREVENT_TRIM := False
Const DUMPMAP_ITERATIVE := True
Const DEBUG_BUILD := False

Function Main: Int()
    Util.SeedRnd($9AF9E14A)
    Util.RndIntRangeFromZero(100, True)
    Debug.WriteLine(random.Seed)

    ' TODO: Some of this stuff belongs in `Level.NewLevel`.
    GameData.LoadGameDataXML(True)

    Level.isSeededMode = True
    Level.randSeedString = "1"
    Level.randSeed = Util.ParseTextSeed(Level.randSeedString)
    If Level.randSeed = -1 Then Level.randSeed = 0

    If Not Level.wholeRunRNG
        Level.wholeRunRNG = RNG.Make(Level.randSeed)
    End If

    Level.currentFloorRNG = Level.wholeRunRNG.Split()
    Local randSeed := Level.currentFloorRNG.Rand()
    ' TODO: Deterministic start log message
    
    Debug.Log("NEWLEVEL: Using seed " + randSeed)

    Util.SeedRnd(randSeed)

    controller_game.players[0] = New Player(0, Character.Cadence)

    Level.creatingMap = True

    'INIT_HARDCORE_MODE_COMMON
    Level.GenerateHardcoreZoneOrder()
    controller_game.currentZone = Level.zoneOrder.Get(0)
    controller_game.currentLevel = 1
    controller_game.currentDepth = 1
    Level.isHardcoreMode = True
    Item.CreateItemPools()
    Util.SeedRnd(randSeed)
    Level.CreateMap(Null)
    Debug.WriteLine("Created map.")
    Level.DumpMap()

    If necrodancer.PREVENT_TRIM
        NoTrim()
    End If

    Return 0
End Function

Function NoTrim: Void()
    (New Beastmaster()).NoTrim()
    (New BeatAnimationData())
    (New BombTrap(0, 0)).NoTrim()
    (New Bossmaster()).NoTrim()
    (New Bouncer(0.0, 0.0, 0.0, 0))
    (New BounceTrap(0, 0, 0)).NoTrim()
    (New Chest(0, 0, "", False, False, False, 0)).NoTrim()
    (New ConfuseTrap(0, 0)).NoTrim()
    (New Crate(0, 0, 0, "")).NoTrim()
    (New ExitMap())
    (New FireTrap(0, 0, 0, False)).NoTrim()
    (New GameData()).NoTrim()
    (New Gargoyle())
    (New Item(0, 0, "", False, 0, False)).NoTrim()
    (New Level()).NoTrim()
    (New LevelObject(0, 0, 0, False, Null)).NoTrim()
    (New Medic()).NoTrim()
    (New Merlin()).NoTrim()
    (New ParticleSystem())
    (New Player()).NoTrim()
    (New PlayerHealth())
    (New Point()).NoTrim()
    (New Point2())
    (New PortalSeg())
    (New Rect()).NoTrim()
    (New RectRoom())
    (New RNG()).NoTrim()
    (New RoomWithDoor())
    (New SaleChest()).NoTrim()
    (New ScatterTrap()).NoTrim()
    (New Shopkeeper()).NoTrim()
    (New Shrine()).NoTrim()
    (New SlowDownTrap()).NoTrim()
    (New SpeedUpTrap()).NoTrim()
    (New Spells())
    (New SpikeTrap()).NoTrim()
    (New Sprite()).NoTrim()
    (New StackEx<Int>())
    (New SwarmSarcophagus()).NoTrim()
    (New Tile()).NoTrim()
    (New TileData())
    (New TrapDoor()).NoTrim()
    (New TravelRune()).NoTrim()
    (New TeleportTrap()).NoTrim()
    (New Util()).NoTrim()
    (New XMLNode()).NoTrim()
End Function
