'Strict

Import mojo.graphics
Import enemy
Import enemy.bell
Import audio2
Import entity
Import logger
Import point
Import sprite
Import util

Class DeadRinger Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, b1: Bell, b2: Bell, b3: Bell, b4: Bell)
        Super.New()

        Self.Init(xVal, yVal, l, "dead_ringer")

        Self.overrideHitSound = "deadRingerHit"
        Self.overrideDeathSound = "deadRingerDeath"

        If xVal > 0
            Self.seekingBell = True
        End If

        Self.bells[0] = b1
        Self.bells[1] = b2
        Self.bells[2] = b3
        Self.bells[3] = b4

        Self.imageStandard = Self.image
        Self.imageSmash = New Sprite("entities/dead_ringer_hammer.png", 35, 54, 28)
        Self.imageCharge = New Sprite("entities/dead_ringer_charge.png", 50, 43, 6)
        Self.imageChargeSwipe = New Sprite("swipes/swipe_dead_ringer.png", 24, 20, 4, Image.MidHandle)
    End Method

    Field seekingBell: Int
    Field bells: Bell[5]
    Field imageStandard: Sprite
    Field imageSmash: Sprite
    Field imageCharge: Sprite
    Field imageChargeSwipe: Sprite
    Field smashing: Bool
    Field phase: Int
    Field justSmashed: Bool
    Field smashCounter: Int
    Field chargingDir: Int = Direction.None
    Field chargedDir: Int = Direction.None
    Field chargeCounter: Int
    Field justGotHit: Bool
    Field readyToCharge: Bool
    Field chargedOriginX: Int
    Field chargedOriginY: Int
    Field chargedLength: Int

    Method Die: Void()
        If Not Self.dead
            Enemy.SetEnemiesToDropNoCoinsOverride()

            If Not RenderableObject.deletingAll
                Audio.PlayGameSoundAt("deadRingerDeath", Self.x, Self.y, False, -1, False)
            End If

            Super.Die()
            Enemy.KillAllEnemies()

            Local bigBell := Self.bells[4]
            If bigBell <> Null
                bigBell.Die()
            End If
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("DeadRinger.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("DeadRinger.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImmuneToFear: Bool()
        Debug.TraceNotImplemented("DeadRinger.ImmuneToFear()")
    End Method

    Method Move: Int()
        Debug.TraceNotImplemented("DeadRinger.Move()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("DeadRinger.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("DeadRinger.MoveSucceed(Bool, Bool)")
    End Method

    Method PossiblyStartCharge: Void()
        Debug.TraceNotImplemented("DeadRinger.PossiblyStartCharge()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("DeadRinger.Render()")
    End Method

    Method Update: Void()
        If Self.smashing
            Self.image = Self.imageSmash

            Self.animOverride = Audio.GetBeatAnimFrame3() + 1
            If Self.phase = 1
                Self.animOverride += 7
            End If

            Self.xOff = 0.0
            Self.yOff = -22.0

            Self.image.SetZOff(25.0)
        Else If Self.justSmashed
            Self.image = Self.imageSmash

            Self.animOverride = (Self.smashCounter / 10) + 4
            If Self.phase = 1
                Self.animOverride += 7
            End If

            Self.xOff = 0.0
            Self.yOff = -22.0

            Self.image.SetZOff(25.0)
        Else If Self.chargingDir <> Direction.None
            Self.image = Self.imageCharge

            Self.animOverride = 0
            If Self.phase = 1
                Self.animOverride += 2
            End If

            Self.yOff = -10.0

            Self.image.SetZOff(24.0)

            Select Self.chargingDir
                Case Direction.Right
                    Self.image.FlipX(False, True)

                    Self.xOff = -19.0
                Default
                    Self.image.FlipX(True, True)

                    Self.xOff = -10.0
            End Select

            If Self.phase = 1
                Self.yOff -= 2.0
            End If
        Else If Self.chargedDir <> Direction.None
            Self.image = Self.imageCharge

            Self.animOverride = 0
            If Self.phase = 1
                Self.animOverride += 2
            End If

            If Self.chargeCounter < 10
                Select Self.chargedDir
                    Case Direction.Right,
                         Direction.Left
                        Self.animOverride = 1
                End Select
            End If

            Self.yOff = -10.0

            Self.image.SetZOff(24.0)

            ' This might be flipped.
            If Self.lastX < Self.x
                Self.image.FlipX(False, True)
                
                Self.xOff = -19.0
            Else If Self.lastX > Self.x
                Self.image.FlipX(True, True)

                Self.xOff = -10.0
            End If

            If Self.phase = 1
                Self.yOff -= 2.0
            End If
        Else
            Self.image = Self.imageStandard

            Self.animOverride = Audio.GetBeatAnimFrame4()
            If Self.phase = 1
                Self.animOverride += 4
            End If

            Self.xOff = -1.0
            Self.yOff = -11.0

            Self.image.SetZOff(22.0)

            ' This might be flipped.
            If Self.lastX < Self.x
                Self.image.FlipX(False, True)
                
                Self.xOff = -1.0
            Else If Self.lastX > Self.x
                Self.image.FlipX(True, True)

                Self.xOff = -13.0
            End If

            If Self.phase = 1
                Self.yOff -= 2.0
            End If
        End If

        If Self.justSmashed
            Self.smashCounter += 1
            If Self.smashCounter >= 30
                Self.smashCounter = 0
                Self.justSmashed = False
            End If
        End If

        If Self.chargedDir <> Direction.None
            Self.chargeCounter += 1
            If Self.chargeCounter >= 20
                Self.chargeCounter = 0
                Self.chargedDir = Direction.None
            End If
        End If

        If Self.chargingDir <> Direction.None
            Self.currentMoveDelay = 1
        End If

        ' Exclude big bell
        For Local i := 0 Until Self.bells.Length - 1
            Local bell := Self.bells[i]

            bell.beingSought = False
        End For

        If Self.seekingBell < Self.bells.Length - 1
            Local bell := Self.bells[Self.seekingBell]

            bell.beingSought = True
        End If

        Super.Update()
    End Method

End Class
