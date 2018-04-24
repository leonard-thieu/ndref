'Strict

Import enemy
Import entity
Import logger
Import point
Import sprite

Class DeadRinger Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, b1: Object, b2: Object, b3: Object, b4: Object)
        Debug.TraceNotImplemented("DeadRinger.New(Int, Int, Int, Object, Object, Object, Object)")
    End Method

    Field seekingBell: Int
    Field bells: Bell[]
    Field imageStandard: Sprite
    Field imageSmash: Sprite
    Field imageCharge: Sprite
    Field imageChargeSwipe: Sprite
    Field smashing: Bool
    Field phase: Int
    Field justSmashed: Bool
    Field smashCounter: Int
    Field chargingDir: Int
    Field chargedDir: Int
    Field chargeCounter: Int
    Field justGotHit: Bool
    Field readyToCharge: Bool
    Field chargedOriginX: Int
    Field chargedOriginY: Int
    Field chargedLength: Int

    Method Die: Void()
        Debug.TraceNotImplemented("DeadRinger.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("DeadRinger.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("DeadRinger.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Move: Int()
        Debug.TraceNotImplemented("DeadRinger.Move()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("DeadRinger.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("DeadRinger.MoveSucceed(Bool, Bool)")
    End Method

    Method PossiblyStartCharge: Void()
        Debug.TraceNotImplemented("DeadRinger.PossiblyStartCharge()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("DeadRinger.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("DeadRinger.Update()")
    End Method

End Class
