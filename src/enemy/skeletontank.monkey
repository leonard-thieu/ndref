'Strict

Import enemy
Import entity
Import logger
Import point

Class SkeletonTank Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("SkeletonTank.New(Int, Int, Int)")
    End Method

    Field moveCycle: Int
    Field movingDir: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("SkeletonTank.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("SkeletonTank.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("SkeletonTank.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("SkeletonTank.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SkeletonTank.Update()")
    End Method

End Class
