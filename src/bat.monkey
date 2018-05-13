'Strict

Import controller_game
Import controller_level_editor
Import enemy
Import entity
Import level
Import logger
Import point
Import shrine
Import util

Class Bat Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Select l
            Case 1
                If Shrine.warShrineActive Then l = 2
            Case 2,
                 4
            If Util.IsCharacterActive(Character.Bolt) Or
               Util.AreAriaOrCodaActive()
                If Not Level.isBeastmaster And
                   controller_game.currentLevel <> -3000
                    l = 1
                Else If l = 2 And
                        Not Level.isTrainingMode And
                        Not Level.isHardcoreMode And
                        controller_game.currentLevel <> -3000 And
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
        Debug.TraceNotImplemented("Bat.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Bat.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Bat.Update()")
    End Method

End Class
