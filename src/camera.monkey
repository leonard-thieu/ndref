'Strict

Import logger

Class Camera

    Global fadeInCallback: Int
    Global fadeInCurrent: Int
    Global fadeOutCallback: Int
    Global fadeOutCurrent: Int
    Global fadeOutDuration: Int
    Global fixed: Bool
    Global freezeFrameDelay: Int
    Global freezeFrameNum: Int
    Global freezeImage: Int
    Global lastFreezeFrameH: Int
    Global lastFreezeFrameW: Int
    Global overlayBlack: Int
    Global overlayRed: Int
    Global overlayRedDuration: Int
    Global overlayWhite: Int
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
        Debug.TraceNotImplemented("Camera.FadeOutThenExecute()")
    End Function

    Function Init: Void()
        Debug.TraceNotImplemented("Camera.Init()")
    End Function

    Function IsOnScreen: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.IsOnScreen()")
    End Function

    Function IsOnScreenStandardized: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.IsOnScreenStandardized()")
    End Function

    Function IsOnScreenStandardizedRelativeToPoint: Bool(xVal: Int, yVal: Int, pointX: Int, pointY: Int)
        Debug.TraceNotImplemented("Camera.IsOnScreenStandardizedRelativeToPoint()")
    End Function

    Function SetFreezeFrames: Void(num: Int, delay: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.SetFreezeFrames()")
    End Function

    Function Shake2: Void(type: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.Shake2()")
    End Function

    Function Update: Void()
        Debug.TraceNotImplemented("Camera.Update()")
    End Function

    Function _EditorFix: Void() End

    Method NoTrim: Void()
        CaptureFreezeFrame()
        FadeOutThenExecute(0, Null)
        Init()
        IsOnScreen(0, 0)
        IsOnScreenStandardized(0, 0)
        IsOnScreenStandardizedRelativeToPoint(0, 0, 0, 0)
        SetFreezeFrames(0, 0, 0, 0)
        Shake2(0, 0, 0)
        Update()
    End Method

End Class
