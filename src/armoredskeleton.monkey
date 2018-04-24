'Strict

Import enemy
Import entity
Import logger
Import point

Class ArmoredSkeleton Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("ArmoredSkeleton.New(Int, Int, Int)")
    End Method

    Field hasHead: Bool
    Field cachedMoveDir: Point
    Field directionHitFrom: Int
    Field gotBounced: Bool
    Field shieldDestroyed: Bool
    Field shieldDir: Int
    Field justBounced: Bool
    Field willHaveHead: Bool

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("ArmoredSkeleton.CanBeLord()")
    End Method

    Method DestroyShield: Void(dir: Int)
        Debug.TraceNotImplemented("ArmoredSkeleton.DestroyShield(Int)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("ArmoredSkeleton.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("ArmoredSkeleton.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("ArmoredSkeleton.Knockback(Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("ArmoredSkeleton.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ArmoredSkeleton.Update()")
    End Method

End Class
