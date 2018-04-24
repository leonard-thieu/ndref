'Strict

Import enemy
Import logger
Import point

Class Rook Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Rook.New(Int, Int, Int)")
    End Method

    Field castleNextMove: Bool

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Rook.GetMovementDirection()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Rook.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Rook.Update()")
    End Method

End Class
