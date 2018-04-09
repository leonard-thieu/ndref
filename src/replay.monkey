Strict

Class Replay

    Global lastSavedReplayFile: String

    Function LoadReplayFromFile: Void(filename: Int, replay: Object)
        Throw New Throwable()
    End Function

    Function LoadReplayFromString: Void(data: Int, replay: Object)
        Throw New Throwable()
    End Function

    Function SaveReplayToFile: Void(replay: Object)
        Throw New Throwable()
    End Function

    Function SaveReplayToString: Int(replay: Object)
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

    Method GetDirectionsHitForBeat: Object(playerNum: Int, closestBeat: Int, percentDist: Float)
        Throw New Throwable()
    End Method

    Method GetNumBeats: Int()
        Throw New Throwable()
    End Method

    Method GetRand: Int(channel: Int)
        Throw New Throwable()
    End Method

    Method Load: Void(filename: Int)
        Throw New Throwable()
    End Method

    Method NewLevel: Void(randSeed: Int)
        Throw New Throwable()
    End Method

    Method NextLevel: Void()
        Throw New Throwable()
    End Method

    Method RecordBeat: Void(beatNum: Int)
        Throw New Throwable()
    End Method

    Method RecordMissedBeat: Void(playerNum: Int, beatNum: Int)
        Throw New Throwable()
    End Method

    Method RecordMove: Void(playerNum: Int, move: Int, beatNum: Int, isOffbeat: Bool)
        Throw New Throwable()
    End Method

    Method RecordRand: Void(channel: Int, num: Int)
        Throw New Throwable()
    End Method

    Method Reset: Void()
        Throw New Throwable()
    End Method

    Method Save: Void()
        Throw New Throwable()
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
