'Strict

Import entity
Import logger
Import trap

Class ConfuseTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New(xVal, yVal, TrapType.ConfuseTrap)

        Self.xOff = 5.0
        Self.yOff = 15.0

        Self.image = New Sprite("traps/confusetrap.png", 14, 16, 4)
        Self.image.SetZOff(-995.0)
    End Method

    Field retractCounter: Int

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("ConfuseTrap.Trigger(Entity)")
    End Method

End Class
