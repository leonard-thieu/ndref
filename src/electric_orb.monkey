'Strict

Import enemy
Import entity
Import logger

Class ElectricOrb Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, dir_: Int)
        Debug.TraceNotImplemented("ElectricOrb.New(Int, Int, Int, Int)")
    End Method

    Field dir: Int

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("ElectricOrb.CanBeDamaged(Bool, Bool)")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("ElectricOrb.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("ElectricOrb.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("ElectricOrb.MoveSucceed(Bool, Bool)")
    End Method

End Class
