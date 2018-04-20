'Strict

Import mojo.graphics
Import logger
Import trap

Class SlowDownTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New()

        Self.trapType = TrapType.SlowDownTrap
        Self.x = xVal
        Self.y = yVal
        Self.xOff = 5.0
        Self.yOff = 15.0

        Self.image = New Sprite("traps/slowdowntrap.png", 14, 16, 4, Image.DefaultFlags)
        Self.image.SetZOff(-995.0)
    End Method

    Field slowDownStartBeat: Int = -1
    Field currentMusicSpeed: Float = 1.0

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("SlowDownTrap.Trigger()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SlowDownTrap.Update()")
    End Method

    Method NoTrim: Void()
        Trigger(Null)
        Update()
    End Method

End Class
