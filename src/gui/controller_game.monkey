'Strict

Import monkey.list
Import mojo.app
Import mojo.graphics
Import gui.controller
Import gui.gui_gameplay
Import level
Import bouncer
Import gamedata
Import input2
Import logger
Import player_class
Import spells
Import sprite
Import textsprite

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

        GUI_gameplay.errorKey = New Sprite("gui/error_locked.png", 1, Image.DefaultFlags)
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
        Debug.TraceNotImplemented("ControllerGame.Update()")
    End Method

End Class
