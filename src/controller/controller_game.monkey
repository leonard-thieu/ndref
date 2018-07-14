'Strict

Import monkey.list
Import mojo.app
Import mojo.input
Import controller
Import controller.controller_game
Import controller.controller_pause
Import controller.controller_postgame
Import enemy
Import gui.flyaway
Import gui.gui_gameplay
Import level
Import trap
Import trap.trapdoor
Import audio2
Import bomb
Import bouncer
Import crystal_shards
Import doppelganger
Import entity
Import gamedata
Import input2
Import item
Import logger
Import necrodancer
Import necrodancergame
Import particles
Import player_class
Import renderableobject
Import spells
Import sprite
Import swarm
Import textsprite
Import tile
Import util

Global DEBUG_ALL_TILES_VISIBLE: Bool
Global DEBUG_GOD_MODE: Bool
Global DEBUG_HOTKEY_MODE: String
Global DEBUG_HOTKEY_TEXT: String
Global DEBUG_MOUSE_COORDS: Bool
Global DEBUG_RAND_SEED: Int
Global DEBUG_SHOW_BEAT_INDICATORS: Bool = True
Global DEBUG_SHOW_GUI: Bool = True

Global beatData: Int[]
Global bpmCalculatorBeats: Int
Global bpmCalculatorStart: Int
Global bpmStorage: List<Int> = New List<Int>()
Global controllerGamePointer: ControllerGame
Global currentDepth: Int = 1
Global currentLevel: Int = 1
Global currentZone: Int = 1
Global dailyChallengeSuccessScore: Int = -1
Global debugEnablePrototypes: Bool = True
Global gamePaused: Bool
Global hardcoreModeSuccessScore: Int = -1
Global hasWon: Bool
Global incrementFixedBeatNum: Bool
Global lastEnemyMoveBeat: Int
Global lastPlayerMoveBeat: Int[4]
Global numPlayers: Int = 1
Global player1: Int
Global players: Player[4]
Global runPlaytimeLastAdded: Int
Global runPlaytimeMilliseconds: Int
Global showScoreMessage: Bool
Global speedrunSuccessScore: Int = -1
Global subRunPlaytimeMilliseconds: Int
Global totalPlaytimeLastAdded: Int
Global totalPlaytimeMilliseconds: Int

Class ControllerGame Extends Controller

    Function _EditorFix: Void() End

    Method New()
        Super.New()

        controller_game.totalPlaytimeLastAdded = app.Millisecs()
        controller_game.controllerGamePointer = Self
        Sprite.scaleToFitScreen = False

        For Local i := 0 Until controller_game.lastPlayerMoveBeat.Length
            controller_game.lastPlayerMoveBeat[i] = -1
        End For

        Self.ResetPostDeathReplay()

        GUI_gameplay.errorKey = New Sprite("gui/error_locked.png", 1)
        GUI_gameplay.errorKey.SetZ(10000.0)

        Input.Init()

        controller_game.gamePaused = False

        GameData.SetCharUnlocked(Character.Cadence)
        GameData.SetCharUnlocked(Character.Bard)
        GameData.SetCharUnlocked(Character.Nocturna)
        GameData.SetCharUnlocked(Character.Reaper)
        GameData.SetCharUnlocked(Character.Tempo)
        GameData.SetCharUnlocked(Character.Mary)

        Spells.Init()

        Level.NewLevel(LevelType.Lobby, 1)
        Level.DoRestart()

        Self.restartImage.zVal = 19990
        Self.scoresImage.zVal = 19990
        Self.scoresImage2.zVal = 19990
        Self.songEndedImage.zVal = 19990
        Self.songEndedImage2.zVal = 19990

        Self.restartBounce = New Bouncer(-0.1, 0.0, 1.5, 100)
        Self.replayInstructions = New TextSprite(0, 1.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
        Self.replayInstructions.zVal = 20001
    End Method

    Field specialScoreSubmit: Bool
    Field postDeathReplay: Bool[400]
    Field postDeathFrame: Int
    Field postDeathCounter: Int = 100
    Field coinVal: Int = -1
    Field timeVal: Int = -1
    Field restartImage: TextSprite = New TextSprite(2, 2.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field scoresImage: TextSprite = New TextSprite(2, 2.0, $FFFF0000, 10000, True, $FF000000, 1, 1)
    Field scoresImage2: TextSprite = New TextSprite(2, 2.0, $FFFF0000, 10000, True, $FF000000, 1, 1)
    Field songEndedImage: TextSprite = New TextSprite(2, 3.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field songEndedImage2: TextSprite = New TextSprite(2, 3.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field restartBounce: Bouncer
    Field replayInstructions: TextSprite
    Field viewingLeaderboard: Bool
    Field ignoreInput: Bool
    Field movementBufferFrame: Int
    Field movementBuffer: Int = -1
    Field pendingScores: Int
    Field originalNumScores: Int
    Field score: Int = -1
    Field originalFailures: Int
    Field scoreSubmitTime: Int = -1
    Field speedrunImage: TextSprite = New TextSprite(0, 2.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field lastSpeedrunString: String
    Field heartTransplantTimerImage: TextSprite = New TextSprite(2, 2.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field fpsImage: TextSprite = New TextSprite(0, 1.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field levelImage: TextSprite = New TextSprite(1, 1.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerGame.Destructor()")
    End Method

    Method PrepareToSubmitScores: Void(numScores: Int)
        Debug.TraceNotImplemented("ControllerGame.PrepareToSubmitScores(Int)")
    End Method

    Method RegainFocus: Void()
        Debug.TraceNotImplemented("ControllerGame.RegainFocus()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerGame.Render()")
    End Method

    Method RenderPostGameReplay: Void()
        Debug.TraceNotImplemented("ControllerGame.RenderPostGameReplay()")
    End Method

    Method ResetPostDeathReplay: Void()
        Debug.TraceNotImplemented("ControllerGame.ResetPostDeathReplay()")
    End Method

    Method ScoreSubmitFailed: Bool()
        Debug.TraceNotImplemented("ControllerGame.ScoreSubmitFailed()")
    End Method

    Method Suspend: Void()
        Debug.TraceNotImplemented("ControllerGame.Suspend()")
    End Method

    Method Update: Void()
        Audio.UpdateNumLoops()

        If Level.levelJustStarted
            Level.levelJustStarted = False
            Audio.Update(True)
            RenderableObject.UpdateAll()
        End If

        If Not Self.ignoreInput And
           Not Input.GameUpdate()
            Return
        End If

        Local upRightKeyBinding := GameData.GetKeyBinding(0, ControlIndex.UpRight)
        If (upRightKeyBinding < 0 And
            ((input.KeyHit(input.KEY_JOY0_LB) And Not Input.IsRedefined(input.KEY_JOY0_LB)) Or
             (input.KeyHit(input.KEY_JOY0_RB) And Not Input.IsRedefined(input.KEY_JOY0_RB)))) Or
           (upRightKeyBinding >= 0 And
            Input.KeyWasHit(upRightKeyBinding)) Or
           input.KeyHit(input.KEY_ESCAPE)
            controller_game.gamePaused = True
            Audio.PauseSong(True)
            New ControllerPause(Self)
        End If

        Local allPlayersPerished := Player.AllPlayersPerished()

        Local upLeftKeyBinding := GameData.GetKeyBinding(0, ControlIndex.UpLeft)
        If upLeftKeyBinding >= 0 And
           Input.KeyWasHit(upLeftKeyBinding)
            If (allPlayersPerished Or
                controller_game.hasWon) And
               Not Level.isReplaying
                If Level.replay <> Null
                    If Level.replay.replayStr = ""
                        Level.replay.Save()
                    End If
                End If
            End If

            controller_game.showScoreMessage = False
            controller_game.hasWon = False

            If Self.specialScoreSubmit
                Self.specialScoreSubmit = False
                Level.TakeActionAfterAllCharsScoreSubmit()
            Else
                Level.DoQuickRestart(False, True, False)
            End If
        End If

        If allPlayersPerished Or
           controller_game.showScoreMessage
            Local directionsHit := Input.GetDirectionsHit(0, False)
            If Not directionsHit.IsEmpty()
                Local firstDirection := directionsHit.First()
                Local lastDirection := directionsHit.Last()

                If directionsHit.Count() = 1
                    lastDirection = Direction.None
                End If

                If necrodancergame.globalFrameCounter - Self.movementBufferFrame > 10
                    Self.movementBuffer = Direction.None
                End If

                If (lastDirection <> Direction.Right Or firstDirection <> Direction.Left) And
                   (lastDirection <> Direction.Left Or firstDirection <> Direction.Right) And
                   (lastDirection <> Direction.Right Or Self.movementBuffer <> Direction.Left)
                    If (firstDirection = Direction.Left And Self.movementBuffer <> Direction.Right) Or
                       (firstDirection <> Direction.Right And firstDirection <> Direction.Left And
                        (lastDirection <> Direction.Left Or Self.movementBuffer <> Direction.Right)) And
                       (firstDirection = Direction.Right And Self.movementBuffer <> Direction.Left And
                        (lastDirection <> Direction.Left Or Self.movementBuffer <> Direction.Right))
                        ' Do nothing
                    Else
                        If Self.pendingScores <= 0 Or
                           controller_game.showScoreMessage
                            controller_game.showScoreMessage = False
                            Self.pendingScores = 0

                            If Not Level.isTrainingMode And
                               controller_game.hasWon
                                controller_game.hasWon = False

                                If Not Self.specialScoreSubmit
                                    New ControllerPostGame(
                                        Self,
                                        Level.isHardcoreMode,
                                        Level.isDailyChallenge,
                                        Level.isAllCharactersMode,
                                        Level.isDeathlessMode,
                                        False,
                                        Self.coinVal,
                                        Self.timeVal)
                                Else
                                    Self.specialScoreSubmit = False
                                    Level.TakeActionAfterAllCharsScoreSubmit()
                                End If
                            Else
                                New ControllerPostGame(
                                    Self,
                                    Level.isHardcoreMode,
                                    Level.isDailyChallenge,
                                    Level.isAllCharactersMode,
                                    Level.isDeathlessMode,
                                    True,
                                    -1,
                                    -1)
                            End If
                        Else
                            controller_game.showScoreMessage = True
                        End If
                    End If
                End If

                Self.movementBuffer = directionsHit.First()
                Self.movementBufferFrame = necrodancergame.globalFrameCounter
            End If
        End If

        If controller_game.hasWon And
           Not Self.pendingScores And
           (controller_game.showScoreMessage Or
            GameData.modGamedataChanges)
            controller_game.hasWon = False
            controller_game.showScoreMessage = False

            If Not Self.specialScoreSubmit
                New ControllerPostGame(
                    Self,
                    Level.isHardcoreMode,
                    Level.isDailyChallenge,
                    Level.isAllCharactersMode,
                    Level.isDeathlessMode,
                    False,
                    Self.coinVal,
                    Self.timeVal)
            Else
                Self.specialScoreSubmit = False
                Level.TakeActionAfterAllCharsScoreSubmit()
            End If
        End If

        If ((Audio.PastLastBeat() Or
             Audio.HasSongEnded()) And
            Audio.songLoops = 0) Or
           (Level.isReplaying And
            Level.replay.GetNumBeats() < Audio.GetClosestBeatNum(True) And
            Not Audio.DoingNecrodancerTransition())
            For Local i := 0 Until controller_game.numPlayers
                Local player := controller_game.players[i]
                If Self.HasFocus() And
                   Not controller_game.hasWon And
                   Not Audio.startSong And
                   Not player.isHelper And
                   Not player.falling And
                   player.IsStandingStill() And
                   Level.IsLockedExit(player.x, player.y)
                    If Level.bossNumber = BossBattleType.NecroDancer2 And
                       (controller_game.currentLevel = LevelType.TrainingNecroDancer2Battle Or
                        controller_game.currentLevel = LevelType.FinalBossBattle)
                        Level.ActivateTrigger(53, Null, Null)

                        Continue
                    End If

                    If Util.IsCharacterActive(Character.Dove)
                        player.Hit("COWARDICE", 99999)

                        Continue
                    End If

                    Local trap := Trap.GetTrapAt(player.x, player.y)
                    If trap <> Null
                        trap.Die()
                    End If

                    player.lordCrownActiveBeat = -1
                    player.shieldActiveBeat = -1

                    New TrapDoor(player.x, player.y)
                End If
            End For
        End If

        Audio.Update(True)
        RenderableObject.UpdateAll()
        Doppelganger.UpdateAll()
        Flyaway.UpdateAll()
        ParticleSystem.UpdateAll()
        Level.Update()
        Input.UpdateKeysHit()

        Enemy.movesBehind = Audio.GetClosestBeatNum(True) - controller_game.lastEnemyMoveBeat
        If Enemy.EnemiesMovingThisFrame() Or
           necrodancer.MOVE_ENTITIES_EVERY_UPDATE
            Swarm.Move()
            Bomb.MoveAll()
            Enemy.MoveAll()

            For Local i := 0 Until controller_game.numPlayers
                Local player := controller_game.players[i]
                player.HandleIceAndCoals()
            End For

            Trap.MoveAll()
            Tile.MoveAll()
            Item.MoveAll()
            CrystalShards.MoveAll()
            Level.minimap.Update()

            For Local i := 0 Until controller_game.numPlayers
                Local player := controller_game.players[i]
                player.AfterEnemyMovement()
            End For

            Entity.UpdateVisibility()

            controller_game.lastEnemyMoveBeat += 1
        End If

        If controller_game.incrementFixedBeatNum
            Audio.IncrementFixedBeat()
            controller_game.incrementFixedBeatNum = False
        End If

        If Not Self.HasFocus() Or
           Level.isLevelEnding
            controller_game.totalPlaytimeLastAdded = app.Millisecs()
        Else
            If controller_game.totalPlaytimeLastAdded = 0
                controller_game.totalPlaytimeLastAdded = app.Millisecs()
            End If

            If app.Millisecs() - controller_game.totalPlaytimeLastAdded > 1000
                controller_game.totalPlaytimeMilliseconds += app.Millisecs() - controller_game.totalPlaytimeLastAdded
                controller_game.totalPlaytimeLastAdded = app.Millisecs()
            End If
        End If

        If allPlayersPerished
            If controller_game.runPlaytimeLastAdded = 0
                Return
            End If

            controller_game.runPlaytimeMilliseconds += app.Millisecs() - controller_game.runPlaytimeLastAdded
            controller_game.subRunPlaytimeMilliseconds += app.Millisecs() - controller_game.runPlaytimeLastAdded

            If Level.isReplaying
                controller_game.subRunPlaytimeMilliseconds = Level.replay.runTime
            Else If Level.replay <> Null
                Level.replay.runTime = controller_game.runPlaytimeMilliseconds
            End If

            controller_game.runPlaytimeLastAdded = 0

            Return
        End If

        If Not Self.HasFocus() Or
           Level.isLevelEnding
            If controller_game.runPlaytimeLastAdded <> 0
                controller_game.runPlaytimeMilliseconds += app.Millisecs() - controller_game.runPlaytimeLastAdded
                controller_game.subRunPlaytimeMilliseconds += app.Millisecs() - controller_game.runPlaytimeLastAdded
                controller_game.runPlaytimeLastAdded = 0

                Return
            End If
        Else
            If controller_game.runPlaytimeLastAdded = 0
                controller_game.runPlaytimeLastAdded = app.Millisecs()
            End If

            If app.Millisecs() - controller_game.runPlaytimeLastAdded > 1000
                Local runPlaytimeOffset := app.Millisecs() - controller_game.runPlaytimeLastAdded

                If Level.isReplaying
                    If Audio.musicSpeed < 0.8 Or
                       Audio.musicSpeed > 1.2
                        runPlaytimeOffset *= Audio.musicSpeed
                    End If
                End If

                controller_game.runPlaytimeMilliseconds += runPlaytimeOffset
                controller_game.subRunPlaytimeMilliseconds += runPlaytimeOffset
                controller_game.runPlaytimeLastAdded = app.Millisecs()
            End If
        End If
    End Method

End Class
