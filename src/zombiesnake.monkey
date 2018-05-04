'Strict

Import enemy
Import entity
Import logger
Import point

Class ZombieSnake Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "zombie_snake")

        Self.movesRegardlessOfDistance = True
        Self.wasSeekingX = False

        Self.ActivateLight(0.01, 0.02)
    End Method

    Field zsChild: ZombieSnake
    Field zsParent: ZombieSnake
    Field cachedMoveDir: Point = New Point(0, 0)
    Field facing: Int = -1

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

    Method SetChild: Void(zs: ZombieSnake)
        Self.zsChild = zs
    End Method

    Method SetParent: Void(zs: Object)
        Debug.TraceNotImplemented("ZombieSnake.SetParent(Object)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ZombieSnake.Update()")
    End Method

End Class
