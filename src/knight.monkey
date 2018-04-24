'Strict

Import enemy
Import logger
Import point
Import sprite

Class Knight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Knight.New(Int, Int, Int)")
    End Method

    Field customAttackSwipe: Sprite

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Knight.GetMovementDirection()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Knight.Render()")
    End Method

End Class
