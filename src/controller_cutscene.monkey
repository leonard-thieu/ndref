'Strict

Import monkey.list
Import callback
Import controller
Import controller_cutscene
Import graphics
Import logger
Import sprite

Class ControllerCutscene Extends Controller

    Global fadingIn: Bool
    Global fadingOut: Bool
    Global instance: Object
    Global startedPlayback: Bool
    Global subtitleXML: Object
    Global videoSpr: Object

    Function InitSubtitles: Void()
        Debug.TraceNotImplemented("ControllerCutscene.InitSubtitles()")
    End Function

    Function _EditorFix: Void() End

    Method New(cutsceneChar: Int, cutsceneNum: Int, creditsNum: Int)
        Debug.TraceNotImplemented("ControllerCutscene.New(Int, Int, Int)")
    End Method

    Field cutsceneName: String
    Field videoImg: Image
    Field subtitles: List<Object>
    Field inputDelayFrames: Int
    Field numKeyHits: Int
    Field delayFrame: Bool
    Field currentFramePixels: Int[]
    Field videoSprInitialized: Bool
    Field curSubtitle: SubtitleData
    Field subtitleImg: Sprite
    Field endVideoDelay: Int

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerCutscene.Destructor()")
    End Method

    Method DrawFrame: Void()
        Debug.TraceNotImplemented("ControllerCutscene.DrawFrame()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerCutscene.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerCutscene.Update()")
    End Method

End Class

Class SubtitleData

    Function _EditorFix: Void() End

    Method New(startT: Int, endT: Int, path: Int, xOffset: Int, yOffset: Int, sc: Float)
        Debug.TraceNotImplemented("SubtitleData.New(Int, Int, Int, Int, Int, Float)")
    End Method

    Field startTime: Int
    Field endTime: Int
    Field imagePath: String
    Field xOff: Int
    Field yOff: Int
    Field scale: Float

End Class

Class FadeIn_callback Implements Callback

    Function _EditorFix: Void() End

    Method Execute: Void(args: Int)
        Debug.TraceNotImplemented("FadeIn_callback.Execute(Int)")
    End Method

End Class

Class FadeOut_callback Implements Callback

    Function _EditorFix: Void() End

    Method Execute: Void(args: Int)
        Debug.TraceNotImplemented("FadeOut_callback.Execute(Int)")
    End Method

End Class
