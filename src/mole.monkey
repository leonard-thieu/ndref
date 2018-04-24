'Strict

Import enemy
Import entity
Import logger
Import mole_dirt
Import point

Class Mole Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Mole.New(Int, Int, Int)")
    End Method

    Field currentDirt: MoleDirt
    Field wasBurrowed: Bool
    Field isBurrowed: Bool

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Mole.CanBeDamaged(Bool, Bool)")
    End Method

    Method Delete: Void()
        Debug.TraceNotImplemented("Mole.Delete()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Mole.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Mole.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Mole.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Mole.MoveSucceed(Bool, Bool)")
    End Method

    Method PutDirt: Void()
        Debug.TraceNotImplemented("Mole.PutDirt()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Mole.Render()")
    End Method

    Method UnoccupyDirt: Void()
        Debug.TraceNotImplemented("Mole.UnoccupyDirt()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Mole.Update()")
    End Method

End Class
