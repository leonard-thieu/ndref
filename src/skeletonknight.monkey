'Strict

Import enemy
Import entity
Import logger
Import point

Class SkeletonKnight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("SkeletonKnight.New(Int, Int, Int)")
    End Method

    Field hasHead: Bool
    Field cachedMoveDir: Point
    Field directionHitFrom: Int
    Field gotBounced: Bool
    Field hasHorse: Bool
    Field shieldDestroyed: Bool
    Field shieldDir: Int
    Field hasRoared: Bool
    Field justBounced: Bool
    Field willHaveHead: Bool

    Method AdjustShieldDir: Void()
        Debug.TraceNotImplemented("SkeletonKnight.AdjustShieldDir()")
    End Method

    Method DestroyHorse: Void(dir: Int)
        Debug.TraceNotImplemented("SkeletonKnight.DestroyHorse(Int)")
    End Method

    Method DestroyShield: Void(dir: Int)
        Debug.TraceNotImplemented("SkeletonKnight.DestroyShield(Int)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("SkeletonKnight.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("SkeletonKnight.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("SkeletonKnight.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("SkeletonKnight.Knockback(Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("SkeletonKnight.MoveFail()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("SkeletonKnight.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("SkeletonKnight.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SkeletonKnight.Update()")
    End Method

End Class
