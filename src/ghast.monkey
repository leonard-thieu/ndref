'Strict

Import enemy
Import entity
Import logger
Import point

Class Ghast Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Ghast.New(Int, Int, Int)")
    End Method

    Field seeking: Bool
    Field teleporting: Bool
    Field hitDir: Int
    Field hitPlayer: Entity
    Field skippedMove: Bool
    Field hasRoared: Bool
    Field beenHit: Bool

    Method BecomeCorporeal: Void(force: Bool)
        Debug.TraceNotImplemented("Ghast.BecomeCorporeal(Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Ghast.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Ghast.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Ghast.Update()")
    End Method

End Class
