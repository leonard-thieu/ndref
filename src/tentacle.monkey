'Strict

Import enemy
Import entity
Import logger
Import octoboss
Import point
Import sprite

Class Tentacle Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Tentacle.New(Int, Int, Int)")
    End Method

    Field initX: Int
    Field initY: Int
    Field initialXOff: Int
    Field image2: Sprite
    Field nextX: Int
    Field nextY: Int
    Field boss: Octoboss
    Field tentacleNum: Int
    Field activated: Bool
    Field wasDead: Bool
    Field additionalXOff: Int
    Field state: Int
    Field showHeartsDelay: Int
    Field vibrateCounter: Int
    Field vibrateOffset: Float
    Field nextPlayerOffset: Point
    Field nextState: Int
    Field stateChangeBeat: Int
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
