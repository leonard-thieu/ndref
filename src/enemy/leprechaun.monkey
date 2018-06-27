'Strict

Import enemy
Import entity
Import logger
Import point
Import sprite

Class Leprechaun Extends Enemy

    Global seenLeprechaun: Bool

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Leprechaun.New(Int, Int, Int)")
    End Method

    Field initialYOff: Int
    Field rainbowImg: Sprite
    Field bornOnBeat: Int
    Field aggro: Bool
    Field disappearing: Bool
    Field rainbowFrame: Int
    Field rainbowFrameCounter: Int
    Field coinsLeft: Int

    Method Disappear: Void()
        Debug.TraceNotImplemented("Leprechaun.Disappear()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Leprechaun.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Leprechaun.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Leprechaun.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Leprechaun.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Leprechaun.Update()")
    End Method

End Class
