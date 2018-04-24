'Strict

Import entity
Import logger
Import trap

Class SpikeTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("SpikeTrap.New(Int, Int)")
    End Method

    Field retractCounter: Int
    Field frameToShow: Int

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("SpikeTrap.Trigger(Entity)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SpikeTrap.Update()")
    End Method

End Class
