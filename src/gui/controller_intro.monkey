'Strict

Import monkey.list
Import gui.controller
Import gui.controller_cutscene
Import graphics
Import logger
Import sprite

Class ControllerIntro Extends Controller

    Global videoSpr: Object

    Function _EditorFix: Void() End

    Field splashScreen: Sprite
    Field videoImg: Image
    Field introVideoName: String
    Field introSongName: String
    Field subtitles: List<Object>
    Field splashStartTime: Int
    Field numKeyHits: Int
    Field delayFrame: Bool
    Field currentFramePixels: Int[]
    Field startedPlayback: Bool
    Field videoSprInitialized: Bool
    Field curSubtitle: SubtitleData
    Field subtitleImg: Sprite
    Field endVideoDelay: Int
    Field splashAlpha: Float

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerIntro.Destructor()")
    End Method

    Method DrawFrame: Void()
        Debug.TraceNotImplemented("ControllerIntro.DrawFrame()")
    End Method

    Method RegainFocus: Void()
        Debug.TraceNotImplemented("ControllerIntro.RegainFocus()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerIntro.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerIntro.Update()")
    End Method

End Class
