'Strict

Import controller.controller_game
Import enemy
Import audio2
Import logger
Import point
Import util

Class SleepingGoblin Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "sleeping_goblin")

        Self.animOverride = 4

        Self.overrideAttackSound = "goblinAttack"
        Self.overrideDeathSound = "goblinDeath"
        Self.overrideHitSound = "goblinHit"
    End Method

    Field sleeping: Bool = True
    Field stunnedTime: Int
    Field wakeupTime: Int = 3
    Field haveReslept: Bool

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("SleepingGoblin.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("SleepingGoblin.MoveFail()")
    End Method

    Method Update: Void()
        Super.Update()

        If Util.GetDistFromClosestPlayer(Self.x, Self.y, False) <= 3.0 And
           Self.sleeping
            If Enemy.EnemiesHaveMovedClosestBeat() Or
               (Audio.IsFixedBeatSet() And
                Not controller_game.incrementFixedBeatNum)
                Self.sleeping = False
            End If
        End If

        If Self.sleeping
            Self.animOverride = 4
        Else If Self.stunnedTime > 0 Or
                Self.wakeupTime > 0
            If Self.animOverride <> 5 And
               Not Self.haveReslept
                Audio.PlayGameSoundAt("goblinAwaken", Self.x, Self.y, False, -1, False)

                Self.haveReslept = True
            End If

            Self.animOverride = 5
        Else
            Self.animOverride = -1
        End If

        If Self.animOverride = -1
            If Self.x < Self.lastX
                Self.image.FlipX(False, True)
            Else If Self.x > Self.lastX
                Self.image.FlipX(False, True)
            End If
        End If
    End Method

End Class
