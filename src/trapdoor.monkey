'Strict

Import entity
Import logger
Import trap

Class TrapDoor Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("TrapDoor.New(Int, Int)")
    End Method

    Field keepMultiplier: Bool

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("TrapDoor.Trigger(Entity)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TrapDoor.Update()")
    End Method

End Class
