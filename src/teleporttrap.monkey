'Strict

Import mojo.graphics
Import entity
Import logger
Import sprite
Import trap

Class TeleportTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New(xVal, yVal, TrapType.TeleportTrap)

        Self.xOff = 5.0
        Self.yOff = 15.0

        Self.image = New Sprite("traps/teleporttrap.png", 14, 16, 4, Image.DefaultFlags)
        Self.image.SetZ(-995.0)
    End Method

    Field retractCounter: Int

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("TeleportTrap.Trigger(Entity)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TeleportTrap.Update()")
    End Method

End Class
