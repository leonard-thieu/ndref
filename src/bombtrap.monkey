'Strict

Import mojo.graphics
Import entity
Import logger
Import sprite
Import trap

Class BombTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New()

        Self.trapType = TrapType.BombTrap
        Self.xOff = 5.0
        Self.yOff = 15.0

        Self.x = xVal
        Self.y = yVal

        Self.image = new Sprite("traps/bombtrap.png", 14, 16, 4, Image.DefaultFlags)
        Self.image.SetZ(-995.0)
    End Method

    Field triggeredFrames: Int

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("BombTrap.Trigger(Entity)")
    End Method

End Class
