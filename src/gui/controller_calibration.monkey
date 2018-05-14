'Strict

Import gui.controller
Import gui.guiborder
Import gui.textlabel
Import logger
Import sprite

Class ControllerCalibration Extends Controller

    Function _EditorFix: Void() End

    Field cachedScaleVal: Bool
    Field overlayWhite: Sprite
    Field cadenceBody: Sprite
    Field cadenceHead: Sprite
    Field lastTime: Int
    Field state: Int
    Field audioLatencySum: Int
    Field audioLatencyNum: Int
    Field audioLatencyAdjust: Int
    Field videoLatencySum: Int
    Field videoLatencyNum: Int
    Field videoLatencyAdjust: Int
    Field lastInputDelay: Int
    Field lastAudioLatency: Float
    Field lastVideoLatency: Float
    Field border: GuiBorder
    Field audioLatencyTitle: TextLabel
    Field audioLatencyInstructions: TextLabel
    Field timeInsturction: TextLabel
    Field skipInstructions: TextLabel
    Field videoLatencyTitle: TextLabel
    Field videoLatencyInstructions: TextLabel
    Field results1: TextLabel
    Field results2: TextLabel
    Field results3: TextLabel
    Field results4: TextLabel
    Field results5: TextLabel
    Field results6: TextLabel

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerCalibration.Destructor()")
    End Method

    Method DoBounce: Void()
        Debug.TraceNotImplemented("ControllerCalibration.DoBounce()")
    End Method

    Method GetAudioLatency: Float()
        Debug.TraceNotImplemented("ControllerCalibration.GetAudioLatency()")
    End Method

    Method GetVideoLatency: Float()
        Debug.TraceNotImplemented("ControllerCalibration.GetVideoLatency()")
    End Method

    Method RegainFocus: Void()
        Debug.TraceNotImplemented("ControllerCalibration.RegainFocus()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerCalibration.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerCalibration.Update()")
    End Method

    Method UpWasHit: Bool()
        Debug.TraceNotImplemented("ControllerCalibration.UpWasHit()")
    End Method

End Class
