'Strict

Import enemy
Import logger
Import point

Class BatMiniboss Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("BatMiniboss.New(Int, Int, Int)")
    End Method

    Field hasRoared: Bool

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("BatMiniboss.GetMovementDirection()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("BatMiniboss.Update()")
    End Method

End Class
