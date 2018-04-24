'Strict

Import enemy
Import entity
Import logger
Import point

Class Bat Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Bat.New(Int, Int, Int)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Bat.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Bat.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Bat.Update()")
    End Method

End Class
