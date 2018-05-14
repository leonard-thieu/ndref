'Strict

Import enemy
Import logger

Class SwarmSarcophagus Extends Enemy

    Global swarmSarcophagi: Object

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("SwarmSarcophagus.New(Int, Int)")
    End Method

    Field queuedSpawn: Int
    Field prepSpawn: Bool
    Field vibrateCounter: Int
    Field vibrateOffset: Float

    Method Delete: Void()
        Debug.TraceNotImplemented("SwarmSarcophagus.Delete()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("SwarmSarcophagus.MoveSucceed(Bool, Bool)")
    End Method

    Method QueueSpawn: Void(type: Int)
        Debug.TraceNotImplemented("SwarmSarcophagus.QueueSpawn(Int)")
    End Method

    Method SpawnEnemy2: Void(type: Int)
        Debug.TraceNotImplemented("SwarmSarcophagus.SpawnEnemy2(Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SwarmSarcophagus.Update()")
    End Method

End Class
