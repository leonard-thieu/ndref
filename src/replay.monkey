'Strict

Import monkey.list
Import monkey.map
Import logger

Class Replay

    Global lastSavedReplayFile: String

    Function LoadReplayFromFile: Void(filename: Int, replay: Object)
        Debug.TraceNotImplemented("Replay.LoadReplayFromFile(Int, Object)")
    End Function

    Function LoadReplayFromString: Void(data: Int, replay: Object)
        Debug.TraceNotImplemented("Replay.LoadReplayFromString(Int, Object)")
    End Function

    Function SaveReplayToFile: Void(replay: Object)
        Debug.TraceNotImplemented("Replay.SaveReplayToFile(Object)")
    End Function

    Function SaveReplayToString: Int(replay: Object)
        Debug.TraceNotImplemented("Replay.SaveReplayToString(Object)")
    End Function

    Function _EditorFix: Void() End

    Field curReplayData: Node<ReplayData>
    Field gaveWarning: Bool
    Field startingZone: Int
    Field startingLevel: Int
    Field curBeats: Int[]
    Field beatOffset: Int
    Field runTime: Int
    Field replayStr: String
    Field gameVersion: Int
    Field startingGold: Int
    Field hasBroadsword: Bool
    Field replayData: List<ReplayData>
    Field saveData: String

    Method GetDirectionsHitForBeat: Object(playerNum: Int, closestBeat: Int, percentDist: Float)
        Debug.TraceNotImplemented("Replay.GetDirectionsHitForBeat(Int, Int, Float)")
    End Method

    Method GetNumBeats: Int()
        Debug.TraceNotImplemented("Replay.GetNumBeats()")
    End Method

    Method GetRand: Int(channel: Int)
        Debug.TraceNotImplemented("Replay.GetRand(Int)")
    End Method

    Method Load: Void(filename: Int)
        Debug.TraceNotImplemented("Replay.Load(Int)")
    End Method

    Method NewLevel: Void(randSeed: Int)
        Debug.TraceNotImplemented("Replay.NewLevel(Int)")
    End Method

    Method NextLevel: Void()
        Debug.TraceNotImplemented("Replay.NextLevel()")
    End Method

    Method RecordBeat: Void(beatNum: Int)
        Debug.TraceNotImplemented("Replay.RecordBeat(Int)")
    End Method

    Method RecordMissedBeat: Void(playerNum: Int, beatNum: Int)
        Debug.TraceNotImplemented("Replay.RecordMissedBeat(Int, Int)")
    End Method

    Method RecordMove: Void(playerNum: Int, move: Int, beatNum: Int, isOffbeat: Bool)
        Debug.TraceNotImplemented("Replay.RecordMove(Int, Int, Int, Bool)")
    End Method

    Method RecordRand: Void(channel: Int, num: Int)
        Debug.TraceNotImplemented("Replay.RecordRand(Int, Int)")
    End Method

    Method Reset: Void()
        Debug.TraceNotImplemented("Replay.Reset()")
    End Method

    Method Save: Void()
        Debug.TraceNotImplemented("Replay.Save()")
    End Method

End Class

Class ReplayData

    Function _EditorFix: Void() End

    Field randList1: List<Int>
    Field randList2: List<Int>
    Field cameraWidth: Int
    Field cameraHeight: Int
    Field randSeed: Int
    Field numPlayers: Int
    Field lastBeat: Int
    Field charID: Int[]
    Field playerInputs: IntMap<Object>[]
    Field missedBeats: List<Int>[]

End Class
