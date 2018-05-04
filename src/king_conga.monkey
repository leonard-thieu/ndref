'Strict

Import monkey.list
Import mojo.graphics
Import controller_game
Import enemy
Import entity
Import logger
Import player_class
Import point
Import shrine
Import sprite
Import util

Class KingConga Extends Enemy

    Global theKing: KingConga

    Function DestroyThrone: Void()
        Debug.TraceNotImplemented("KingConga.DestroyThrone()")
    End Function

    Function MissedBeat: Void()
        Debug.TraceNotImplemented("KingConga.MissedBeat()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "king_conga")

        Self.initX = xVal
        Self.initY = yVal

        KingConga.theKing = Self

        Self.overrideAttackSound = "kingCongaAttack"
        Self.overrideHitSound = "kingCongaHit"
        Self.overrideDeathSound = "kingCongaDeath"

        Self.initialXOff = Self.xOff

        Self.image2 = New Sprite("entities/king_conga_throne.png", 1, Image.DefaultFlags)
        Self.image2.SetZOff(40.0)

        Local healthMaxBonus := controller_game.currentDepth - 1
        If Shrine.warShrineActive
            healthMaxBonus = 4
        End If

        Self.healthMax += healthMaxBonus
        Self.health = Self.healthMax

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Field state: Int
    Field throneDestroyed: Bool
    Field initX: Int
    Field initY: Int
    Field initialXOff: Int = -1
    Field image2: Sprite
    Field zombieFriends: List<Enemy> = New List<Enemy>()
    Field lastBeatNum: Int = -1
    Field lastBeatAnim: Int = -1

    Method AddZombieFriend: Void(z: Enemy)
        Self.zombieFriends.AddLast(z)
    End Method

    Method CheckZombieFriends: Void()
        Debug.TraceNotImplemented("KingConga.CheckZombieFriends()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("KingConga.Die()")
    End Method

    Method EnterFinalState: Void(playCry: Bool)
        Debug.TraceNotImplemented("KingConga.EnterFinalState(Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("KingConga.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("KingConga.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImmuneToFear: Bool()
        Debug.TraceNotImplemented("KingConga.ImmuneToFear()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("KingConga.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("KingConga.Render()")
    End Method

    Method TeleportBack: Void()
        Debug.TraceNotImplemented("KingConga.TeleportBack()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("KingConga.Update()")
    End Method

End Class
