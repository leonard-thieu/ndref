'Strict

Import enemy
Import logger
Import point

Class FakeWall Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("FakeWall.New(Int, Int, Int)")
    End Method

    Field hasMoved: Bool
    Field goldDropped: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("FakeWall.Die()")
    End Method

    Method DropItem2: Void()
        Debug.TraceNotImplemented("FakeWall.DropItem2()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("FakeWall.GetMovementDirection()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("FakeWall.Update()")
    End Method

End Class
