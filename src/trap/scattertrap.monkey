Strict

Import entity
Import logger
Import sprite
Import trap

Class ScatterTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New(xVal, yVal, TrapType.ScatterTrap)

        Self.xOff = 5.0
        Self.yOff = 15.0

        Self.image = New Sprite("traps/scattertrap.png", 14, 16, 4)
        Self.image.SetZ(-995.0)
    End Method

    Field triggeredFrames: Int

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("ScatterTrap.Trigger(Entity)")
    End Method

    Method Update: Void()
        If Self.triggeredFrames > 0
            Self.triggeredFrames -= 1
            If Self.triggeredFrames = 0
                Self.triggered = False
            End If
        End If

        Self.image.SetFrame(1)
        If Self.triggered
            Self.image.SetFrame(0)
        End If

        Super.Update()
    End Method

End Class
