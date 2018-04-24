'Strict

Import enemy
Import logger
Import point

Class GoblinBomber Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("GoblinBomber.New(Int, Int, Int)")
    End Method

    Field dropBomb: Bool

    Method AfterHitHook2: Void(diffX: Int, diffY: Int)
        Debug.TraceNotImplemented("GoblinBomber.AfterHitHook2(Int, Int)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("GoblinBomber.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("GoblinBomber.GetMovementDirection()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("GoblinBomber.Update()")
    End Method

End Class
