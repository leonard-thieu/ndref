Strict

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

Const DEBUG_BUILD := False

Const PREVENT_TRIM := False
Const DUMPMAP_ITERATIVE := True

Function Main: Int()
    GameData.LoadGameDataXML(True)

    controller_game.players[0] = New Player(0, Character.Cadence)
    controller_game.numPlayers = 1

    Level.NewLevel(1, 1, 0, False, Null, False)

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
