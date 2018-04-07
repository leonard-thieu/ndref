Import monkey.random
Import controller_game
Import level
Import player
Import point

Class Util

    Global storedSeed: Int

    Function AddMetric: Void(key: Int, value: Int, send: Bool, blocking: Bool, isNumber: Bool)
    End Function

    Function AreAriaOrCodaActive: Bool()
        Return Util.IsCharacterActive(Character.Aria) Or Util.IsCharacterActive(Character.Coda)
    End Function

    Function CreateScaledTextSprite: Object(str: Int, color: Int, scale: Int)
    End Function

    Function CreateTextSprite: Object(str: Int, color: Int, addShadow: Bool)
    End Function

    Function CustomMusicInUse: Bool()
    End Function

    Function DirToString: Int(dir: Int)
    End Function

    Function FindClosestTrulyUnoccupiedSpace: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
    End Function

    Function FindClosestTrulyUnoccupiedSpaceNotAdjacentToEnemy: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
    End Function

    Function FindClosestUnoccupiedSpace: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
    End Function

    Function GetActiveLanguagesFolderPath: Int()
    End Function

    Function GetAngleBetweenDirections: Int(dir1: Int, dir2: Int)
    End Function

    Function GetAnyPlayerAt: Object(xVal: Int, yVal: Int)
    End Function

    Function GetClosestPlayer: Object(xVal: Int, yVal: Int)
    End Function

    Function GetClosestPlayerIncludeItemEffects: Object(xVal: Int, yVal: Int, ignorePhasing: Bool)
    End Function

    Function GetDirAfterRotation: Int(dir: Int, rotation: Int, includeDiagonals: Bool)
    End Function

    Function GetDirFromDiff: Int(xDiff: Int, yDiff: Int)
    End Function

    Function GetDirRotationOrder: Object()
    End Function

    Function GetDistFromClosestPlayer: Float(xVal: Int, yVal: Int, includeSouls: Bool)
    End Function

    Function GetDistSqFromClosestPlayer: Float(xVal: Int, yVal: Int, includeSouls: Bool, includeLambs: Bool)
    End Function

    Function GetLanguagesFolderPath: Int()
    End Function

    Function GetLeaderboardScores: Void(rangeStart: Int, rangeEnd: Int, dayOffset: Int, specificLeaderboard: Int, useTodaysSeed: Bool, friendsOnly: Bool, playerOnly: Bool)
    End Function

    Function GetLeaderboardSetPrefix: Int()
    End Function

    Function GetLeaderboardSuffix: Int()
    End Function

    Function GetLeaderboardSuffixForCharacterAndCoopAndDeathlessState: Int(includeCadence: Bool, includeCustomMusic: Bool, includeExtraMode: Bool, includeChar: Bool, includeAllChars: Bool, includeTags: Bool)
    End Function

    Function GetPlayerLocation: Object(playerNum: Int)
    End Function

    Function GetPlayersAt: Object(where: Object)
    End Function

    Function GetPlayersAt: Object(xVal: Int, yVal: Int)
    End Function

    Function GetPointFromDir: Point(dir: Int)
        Local x: Int
        Local y: Int

        Select dir
            Case 0
                x = 1
                y = 0
            Case 1
                x = 0
                y = 1
            Case 2
                x = -1
                y = 0
            Case 3
                x = 1
                y = -1
            Case 4
                x = 1
                y = 1
            Case 5
                x = -1
                y = 1
            Case 6
                x = -1
                y = -1
            Case 7
                x = 1
                y = -1
            Default
                x = 0
                y = 0
        End Select

        Return New Point(x, y)
    End Function

    Function GetSteamStat: Int(statName: Int)
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
    End Function

    Function GetVersionString: Int()
    End Function

    Function HasLeaderboardDownloaded: Bool()
    End Function

    Function IncrementSteamStat: Bool(statName: Int, inGameplayOnly: Bool, allowCoop: Bool, allowSeeded: Bool, delayUntilLevelLoad: Bool)
    End Function

    Function InvertDir: Int(dir: Int)
    End Function

    Function IsAnyPlayerAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsBomblessCharacterActive: Bool()
    End Function

    Function IsCharacterActive: Bool(charID: Int)
        For Local i := 0 To controller_game.numPlayers
            Local player := controller_game.players[i]
            If player And player.characterID = charID Then Return True
        End For

        Return False
    End Function

    Function IsEnemyAdjacent: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsGlobalCollisionAt: Bool(xVal: Int, yVal: Int, isPlayer: Bool, ignoreWalls: Bool, includeTheNothing: Bool, includeShopWallsDespiteIgnoringWalls: Bool, skipIgnoreWalls: Bool)
    End Function

    Function IsNonMobileCollisionAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsOnScreen: Bool(xVal: Int, yVal: Int, cameraSeekX: Float, cameraSeekY: Float)
    End Function

    Function IsWeaponlessCharacterActive: Bool()
        For Local i := 0 To controller_game.numPlayers
            Local player := controller_game.players[i]
            If player.IsWeaponlessCharacter() Then Return True
        End For

        Return False
    End Function

    Function ParseTextSeed: Int(randSeedString: String)
    End Function

    Function ProcessDelayedStats: Void()
    End Function

    Function Pump: Void()
    End Function

    Function RndBool: Bool(useSeed: Bool)
    End Function

    Function RndIntRange: Int(low: Int, high: Int, useSeed: Bool, replayConsistencyChannel: Int)
        Local seed: Int

        If useSeed
            seed = Util.storedSeed
            If Util.storedSeed = -1
                seed = random.Seed
            Else
                Util.storedSeed = -1
            End If
        Else
            seed = random.Seed
            Util.storedSeed = random.Seed
        End If

        Local rndVal := random.Rnd(low, high + 1)

        Return rndVal
    End Function

    Function RndIntRangeFromZero: Int(high: Int, useSeed: Bool)
    End Function

    Function RotateDirInDirection: Int(original: Int, dir: Int)
    End Function

    Function RotatePoint45DegreesClockwise: Object(p: Object)
    End Function

    Function RotatePointInDirection: Object(original: Object, dir: Int)
    End Function

    Function RotatePointInGeneralDirection: Object(p: Object, dir: Int)
    End Function

    Function SegmentSegmentIntersection: Object(p0_x: Float, p0_y: Float, p1_x: Float, p1_y: Float, p2_x: Float, p2_y: Float, p3_x: Float, p3_y: Float)
    End Function

    Function SendEntityTo: Void(ent: Object, xVal: Int, yVal: Int, triggerBossStart: Bool)
    End Function

    Function SetAppFolder: Void()
    End Function

    Function SetSteamIntStat: Bool(statName: Int, val: Int, inGameplayOnly: Bool, allowCoop: Bool, delayUntilLevelLoad: Bool)
    End Function

    Function SongNameSoundtrackId: Int(songName: Int)
    End Function

    Function StringLeft: Int(str: Int, n: Int)
    End Function

    Function SubmitDailyHardcoreScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
    End Function

    Function SubmitHardcoreScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
    End Function

    Function SubmitModeScore: Void(mode: Int, score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
    End Function

    Function SubmitSeededScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
    End Function

    Function SubmitSeededSpeedrunScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
    End Function

    Function SubmitSpeedrunScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
    End Function

    Function TeleportEntity: Bool(ent: Object, minDist: Float, oldX: Int, oldY: Int, anyFloor: Bool)
    End Function

    Function _EditorFix() End

    Method NoTrim()
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
        ParseTextSeed(0)
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
