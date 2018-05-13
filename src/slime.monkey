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
            l = Util.RndIntRange(2, 3, False)
        End If

        Self.Init(xVal, yVal, l, "slime")

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
        Debug.TraceNotImplemented("Slime.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Slime.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Slime.MoveSucceed(Bool, Bool)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Slime.PerformMovement(Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Slime.Update()")
    End Method

End Class
