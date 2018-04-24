'Strict

Import enemy
Import entity
Import logger
Import point

Class King Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("King.New(Int, Int, Int)")
    End Method

    Field initialYOff: Int
    Field castled: Bool
    Field lastMan: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("King.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("King.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("King.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("King.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("King.Update()")
    End Method

End Class
