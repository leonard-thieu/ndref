'Strict

Import enemy
Import level
Import logger
Import point
Import shrine
Import util

Class Slime Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If l = 1 And
           Shrine.warShrineActive
            l = Util.RndIntRange(2, 3, False, -1)
        End If

        Self.Init(xVal, yVal, l, "slime", "", -1, -1)

        Self.moveCount = Util.RndIntRangeFromZero(3, True)

        ' TODO: Probably a much simpler way to write this.
        If level = 3
            If Level.IsWallAt(xVal + 1, yVal) Or Level.IsWallAt(xVal + 1, yVal + 1)
                If Level.IsWallAt(xVal, yVal - 1) Or Level.IsWallAt(xVal + 1, yVal - 1)
                    If Level.IsWallAt(xVal - 1, yVal) Or Level.IsWallAt(xVal - 1, yVal - 1)
                        If Not Level.IsWallAt(xVal, yVal + 1) And Not Level.IsWallAt(xVal - 1, yVal + 1)
                            Self.moveCount = 1
                        End If
                    Else
                        Self.moveCount = 2
                    End If
                Else
                    Self.moveCount = 3
                End If
            Else
                Self.moveCount = 0
            End If
        Else
            If Not Level.IsWallAt(xVal, yVal + 1)
                Self.moveCount = 1
            End If

            If Not Level.IsWallAt(xVal, yVal - 1)
                Self.moveCount = 0
            End If
        End If

        If Self.level = 2
            Self.image.FlipX(False, True)

            If Util.RndBool(False)
                Self.image.FlipX(True, True)
            End If
        End If

        Self.movesRegardlessOfDistance = True

        Self.overrideHitSound = "slimeHit"
        Self.overrideAttackSound = "slimeAttack"
        Self.overrideDeathSound = "slimeDeath"
    End Method

    Field moveCount: Int

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Slime.CanBeLord()")
    End Method

    Method Die: Void()
        If Self.enableDeathEffects
            If Not Self.falling
                Select Self.level
                    Case 4
                        Level.PlaceIceTileAt(Self.x, Self.y)
                    Case 5
                        Level.PlaceHotCoalTileAt(Self.x, Self.y)
                End Select
            End If
        End If

        Super.Die()
    End Method

    Method GetMovementDirection: Point()
        Local movementDirection := New Point(0, 0)

        Select Self.level
            Case 8
                Select Self.moveCount Mod 8
                    Case 0,
                         1
                        movementDirection.x = 1
                        Self.image.FlipX(True, True)
                    Case 2
                        movementDirection.y = 1
                        Self.image.FlipX(True, True)
                    Case 3
                        movementDirection.y = 1
                        Self.image.FlipX(False, True)
                    Case 4,
                         5
                        movementDirection.x = -1
                        Self.image.FlipX(True, True)
                    Case 6
                        movementDirection.y = -1
                        Self.image.FlipX(True, True)
                    Case 7
                        movementDirection.y = -1
                        Self.image.FlipX(False, True)
                End Select
            Case 7
                Select Self.moveCount Mod 4
                    Case 0
                        movementDirection.x = 1
                        Self.image.FlipX(False, True)
                    Case 1
                        movementDirection.x = -1
                        movementDirection.y = 1
                        Self.image.FlipX(False, True)
                    Case 2
                        movementDirection.x = -1
                        Self.image.FlipX(True, True)
                    Case 3
                        movementDirection.x = 1
                        movementDirection.y = -1
                        Self.image.FlipX(True, True)
                End Select
            Case 6
                Select Self.moveCount Mod 4
                    Case 0,
                         2
                        movementDirection.x = 1
                        Self.image.FlipX(False, True)
                    Case 1
                        movementDirection.x = -1
                        movementDirection.y = 1
                        Self.image.FlipX(True, True)
                    Case 3
                        movementDirection.x = -1
                        movementDirection.y = -1
                        Self.image.FlipX(True, True)
                End Select
            Case 5
                Select Self.moveCount Mod 4
                    Case 0
                        movementDirection.x = -1
                        movementDirection.y = 1
                    Case 1
                        movementDirection.x = 1
                        movementDirection.y = 1
                        Self.image.FlipX(True, True)
                    Case 2
                        movementDirection.x = 1
                        movementDirection.y = -1
                    Case 3
                        movementDirection.x = -1
                        movementDirection.y = -1
                        Self.image.FlipX(False, True)
                End Select
            Case 4
                Select Self.moveCount Mod 4
                    Case 0
                        movementDirection.x = 1
                        movementDirection.y = 1
                        Self.image.FlipX(False, True)
                    Case 1
                        movementDirection.x = -1
                        movementDirection.y = 1
                    Case 2
                        movementDirection.x = -1
                        movementDirection.y = -1
                    Case 3
                        movementDirection.x = 1
                        movementDirection.y = -1
                        Self.image.FlipX(True, True)
                End Select
            Case 3
                Select Self.moveCount Mod 4
                    Case 0
                        movementDirection.x = 1
                    Case 1
                        movementDirection.y = 1
                    Case 2
                        movementDirection.x = -1
                    Case 3
                        movementDirection.y = -1
                        Self.image.FlipX(True, True)
                End Select
            Case 2
                Select Self.moveCount Mod 2
                    Case 0
                        movementDirection.y = -1
                    Case 1
                        movementDirection.y = 1
                End Select
        End Select

        Return movementDirection
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Slime.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        If moveDelayed And
           Self.level = 1
            If Not Self.IsStuckInLiquid()
                Local bounceTo := New Point(0, -1)
                Self.BounceToward(bounceTo, False)
            End If
        End If

        If Not hitPlayer And
           Not moveDelayed
            Self.moveCount += 1
        End If

        Super.MoveSucceed(hitPlayer, moveDelayed)
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Slime.PerformMovement(Int, Int)")
    End Method

    Method Update: Void()
        If Self.level = 2
            Self.animOverride = -1
            
            If Self.currentMoveDelay <= 1
                If Not Player.PlayersHaveMovedThisBeat() And
                   Audio.CloserToPreviousBeatThanNext()
                    Self.animOverride = 7
                End If
            Else
                Self.overrideNormal2Timing = 0
            End If
        End If

        Super.Update()
    End Method

End Class
