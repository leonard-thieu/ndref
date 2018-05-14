'Strict

Import enemy
Import entity
Import logger
Import point

Class ToughSarcophagus Extends Enemy

    Function GetPerRoomCount: Int()
        Debug.TraceNotImplemented("ToughSarcophagus.GetPerRoomCount()")
    End Function

    Function GetSpawnBeats: Int()
        Debug.TraceNotImplemented("ToughSarcophagus.GetSpawnBeats()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, etype: Int)
        Debug.TraceNotImplemented("ToughSarcophagus.New(Int, Int, Int)")
    End Method

    Field spawnType: Int
    Field spawnTimer: Int
    Field numSpawned: Int
    Field current: Enemy
    Field vibrateCounter: Int
    Field vibrateOffset: Float

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("ToughSarcophagus.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("ToughSarcophagus.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("ToughSarcophagus.MoveSucceed(Bool, Bool)")
    End Method

    Method SpawnEnemy: Void()
        Debug.TraceNotImplemented("ToughSarcophagus.SpawnEnemy()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ToughSarcophagus.Update()")
    End Method

End Class
