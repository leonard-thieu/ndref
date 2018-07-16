'Strict

Import monkey.math
Import audio2
Import entity
Import logger
Import sprite
Import trap

Class SlowDownTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New(xVal, yVal, TrapType.SlowDownTrap)
        
        Self.xOff = 5.0
        Self.yOff = 15.0

        Self.image = New Sprite("traps/slowdowntrap.png", 14, 16, 4)
        Self.image.SetZOff(-995.0)
    End Method

    Field slowDownStartBeat: Int = -1
    Field currentMusicSpeed: Float = 1.0

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("SlowDownTrap.Trigger(Entity)")
    End Method

    Method Update: Void()
        If Self.slowDownStartBeat <> -1
            Local timeUntilStart := Audio.TimeUntilSpecificBeat(Self.slowDownStartBeat)
            Local timeUntilAfterStart := Audio.TimeUntilSpecificBeat(Self.slowDownStartBeat + 1)
            Local timeUntilBeforeEnd := Audio.TimeUntilSpecificBeat(Self.slowDownStartBeat + 13)
            Local timeUntilEnd := Audio.TimeUntilSpecificBeat(Self.slowDownStartBeat + 14)

            If timeUntilAfterStart > 0
                Self.currentMusicSpeed = 0.875 + (timeUntilAfterStart / (timeUntilAfterStart - timeUntilStart)) * -0.125
            Else If timeUntilBeforeEnd > 0
                Self.currentMusicSpeed = 0.875
            Else If timeUntilEnd > 0
                Self.currentMusicSpeed = 1.0 - (timeUntilEnd / (timeUntilEnd - timeUntilBeforeEnd)) * 0.125
            Else
                Self.currentMusicSpeed = 1.0
                Self.slowDownStartBeat = -1
            End If

            Self.currentMusicSpeed = math.Min(1.0, Self.currentMusicSpeed)
            Audio.ModifyMusicSpeed(Self.currentMusicSpeed)
        End If

        If Self.slowDownStartBeat <> -1
            Self.triggered = False
        End If

        Self.image.SetFrame(1)
        If Self.triggered
            Self.image.SetFrame(0)
        End If

        Super.Update()
    End Method

End Class
