'Strict

Import level
Import callback
Import logger
Import necrodancergame

Class Camera

    Global fadeInCallback: Callback
    Global fadeInCurrent: Int
    Global fadeInDuration: Int
    Global fadeOutCallback: Callback
    Global fadeOutCurrent: Int
    Global fadeOutDuration: Int
    Global fixed: Bool
    Global freezeFrameDelay: Int = -1
    Global freezeFrameNum: Int = -1
    Global freezeImage: Object
    Global lastFreezeFrameH: Int
    Global lastFreezeFrameW: Int
    Global overlayBlack: Object
    Global overlayRed: Object
    Global overlayRedDuration: Int
    Global overlayWhite: Object
    Global overlayWhiteDuration: Int
    Global seekX: Float
    Global seekY: Float
    Global shakeDuration: Int
    Global shakeDurationInitial: Int
    Global shakeOffX: Float
    Global shakeOffY: Float
    Global shakePower: Float
    Global x: Int
    Global y: Int

    Function CaptureFreezeFrame: Void()
        Debug.TraceNotImplemented("Camera.CaptureFreezeFrame()")
    End Function

    Function FadeOutThenExecute: Void(dur: Int, cBack: Callback)
        Camera.fadeOutCallback = cBack
        Camera.fadeOutDuration = dur
        Camera.fadeOutCurrent = dur
    End Function

    Function GetFixedHeight: Int()
        If Level.isReplaying
            Local curReplayData := Level.replay.curReplayData
            If curReplayData <> Null
                Return curReplayData.Value().cameraHeight
            End If
        End If

        Return necrodancergame.FIXED_HEIGHT
    End Function

    Function GetFixedWidth: Int()
        If Level.isReplaying
            Local curReplayData := Level.replay.curReplayData
            If curReplayData <> Null
                Return curReplayData.Value().cameraWidth
            End If
        End If

        Return necrodancergame.FIXED_WIDTH
    End Function

    Function Init: Void()
        Debug.TraceNotImplemented("Camera.Init()")
    End Function

    Function IsOnScreen: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.IsOnScreen(Int, Int)")
    End Function

    Function IsOnScreenStandardized: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.IsOnScreenStandardized(Int, Int)")
    End Function

    Function IsOnScreenStandardizedRelativeToPoint: Bool(xVal: Int, yVal: Int, pointX: Int, pointY: Int)
        Local pixelX := pointX - (24 * xVal)
        Local pixelY := pointY - (24 * yVal)

        Return (-239 <= pixelX And pixelX <= 251) And
               (-134 <= pixelY And pixelY <= 146)
    End Function

    Function SetFreezeFrames: Void(num: Int, delay: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.SetFreezeFrames(Int, Int, Int, Int)")
    End Function

    Function Shake: Void(type: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.Shake(Int, Int, Int)")
    End Function

    Function Update: Void()
        Debug.TraceNotImplemented("Camera.Update()")
    End Function

    Function _EditorFix: Void() End

End Class
