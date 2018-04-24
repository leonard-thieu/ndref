'Strict

Import enemy
Import entity
Import logger

Class Skull Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Skull.New(Int, Int, Int)")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Skull.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

End Class
