'Strict

Import enemy
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
        Debug.TraceNotImplemented("DeathMetal.Die()")
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
        Debug.TraceNotImplemented("DeathMetal.Update()")
    End Method

End Class
