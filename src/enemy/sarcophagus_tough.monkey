'Strict

Import enemy
Import level
Import entity
Import logger
Import point

Class ToughSarcophagus Extends Enemy

    Function GetPerRoomCount: Int()
        Local hardModeXML := Level.GetHardModeXML()

        Return hardModeXML.GetAttribute("sarcsPerRoom", 0)
    End Function

    Function GetSpawnBeats: Int()
        Debug.TraceNotImplemented("ToughSarcophagus.GetSpawnBeats()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, etype: Int)
        Super.New()

        Self.Init(xVal, yVal, 1, "toughsarcophagus")

        Self.isSarcophagus = True

        Self.overrideHitSound = "sarcophagusHit"
        Self.overrideDeathSound = "sarcophagusDeath"

        Self.spawnType = etype
    End Method

    Field spawnType: Int
    Field spawnTimer: Int
    Field numSpawned: Int
    Field current: Enemy
    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 0.7

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
