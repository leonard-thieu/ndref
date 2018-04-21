'Strict

Import monkey.math
Import monkey.random
Import controller_game
Import level
Import logger
Import player_class
Import point

Class Util

    Global storedSeed: Int

    Function AddMetric: Void(key: Int, value: Int, send: Bool, blocking: Bool, isNumber: Bool)
        Debug.TraceNotImplemented("Util.AddMetric()")
    End Function

    Function AreAriaOrCodaActive: Bool()
        Return Util.IsCharacterActive(Character.Aria) Or Util.IsCharacterActive(Character.Coda)
    End Function

    Function CreateScaledTextSprite: Object(str: Int, color: Int, scale: Int)
        Debug.TraceNotImplemented("Util.CreateScaledTextSprite()")
    End Function

    Function CreateTextSprite: Object(str: Int, color: Int, addShadow: Bool)
        Debug.TraceNotImplemented("Util.CreateTextSprite()")
    End Function

    Function CustomMusicInUse: Bool()
        Debug.TraceNotImplemented("Util.CustomMusicInUse()")
    End Function

    Function DirToString: Int(dir: Int)
        Debug.TraceNotImplemented("Util.DirToString()")
    End Function

    Function FindClosestTrulyUnoccupiedSpace: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
        Debug.TraceNotImplemented("Util.FindClosestTrulyUnoccupiedSpace()")
    End Function

    Function FindClosestTrulyUnoccupiedSpaceNotAdjacentToEnemy: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
        Debug.TraceNotImplemented("Util.FindClosestTrulyUnoccupiedSpaceNotAdjacentToEnemy()")
    End Function

    Function FindClosestUnoccupiedSpace: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
        Debug.TraceNotImplemented("Util.FindClosestUnoccupiedSpace()")
    End Function

    Function GetActiveLanguagesFolderPath: Int()
        Debug.TraceNotImplemented("Util.GetActiveLanguagesFolderPath()")
    End Function

    Function GetAngleBetweenDirections: Int(dir1: Int, dir2: Int)
        Debug.TraceNotImplemented("Util.GetAngleBetweenDirections()")
    End Function

    Function GetAnyPlayerAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Util.GetAnyPlayerAt()")
    End Function

    Function GetClosestPlayer: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Util.GetClosestPlayer()")
    End Function

    Function GetClosestPlayerIncludeItemEffects: Object(xVal: Int, yVal: Int, ignorePhasing: Bool)
        Debug.TraceNotImplemented("Util.GetClosestPlayerIncludeItemEffects()")
    End Function

    Function GetDirAfterRotation: Int(dir: Int, rotation: Int, includeDiagonals: Bool)
        Debug.TraceNotImplemented("Util.GetDirAfterRotation()")
    End Function

    Function GetDirFromDiff: Int(xDiff: Int, yDiff: Int)
        Debug.TraceNotImplemented("Util.GetDirFromDiff()")
    End Function

    Function GetDirRotationOrder: Object()
        Debug.TraceNotImplemented("Util.GetDirRotationOrder()")
    End Function

    Function GetDist: Float(x: Int, y: Int, x2: Int, y2: Int)
        Return math.Sqrt(Util.GetDistSq(x, y, x2, y2))
    End Function

    Function GetDistSq: Int(x: Int, y: Int, x2: Int, y2: Int)
        Return ((x2 - x) * (x2 - x)) +
               ((y2 - y) * (y2 - y))
    End Function

    Function GetDistFromClosestPlayer: Float(xVal: Int, yVal: Int, includeSouls: Bool)
        Debug.TraceNotImplemented("Util.GetDistFromClosestPlayer()")
    End Function

    Function GetDistSqFromClosestPlayer: Float(xVal: Int, yVal: Int, includeSouls: Bool, includeLambs: Bool)
        Debug.TraceNotImplemented("Util.GetDistSqFromClosestPlayer()")
    End Function

    Function GetLanguagesFolderPath: Int()
        Debug.TraceNotImplemented("Util.GetLanguagesFolderPath()")
    End Function

    Function GetLeaderboardScores: Void(rangeStart: Int, rangeEnd: Int, dayOffset: Int, specificLeaderboard: Int, useTodaysSeed: Bool, friendsOnly: Bool, playerOnly: Bool)
        Debug.TraceNotImplemented("Util.GetLeaderboardScores()")
    End Function

    Function GetLeaderboardSetPrefix: Int()
        Debug.TraceNotImplemented("Util.GetLeaderboardSetPrefix()")
    End Function

    Function GetLeaderboardSuffix: Int()
        Debug.TraceNotImplemented("Util.GetLeaderboardSuffix()")
    End Function

    Function GetLeaderboardSuffixForCharacterAndCoopAndDeathlessState: Int(includeCadence: Bool, includeCustomMusic: Bool, includeExtraMode: Bool, includeChar: Bool, includeAllChars: Bool, includeTags: Bool)
        Debug.TraceNotImplemented("Util.GetLeaderboardSuffixForCharacterAndCoopAndDeathlessState()")
    End Function

    Function GetPlayerLocation: Object(playerNum: Int)
        Debug.TraceNotImplemented("Util.GetPlayerLocation()")
    End Function

    Function GetPlayersAt: Object(where: Object)
        Debug.TraceNotImplemented("Util.GetPlayersAt()")
    End Function

    Function GetPlayersAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Util.GetPlayersAt()")
    End Function

    Function GetPointFromDir: Point(dir: Int)
        Local x: Int
        Local y: Int

        Select dir
            Case Direction.Right
                x = 1
                y = 0
            Case Direction.Down
                x = 0
                y = 1
            Case Direction.Left
                x = -1
                y = 0
            Case Direction.Up
                x = 0
                y = -1
            Case Direction.DownRight
                x = 1
                y = 1
            Case Direction.DownLeft
                x = -1
                y = 1
            Case Direction.UpLeft
                x = -1
                y = -1
            Case Direction.UpRight
                x = 1
                y = -1
            Default
                x = 0
                y = 0
        End Select

        Return New Point(x, y)
    End Function

    Function GetSteamStat: Int(statName: Int)
        Debug.TraceNotImplemented("Util.GetSteamStat()")
    End Function

    Function GetTileAt: Tile(xVal: Int, yVal: Int)
        If Level.tiles.Contains(xVal)
            Local tilesAtX := Level.tiles.Get(xVal)
            If tilesAtX.Contains(yVal)
                Return tilesAtX.Get(xVal)
            End If
        End If

        Return Null
    End Function

    Function GetTimeStringFromMilliseconds: Int(msecs: Int, secondsOnly: Bool, padSeconds: Bool)
        Debug.TraceNotImplemented("Util.GetTimeStringFromMilliseconds()")
    End Function

    Function GetVersionString: Int()
        Debug.TraceNotImplemented("Util.GetVersionString()")
    End Function

    Function HasLeaderboardDownloaded: Bool()
        Debug.TraceNotImplemented("Util.HasLeaderboardDownloaded()")
    End Function

    Function IncrementSteamStat: Bool(statName: Int, inGameplayOnly: Bool, allowCoop: Bool, allowSeeded: Bool, delayUntilLevelLoad: Bool)
        Debug.TraceNotImplemented("Util.IncrementSteamStat()")
    End Function

    Function InvertDir: Int(dir: Int)
        Debug.TraceNotImplemented("Util.InvertDir()")
    End Function

    Function IsAnyPlayerAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Util.IsAnyPlayerAt()")
    End Function

    Function IsBomblessCharacterActive: Bool()
        Debug.TraceNotImplemented("Util.IsBomblessCharacterActive()")
    End Function

    Function IsCharacterActive: Bool(charID: Int)
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player And player.characterID = charID Then Return True
        End For

        Return False
    End Function

    Function IsEnemyAdjacent: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Util.IsEnemyAdjacent()")
    End Function

    Function IsGlobalCollisionAt: Bool(xVal: Int, yVal: Int, isPlayer: Bool, ignoreWalls: Bool, includeTheNothing: Bool, includeShopWallsDespiteIgnoringWalls: Bool, skipIgnoreWalls: Bool)
        Debug.TraceNotImplemented("Util.IsGlobalCollisionAt()")
    End Function

    Function IsNonMobileCollisionAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Util.IsNonMobileCollisionAt()")
    End Function

    Function IsOnScreen: Bool(xVal: Int, yVal: Int, cameraSeekX: Float, cameraSeekY: Float)
        Debug.TraceNotImplemented("Util.IsOnScreen()")
    End Function

    Function IsWeaponlessCharacterActive: Bool()
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player.IsWeaponlessCharacter() Then Return True
        End For

        Return False
    End Function

    Function ParseTextSeed: Int(randSeedString: String)
        Const NUMBER_9 := 57
        Const NUMBER_0 := 48

        Local seed := 0

        For Local i := 1 Until randSeedString.Length()
            seed += i * randSeedString[i - 1]
        End For

        For Local j := 0 Until randSeedString.Length()
            If randSeedString[j] > NUMBER_9 Then Return seed
        End For

        seed = 0
        For Local k := 0 Until randSeedString.Length()
            seed = (10 * seed) + (randSeedString[k] - NUMBER_0)
        End For

        Return seed
    End Function

    Function ProcessDelayedStats: Void()
        Debug.TraceNotImplemented("Util.ProcessDelayedStats()")
    End Function

    Function Pump: Void()
        Debug.TraceNotImplemented("Util.Pump()")
    End Function

    Function RndBool: Bool(useSeed: Bool)
        Return Util.RndIntRangeFromZero(1, useSeed) = 0.0
    End Function

    Function RndFloatRange: Float(low: Float, high: Float, useSeed: Bool)
        If useSeed
            If Util.storedSeed <> -1
                random.Seed = Util.storedSeed
                Util.storedSeed = -1
            End If
        Else
            Util.storedSeed = random.Seed
        End If

        Return random.Rnd(low, high)
    End Function

    Function RndIntRange: Int(low: Int, high: Int, useSeed: Bool, replayConsistencyChannel: Int)
        Local value: Int = math.Floor(Util.RndFloatRange(low, high + 1, useSeed))
        value = math.Clamp(value, low, high)

        If replayConsistencyChannel >= 0
            If Level.isReplaying
                If Not Level.creatingMap
                    value = Level.replay.GetRand(replayConsistencyChannel)

                    If value < low Or
                       value > high
                        Return low
                    End If
                End If
            Else
                If Level.replay
                    Level.replay.RecordRand(replayConsistencyChannel, value)
                End If
            End If
        End If

        Return value
    End Function

    Function RndIntRangeFromZero: Int(high: Int, useSeed: Bool)
        Return RndIntRange(0, high, useSeed, -1)
    End Function

    Function RotateDirInDirection: Int(original: Int, dir: Int)
        Debug.TraceNotImplemented("Util.RotateDirInDirection()")
    End Function

    Function RotatePoint45DegreesClockwise: Object(p: Object)
        Debug.TraceNotImplemented("Util.RotatePoint45DegreesClockwise()")
    End Function

    Function RotatePointInDirection: Object(original: Object, dir: Int)
        Debug.TraceNotImplemented("Util.RotatePointInDirection()")
    End Function

    Function RotatePointInGeneralDirection: Object(p: Object, dir: Int)
        Debug.TraceNotImplemented("Util.RotatePointInGeneralDirection()")
    End Function

    Function SeedRnd(seed: Int)
        Util.storedSeed = -1
        random.Seed = seed
    End Function

    Function SegmentSegmentIntersection: Object(p0_x: Float, p0_y: Float, p1_x: Float, p1_y: Float, p2_x: Float, p2_y: Float, p3_x: Float, p3_y: Float)
        Debug.TraceNotImplemented("Util.SegmentSegmentIntersection()")
    End Function

    Function SendEntityTo: Void(ent: Object, xVal: Int, yVal: Int, triggerBossStart: Bool)
        Debug.TraceNotImplemented("Util.SendEntityTo()")
    End Function

    Function SetAppFolder: Void()
        Debug.TraceNotImplemented("Util.SetAppFolder()")
    End Function

    Function SetSteamIntStat: Bool(statName: Int, val: Int, inGameplayOnly: Bool, allowCoop: Bool, delayUntilLevelLoad: Bool)
        Debug.TraceNotImplemented("Util.SetSteamIntStat()")
    End Function

    Function SongNameSoundtrackId: Int(songName: Int)
        Debug.TraceNotImplemented("Util.SongNameSoundtrackId()")
    End Function

    Function StringLeft: Int(str: Int, n: Int)
        Debug.TraceNotImplemented("Util.StringLeft()")
    End Function

    Function SubmitDailyHardcoreScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitDailyHardcoreScore()")
    End Function

    Function SubmitHardcoreScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitHardcoreScore()")
    End Function

    Function SubmitModeScore: Void(mode: Int, score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitModeScore()")
    End Function

    Function SubmitSeededScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitSeededScore()")
    End Function

    Function SubmitSeededSpeedrunScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitSeededSpeedrunScore()")
    End Function

    Function SubmitSpeedrunScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitSpeedrunScore()")
    End Function

    Function TeleportEntity: Bool(ent: Object, minDist: Float, oldX: Int, oldY: Int, anyFloor: Bool)
        Debug.TraceNotImplemented("Util.TeleportEntity()")
    End Function

    Function _EditorFix: Void() End

    Method NoTrim: Void()
        AddMetric(0, 0, False, False, False)
        AreAriaOrCodaActive()
        CreateScaledTextSprite(0, 0, 0)
        CreateTextSprite(0, 0, False)
        CustomMusicInUse()
        DirToString(0)
        FindClosestTrulyUnoccupiedSpace(0, 0, False)
        FindClosestTrulyUnoccupiedSpaceNotAdjacentToEnemy(0, 0, False)
        FindClosestUnoccupiedSpace(0, 0, False)
        GetActiveLanguagesFolderPath()
        GetAngleBetweenDirections(0, 0)
        GetAnyPlayerAt(0, 0)
        GetClosestPlayer(0, 0)
        GetClosestPlayerIncludeItemEffects(0, 0, False)
        GetDirAfterRotation(0, 0, False)
        GetDirFromDiff(0, 0)
        GetDirRotationOrder()
        GetDist(0, 0, 0, 0)
        GetDistSq(0, 0, 0, 0)
        GetDistFromClosestPlayer(0, 0, False)
        GetDistSqFromClosestPlayer(0, 0, False, False)
        GetLanguagesFolderPath()
        GetLeaderboardScores(0, 0, 0, 0, False, False, False)
        GetLeaderboardSetPrefix()
        GetLeaderboardSuffix()
        GetLeaderboardSuffixForCharacterAndCoopAndDeathlessState(False, False, False, False, False, False)
        GetPlayerLocation(0)
        GetPlayersAt(Null)
        GetPlayersAt(0, 0)
        GetPointFromDir(0)
        GetSteamStat(0)
        GetTimeStringFromMilliseconds(0, False, False)
        GetVersionString()
        HasLeaderboardDownloaded()
        IncrementSteamStat(0, False, False, False, False)
        InvertDir(0)
        IsAnyPlayerAt(0, 0)
        IsBomblessCharacterActive()
        IsCharacterActive(0)
        IsEnemyAdjacent(0, 0)
        IsGlobalCollisionAt(0, 0, False, False, False, False, False)
        IsNonMobileCollisionAt(0, 0)
        IsOnScreen(0, 0, 0, 0)
        IsWeaponlessCharacterActive()
        ParseTextSeed("")
        ProcessDelayedStats()
        Pump()
        RndBool(False)
        RndIntRange(0, 0, False, 0)
        RndIntRangeFromZero(0, False)
        RotateDirInDirection(0, 0)
        RotatePoint45DegreesClockwise(Null)
        RotatePointInDirection(Null, 0)
        RotatePointInGeneralDirection(Null, 0)
        SegmentSegmentIntersection(0, 0, 0, 0, 0, 0, 0, 0)
        SendEntityTo(Null, 0, 0, False)
        SetAppFolder()
        SetSteamIntStat(0, 0, False, False, False)
        SongNameSoundtrackId(0)
        StringLeft(0, 0)
        SubmitDailyHardcoreScore(0, 0, 0, 0, 0, 0)
        SubmitHardcoreScore(0, 0, 0, 0, 0, 0)
        SubmitModeScore(0, 0, 0, 0, 0, 0, 0)
        SubmitSeededScore(0, 0, 0, 0, 0, 0)
        SubmitSeededSpeedrunScore(0, 0, 0, 0, 0, 0)
        SubmitSpeedrunScore(0, 0, 0, 0, 0, 0)
        TeleportEntity(Null, 0, 0, 0, False)
    End Method

End

Class Direction

    Const Right: Int = 0
    Const Down: Int = 1
    Const Left: Int = 2
    Const Up: Int = 3
    Const DownRight: Int = 4
    Const DownLeft: Int = 5
    Const UpLeft: Int = 6
    Const UpRight: Int = 7

End Class
