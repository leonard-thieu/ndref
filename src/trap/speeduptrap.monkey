Strict

Import monkey.math
Import gui.flyaway
Import level
Import audio2
Import entity
Import item
Import logger
Import player_class
Import sprite
Import trap

Class SpeedUpTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New(xVal, yVal, TrapType.SpeedUpTrap)

        Self.xOff = 5.0
        Self.yOff = 15.0
        Self.image = New Sprite("traps/speeduptrap.png", 14, 16, 4)
        Self.image.SetZ(-995.0)
    End Method

    Field speedUpStartBeat: Int = -1
    Field currentMusicSpeed: Float = 1.0

    Method Trigger: Void(ent: Entity)
        If Not ent.isPlayer
            Return
        End If

        Self.image.SetFrame(0)

        If Player.DoesAnyPlayerHaveItemOfType(ItemType.SpikedEars, False)
            Local flyaway := New Flyaway("|14000|MUFFLED!|", ent.x, ent.y, 0, -14, True, 0.0, 0.2, True, 120)
            flyaway.CenterX()
        Else If Self.speedUpStartBeat = -1
            If Not Level.isReplaying Or
               Audio.musicSpeed = 1.0
                Self.currentMusicSpeed = 1.0
                Self.speedUpStartBeat = Audio.GetCurrentBeatNumberIncludingLoops(False, False)
            End If

            Local flyaway := New Flyaway("|232|TEMPO UP!|", ent.x, ent.y, 0, -14, True, 0.0, 0.2, True, 120)
            flyaway.CenterX()

            Audio.PlayGameSoundAt("trapdoorOpen", Self.x, Self.y, False, -1, False)
        End If

        Super.Trigger(ent)
    End Method

    Method Update: Void()
        If Self.speedUpStartBeat <> -1
            Local timeUntilStart := Audio.TimeUntilSpecificBeat(Self.speedUpStartBeat)
            Local timeUntilAfterStart := Audio.TimeUntilSpecificBeat(Self.speedUpStartBeat + 2)
            Local timeUntilBeforeEnd := Audio.TimeUntilSpecificBeat(Self.speedUpStartBeat + 18)
            Local timeUntilEnd := Audio.TimeUntilSpecificBeat(Self.speedUpStartBeat + 20)

            If timeUntilAfterStart > 0
                Self.currentMusicSpeed = 1.125 + (timeUntilAfterStart / (timeUntilAfterStart - timeUntilStart)) * -0.125
            Else If timeUntilBeforeEnd > 0
                Self.currentMusicSpeed = 1.125
            Else If timeUntilEnd > 0
                Self.currentMusicSpeed = 1.0 - (timeUntilEnd / (timeUntilEnd - timeUntilBeforeEnd)) * 0.125
            Else
                Self.currentMusicSpeed = 1.0
                Self.speedUpStartBeat = -1
            End If

            Self.currentMusicSpeed = math.Max(1.0, Self.currentMusicSpeed)
            Audio.ModifyMusicSpeed(Self.currentMusicSpeed)
        End If

        If Self.speedUpStartBeat <> -1
            Self.triggered = False
        End If

        Self.image.SetFrame(1)
        If Self.triggered
            Self.image.SetFrame(0)
        End If

        Super.Update()
    End Method

End Class
