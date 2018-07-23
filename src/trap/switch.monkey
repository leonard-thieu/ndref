'Strict

Import monkey.list
Import trap
Import entity
Import logger
Import sprite
Import util

Class Switch Extends Trap

    Global switches: List<Switch> = New List<Switch>()

    Function RemoveAll: Void()
        Debug.TraceNotImplemented("Switch.RemoveAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, triggerNum: Int, pair: Switch)
        Super.New(xVal, yVal, TrapType.Switch)

        Self.xOff = 5.0
        Self.yOff = 15.0
        
        Self.trigger = triggerNum
        Self.pairedSwitch = pair

        Self.image = New Sprite("traps/switch.png", 14, 16, 4)
        Self.image.SetZ(-995.0)

        Switch.switches.AddLast(Self)

        Self.ActivateLight(1.0, 1.5)
    End Method

    Field trigger: Int = -1
    Field pairedSwitch: Switch

    Method Die: Void()
        Debug.TraceNotImplemented("Switch.Die()")
    End Method

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("Switch.Trigger(Entity)")
    End Method

    Method Update: Void()
        If Self.triggered And
           Not Util.IsAnyPlayerAt(Self.x, Self.y)
            Self.triggered = False
        End If

        Self.image.SetFrame(1)
        If Self.triggered
            Self.image.SetFrame(0)
        End If

        Super.Update()
    End Method

End Class
