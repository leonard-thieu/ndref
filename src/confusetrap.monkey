'Strict

Import entity
Import logger
Import trap

Class ConfuseTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("ConfuseTrap.New(Int, Int)")
    End Method

    Field retractCounter: Int

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("ConfuseTrap.Trigger(Entity)")
    End Method

End Class
