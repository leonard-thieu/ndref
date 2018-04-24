'Strict

Import enemy
Import entity
Import logger
Import point

Class Wraith Extends Enemy

    Global theCursedWraith: Object

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Wraith.New(Int, Int, Int)")
    End Method

    Field crySound: String
    Field seeking: Bool
    Field hasRoared: Bool

    Method AfterHitPlayer: Void(p: Object)
        Debug.TraceNotImplemented("Wraith.AfterHitPlayer(Object)")
    End Method

    Method BecomeCorporeal: Void(force: Bool)
        Debug.TraceNotImplemented("Wraith.BecomeCorporeal(Bool)")
    End Method

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Wraith.CanBeDamaged(Bool, Bool)")
    End Method

    Method CheckCorporeality: Void()
        Debug.TraceNotImplemented("Wraith.CheckCorporeality()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Wraith.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Wraith.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Wraith.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Wraith.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Wraith.Update()")
    End Method

End Class
