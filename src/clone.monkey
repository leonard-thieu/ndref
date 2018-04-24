'Strict

Import enemy
Import logger
Import point

Class Clone Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Clone.New(Int, Int, Int)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Clone.GetMovementDirection()")
    End Method

End Class
