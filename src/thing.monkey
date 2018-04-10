Import entity

Class Thing Extends Entity

    Function _EditorFix: Void() End

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Throw New Throwable()
    End Method

    Method Update: Void()
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        Hit(0, 0, 0, Null, False, 0)
        Update()
    End Method

End Class
