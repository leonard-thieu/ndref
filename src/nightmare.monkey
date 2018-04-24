'Strict

Import enemy
Import entity
Import logger
Import point

Class Nightmare Extends Enemy

    Global nightmare: Object

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Nightmare.New(Int, Int, Int)")
    End Method

    Field NIGHTMARE_DARKNESS_RADIUS: Float
    Field seekDistance: Int
    Field failedLastMove: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("Nightmare.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Nightmare.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Nightmare.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsVisible: Bool()
        Debug.TraceNotImplemented("Nightmare.IsVisible()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Nightmare.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Nightmare.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Nightmare.Update()")
    End Method

End Class
