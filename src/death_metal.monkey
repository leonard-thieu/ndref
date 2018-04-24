'Strict

Import enemy
Import entity
Import logger
Import point

Class DeathMetal Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("DeathMetal.New(Int, Int, Int)")
    End Method

    Field actionDelay: Int
    Field cachedMoveDir: Point
    Field shieldDestroyed: Bool
    Field preventKnockbackThisFrame: Bool
    Field shieldDir: Int
    Field actionDelayTime: Int
    Field lastActionTime: Int
    Field lastAction: Int
    Field summonCount: Int
    Field justBounced: Bool
    Field directionHitFrom: Int

    Method AdjustShieldDir: Void()
        Debug.TraceNotImplemented("DeathMetal.AdjustShieldDir()")
    End Method

    Method DestroyShield: Void(dir: Int)
        Debug.TraceNotImplemented("DeathMetal.DestroyShield(Int)")
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
