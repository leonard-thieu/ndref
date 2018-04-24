'Strict

Import enemy
Import entity
Import logger
Import point

Class Orc Extends Enemy

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int, l: Int)
        Debug.TraceNotImplemented("Orc.New(Int, Int, Int)")
    End Method

    Field facing: Int
    Field nextFacing: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Orc.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Orc.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Orc.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Orc.Update()")
    End Method

End Class
