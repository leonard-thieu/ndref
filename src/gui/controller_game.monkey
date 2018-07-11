'Strict

Import monkey.list
Import mojo.app
Import mojo.input
Import gui.controller
Import gui.controller_pause
Import gui.flyaway
Import gui.gui_gameplay
Import enemy
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

        Local pause: Bool

        Local keyBinding_0_11 := GameData.GetKeyBinding(0, 11)
        If keyBinding_0_11 < 0
            If (input.KeyHit(input.KEY_JOY0_LB) And Not Input.IsRedefined(input.KEY_JOY0_LB)) Or
               (input.KeyHit(input.KEY_JOY0_RB) And Not Input.IsRedefined(input.KEY_JOY0_RB))
                pause = True
            End If
        Else
            If keyBinding_0_11 < 512 And
               Not Input.keysHitLastFrame[keyBinding_0_11] And
               Not Input.keysHit2FramesAgo[keyBinding_0_11]
                Select keyBinding_0_11
                    Case 384
                        If Input.stickDown[0]
                            pause = True
                        End If
                    Case 385
                        If Input.stickRight[0]
                            pause = True
                        End If
                    Case 386
                        If Input.stickLeft[0]
                            pause = True
                        End If
                    Default
                        If Input.KeyWasHit(keyBinding_0_11)
                            pause = True
                        End If
                End Select
            End If
        End If

        If Not pause And
           input.KeyHit(input.KEY_ESCAPE)
            pause = True
        End If

        If pause
            controller_game.gamePaused = True
            Audio.PauseSong(True)
            New ControllerPause(Self)
        End If

        Local allPlayersPerished := Player.AllPlayersPerished()

        Local keyBinding_0_10 := GameData.GetKeyBinding(0, 10)
        If Input.KeyWasHit(keyBinding_0_10)
            If (allPlayersPerished Or controller_game.hasWon) And
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
            Debug.TraceNotImplemented("ControllerGame.Update() (Postgame - death)")
        End If

        If controller_game.hasWon And
           Not Self.pendingScores And
           (controller_game.showScoreMessage Or GameData.modGamedataChanges)
            Debug.TraceNotImplemented("ControllerGame.Update() (Postgame - win)")
        End If

        Local songHasNotLooped: Bool
        If Not Audio.PastLastBeat() And
           Not Audio.HasSongEnded()
            songHasNotLooped = False
        Else
            songHasNotLooped = (Audio.songLoops = 0)
        End If

        If Level.isReplaying
            If Level.replay.GetNumBeats() < Audio.GetClosestBeatNum(True)
                songHasNotLooped = Not Audio.DoingNecrodancerTransition()
            End If
        End If

        For Local i := 0 Until controller_game.numPlayers
            If Not songHasNotLooped
                Continue
            End If

            If Self.HasFocus()
                If Not controller_game.hasWon And
                   Not Audio.startSong
                    Local player := controller_game.players[i]
                    If Not player.isHelper And
                       Not player.falling
                        If player.IsStandingStill()
                            If Level.IsLockedExit(player.x, player.y)
                                If Level.bossNumber = BossBattleType.NecroDancer2 And
                                   (controller_game.currentLevel = LevelType.TrainingNecroDancer2Battle Or
                                    controller_game.currentLevel = LevelType.FinalBossBattle)
                                    Level.ActivateTrigger(53, Null, Null)

                                    Continue
                                End If

                                If Util.IsCharacterActive(Character.Dove)
                                    player.Hit("COWARDICE", 99999, -1, Null, False, 0)

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
                        End If
                    End If
                End If
            End If
        End For

        Audio.Update(True)
        RenderableObject.UpdateAll()
        Doppelganger.UpdateAll()
        Flyaway.UpdateAll()
        ParticleSystem.UpdateAll()
        Level.Update()
        Input.UpdateKeysHit()

        Enemy.movesBehind = Audio.GetClosestBeatNum(True) - controller_game.lastEnemyMoveBeat
        If Enemy.EnemiesMovingThisFrame()
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

        Debug.TraceNotImplemented("ControllerGame.Update() (Playtime)")

        'If Self.HasFocus() And
        '   Not Level.isLevelEnding
        '    If controller_game.totalPlaytimeLastAdded = 0
        '        controller_game.totalPlaytimeLastAdded = app.Millisecs()
        '    End If

        '    If app.Millisecs() - controller_game.totalPlaytimeLastAdded <= 1000
        '        If allPlayersPerished
        '            If controller_game.runPlaytimeLastAdded = 0
        '                Return
        '            End If

        '            controller_game.runPlaytimeMilliseconds += app.Millisecs() - controller_game.runPlaytimeLastAdded
        '            controller_game.subRunPlaytimeMilliseconds += app.Millisecs() - controller_game.runPlaytimeLastAdded

        '            If Level.isReplaying
        '                controller_game.subRunPlaytimeMilliseconds = Level.replay.runTime
        '            Else If Level.replay <> Null
        '                Level.replay.runTime = controller_game.runPlaytimeMilliseconds
        '            End If

        '            controller_game.runPlaytimeLastAdded = 0

        '            Return
        '        End If
        '    End If
        'End If
    End Method

End Class
