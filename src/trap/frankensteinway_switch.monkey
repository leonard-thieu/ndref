'Strict

Import enemy.frankensteinway_prop
Import entity
Import logger
Import trap

Class FrankensteinwaySwitch Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("FrankensteinwaySwitch.New(Int, Int)")
    End Method

    Field parent: FrankensteinwayProp

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("FrankensteinwaySwitch.Trigger(Entity)")
    End Method

End Class
