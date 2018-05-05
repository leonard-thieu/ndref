'Strict

Import logger

Class Camera

    Global fadeInCallback: Object
    Global fadeInCurrent: Int
    Global fadeInDuration: Int
    Global fadeOutCallback: Object
    Global fadeOutCurrent: Int
    Global fadeOutDuration: Int
    Global fixed: Bool
    Global freezeFrameDelay: Int
    Global freezeFrameNum: Int
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

    Function FadeOutThenExecute: Void(dur: Int, cBack: Object)
        Debug.TraceNotImplemented("Camera.FadeOutThenExecute(Int, Object)")
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

    Function Shake2: Void(type: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.Shake2(Int, Int, Int)")
    End Function

    Function Update: Void()
        Debug.TraceNotImplemented("Camera.Update()")
    End Function

    Function _EditorFix: Void() End

End Class
