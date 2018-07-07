'Strict

Import "native/util.cpp"
Import monkey.list
Import monkey.map
Import monkey.math
Import monkey.random
Import os
Import mojo.input
Import gui.controller_game
Import level
Import camera
Import logger
Import necrodancer
Import player_class
Import point
Import rect
Import renderableobject
Import stack_ex

Class Util

    Global delayedStatIncrements: List<String> = New List<String>()
    Global delayedStatSets: StringMap<Int> = New StringMap<Int>()
    Global dirRotationOrder: StackEx<Int> = New StackEx<Int>()
    Global numSubmissionAttempts: Int
    Global pendingScoreRetrieval: Bool
    Global pendingScoreRetrievalEnd: Int
    Global pendingScoreRetrievalStart: Int
    Global pendingScoreSubmission: List<HighScoreSubmission> = New List<HighScoreSubmission>()
    Global storedSeed: Int

    Function AddMetric: Void(key: String, value: String, send: Bool = False, blocking: Bool = False, isNumber: Bool = False)
        Debug.TraceNotImplemented("Util.AddMetric(String, String, Bool, Bool, Bool)")
    End Function

    Function AreAriaOrCodaActive: Bool()
        Return Util.IsCharacterActive(Character.Aria) Or Util.IsCharacterActive(Character.Coda)
    End Function

    Function CreateScaledTextSprite: Object(str: Int, color: Int, scale: Int)
        Debug.TraceNotImplemented("Util.CreateScaledTextSprite(Int, Int, Int)")
    End Function

    Function CreateTextSprite: Object(str: Int, color: Int, addShadow: Bool)
        Debug.TraceNotImplemented("Util.CreateTextSprite(Int, Int, Bool)")
    End Function

    Function CustomMusicInUse: Bool()
        Debug.TraceNotImplemented("Util.CustomMusicInUse()")
    End Function

    Function DirToString: String(dir: Int)
        Select dir
            Case Direction.None Return "DIR_NONE"
            Case Direction.Right Return "DIR_RIGHT"
            Case Direction.Down Return "DIR_DOWN"
            Case Direction.Left Return "DIR_LEFT"
            Case Direction.Up Return "DIR_UP"
            Case Direction.DownRight Return "DIR_DOWNRIGHT"
            Case Direction.DownLeft Return "DIR_DOWNLEFT"
            Case Direction.UpLeft Return "DIR_UPLEFT"
            Case Direction.UpRight Return "DIR_UPRIGHT"
        End Select

        Return "Unrecognized direction " + dir
    End Function

    Function FindClosestTrulyUnoccupiedSpace: Point(xVal: Int, yVal: Int, ignoreWalls: Bool)
        Local points := [[xVal, yVal], [xVal - 1, yVal], [xVal + 1, yVal], [xVal, yVal - 1], [xVal, yVal + 1], [xVal - 1, yVal - 1], [xVal + 1, yVal - 1], [xVal - 1, yVal + 1], [xVal + 1, yVal + 1], [xVal - 2, yVal], [xVal + 2, yVal], [xVal, yVal - 2], [xVal, yVal + 2]]

        For Local p := EachIn points
            Local x := p[0]
            Local y := p[1]

            If Level.GetTileAt(x, y) <> Null And
               Not Util.IsGlobalCollisionAt(x, y, False, ignoreWalls, False, False) And
               Not Util.IsAnyPlayerAt(x, y) And
               Entity.GetEntityAt(x, y, True) = Null
                Return New Point(x, y)
            End If
        End For

        Return Null
    End Function

    Function FindClosestTrulyUnoccupiedSpaceNotAdjacentToEnemy: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
        Debug.TraceNotImplemented("Util.FindClosestTrulyUnoccupiedSpaceNotAdjacentToEnemy(Int, Int, Bool)")
    End Function

    Function FindClosestUnoccupiedSpace: Object(xVal: Int, yVal: Int, ignoreWalls: Bool)
        Debug.TraceNotImplemented("Util.FindClosestUnoccupiedSpace(Int, Int, Bool)")
    End Function

    Function GetActiveLanguagesFolderPath: Int()
        Debug.TraceNotImplemented("Util.GetActiveLanguagesFolderPath()")
    End Function

    Function GetAngleBetweenDirections: Int(dir1: Int, dir2: Int)
        Debug.TraceNotImplemented("Util.GetAngleBetweenDirections(Int, Int)")
    End Function

    Function GetAnyPlayerAt: Player(xVal: Int, yVal: Int)
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If Not player.Perished
                If player.x = xVal And
                   player.y = yVal
                    Return player
                End If
            End If
        End For

        Return Null
    End Function

    Function GetClosestPlayer: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Util.GetClosestPlayer(Int, Int)")
    End Function

    Function GetClosestPlayerIncludeItemEffects: Object(xVal: Int, yVal: Int, ignorePhasing: Bool)
        Debug.TraceNotImplemented("Util.GetClosestPlayerIncludeItemEffects(Int, Int, Bool)")
    End Function

    Function GetDirAfterRotation: Int(dir: Int, rotation: Int, includeDiagonals: Bool)
        Debug.TraceNotImplemented("Util.GetDirAfterRotation(Int, Int, Bool)")
    End Function

    Function GetDirFromDiff: Int(xDiff: Int, yDiff: Int)
        Debug.TraceNotImplemented("Util.GetDirFromDiff(Int, Int)")
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
        Debug.TraceNotImplemented("Util.GetDistFromClosestPlayer(Int, Int, Bool)")
    End Function

    Function GetDistSqFromClosestPlayer: Float(xVal: Int, yVal: Int, includeSouls: Bool, includeLambs: Bool)
        Debug.TraceNotImplemented("Util.GetDistSqFromClosestPlayer(Int, Int, Bool, Bool)")
    End Function

    Function GetDistSqFromObject: Float(xVal: Int, yVal: Int, obj: RenderableObject)
        Return Util.GetDistSq(obj.x, obj.y, xVal, yVal)
    End Function

    Function GetLanguagesFolderPath: Int()
        Debug.TraceNotImplemented("Util.GetLanguagesFolderPath()")
    End Function

    Function GetLeaderboardScores: Void(rangeStart: Int, rangeEnd: Int, dayOffset: Int, specificLeaderboard: String, useTodaysSeed: Bool, friendsOnly: Bool, playerOnly: Bool)
        Debug.TraceNotImplemented("Util.GetLeaderboardScores(Int, Int, Int, String, Bool, Bool, Bool)")
    End Function

    Function GetLeaderboardSetPrefix: Int()
        Debug.TraceNotImplemented("Util.GetLeaderboardSetPrefix()")
    End Function

    Function GetLeaderboardSuffix: Int()
        Debug.TraceNotImplemented("Util.GetLeaderboardSuffix()")
    End Function

    Function GetLeaderboardSuffixForCharacterAndCoopAndDeathlessState: Int(includeCadence: Bool, includeCustomMusic: Bool, includeExtraMode: Bool, includeChar: Bool, includeAllChars: Bool, includeTags: Bool)
        Debug.TraceNotImplemented("Util.GetLeaderboardSuffixForCharacterAndCoopAndDeathlessState(Bool, Bool, Bool, Bool, Bool, Bool)")
    End Function

    Function GetL1Dist: Int(x1: Int, y1: Int, x2: Int, y2: Int)
        Return math.Abs(x1 - x2) + math.Abs(y1 - y2)
    End Function

    Function GetPlayerLocation: Object(playerNum: Int)
        Debug.TraceNotImplemented("Util.GetPlayerLocation(Int)")
    End Function

    Function GetPlayersAt: List<Player>(where: Rect)
        Local playersAt := New List<Player>()

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If Not player.Perished()
                If where.Contains(player.GetLocation())
                    playersAt.AddLast(player)
                End If
            End If
        End for

        Return playersAt
    End Function

    Function GetPlayersAt: List<Player>(xVal: Int, yVal: Int)
        Return Util.GetPlayersAt(New Rect(xVal, yVal, 0, 0))
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
        Debug.TraceNotImplemented("Util.GetSteamStat(Int)")
    End Function

    Function GetTimeStringFromMilliseconds: String(msecs: Int, secondsOnly: Bool, padSeconds: Bool)
        Debug.TraceNotImplemented("Util.GetTimeStringFromMilliseconds(Int, Bool, Bool)")
    End Function

    Function GetVersionString: String()
        Const MAJOR_VERSION: Int = 2
        Const MINOR_VERSION: Int = 59

        Local versionStr := "v" + MAJOR_VERSION + "." + MINOR_VERSION

        If necrodancer.DEBUG_BUILD
            versionStr += "_DEBUG"
        End If

        Return versionStr
    End Function

    Function HasLeaderboardDownloaded: Bool()
        Debug.TraceNotImplemented("Util.HasLeaderboardDownloaded()")
    End Function

    Function IncrementSteamStat: Bool(statName: String, inGameplayOnly: Bool = True, allowCoop: Bool = False, allowSeeded: Bool = False, delayUntilLevelLoad: Bool = False)
        Debug.TraceNotImplemented("Util.IncrementSteamStat(String, Bool, Bool, Bool, Bool)")
    End Function

    Function InvertDir: Int(dir: Int)
        Debug.TraceNotImplemented("Util.InvertDir(Int)")
    End Function

    Function IsAnyPlayerAt: Bool(xVal: Int, yVal: Int)
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]

            If player.Perished() Then Continue

            If player.x = xVal And
               player.y = yVal
                Return True
            End If
        End For

        Return False
    End Function

    Function IsBomblessCharacterActive: Bool()
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player <> Null And
               player.IsBomblessCharacter()
                Return True
            End If
        End For

        Return False
    End Function

    Function IsCharacterActive: Bool(charID: Int)
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player And player.characterID = charID Then Return True
        End For

        Return False
    End Function

    Function IsEnemyAdjacent: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Util.IsEnemyAdjacent(Int, Int)")
    End Function

    Function IsGlobalCollisionAt: Bool(xVal: Int, yVal: Int, isPlayer: Bool, ignoreWalls: Bool, includeShopWallsDespiteIgnoringWalls: Bool, skipIgnoreWalls: Bool)
        Return Util.IsGlobalCollisionAt(xVal, yVal, isPlayer, ignoreWalls, False, includeShopWallsDespiteIgnoringWalls, skipIgnoreWalls)
    End Function

    Function IsGlobalCollisionAt: Bool(xVal: Int, yVal: Int, isPlayer: Bool, ignoreWalls: Bool, includeTheNothing: Bool, includeShopWallsDespiteIgnoringWalls: Bool, skipIgnoreWalls: Bool)
        If includeTheNothing And
           Level.GetTileAt(xVal, yVal) = Null
            Return True
        End If

        If includeShopWallsDespiteIgnoringWalls
            Select Level.GetTileTypeAt(xVal, yVal)
                Case TileType.ShopWall,
                     TileType.UnbreakableWall,
                     TileType.BossWall
                    Return True
            End Select
        End If

        For Local renderableObj := EachIn RenderableObject.renderableObjectList
            If renderableObj.collides
                If renderableObj.isPlayer And Player(renderableObj).Perished() Then Continue
                If isPlayer And renderableObj.playerOverrideCollide Then Continue

                If ignoreWalls
                    Local tile := Tile(renderableObj)
                    If tile <> Null And tile.GetType() = TileType.IndestructibleBorder Then Continue
                End If

                If skipIgnoreWalls
                    Local entity := Entity(renderableObj)
                    If entity <> Null And entity.ignoreWalls Then Continue
                End If

                If (renderableObj.x <= xVal And xVal < renderableObj.x + renderableObj.width) And
                   (renderableObj.y <= yVal And yVal < renderableObj.y + renderableObj.height)
                    Return True
                End If
            End If
        End For

        Return False
    End Function

    Function IsNonMobileCollisionAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Util.IsNonMobileCollisionAt(Int, Int)")
    End Function

    Function IsOnScreen: Bool(xVal: Int, yVal: Int, cameraSeekX: Float, cameraSeekY: Float)
        Local yDiff := yVal - (cameraSeekY / 24.0)
        Local fixedHeight := Camera.GetFixedHeight()

        If (fixedHeight / -48) - 1 > yDiff
            Return False
        End If

        If (fixedHeight / 48) + 1 < yDiff
            Return False
        End If

        Local xDiff := xVal - (cameraSeekX / 24.0)
        Local fixedWidth := Camera.GetFixedWidth()

        If (fixedWidth / -48) - 1 > xDiff
            Return False
        End If

        If (fixedWidth / 48) + 1 < xDiff
            Return False
        End If

        Return True
    End Function

    Function IsWeaponlessCharacterActive: Bool()
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player.IsWeaponlessCharacter() Then Return True
        End For

        Return False
    End Function

    Function LineSegmentTileIntersect: Bool(p0_x: Float, p0_y: Float, p1_x: Float, p1_y: Float, p2_x: Float, p2_y: Float)
        Debug.TraceNotImplemented("Util.LineSegmentTileIntersect(Float, Float, Float, Float, Float, Float)")
    End Function

    Function ParseTextSeed: Int(randSeedString: String)
        Local seed := 0

        For Local i := 1 Until randSeedString.Length
            seed += i * randSeedString[i - 1]
        End For

        For Local j := 0 Until randSeedString.Length
            If randSeedString[j] > input.KEY_9 Then Return seed
        End For

        seed = 0
        For Local k := 0 Until randSeedString.Length
            seed = (10 * seed) + (randSeedString[k] - input.KEY_0)
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

    Function RndIntRange: Int(low: Int, high: Int, useSeed: Bool, replayConsistencyChannel: Int = -1)
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
        Debug.TraceNotImplemented("Util.RotateDirInDirection(Int, Int)")
    End Function

    Function RotatePoint45DegreesClockwise: Object(p: Object)
        Debug.TraceNotImplemented("Util.RotatePoint45DegreesClockwise(Object)")
    End Function

    Function RotatePointInDirection: Object(original: Object, dir: Int)
        Debug.TraceNotImplemented("Util.RotatePointInDirection(Object, Int)")
    End Function

    Function RotatePointInGeneralDirection: Object(p: Object, dir: Int)
        Debug.TraceNotImplemented("Util.RotatePointInGeneralDirection(Object, Int)")
    End Function

    Function SeedRnd(seed: Int)
        Util.storedSeed = -1
        random.Seed = seed
    End Function

    Function SegmentSegmentIntersection: Object(p0_x: Float, p0_y: Float, p1_x: Float, p1_y: Float, p2_x: Float, p2_y: Float, p3_x: Float, p3_y: Float)
        Debug.TraceNotImplemented("Util.SegmentSegmentIntersection(Float, Float, Float, Float, Float, Float, Float, Float)")
    End Function

    Function SendEntityTo: Void(ent: Object, xVal: Int, yVal: Int, triggerBossStart: Bool)
        Debug.TraceNotImplemented("Util.SendEntityTo(Object, Int, Int, Bool)")
    End Function

    Function SetAppFolder: Void()
        Local appPath := os.AppPath()

        appPath = Util.StringLeft(appPath, appPath.FindLast(".app"))
        appPath = Util.StringLeft(appPath, appPath.FindLast("/"))
        appPath += "/"

        util.globalAppFolder = appPath
    End Function

    Function SetSteamIntStat: Bool(statName: String, val: Int, inGameplayOnly: Bool, allowCoop: Bool, delayUntilLevelLoad: Bool)
        Debug.TraceNotImplemented("Util.SetSteamIntStat(String, Int, Bool, Bool, Bool)")
    End Function

    Function SongNameSoundtrackId: Int(songName: Int)
        Debug.TraceNotImplemented("Util.SongNameSoundtrackId(Int)")
    End Function

    Function StringLeft: String(str: String, n: Int)
        n = math.Min(n, str.Length)

        Return str[..n]
    End Function

    Function SubmitDailyHardcoreScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitDailyHardcoreScore(Int, Int, Int, Int, Int, Int)")
    End Function

    Function SubmitHardcoreScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitHardcoreScore(Int, Int, Int, Int, Int, Int)")
    End Function

    Function SubmitModeScore: Void(mode: Int, score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitModeScore(Int, Int, Int, Int, Int, Int, Int)")
    End Function

    Function SubmitSeededScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitSeededScore(Int, Int, Int, Int, Int, Int)")
    End Function

    Function SubmitSeededSpeedrunScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitSeededSpeedrunScore(Int, Int, Int, Int, Int, Int)")
    End Function

    Function SubmitSpeedrunScore: Void(score: Int, z: Int, l: Int, suffix: Int, killedBy: Int, replayData: Int)
        Debug.TraceNotImplemented("Util.SubmitSpeedrunScore(Int, Int, Int, Int, Int, Int)")
    End Function

    Function TeleportEntity: Bool(ent: Object, minDist: Float, oldX: Int, oldY: Int, anyFloor: Bool)
        Debug.TraceNotImplemented("Util.TeleportEntity(Object, Float, Int, Int, Bool)")
    End Function

    Function _EditorFix: Void() End

End Class

Class HighScoreSubmission

    Function _EditorFix: Void() End

    Method New(s: Int, z: Int, l: Int, lb: Int, sa: Int, dt: Int)
        Debug.TraceNotImplemented("HighScoreSubmission.New(Int, Int, Int, Int, Int, Int)")
    End Method

    Field pendingSubmitLeaderboard: String
    Field submissionAttemptNumber: Int
    Field submitted: Bool
    Field pendingSubmitScore: Int
    Field pendingSubmitZone: Int
    Field pendingSubmitLevel: Int
    Field data: String

End Class

Class Direction

    Const None: Int = -1
    Const Right: Int = 0
    Const Down: Int = 1
    Const Left: Int = 2
    Const Up: Int = 3
    Const DownRight: Int = 4
    Const DownLeft: Int = 5
    Const UpLeft: Int = 6
    Const UpRight: Int = 7

End Class

Function SetVSync: Void(v: Int)
    Debug.TraceNotImplemented("SetVSync(Int)")
End Function

Extern

Global globalAppFolder: String

Function GetAppFolder: String()
