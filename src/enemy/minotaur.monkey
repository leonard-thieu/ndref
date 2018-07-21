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
    Field chargingDir: Int = Direction.None
    Field stunnedTime: Int

    Method GetMovementDirection: Point()
        Local closestPlayer := Util.GetClosestPlayer(Self.x, Self.y)
        If Self.stunnedTime > 0
            Self.stunnedTime -= 1
            If Self.stunnedTime = 0
                Self.animOverride = -1
            End If

            Return New Point(0, 0)
        End If

        If Self.chargingDir <> Direction.None
            If Not Self.IsConfused()
                If Self.x > Self.lastX
                    Self.chargingDir = Direction.Right
                    Self.image.FlipX(True, True)
                Else If Self.x < Self.lastX
                    Self.chargingDir = Direction.Left
                    Self.image.FlipX(False, True)
                Else If Self.y > Self.lastY
                    Self.chargingDir = Direction.Down
                Else If Self.y < Self.lastY
                    Self.chargingDir = Direction.Up
                End If
            End If

            Select Self.chargingDir
                Case Direction.Right
                    Return New Point(1, 0)
                Case Direction.Left
                    Return New Point(-1, 0)
                Case Direction.Down
                    Return New Point(0, 1)
                Case Direction.Up
                    Return New Point(0, -1)
            End Select

            Return New Point(0, 0)
        End If

        Self.chargingDir = Self.TryChargeAt(closestPlayer.x, closestPlayer.y)
        If Self.chargingDir = Direction.None
            Self.chargingDir = Self.TryChargeAt(closestPlayer.lastBeatX, closestPlayer.lastBeatY)
        End If

        If Self.chargingDir <> Direction.None
            Audio.PlayGameSoundAt("minotaurCharge", Self.x, Self.y, False, -1, False)

            Local movementDirection := Util.GetPointFromDir(Self.chargingDir)
            If movementDirection.x < 0
                Self.image.FlipX(False, True)
            Else If movementDirection.x > 0
                Self.image.FlipX(True, True)
            End If

            Return movementDirection
        End If

        Return Self.BasicSeek()
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
