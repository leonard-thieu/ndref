'Strict

Import gui.controller
Import bouncer
Import logger
Import player_class
Import textsprite

Global beatData: Int
Global bpmCalculatorBeats: Int
Global bpmCalculatorStart: Int
Global bpmStorage: Int
Global controllerGamePointer: ControllerGame
Global currentDepth: Int = 1
Global currentLevel: Int = 1
Global currentZone: Int = 1
Global dailyChallengeSuccessScore: Int = -1
Global DEBUG_ALL_TILES_VISIBLE: Int
Global DEBUG_GOD_MODE: Int
Global DEBUG_HOTKEY_MODE: String
Global DEBUG_HOTKEY_TEXT: String
Global DEBUG_MOUSE_COORDS: Int
Global DEBUG_RAND_SEED: Int
Global DEBUG_SHOW_BEAT_INDICATORS: Int
Global DEBUG_SHOW_GUI: Int
Global debugEnablePrototypes: Int
Global gamePaused: Bool
Global hardcoreModeSuccessScore: Int = -1
Global hasWon: Int
Global incrementFixedBeatNum: Int
Global lastEnemyMoveBeat: Int
Global lastPlayerMoveBeat: Int
Global numPlayers: Int = 1
Global player1: Int
Global players: Player[4]
Global runPlaytimeLastAdded: Int
Global runPlaytimeMilliseconds: Int
Global showScoreMessage: Int
Global speedrunSuccessScore: Int = -1
Global subRunPlaytimeMilliseconds: Int
Global totalPlaytimeLastAdded: Int
Global totalPlaytimeMilliseconds: Int

Class ControllerGame Extends Controller

    Function _EditorFix: Void() End

    Field specialScoreSubmit: Bool
    Field postDeathReplay: Bool[]
    Field postDeathFrame: Int
    Field postDeathCounter: Int
    Field coinVal: Int
    Field timeVal: Int
    Field restartImage: TextSprite
    Field scoresImage: TextSprite
    Field scoresImage2: TextSprite
    Field songEndedImage: TextSprite
    Field songEndedImage2: TextSprite
    Field restartBounce: Bouncer
    Field replayInstructions: TextSprite
    Field viewingLeaderboard: Bool
    Field ignoreInput: Bool
    Field movementBufferFrame: Int
    Field movementBuffer: Int
    Field pendingScores: Int
    Field originalNumScores: Int
    Field score: Int
    Field originalFailures: Int
    Field scoreSubmitTime: Int
    Field speedrunImage: TextSprite
    Field lastSpeedrunString: String
    Field heartTransplantTimerImage: TextSprite
    Field fpsImage: TextSprite
    Field levelImage: TextSprite

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
