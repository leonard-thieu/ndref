'Strict

Import entity
Import logger
Import sprite
Import trap

Class SpikeTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New(xVal, yVal, TrapType.SpikeTrap)

        Self.xOff = -4.0
        Self.yOff = 11.0

        Self.image = New Sprite("traps/spiketrap.png", 34, 20, 6)
        Self.image.SetZ(-995.0)
    End Method

    Field retractCounter: Int
    Field frameToShow: Int

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("SpikeTrap.Trigger(Entity)")
    End Method

    Method Update: Void()
        If Self.retractCounter > 0
            Self.retractCounter -= 1

            If Self.retractCounter = 0
                Self.triggered = False
                Self.frameToShow = 0
            End If
        End If

        Self.image.SetFrame(Self.frameToShow)

        Super.Update()
    End Method

End Class
