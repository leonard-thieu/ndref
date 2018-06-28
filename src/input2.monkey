'Strict

Import gui.controller_game
Import gui.controller_popup
Import enemy
Import level
Import audio
Import gamedata
Import input2
Import logger
Import necrodancergame
Import player_class

Class Input

    Global keysHit2FramesAgo: Bool[512]
    Global keysHitLastFrame: Bool[512]
    Global lastBeatMissed: Int[4]
    Global lastBeatMovedOn: Int[4]
    Global lastBeatSkippedFlyaway: Int = -1
    Global lastJoyX: Float[4]
    Global lastJoyX2: Float[4]
    Global lastJoyY: Float[4]
    Global lastJoyY2: Float[4]
    Global lastOffbeatMovedOn: Int[4]
    Global movementBuffer: Int[4]
    Global movementBufferFrame: Int[4]
    Global offbeatMovementBuffer: Int[4]
    Global offbeatMovementBufferFrame: Int[4]
    Global popUpController: ControllerPopUp
    Global popupFrame: Int = -1
    Global punishmentBeatToSkip: Int[4]
    Global punishmentBeatToSkipQueue: Int[4]
    Global stickDown: Bool[4]
    Global stickDown2: Bool[4]
    Global stickLeft: Bool[4]
    Global stickLeft2: Bool[4]
    Global stickRight: Bool[4]
    Global stickRight2: Bool[4]
    Global stickUp: Bool[4]
    Global stickUp2: Bool[4]

    Function GameUpdate: Bool()
        Debug.TraceNotImplemented("Input.GameUpdate()")

        Return True
    End Function

    Function GetDefaultHUDText: Int(moveDir: Int, num: Int)
        Debug.TraceNotImplemented("Input.GetDefaultHUDText(Int, Int)")
    End Function

    Function GetDirectionsHit: Object(playerNum: Int, takeReplayIntoAccount: Bool)
        Debug.TraceNotImplemented("Input.GetDirectionsHit(Int, Bool)")
    End Function

    Function GetKeyName: Int(val: Int, forHud: Bool, num: Int, moveDir: Int)
        Debug.TraceNotImplemented("Input.GetKeyName(Int, Bool, Int, Int)")
    End Function

    Function GetKeyName_BigText: Int(val: Int)
        Debug.TraceNotImplemented("Input.GetKeyName_BigText(Int)")
    End Function

    Function GetRedefineKeyText: Int()
        Debug.TraceNotImplemented("Input.GetRedefineKeyText()")
    End Function

    Function GetTextForHUD: Int(playerNum: Int, moveDir: Int, num: Int)
        Debug.TraceNotImplemented("Input.GetTextForHUD(Int, Int, Int)")
    End Function

    Function GetUpDownText: Int()
        Debug.TraceNotImplemented("Input.GetUpDownText()")
    End Function

    Function HandleMovementKeys: Void()
        Debug.TraceNotImplemented("Input.HandleMovementKeys()")
    End Function

    Function Init: Void()
        For Local i := 0 Until 4
            Input.stickLeft[i] = False
            Input.stickRight[i] = False
            Input.stickUp[i] = False
            Input.stickDown[i] = False
            
            Input.lastJoyX[i] = 0.0
            Input.lastJoyY[i] = 0.0

            Input.stickLeft2[i] = False
            Input.stickRight2[i] = False
            Input.stickUp2[i] = False
            Input.stickDown2[i] = False
            
            Input.lastJoyX2[i] = 0.0
            Input.lastJoyY2[i] = 0.0

            Input.movementBuffer[i] = -1
            Input.movementBufferFrame[i] = 0

            Input.offbeatMovementBuffer[i] = -1
            Input.offbeatMovementBufferFrame[i] = 0

            Input.lastBeatMovedOn[i] = -1
            Input.lastOffbeatMovedOn[i] = -1
            Input.lastBeatMissed[i] = -1

            Input.punishmentBeatToSkip[i] = -1
            Input.punishmentBeatToSkipQueue[i] = -1
        End For

        For Local i := 0 Until 512
            Input.keysHitLastFrame[i] = False
            Input.keysHit2FramesAgo[i] = False
        End For
    End Function

    Function IsRedefined: Bool(key: Int)
        Debug.TraceNotImplemented("Input.IsRedefined(Int)")
    End Function

    Function KeyWasHit: Int(keyID: Int)
        Debug.TraceNotImplemented("Input.KeyWasHit(Int)")
    End Function

    Function ResetMovementCounters: Void()
        Input.Init()

        controller_game.lastEnemyMoveBeat = 0

        Enemy.movesBehind = 0
        Enemy.lastWraithSpawnBeat = 0

        Audio.fixedBeatNum = -64

        If (Not Level.isReplaying And
            Util.IsCharacterActive(Character.Bard)) Or
           (GameData.GetLobbyMove() And
            (controller_game.currentLevel = LevelType.Lobby Or
            (LevelType.MinLobbyArea <= controller_game.currentLevel And controller_game.currentLevel <= LevelType.MaxLobbyArea)))
            Audio.fixedBeatNum = 1
        End If

        For Local i := 0 Until controller_game.numPlayers
            controller_game.lastPlayerMoveBeat[i] = -1

            Local player := controller_game.players[i]
            If player <> Null
                player.queuedMoveBeat = -1
            End If
        End For

        Input.lastBeatSkippedFlyaway = -1
    End Function

    Function SpawnDebugItem: Void(type: Int)
        Debug.TraceNotImplemented("Input.SpawnDebugItem(Int)")
    End Function

    Function Update: Void()
        If controller_game.DEBUG_MOUSE_COORDS
            Debug.TraceNotImplemented("Input.Update() (Debug mouse coords)")
        End If

        If Input.popUpController <> Null
            If necrodancergame.globalFrameCounter > Input.popupFrame + 60
                Input.popUpController.ignoreInput = False
            End If

            Select Input.popUpController.retval
                Case -1
                    ' Do nothing
                Case 2
                    GameData.SetLobbyMove(True)
                    Level.DoRestart()
                    Input.popUpController = Null
                Default
                    Input.popUpController = Null
            End Select
        End If

        Debug.TraceNotImplemented("Input.Update() (Joystick)")
    End Function

    Function UpdateKeysHit: Void()
        Debug.TraceNotImplemented("Input.UpdateKeysHit()")
    End Function

    Function _EditorFix: Void() End

End Class
