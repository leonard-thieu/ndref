'Strict

Import mojo.graphics
Import enemy.octoboss
Import enemy
Import entity
Import logger
Import point
Import sprite

Class Tentacle Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.initX = xVal
        Self.initY = yVal

        Self.Init(xVal, yVal, l, "tentacle")

        Self.initialXOff = Self.xOff

        Self.image2 = New Sprite("entities/tentacle_tell.png", 1, Image.DefaultFlags)
        Self.image2.SetZ(-991.0)

        Self.nextX = Self.x
        Self.nextY = Self.y

        Self.overrideAttackSound = "tentacleAttack"
        Self.overrideHitSound = "tentacleHit"
        Self.overrideDeathSound = "tentacleDeath"
    End Method

    Field initX: Int
    Field initY: Int
    Field initialXOff: Int = -1
    Field image2: Sprite
    Field nextX: Int
    Field nextY: Int
    Field boss: Octoboss
    Field tentacleNum: Int = -1
    Field activated: Bool
    Field wasDead: Bool
    Field additionalXOff: Int
    Field state: Int
    Field showHeartsDelay: Int
    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 1.5
    Field nextPlayerOffset: Point = New Point(0, 0)
    Field nextState: Int
    Field stateChangeBeat: Int = 99999
    Field didPhase5: Bool
    Field didPhase6: Bool

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Tentacle.CanBeDamaged(Bool, Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Tentacle.GetMovementDirection()")
    End Method

    Method GetPhase5Offset: Object()
        Debug.TraceNotImplemented("Tentacle.GetPhase5Offset()")
    End Method

    Method GetPhase6Offset: Object()
        Debug.TraceNotImplemented("Tentacle.GetPhase6Offset()")
    End Method

    Method GetTentacleLevelNumber: Int()
        Debug.TraceNotImplemented("Tentacle.GetTentacleLevelNumber()")
    End Method

    Method GoHome: Void()
        Debug.TraceNotImplemented("Tentacle.GoHome()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Tentacle.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Tentacle.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Tentacle.Render()")
    End Method

    Method SubmergeTo: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Tentacle.SubmergeTo(Int, Int)")
    End Method

    Method SubmergeTo2: Void(p: Object)
        Debug.TraceNotImplemented("Tentacle.SubmergeTo2(Object)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Tentacle.Update()")
    End Method

End Class
