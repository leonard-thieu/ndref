'Strict

Import enemy
Import logger
Import point

Class Bishop Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Bishop.New(Int, Int, Int)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Bishop.GetMovementDirection()")
    End Method

End Class
