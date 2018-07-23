'Strict

Import enemy
Import audio2
Import entity
Import logger
Import player_class
Import point
Import util

Class DeathMetal Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "deathmetal")

        Self.animOverride = False

        Self.overrideHitSound = "deathMetal_hit"
        Self.overrideDeathSound = "deathMetal_death"
        Self.overrideAttackSound = "deathMetal_attack"

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Field actionDelay: Int = -1
    Field cachedMoveDir: Point = New Point(0, 0)
    Field shieldDestroyed: Bool
    Field preventKnockbackThisFrame: Bool
    Field shieldDir: Int = Direction.Down
    Field actionDelayTime: Int = 3
    Field lastActionTime: Int = 7
    Field lastAction: Int
    Field summonCount: Int
    Field justBounced: Bool
    Field directionHitFrom: Int = Direction.None

    Method AdjustShieldDir: Void()
        Debug.TraceNotImplemented("DeathMetal.AdjustShieldDir()")
    End Method

    Method DestroyShield: Void(dir: Int)
        Debug.TraceNotImplemented("DeathMetal.DestroyShield(Int)")
    End Method

    Method Die: Void()
        Enemy.SetEnemiesToDropNoCoinsOverride()
        Super.Die()
        Enemy.KillAllEnemies()
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("DeathMetal.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("DeathMetal.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("DeathMetal.Knockback(Int)")
    End Method

    Method MakeEnemies: Void(enType: Int, numMin: Int, numMax: Int)
        Debug.TraceNotImplemented("DeathMetal.MakeEnemies(Int, Int, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("DeathMetal.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("DeathMetal.MoveSucceed(Bool, Bool)")
    End Method

    Method TakeAction: Void()
        Debug.TraceNotImplemented("DeathMetal.TakeAction()")
    End Method

    Method Update: Void()
        Self.preventKnockbackThisFrame = False

        If Not Self.shieldDestroyed
            Select Self.shieldDir
                Case Direction.Left
                    Self.image.FlipX(False, True)
                Case Direction.Right
                    Self.image.FlipX(True, True)
            End Select
        End If

        If Self.health <= 4
            Self.actionDelayTime = 3
            Self.lastActionTime = 6
        End If

        If Self.health <= 2
            Self.lastActionTime = 4
            Self.actionDelayTime = 4
        End If

        If Self.shieldDestroyed
            If Audio.GetClosestBeatNum(True) - Self.actionDelay >= Self.actionDelayTime And
               Self.actionDelay > 0
                Self.TakeAction()
            End If

            If Audio.GetClosestBeatNum(True) - Self.lastAction >= Self.lastActionTime And
               (Util.GetDistFromClosestPlayer(Self.x, Self.y, False) >= 2.0 Or
                Self.health <= 2)
                If Self.health > 4
                    Audio.PlayGameSound("deathMetal_skels", -1, 1.0)
                Else If Self.health > 2
                    Audio.PlayGameSound("deathMetal_skels2", -1, 1.0)
                Else
                    Audio.PlayGameSound("deathMetal_fireball", -1, 1.0)
                End If

                Self.lastAction = Audio.GetClosestBeatNum(True)
                Self.actionDelay = Audio.GetClosestBeatNum(True)
            End If

            If Self.actionDelay < 0
                Self.animOverrideState = 8
                Self.animOverride = -1
            Else
                Self.animOverrideState = 6

                If Audio.IsBeatAnimTime(False, True)
                    Self.animOverride = 1
                Else
                    Self.animOverride = 0
                End If
            End If
        Else
            Select Self.shieldDir
                Case Direction.Left,
                     Direction.Right
                    Self.animOverrideState = 0
                Case Direction.Up
                    Self.animOverrideState = 4
                Default
                    Self.animOverrideState = 2
            End Select

            If Audio.IsBeatAnimTime(False, True)
                Self.animOverride = 0
            Else
                Self.animOverride = 1
            End If
        End If

        Super.Update()
    End Method

End Class
