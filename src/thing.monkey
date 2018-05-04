'Strict

Import entity
Import logger

Class Thing Extends Entity

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, collides: Bool)
        Super.New()

        Self.x = xVal
        Self.y = yVal
        Self.collides = collides
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Thing.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Thing.Update()")
    End Method

End Class
