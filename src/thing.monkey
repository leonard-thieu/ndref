'Strict

Import entity
Import logger

Class Thing Extends Entity

    Function _EditorFix: Void() End

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Thing.Hit()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Thing.Update()")
    End Method

    Method NoTrim: Void()
        Hit(0, 0, 0, Null, False, 0)
        Update()
    End Method

End Class
