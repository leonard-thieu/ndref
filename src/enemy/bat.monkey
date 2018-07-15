'Strict

Import controller.controller_game
Import controller.controller_level_editor
Import enemy
Import level
Import entity
Import logger
Import player_class
Import point
Import shrine
Import tile
Import util

Class Bat Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Select l
            Case 1
                If Shrine.warShrineActive
                    l = 2
                End If
            Case 2,
                 4
            If Util.IsCharacterActive(Character.Bolt) Or
               Util.AreAriaOrCodaActive()
                If Not Level.isBeastmaster And
                   controller_game.currentLevel <> LevelType.Test
                    l = 1
                Else If l = 2 And
                        Not Level.isTrainingMode And
                        Not Level.isHardcoreMode And
                        controller_game.currentLevel <> LevelType.Test And
                        ControllerLevelEditor.playingLevel = -1
                    l = 1
                End If
            End If
        End Select

        Self.Init(xVal, yVal, l, "bat")

        Self.overrideAttackSound = "batAttack"
        Self.overrideHitSound = "batHit"
        Self.overrideDeathSound = "batDeath"
    End Method

    Method GetMovementDirection: Point()
        If Self.level = 4
            If Not Tile.AnyPlayerHaveRingOfLuck()
                Local x: Int
                Local y: Int

                x = 1
                y = 0
                If Util.IsAnyPlayerAt(Self.x + x, Self.y + y)
                    Return New Point(x, y)
                End If

                x = -1
                y = 0
                If Util.IsAnyPlayerAt(Self.x + x, Self.y + y)
                    Return New Point(x, y)
                End If

                x = 0
                y = 1
                If Util.IsAnyPlayerAt(Self.x + x, Self.y + y)
                    Return New Point(x, y)
                End If

                x = 0
                y = -1
                If Util.IsAnyPlayerAt(Self.x + x, Self.y + y)
                    Return New Point(x, y)
                End If
            End If

            Return Self.RandomSeek(False, False)
        End If

        If Self.confusedUntil > Audio.GetClosestBeatNum(True)
            Return Self.BasicSeek()
        End If

        Return Super.GetMovementDirection()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Bat.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        If Self.lastX > Self.x
            Self.image.FlipX(True, True)
        Else If Self.x > Self.lastX
            Self.image.FlipX(False, True)
        End If

        Super.Update()
    End Method

End Class
