'Strict

Import enemy
Import logger
Import point

Class Toad Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Toad.New(Int, Int, Int)")
    End Method

    Field attemptedMoveX: Int
    Field attemptedMoveY: Int
    Field deathCounter: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Toad.GetMovementDirection()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Toad.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Toad.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Toad.Update()")
    End Method

End Class
