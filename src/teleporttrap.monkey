'Strict

Import entity
Import logger
Import trap

Class TeleportTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("TeleportTrap.New(Int, Int)")
    End Method

    Field retractCounter: Int

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("TeleportTrap.Trigger(Entity)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TeleportTrap.Update()")
    End Method

End Class
