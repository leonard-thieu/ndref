'Strict

Import monkey.list
Import monkey.map
Import logger
Import necrodancergame

Class Replay

    Global lastSavedReplayFile: String

    Function LoadReplayFromFile: Void(filename: String, replay: Replay)
        Debug.TraceNotImplemented("Replay.LoadReplayFromFile(String, Replay)")
    End Function

    Function LoadReplayFromString: Void(data: String, replay: Replay)
        Debug.TraceNotImplemented("Replay.LoadReplayFromString(String, Replay)")
    End Function

    Function SaveReplayToFile: Void(replay: Replay)
        Debug.TraceNotImplemented("Replay.SaveReplayToFile(Replay)")
    End Function

    Function SaveReplayToString: String(replay: Replay)
        Debug.TraceNotImplemented("Replay.SaveReplayToString(Replay)")
    End Function

    Function _EditorFix: Void() End

    Method New()
        Self.gameVersion = necrodancergame.GAME_VERSION

        For Local i := 0 Until Self.curBeats.Length
            Self.curBeats[i] = 0
        End For
    End Method

    Field curReplayData: list.Node<ReplayData>
    Field gaveWarning: Bool
    Field startingZone: Int = 1
    Field startingLevel: Int = 1
    Field curBeats: Int[] = New Int[necrodancergame.MAX_NUM_PLAYERS]
    Field beatOffset: Int
    Field runTime: Int
    Field replayStr: String
    Field gameVersion: Int
    Field startingGold: Int
    Field hasBroadsword: Bool
    Field replayData: List<ReplayData> = New List<ReplayData>()
    Field saveData: String

    Method GetDirectionsHitForBeat: List<Int>(playerNum: Int, closestBeat: Int, percentDist: Float)
        Debug.TraceNotImplemented("Replay.GetDirectionsHitForBeat(Int, Int, Float)")
    End Method

    Method GetNumBeats: Int()
        Debug.TraceNotImplemented("Replay.GetNumBeats()")
    End Method

    Method GetRand: Int(channel: Int)
        Debug.TraceNotImplemented("Replay.GetRand(Int)")
    End Method

    Method Load: Void(filename: String)
        Debug.TraceNotImplemented("Replay.Load(String)")
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

    Field randList1: List<Int> = New List<Int>()
    Field randList2: List<Int> = New List<Int>()
    Field cameraWidth: Int
    Field cameraHeight: Int
    Field randSeed: Int
    Field numPlayers: Int
    Field lastBeat: Int
    Field charID: Int[necrodancergame.MAX_NUM_PLAYERS]
    Field playerInputs: IntMap<Int>[necrodancergame.MAX_NUM_PLAYERS]
    Field missedBeats: List<Int>[necrodancergame.MAX_NUM_PLAYERS]

End Class
