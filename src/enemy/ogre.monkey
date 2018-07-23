'Strict

Import enemy
Import audio2
Import logger
Import point
Import sprite
Import util

Class Ogre Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "ogre")

        Self.imageStandard = Self.image
        Self.imageSmashLeft = New Sprite("entities/ogre_left.png", 124, 72, 16)
        Self.imageSmashDown = New Sprite("entities/ogre_down.png", 46, 142, 16)
        Self.imageSmashUp = New Sprite("entities/ogre_up.png", 47, 100, 16)

        Self.overrideAttackSound = "ogreAttack"
        Self.overrideHitSound = "ogreHit"
        Self.overrideDeathSound = "ogreDeath"
    End Method

    Field imageStandard: Sprite
    Field imageSmashLeft: Sprite
    Field imageSmashDown: Sprite
    Field imageSmashUp: Sprite
    Field smashingDir: Int = Direction.None
    Field justSmashed: Bool
    Field smashedDir: Int = Direction.None
    Field smashCounter: Int

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Ogre.CanBeLord()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Ogre.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Ogre.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Ogre.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        If Not Self.isMysteried
            Select Self.smashingDir
                Case Direction.Left
                    Self.image = Self.imageSmashLeft
                    Self.image.FlipX(False, True)

                    Self.animOverride = Audio.GetBeatAnimFrame2() + 2
                    Self.xOff = -78.0
                    Self.yOff = -40.0

                    Self.image.SetZOff(40.0)
                Case Direction.Right
                    Self.image = Self.imageSmashLeft
                    Self.image.FlipX(True, True)

                    Self.animOverride = Audio.GetBeatAnimFrame2() + 2
                    Self.xOff = -21.0
                    Self.yOff = -40.0

                    Self.image.SetZOff(40.0)
                Case Direction.Down
                    Self.image = Self.imageSmashDown

                    Self.animOverride = Audio.GetBeatAnimFrame2() + 2
                    Self.xOff = -11.0
                    Self.yOff = -42.0

                    Self.image.SetZOff(42.0)
                Case Direction.Up
                    Self.image = Self.imageSmashUp

                    Self.animOverride = Audio.GetBeatAnimFrame2() + 2
                    Self.xOff = -11.0
                    Self.yOff = -72.0

                    Self.image.SetZOff(72.0)
                Default
                    If Self.justSmashed
                        Select Self.smashedDir
                            Case Direction.Left
                                Self.image = Self.imageSmashLeft
                                Self.image.FlipX(False, True)
                                Self.imageStandard.FlipX(False, True)

                                Self.animOverride = (Self.smashCounter / 8) + 4
                                Self.xOff = -78.0
                                Self.yOff = -40.0

                                Self.image.SetZOff(40.0)
                            Case Direction.Right
                                Self.image = Self.imageSmashLeft
                                Self.image.FlipX(True, True)
                                Self.imageStandard.FlipX(True, True)

                                Self.animOverride = (Self.smashCounter / 8) + 4
                                Self.xOff = -21.0
                                Self.yOff = -40.0

                                Self.image.SetZOff(40.0)
                            Case Direction.Down
                                Self.image = Self.imageSmashDown

                                Self.animOverride = (Self.smashCounter / 8) + 4
                                Self.xOff = -11.0
                                Self.yOff = -42.0

                                Self.image.SetZOff(42.0)
                            Case Direction.Down
                                Self.image = Self.imageSmashUp

                                Self.animOverride = (Self.smashCounter / 8) + 4
                                Self.xOff = -11.0
                                Self.yOff = -72.0

                                Self.image.SetZOff(72.0)
                            Default
                                Self.image = Self.imageStandard

                                Self.animOverride = 1
                                Self.xOff = -11.0
                                Self.yOff = -18.0

                                Self.image.SetZOff(35.0)
                        End Select
                    Else
                        Self.image = Self.imageStandard

                        Self.animOverride = 1
                        Self.xOff = -11.0
                        Self.yOff = -18.0

                        Self.image.SetZOff(35.0)
                    End If
            End Select
        End If

        If Self.justSmashed
            Self.smashCounter += 1
            If Self.smashCounter >= 32
                Self.smashCounter = 0
                Self.justSmashed = False
            End If
        End If

        Super.Update()
    End Method

End Class
