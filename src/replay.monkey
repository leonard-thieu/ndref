'Strict

Import monkey.list
Import logger

Class Replay

    Global lastSavedReplayFile: String

    Function LoadReplayFromFile: Void(filename: Int, replay: Object)
        Debug.TraceNotImplemented("Replay.LoadReplayFromFile()")
    End Function

    Function LoadReplayFromString: Void(data: Int, replay: Object)
        Debug.TraceNotImplemented("Replay.LoadReplayFromString()")
    End Function

    Function SaveReplayToFile: Void(replay: Object)
        Debug.TraceNotImplemented("Replay.SaveReplayToFile()")
    End Function

    Function SaveReplayToString: Int(replay: Object)
        Debug.TraceNotImplemented("Replay.SaveReplayToString()")
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
        Debug.TraceNotImplemented("Replay.GetDirectionsHitForBeat()")
    End Method

    Method GetNumBeats: Int()
        Debug.TraceNotImplemented("Replay.GetNumBeats()")
    End Method

    Method GetRand: Int(channel: Int)
        Debug.TraceNotImplemented("Replay.GetRand()")
    End Method

    Method Load: Void(filename: Int)
        Debug.TraceNotImplemented("Replay.Load()")
    End Method

    Method NewLevel: Void(randSeed: Int)
        Debug.TraceNotImplemented("Replay.NewLevel()")
    End Method

    Method NextLevel: Void()
        Debug.TraceNotImplemented("Replay.NextLevel()")
    End Method

    Method RecordBeat: Void(beatNum: Int)
        Debug.TraceNotImplemented("Replay.RecordBeat()")
    End Method

    Method RecordMissedBeat: Void(playerNum: Int, beatNum: Int)
        Debug.TraceNotImplemented("Replay.RecordMissedBeat()")
    End Method

    Method RecordMove: Void(playerNum: Int, move: Int, beatNum: Int, isOffbeat: Bool)
        Debug.TraceNotImplemented("Replay.RecordMove()")
    End Method

    Method RecordRand: Void(channel: Int, num: Int)
        Debug.TraceNotImplemented("Replay.RecordRand()")
    End Method

    Method Reset: Void()
        Debug.TraceNotImplemented("Replay.Reset()")
    End Method

    Method Save: Void()
        Debug.TraceNotImplemented("Replay.Save()")
    End Method

    Method NoTrim: Void()
        LoadReplayFromFile(0, Null)
        LoadReplayFromString(0, Null)
        SaveReplayToFile(Null)
        SaveReplayToString(Null)
        GetDirectionsHitForBeat(0, 0, 0)
        GetNumBeats()
        GetRand(0)
        Load(0)
        NewLevel(0)
        NextLevel()
        RecordBeat(0)
        RecordMissedBeat(0, 0)
        RecordMove(0, 0, 0, False)
        RecordRand(0, 0)
        Reset()
        Save()
    End Method

End Class

Class ReplayData

    Function _EditorFix: Void() End

End Class
