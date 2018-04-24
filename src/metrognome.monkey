'Strict

Import enemy
Import entity
Import logger
Import point

Class MetroGnome Extends Enemy

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int, l: Int)
        Debug.TraceNotImplemented("MetroGnome.New(Int, Int, Int)")
    End Method

    Field hasOrigin: Bool
    Field originX: Int
    Field originY: Int
    Field attackCounter: Int
    Field soundParity: Bool

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("MetroGnome.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("MetroGnome.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("MetroGnome.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("MetroGnome.MoveSucceed(Bool, Bool)")
    End Method

    Method Tick: Void()
        Debug.TraceNotImplemented("MetroGnome.Tick()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("MetroGnome.Update()")
    End Method

End Class
