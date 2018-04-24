'Strict

Import enemy
Import logger
Import point

Class TrapCauldron Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("TrapCauldron.New(Int, Int, Int)")
    End Method

    Field hasMoved: Bool

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("TrapCauldron.CanBeDamaged(Bool, Bool)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("TrapCauldron.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("TrapCauldron.GetMovementDirection()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TrapCauldron.Update()")
    End Method

End Class
