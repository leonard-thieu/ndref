'Strict

Import enemy
Import logger
Import point

Class Ghost Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Ghost.New(Int, Int, Int)")
    End Method

    Field lastDist: Float[]
    Field movingAway: Bool

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Ghost.CanBeDamaged(Bool, Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Ghost.GetMovementDirection()")
    End Method

    Method Move: Int()
        Debug.TraceNotImplemented("Ghost.Move()")
    End Method

    Method ProcessDistanceChanges: Void()
        Debug.TraceNotImplemented("Ghost.ProcessDistanceChanges()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Ghost.Update()")
    End Method

End Class
