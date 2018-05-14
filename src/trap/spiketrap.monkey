'Strict

Import mojo.graphics
Import entity
Import logger
Import trap

Class SpikeTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New(xVal, yVal, TrapType.SpikeTrap)

        Self.xOff = -4.0
        Self.yOff = 11.0

        Self.image = New Sprite("traps/spiketrap.png", 34, 20, 6, Image.DefaultFlags)
        Self.image.SetZ(-995.0)
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
