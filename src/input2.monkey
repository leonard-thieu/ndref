'Strict

Import logger

Class Input

    Global lastBeatSkippedFlyaway: Int
    Global popUpController: Int
    Global popupFrame: Int

    Function GameUpdate: Bool()
        Debug.TraceNotImplemented("Input.GameUpdate()")
    End Function

    Function GetDefaultHUDText: Int(moveDir: Int, num: Int)
        Debug.TraceNotImplemented("Input.GetDefaultHUDText()")
    End Function

    Function GetDirectionsHit: Object(playerNum: Int, takeReplayIntoAccount: Bool)
        Debug.TraceNotImplemented("Input.GetDirectionsHit()")
    End Function

    Function GetKeyName: Int(val: Int, forHud: Bool, num: Int, moveDir: Int)
        Debug.TraceNotImplemented("Input.GetKeyName()")
    End Function

    Function GetKeyName: Int(val: Int)
        Debug.TraceNotImplemented("Input.GetKeyName()")
    End Function

    Function GetRedefineKeyText: Int()
        Debug.TraceNotImplemented("Input.GetRedefineKeyText()")
    End Function

    Function GetTextForHUD: Int(playerNum: Int, moveDir: Int, num: Int)
        Debug.TraceNotImplemented("Input.GetTextForHUD()")
    End Function

    Function GetUpDownText: Int()
        Debug.TraceNotImplemented("Input.GetUpDownText()")
    End Function

    Function HandleMovementKeys: Void()
        Debug.TraceNotImplemented("Input.HandleMovementKeys()")
    End Function

    Function Init: Void()
        Debug.TraceNotImplemented("Input.Init()")
    End Function

    Function IsRedefined: Bool(key: Int)
        Debug.TraceNotImplemented("Input.IsRedefined()")
    End Function

    Function KeyWasHit: Int(keyID: Int)
        Debug.TraceNotImplemented("Input.KeyWasHit()")
    End Function

    Function ResetMovementCounters: Void()
        Debug.TraceNotImplemented("Input.ResetMovementCounters()")
    End Function

    Function SpawnDebugItem: Void(type: Int)
        Debug.TraceNotImplemented("Input.SpawnDebugItem()")
    End Function

    Function Update: Void()
        Debug.TraceNotImplemented("Input.Update()")
    End Function

    Function UpdateKeysHit: Void()
        Debug.TraceNotImplemented("Input.UpdateKeysHit()")
    End Function

    Method NoTrim: Void()
        GameUpdate()
        GetDefaultHUDText(0, 0)
        GetDirectionsHit(0, False)
        GetKeyName(0, False, 0, 0)
        GetKeyName(0)
        GetRedefineKeyText()
        GetTextForHUD(0, 0, 0)
        GetUpDownText()
        HandleMovementKeys()
        Init()
        IsRedefined(0)
        KeyWasHit(0)
        ResetMovementCounters()
        SpawnDebugItem(0)
        Update()
        UpdateKeysHit()
    End Method

End Class
