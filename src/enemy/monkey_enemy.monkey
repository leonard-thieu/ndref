'Strict

Import monkey.math
Import enemy.enemyclamper
Import gui.controller_game
Import audio2
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
        If Self.clampedOn
            If Self.x <> Self.clampedOnto.x And
               Self.y <> Self.clampedOnto.y
                Self.x = Self.clampedOnto.x
                Self.y = Self.clampedOnto.y
            End If

            If Self.clampedOnto.Perished
                Self.clampedOn = False
                Self.clampedOnto = Null
                Self.animOverride = -1
                Self.yOff = 0.0
                Self.coinsToDrop = Self.startingCoinsToDrop

                If Self.level = 2 And
                   Self.health <= 3
                    Self.health = 1
                Else
                    Self.health = math.Min(Self.health, Self.startingHealth)
                End If

                Self.healthMax = Self.startingHealth
            End If
        Else
            Self.yOff = 0.0
            If Audio.IsBeatAnimTime(False, False)
                Self.animOverride = 4
            Else
                Self.animOverride = 5
            End If
        End If

        Super.Update()
    End Method

End Class
