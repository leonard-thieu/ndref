Strict

Import monkey.math
Import monkey.random
Import controller_game
Import level
Import player_class
Import point

Class Util

    Global storedSeed: Int

    Function AddMetric: Void(key: Int, value: Int, send: Bool, blocking: Bool, isNumber: Bool)
        Throw New Throwable()
    End Function

    Function AreAriaOrCodaActive: Bool()
        Return Util.IsCharacterActive(Character.Aria) Or Util.IsCharacterActive(Character.Coda)
    End Function

    Function CreateScaledTextSprite: Object(str: Int, color: Int, scale: Int)
        Throw New Throwable()
    End Function

    Function CreateTextSprite: Object(str: Int, color: Int, addShadow: Bool)
        Throw New Throwable()
    End Function

    Function CustomMusicInUse: Bool()
        Throw New Throwable()
    End Function

    Function DirToString: Int(dir: Int)
        Throw New Throwable()
    End Function

    Function FindClosestTrulyUnoccupiedSpace: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
        Throw New Throwable()
    End Function

    Function FindClosestTrulyUnoccupiedSpaceNotAdjacentToEnemy: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
        Throw New Throwable()
    End Function

    Function FindClosestUnoccupiedSpace: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
        Throw New Throwable()
    End Function

    Function GetActiveLanguagesFolderPath: Int()
        Throw New Throwable()
    End Function

    Function GetAngleBetweenDirections: Int(dir1: Int, dir2: Int)
        Throw New Throwable()
    End Function

    Function GetAnyPlayerAt: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function GetClosestPlayer: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function GetClosestPlayerIncludeItemEffects: Object(xVal: Int, yVal: Int, ignorePhasing: Bool)
        Throw New Throwable()
    End Function

    Function GetDirAfterRotation: Int(dir: Int, rotation: Int, includeDiagonals: Bool)
        Throw New Throwable()
    End Function

    Function GetDirFromDiff: Int(xDiff: Int, yDiff: Int)
        Throw New Throwable()
    End Function

    Function GetDirRotationOrder: Object()
        Throw New Throwable()
    End Function

    Function GetDist: Float(x: Int, y: Int, x2: Int, y2: Int)
        Return math.Sqrt(Util.GetDistSq(x, y, x2, y2))
    End Function

    Function GetDistSq: Float(x: Int, y: Int, x2: Int, y2: Int)
        Return ((x2 - x) * (x2 - x)) + 
               ((y2 - y) * (y2 - y))
    End Function

    Function GetDistFromClosestPlayer: Float(xVal: Int, yVal: Int, includeSouls: Bool)
        Throw New Throwable()
    End Function

    Function GetDistSqFromClosestPlayer: Float(xVal: Int, yVal: Int, includeSouls: Bool, includeLambs: Bool)
        Throw New Throwable()
    End Function

    Function GetLanguagesFolderPath: Int()
        Throw New Throwable()
    End Function

    Function GetLeaderboardScores: Void(rangeStart: Int, rangeEnd: Int, dayOffset: Int, specificLeaderboard: Int, useTodaysSeed: Bool, friendsOnly: Bool, playerOnly: Bool)
        Throw New Throwable()
    End Function

    Function GetLeaderboardSetPrefix: Int()
        Throw New Throwable()
    End Function

    Function GetLeaderboardSuffix: Int()
        Throw New Throwable()
    End Function

    Function GetLeaderboardSuffixForCharacterAndCoopAndDeathlessState: Int(includeCadence: Bool, includeCustomMusic: Bool, includeExtraMode: Bool, includeChar: Bool, includeAllChars: Bool, includeTags: Bool)
        Throw New Throwable()
    End Function

    Function GetPlayerLocation: Object(playerNum: Int)
        Throw New Throwable()
    End Function

    Function GetPlayersAt: Object(where: Object)
        Throw New Throwable()
    End Function

    Function GetPlayersAt: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
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
        Throw New Throwable()
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
        Throw New Throwable()
    End Function

    Function GetVersionString: Int()
        Throw New Throwable()
    End Function

    Function HasLeaderboardDownloaded: Bool()
        Throw New Throwable()
    End Function

    Function IncrementSteamStat: Bool(statName: Int, inGameplayOnly: Bool, allowCoop: Bool, allowSeeded: Bool, delayUntilLevelLoad: Bool)
        Throw New Throwable()
    End Function

    Function InvertDir: Int(dir: Int)
        Throw New Throwable()
    End Function

    Function IsAnyPlayerAt: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsBomblessCharacterActive: Bool()
        Throw New Throwable()
    End Function

    Function IsCharacterActive: Bool(charID: Int)
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player And player.characterID = charID Then Return True
        End For

        Return False
    End Function

    Function IsEnemyAdjacent: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsGlobalCollisionAt: Bool(xVal: Int, yVal: Int, isPlayer: Bool, ignoreWalls: Bool, includeTheNothing: Bool, includeShopWallsDespiteIgnoringWalls: Bool, skipIgnoreWalls: Bool)
        Throw New Throwable()
    End Function

    Function IsNonMobileCollisionAt: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsOnScreen: Bool(xVal: Int, yVal: Int, cameraSeekX: Float, cameraSeekY: Float)
        Throw New Throwable()
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

        For Local i := 0 Until randSeedString.Length
            seed += i * randSeedString[i]
        End For

        For Local i := 0 Until randSeedString.Length
            If randSeedString[i] > NUMBER_9 Then Return seed
        End For

        seed = 0
        For Local i := 0 Until randSeedString.Length
            seed = randSeedString[i] + 2 * (5 * seed) - NUMBER_0
        End For

        Return seed
    End Function

    Function ProcessDelayedStats: Void()
        Throw New Throwable()
    End Function

    Function Pump: Void()
        Throw New Throwable()
    End Function

    Function RndBool: Bool(useSeed: Bool)
        Return Util.RndIntRange(0, 1, useSeed, -1) = 0.0
    End Function

    Function RndIntRange: Int(low: Int, high: Int, useSeed: Bool, replayConsistencyChannel: Int)
        Local rndIntVal: Int

        If useSeed
            rndIntVal = Util.storedSeed
            If Util.storedSeed = -1
                rndIntVal = random.Seed
            Else
                Util.storedSeed = -1
            End If
        Else
            rndIntVal = random.Seed
            Util.storedSeed = random.Seed
        End If

        Local rndVal := random.Rnd(low, high + 1)
        ' TODO: Verify what causes `__asm { frndint }` to be emitted.

        If replayConsistencyChannel < 0 Or 
           Not Level.isReplaying Or
           Level.creatingMap
            rndIntVal = math.Min(low, rndIntVal)
        Else
            rndVal = Level.replay.GetRand(replayConsistencyChannel)
            
            If rndVal < low Or rndVal > high
                Return rndIntVal
            End If
        End If

        rndIntVal = high
        If rndVal <= high Then rndIntVal = rndVal

        If replayConsistencyChannel >= 0 And
           Not Level.isReplaying And
           Level.replay
            Level.replay.RecordRand(replayConsistencyChannel, rndIntVal)
        End If

        Return rndIntVal
    End Function

    Function RndIntRangeFromZero: Int(high: Int, useSeed: Bool)
        Return RndIntRange(0, high, useSeed, -1)
    End Function

    Function RotateDirInDirection: Int(original: Int, dir: Int)
        Throw New Throwable()
    End Function

    Function RotatePoint45DegreesClockwise: Object(p: Object)
        Throw New Throwable()
    End Function

    Function RotatePointInDirection: Object(original: Object, dir: Int)
        Throw New Throwable()
    End Function

    Function RotatePointInGeneralDirection: Object(p: Object, dir: Int)
        Throw New Throwable()
    End Function

    Function SegmentSegmentIntersection: Object(p0_x: Float, p0_y: Float, p1_x: Float, p1_y: Float, p2_x: Float, p2_y: Float, p3_x: Float, p3_y: Float)
        Throw New Throwable()
    End Function

    Function SendEntityTo: Void(ent: Object, xVal: Int, yVal: Int, triggerBossStart: Bool)
        Throw New Throwable()
    End Function

    Function SetAppFolder: Void()
        Throw New Throwable()
    End Function

    Function SetSteamIntStat: Bool(statName: Int, val: Int, inGameplayOnly: Bool, allowCoop: Bool, delayUntilLevelLoad: Bool)
        Throw New Throwable()
    End Function

    Function SongNameSoundtrackId: Int(songName: Int)
        Throw New Throwable()
    End Function

    Function StringLeft: Int(str: Int, n: Int)
        Throw New Throwable()
    End Function

    Function SubmitDailyHardcoreScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Throw New Throwable()
    End Function

    Function SubmitHardcoreScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Throw New Throwable()
    End Function

    Function SubmitModeScore: Void(mode: Int, score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Throw New Throwable()
    End Function

    Function SubmitSeededScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Throw New Throwable()
    End Function

    Function SubmitSeededSpeedrunScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Throw New Throwable()
    End Function

    Function SubmitSpeedrunScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Throw New Throwable()
    End Function

    Function TeleportEntity: Bool(ent: Object, minDist: Float, oldX: Int, oldY: Int, anyFloor: Bool)
        Throw New Throwable()
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
