'Strict

Import enemy
Import entity
Import logger
Import point

Class Skeleton Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Skeleton.New(Int, Int, Int)")
    End Method

    Field hasHead: Bool
    Field directionHitFrom: Int
    Field gotBounced: Bool

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Skeleton.CanBeLord()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Skeleton.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Skeleton.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("Skeleton.Knockback(Int)")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Skeleton.MoveImmediate(Int, Int, String)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Skeleton.Update()")
    End Method

End Class
