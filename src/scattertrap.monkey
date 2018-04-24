'Strict

Import entity
Import logger
Import trap

Class ScatterTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("ScatterTrap.New(Int, Int)")
    End Method

    Field triggeredFrames: Int

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("ScatterTrap.Trigger(Entity)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ScatterTrap.Update()")
    End Method

End Class
