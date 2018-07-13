'Strict

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
        Debug.TraceNotImplemented("SpeedUpTrap.Update()")
    End Method

End Class
