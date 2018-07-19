'Strict

Import monkey.math
Import enemy
Import audio2
Import entity
Import logger
Import necrodancergame
Import point
Import shrine
Import util

Class Armadillo Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive And
           l = 1
            l = 2
        End If

        Self.Init(xVal, yVal, l, "armadillo")

        Self.overrideHitSound = "armadilloHit"
        Self.overrideAttackSound = "armadilloAttack"
        Self.overrideDeathSound = "armadilloDeath"
    End Method

    Field chargeNext: Int = Direction.None
    Field chargingDir: Int = Direction.None
    Field stunnedTime: Int

    Method AttemptCharge: Void(target: Entity, immediate: Bool)
        If Not Self.hasBeenVisible
            Return
        End If

        Local dir := Direction.None
        Local xDiffAbs := math.Abs(target.x - Self.x)
        Local yDiffAbs := math.Abs(target.y - Self.y)

        If target.x <> Self.x Or
           yDiffAbs > 6
            If target.y <> y Or
               xDiffAbs > 6
                Select Self.level
                    Case 3
                        If xDiffAbs = yDiffAbs And
                           xDiffAbs <= 6
                            Local xOff := math.Sgn(target.x - Self.x)
                            Local yOff := math.Sgn(target.y - Self.y)
                            Local destX := Self.x
                            Local destY := Self.y

                            Repeat
                                destX += xOff
                                destY += yOff

                                If target.x = destX Or
                                   target.y = destY
                                    Exit
                                End If

                                If Util.IsGlobalCollisionAt(destX, destY, False, False, False, False)
                                    Return
                                End If
                            Forever

                            If immediate
                                Audio.PlayGameSoundAt("armadilloCry", Self.x, Self.y, False, -1, False)
                            End If

                            If target.x < Self.x
                                If target.y < Self.y
                                    chargingDir = Direction.UpLeft
                                Else If target.y > Self.y
                                    chargingDir = Direction.DownLeft
                                End If
                            Else If target.x > Self.x
                                If target.y < Self.y
                                    chargingDir = Direction.UpRight
                                Else If target.y > Self.y
                                    chargingDir = Direction.DownRight
                                End If
                            End If
                        End If
                End Select
            Else
                Local minX := math.Min(target.x, Self.x)
                minX += 1
                Local maxX := math.Max(target.x, Self.x)

                For Local x := minX Until maxX
                    If Util.IsGlobalCollisionAt(x, target.y, False, False, False, False)
                        Return
                    End If
                End For

                If immediate
                    Audio.PlayGameSoundAt("armadilloCry", Self.x, Self.y, False, -1, False)
                End If

                If target.x < Self.x
                    dir = Direction.Left
                Else
                    dir = Direction.Right
                End If
            End If
        Else
            Local minY := math.Min(target.y, Self.y)
            minY += 1
            Local maxY := math.Max(target.y, Self.y)

            For Local y := minY Until maxY
                If Util.IsGlobalCollisionAt(target.x, y, False, False, False, False)
                    Return
                End If
            End For

            If immediate
                Audio.PlayGameSoundAt("armadilloCry", Self.x, Self.y, False, -1, False)
            End If

            If target.y < Self.y
                dir = Direction.Up
            Else
                dir = Direction.Down
            End If
        End If

        If immediate
            Self.chargingDir = dir
        Else
            Self.chargeNext = dir
        End If
    End Method

    Method AttemptCharge: Void(immediate: Bool)
        If Self.stunnedTime <= 0 And
           Self.chargingDir = Direction.None And
           Self.chargeNext = Direction.None
            Local closestPlayer := Util.GetClosestPlayer(Self.x, Self.y)
            Self.AttemptCharge(closestPlayer, immediate)

            If controller_game.numPlayers > 1 And
               Self.chargingDir = Direction.None And
               Self.chargeNext = Direction.None
                If closestPlayer = controller_game.players[0]
                    Self.AttemptCharge(controller_game.players[1], immediate)
                Else
                    Self.AttemptCharge(controller_game.players[0], immediate)
                End If
            End If
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Armadillo.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Armadillo.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("Armadillo.Knockback(Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Armadillo.MoveFail()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Armadillo.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Armadillo.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        If Self.lastX > Self.x
            Self.image.FlipX(False, True)
        Else If Self.lastX < Self.x
            Self.image.FlipX(True, True)
        End If

        Local chargingDir := Self.chargingDir

        If Self.level <> 3
            Select Self.chargingDir
                Case Direction.DownLeft,
                     Direction.UpLeft
                    chargingDir = Direction.Left
                Case Direction.DownRight,
                     Direction.UpRight
                    chargingDir = Direction.Right
            End Select
        End If

        Local animOverrideOffset: Int
        
        Select chargingDir
            Case Direction.UpLeft,
                 Direction.UpRight
                animOverrideOffset = 11
            Case Direction.DownRight,
                 Direction.DownLeft
                animOverrideOffset = 15
            Case Direction.Right,
                 Direction.Left
                animOverrideOffset = 7
            Case Direction.Up,
                 Direction.Down
                animOverrideOffset = 3
            Case Direction.None
                If Self.stunnedTime <= 0
                    Self.animOverride = -1
                End If
        End Select

        If animOverrideOffset <> 0
            Self.animOverride = animOverrideOffset + math.Floor((necrodancergame.globalFrameCounter Mod 8) * 0.5)

            If Self.lastX > Self.x
                Self.image.FlipX(True, True)
            Else If Self.lastX < Self.x
                Self.image.FlipX(False, True)
            End If
        End If

        Self.AttemptCharge(False)

        Super.Update()
    End Method

End Class
