'Strict

Import enemy
Import entity
Import logger
Import point

Class ZombieElectric Extends Enemy

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int, l: Int)
        Debug.TraceNotImplemented("ZombieElectric.New(Int, Int, Int)")
    End Method

    Field facing: Int
    Field turnToFace: Int
    Field rested: Bool
    Field queueRest: Bool

    Method GetMovementDir: Int()
        Debug.TraceNotImplemented("ZombieElectric.GetMovementDir()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("ZombieElectric.GetMovementDirection()")
    End Method

    Method GetNextMovementDir: Int()
        Debug.TraceNotImplemented("ZombieElectric.GetNextMovementDir()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("ZombieElectric.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("ZombieElectric.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("ZombieElectric.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ZombieElectric.Update()")
    End Method

End Class
