'Strict

Import enemy
Import entity
Import logger
Import point

Class ZombieSnake Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("ZombieSnake.New(Int, Int, Int)")
    End Method

    Field zsChild: ZombieSnake
    Field zsParent: ZombieSnake
    Field cachedMoveDir: Point
    Field facing: Int

    Method AdjustFacingDir: Void()
        Debug.TraceNotImplemented("ZombieSnake.AdjustFacingDir()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("ZombieSnake.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("ZombieSnake.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("ZombieSnake.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("ZombieSnake.MoveSucceed(Bool, Bool)")
    End Method

    Method SetChild: Void(zs: Object)
        Debug.TraceNotImplemented("ZombieSnake.SetChild(Object)")
    End Method

    Method SetParent: Void(zs: Object)
        Debug.TraceNotImplemented("ZombieSnake.SetParent(Object)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ZombieSnake.Update()")
    End Method

End Class
