'Strict

Import enemy
Import logger
Import point

Class Harpy Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Harpy.New(Int, Int, Int)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Harpy.GetMovementDirection()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Harpy.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Harpy.Update()")
    End Method

End Class
