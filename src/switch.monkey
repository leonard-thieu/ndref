'Strict

Import entity
Import logger
Import trap

Class Switch Extends Trap

    Global switches: Object

    Function RemoveAll: Void()
        Debug.TraceNotImplemented("Switch.RemoveAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, triggerNum: Int, pair: Object)
        Debug.TraceNotImplemented("Switch.New(Int, Int, Int, Object)")
    End Method

    Field trigger: Int
    Field pairedSwitch: Switch

    Method Die: Void()
        Debug.TraceNotImplemented("Switch.Die()")
    End Method

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("Switch.Trigger(Entity)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Switch.Update()")
    End Method

End Class
