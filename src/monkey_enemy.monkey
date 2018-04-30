'Strict

Import controller_game
Import enemyclamper
Import entity
Import logger
Import player_class
Import shrine
Import util

Class Monkey Extends EnemyClamper

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            Select l
                Case 1 l = 2
                Case 3 l = 4
            End Select
        End If

        Self.Init(xVal, yVal, l, "monkey", "", -1, -1)

        Self.overrideDeathSound = "monkeyDeath"
        If l = 4
            Self.overrideDeathSound = "magicMonkeyDeath"
        End If

        Self.startingHealth = Self.healthMax
        Self.startingCoinsToDrop = Self.coinsToDrop

        If Util.IsCharacterActive(Character.Dove) Or
           (Util.AreAriaOrCodaActive() And controller_game.currentZone = 4)
            Self.coinsToDrop = 0
            Self.Die()
        End If
    End Method

    Field startingHealth: Int
    Field startingCoinsToDrop: Int
    Field clampedOnto: Player

    Method AttemptClamp: Void()
        Debug.TraceNotImplemented("Monkey.AttemptClamp()")
    End Method

    Method Die: Void()
        If Self.clampedOnto <> Null And
           Self.clampedOnto.clampedEnemy = Self
            Self.clampedOnto.clampedEnemy = Null
        End If

        Super.Die()
    End Method

    Method DislodgeAttempt: Bool()
        Debug.TraceNotImplemented("Monkey.DislodgeAttempt()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Monkey.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Monkey.PerformMovement(Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Monkey.Update()")
    End Method

End Class
