'Strict

Import enemy
Import entity
Import logger
Import point

Class Ghoul Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Ghoul.New(Int, Int, Int)")
    End Method

    Field teleporting: Bool
    Field hitDir: Int
    Field hitPlayer: Entity
    Field skippedMove: Bool
    Field hasRoared: Bool
    Field beenHit: Bool
    Field seeking: Bool

    Method BecomeCorporeal2: Void()
        Debug.TraceNotImplemented("Ghoul.BecomeCorporeal2()")
    End Method

    Method CheckCorporeality: Void()
        Debug.TraceNotImplemented("Ghoul.CheckCorporeality()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Ghoul.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Ghoul.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Ghoul.Update()")
    End Method

End Class
