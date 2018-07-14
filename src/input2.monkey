'Strict

Import monkey.list
Import controller.controller_game
Import controller.controller_popup
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

    Function GetDirectionsHit: List<Int>(playerNum: Int, takeReplayIntoAccount: Bool)
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
        If (0 <= keyID And keyID <= 511) And
           Not Input.keysHitLastFrame[keyID] And
           Not Input.keysHit2FramesAgo[keyID]
            Select keyID
                Case InputValue.StickDownPlayer1
                    Return Input.stickDown[0]
                Case InputValue.StickRightPlayer1
                    Return Input.stickRight[0]
                Case InputValue.StickLeftPlayer1
                    Return Input.stickLeft[0]
                Case InputValue.StickUpPlayer1
                    Return Input.stickUp[0]
                Case InputValue.StickDownPlayer2
                    Return Input.stickDown[1]
                Case InputValue.StickRightPlayer2
                    Return Input.stickRight[1]
                Case InputValue.StickLeftPlayer2
                    Return Input.stickLeft[1]
                Case InputValue.StickUpPlayer2
                    Return Input.stickUp[1]
                Case InputValue.StickDownPlayer3
                    Return Input.stickDown[2]
                Case InputValue.StickRightPlayer3
                    Return Input.stickRight[2]
                Case InputValue.StickLeftPlayer3
                    Return Input.stickLeft[2]
                Case InputValue.StickUpPlayer3
                    Return Input.stickUp[2]
                Case InputValue.StickDownPlayer4
                    Return Input.stickDown[3]
                Case InputValue.StickRightPlayer4
                    Return Input.stickRight[3]
                Case InputValue.StickLeftPlayer4
                    Return Input.stickLeft[3]
                Case InputValue.StickUpPlayer4
                    Return Input.stickUp[3]
                Case InputValue.RStickDownPlayer1
                    Return Input.stickDown2[0]
                Case InputValue.RStickRightPlayer1
                    Return Input.stickRight2[0]
                Case InputValue.RStickLeftPlayer1
                    Return Input.stickLeft2[0]
                Case InputValue.RStickUpPlayer1
                    Return Input.stickUp2[0]
                Case InputValue.RStickDownPlayer2
                    Return Input.stickDown2[1]
                Case InputValue.RStickRightPlayer2
                    Return Input.stickRight2[1]
                Case InputValue.RStickLeftPlayer2
                    Return Input.stickLeft2[1]
                Case InputValue.RStickUpPlayer2
                    Return Input.stickUp2[1]
                Case InputValue.RStickDownPlayer3
                    Return Input.stickDown2[2]
                Case InputValue.RStickRightPlayer3
                    Return Input.stickRight2[2]
                Case InputValue.RStickLeftPlayer3
                    Return Input.stickLeft2[2]
                Case InputValue.RStickUpPlayer3
                    Return Input.stickUp2[2]
                Case InputValue.RStickDownPlayer4
                    Return Input.stickDown2[3]
                Case InputValue.RStickRightPlayer4
                    Return Input.stickRight2[3]
                Case InputValue.RStickLeftPlayer4
                    Return Input.stickLeft2[3]
                Case InputValue.RStickUpPlayer4
                    Return Input.stickUp2[3]
                Default
                    Return input.KeyHit(keyID)
            End Select
        End If

        Return 0
    End Function

    Function ResetMovementCounters: Void()
        Input.Init()

        controller_game.lastEnemyMoveBeat = 0

        Enemy.movesBehind = 0
        Enemy.lastWraithSpawnBeat = 0

        Audio.UnsetFixedBeat()

        If (Not Level.isReplaying And
            Util.IsCharacterActive(Character.Bard)) Or
           (GameData.GetLobbyMove() And
            (controller_game.currentLevel = LevelType.Lobby Or
            (LevelType.MinLobbyArea <= controller_game.currentLevel And controller_game.currentLevel <= LevelType.MaxLobbyArea)))
            Audio.InitFixedBeat()
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
        For Local i := 0 Until 512
            Input.keysHit2FramesAgo[i] = Input.keysHitLastFrame[i]
            Input.keysHitLastFrame[i] = input.KeyHit(i) > 0
        End For
    End Function

    Function _EditorFix: Void() End

End Class

Class InputValue

    Const None: Int = -3
    Const PressAnyKey: Int = -2
    Const Default_: Int = -1
    Const Backspace: Int = 8
    Const Tab: Int = 9
    Const Shift: Int = 16
    Const Ctrl: Int = 17
    Const CapsLock: Int = 20
    Const Esc: Int = 27
    Const Space: Int = 32
    Const PageUp: Int = 33
    Const PageDown: Int = 34
    Const End_: Int = 35
    Const Home: Int = 36
    Const Left: Int = 37
    Const Up: Int = 38
    Const Right: Int = 39
    Const Down: Int = 40
    Const Ins: Int = 45
    Const Del: Int = 46
    Const Num0: Int = 48
    Const Num1: Int = 49
    Const Num2: Int = 50
    Const Num3: Int = 51
    Const Num4: Int = 52
    Const Num5: Int = 53
    Const Num6: Int = 54
    Const Num7: Int = 55
    Const Num8: Int = 56
    Const Num9: Int = 57
    Const A: Int = 65
    Const B: Int = 66
    Const C: Int = 67
    Const D: Int = 68
    Const E: Int = 69
    Const F: Int = 70
    Const G: Int = 71
    Const H: Int = 72
    Const I: Int = 73
    Const J: Int = 74
    Const K: Int = 75
    Const L: Int = 76
    Const M: Int = 77
    Const N: Int = 78
    Const O: Int = 79
    Const P: Int = 80
    Const Q: Int = 81
    Const R: Int = 82
    Const S: Int = 83
    Const T: Int = 84
    Const U: Int = 85
    Const V: Int = 86
    Const W: Int = 87
    Const X: Int = 88
    Const Y: Int = 89
    Const Z: Int = 90
    Const NumPad0: Int = 96
    Const NumPad1: Int = 97
    Const NumPad2: Int = 98
    Const NumPad3: Int = 99
    Const NumPad4: Int = 100
    Const NumPad5: Int = 101
    Const NumPad6: Int = 102
    Const NumPad7: Int = 103
    Const NumPad8: Int = 104
    Const NumPad9: Int = 105
    Const NumPadMultiplication: Int = 106
    Const NumPadAddition: Int = 107
    Const NumPadDivision: Int = 108
    Const NumPadSubtraction: Int = 109
    Const NumPadDecimal: Int = 110
    Const NumPadDivision2: Int = 111
    Const F1: Int = 112
    Const F2: Int = 113
    Const F3: Int = 114
    Const F4: Int = 115
    Const F5: Int = 116
    Const F6: Int = 117
    Const F7: Int = 118
    Const F8: Int = 119
    Const F9: Int = 120
    Const F10: Int = 121
    Const F11: Int = 122
    Const F12: Int = 123
    Const Colon: Int = 186
    Const Equal: Int = 187
    Const Comma: Int = 188
    Const Hyphen: Int = 189
    Const Period: Int = 190
    Const ForwardSlash: Int = 191
    Const Tilde: Int = 192
    Const LeftBrace: Int = 219
    Const BackSlash: Int = 220
    Const RightBrace: Int = 221
    Const SingleQuote: Int = 222
    Const StickDownPlayer1: Int = 384
    Const StickDownPlayer2: Int = 392
    Const StickDownPlayer3: Int = 400
    Const StickDownPlayer4: Int = 408
    Const StickUpPlayer1: Int = 387
    Const StickUpPlayer2: Int = 395
    Const StickUpPlayer3: Int = 403
    Const StickUpPlayer4: Int = 411
    Const StickLeftPlayer1: Int = 386
    Const StickLeftPlayer2: Int = 394
    Const StickLeftPlayer3: Int = 402
    Const StickLeftPlayer4: Int = 410
    Const StickRightPlayer1: Int = 385
    Const StickRightPlayer2: Int = 393
    Const StickRightPlayer3: Int = 401
    Const StickRightPlayer4: Int = 409
    Const RStickDownPlayer1: Int = 388
    Const RStickDownPlayer2: Int = 396
    Const RStickDownPlayer3: Int = 404
    Const RStickDownPlayer4: Int = 412
    Const RStickUpPlayer1: Int = 391
    Const RStickUpPlayer2: Int = 399
    Const RStickUpPlayer3: Int = 407
    Const RStickUpPlayer4: Int = 415
    Const RStickLeftPlayer1: Int = 390
    Const RStickLeftPlayer2: Int = 398
    Const RStickLeftPlayer3: Int = 406
    Const RStickLeftPlayer4: Int = 414
    Const RStickRightPlayer1: Int = 389
    Const RStickRightPlayer2: Int = 397
    Const RStickRightPlayer3: Int = 405
    Const RStickRightPlayer4: Int = 413
    Const DpadDownPlayer1: Int = 283
    Const DpadDownPlayer2: Int = 315
    Const DpadDownPlayer3: Int = 347
    Const DpadDownPlayer4: Int = 379
    Const DpadUpPlayer1: Int = 285
    Const DpadUpPlayer2: Int = 317
    Const DpadUpPlayer3: Int = 349
    Const DpadUpPlayer4: Int = 381
    Const DpadLeftPlayer1: Int = 284
    Const DpadLeftPlayer2: Int = 316
    Const DpadLeftPlayer3: Int = 348
    Const DpadLeftPlayer4: Int = 380
    Const DpadRightPlayer1: Int = 282
    Const DpadRightPlayer2: Int = 314
    Const DpadRightPlayer3: Int = 346
    Const DpadRightPlayer4: Int = 378
    Const UpPlayer1: Int = 387
    Const UpPlayer2: Int = 395
    Const UpPlayer3: Int = 403
    Const UpPlayer4: Int = 411
    Const LeftPlayer1: Int = 386
    Const LeftPlayer2: Int = 394
    Const LeftPlayer3: Int = 402
    Const LeftPlayer4: Int = 410
    Const RightPlayer1: Int = 385
    Const RightPlayer2: Int = 393
    Const RightPlayer3: Int = 401
    Const RightPlayer4: Int = 409

End Class

Class ControlIndex

    Const None: Int = -1
    Const Up: Int = 0
    Const Right: Int = 1
    Const Down: Int = 2
    Const Left: Int = 3
    Const UpAlternate: Int = 4
    Const RightAlternate: Int = 5
    Const DownAlternate: Int = 6
    Const LeftAlternate: Int = 7
    Const LeftRight: Int = 8
    Const UpDown: Int = 9
    Const UpLeft: Int = 10
    Const UpRight: Int = 11
    Const DownLeft: Int = 12
    Const DownRight: Int = 13
    Const QuickRestart: Int = 14
    Const Pause: Int = 15

End Class
