'Strict

Import enemy
Import entity
Import logger
Import point

Class Troll Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Troll.New(Int, Int, Int)")
    End Method

    Field lastHitBeat: Int
    Field runningDir: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Troll.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Troll.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Troll.Update()")
    End Method

End Class
