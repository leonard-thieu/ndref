'Strict

Import enemy
Import audio2
Import logger
Import point
Import shrine

Class Minotaur Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "minotaur")

        Self.overrideHitSound = "minotaurHit"
        Self.overrideAttackSound = "minotaurAttack"
        Self.overrideDeathSound = "minotaurDeath"

        Self.initalYOff = Self.yOff
    End Method

    Field initalYOff: Int
    Field hasRoared: Bool
    Field chargingDir: Int = -1
    Field stunnedTime: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Minotaur.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Minotaur.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Minotaur.MoveSucceed(Bool, Bool)")
    End Method

    Method TryChargeAt: Int(targetX: Int, targetY: Int)
        Debug.TraceNotImplemented("Minotaur.TryChargeAt(Int, Int)")
    End Method

    Method Update: Void()
        If Self.animOverride < 4
            Self.yOff = Self.initalYOff
        Else If Self.animOverride > 4
            Self.yOff = Self.initalYOff + 6
            Self.animOverride = Audio.GetBeatAnimFrame4() + 5
        Else
            Self.yOff = Self.initalYOff + 3
        End If

        If Self.IsVisible() And
           Camera.IsOnScreenStandardized(Self.x, Self.y) And
           Not Self.hasRoared And
           Not Level.isLevelEditor
            Audio.PlayGameSoundAt("minotaurCry", Self.x, Self.y, True, -1, False)
            Self.hasRoared = True
        End If

        If Util.GetDistFromClosestPlayer(Self.x, Self.y, False) <= 7.0 Or
           Self.hasRoared
            Self.movesRegardlessOfDistance = True
        End If

        If Enemy.enemiesFearfulDuration > 0
            Self.chargingDir = -1
            Self.animOverride = -1
        Else If Self.chargingDir <> -1
            If Self.x < Self.lastX
                Self.image.FlipX(False, True)
            Else If Self.x > Self.lastX
                Self.image.FlipX(True, True)
            End If
        End If

        Super.Update()
    End Method

End Class
