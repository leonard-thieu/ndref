'Strict

Import enemy
Import entity
Import logger
Import point
Import sprite

Class Poltergeist Extends Enemy

    Global theGhoul: Object

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Poltergeist.New(Int, Int, Int)")
    End Method

    Field alphaImage: Sprite
    Field multiImage: Bool
    Field hitPlayer: Entity
    Field seeking: Bool
    Field teleporting: Bool
    Field skippedMove: Bool
    Field hasRoared: Bool
    Field beenHit: Bool

    Method BecomeCorporeal: Void(force: Bool)
        Debug.TraceNotImplemented("Poltergeist.BecomeCorporeal(Bool)")
    End Method

    Method CheckCorporeality: Void()
        Debug.TraceNotImplemented("Poltergeist.CheckCorporeality()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Poltergeist.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Poltergeist.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Poltergeist.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Poltergeist.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Poltergeist.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Poltergeist.Update()")
    End Method

End Class
