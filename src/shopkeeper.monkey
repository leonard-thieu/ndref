Strict

Import npc

Class Shopkeeper Extends NPC

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Throw New Throwable()
    End Method

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Throw New Throwable()
    End Method

    Method Die: Void()
        Throw New Throwable()
    End Method

    Method GetMovementDirection: Object()
        Throw New Throwable()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Throw New Throwable()
    End Method

    Method IsSinging: Bool()
        Throw New Throwable()
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Throw New Throwable()
    End Method

    Method Update: Void()
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        CanBeDamaged(False, False)
        Die()
        GetMovementDirection()
        Hit(0, 0, 0, Null, False, 0)
        IsSinging()
        MoveSucceed(False, False)
        Update()
    End Method

End Class
