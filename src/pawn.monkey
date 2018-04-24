'Strict

Import enemy
Import entity
Import logger
Import point

Class Pawn Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Pawn.New(Int, Int, Int)")
    End Method

    Field startY: Int
    Field hasMoved: Bool
    Field isQueen: Bool

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Pawn.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Pawn.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Pawn.MoveSucceed(Bool, Bool)")
    End Method

End Class
