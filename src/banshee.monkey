'Strict

Import enemy
Import entity
Import logger

Class Banshee Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Banshee.New(Int, Int, Int)")
    End Method

    Field hasShrieked: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("Banshee.Die()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Banshee.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Banshee.Update()")
    End Method

End Class
