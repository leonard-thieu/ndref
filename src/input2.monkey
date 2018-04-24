'Strict

Import logger

Class Input

    Global lastBeatSkippedFlyaway: Int
    Global popUpController: Object
    Global popupFrame: Int

    Function GameUpdate: Bool()
        Debug.TraceNotImplemented("Input.GameUpdate()")
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
        Debug.TraceNotImplemented("Input.Init()")
    End Function

    Function IsRedefined: Bool(key: Int)
        Debug.TraceNotImplemented("Input.IsRedefined(Int)")
    End Function

    Function KeyWasHit: Int(keyID: Int)
        Debug.TraceNotImplemented("Input.KeyWasHit(Int)")
    End Function

    Function ResetMovementCounters: Void()
        Debug.TraceNotImplemented("Input.ResetMovementCounters()")
    End Function

    Function SpawnDebugItem: Void(type: Int)
        Debug.TraceNotImplemented("Input.SpawnDebugItem(Int)")
    End Function

    Function Update: Void()
        Debug.TraceNotImplemented("Input.Update()")
    End Function

    Function UpdateKeysHit: Void()
        Debug.TraceNotImplemented("Input.UpdateKeysHit()")
    End Function

    Function _EditorFix: Void() End

End Class
