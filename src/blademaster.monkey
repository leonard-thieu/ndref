'Strict

Import enemy
Import entity
Import logger
Import point

Class Blademaster Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Blademaster.New(Int, Int, Int)")
    End Method

    Field charging: Bool
    Field hitDir: Int
    Field vulnerable: Bool

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Blademaster.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Blademaster.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Blademaster.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Blademaster.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Blademaster.Update()")
    End Method

End Class
