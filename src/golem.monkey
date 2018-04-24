'Strict

Import enemy
Import entity
Import logger

Class Golem Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Golem.New(Int, Int, Int)")
    End Method

    Field droppedOoze: Bool
    Field prevFrame: Int

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Golem.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Golem.Update()")
    End Method

End Class
