'Strict

Import monkey.list
Import mojo.graphics
Import gui.controller
Import gui.controller_cutscene
Import audio2
Import gamedata
Import logger
Import sprite
Import textlog

Class ControllerIntro Extends Controller

    Global quitIntro: Bool
    Global videoSpr: Sprite

    Function _EditorFix: Void() End

    Method New()
        Super.New()

        Sprite.scaleToFitScreen = True

        Self.splashScreen = New Sprite("mainmenu/splash_screen.png", 1, Image.DefaultFlags)
        Self.splashScreen.SetZ(10002.0)
        Self.splashScreen.InWorld = False

        TextLog.Message("ControllerIntro: Loading images1...")
        Self.videoImg = graphics.CreateImage(960, 640)

        TextLog.Message("ControllerIntro: Loading images2...")
        ControllerIntro.videoSpr = New Sprite(Self.videoImg)
        ControllerIntro.videoSpr.InWorld = False
        ControllerIntro.videoSpr.SetZ(10000.0)
        ControllerIntro.videoSpr.SetScale(0.5)

        TextLog.Message("ControllerIntro: Initializing Audio...")
        Audio.Init()

        If GameData.GetShownNocturnaIntro() Or
           (Not GameData.GetDLCPlayed() And GameData.GetZone2Unlocked(Character.Cadence)) Or
           GameData.IsCharUnlocked(Character.Melody)
            GameData.SetShownNocturnaIntro(True)
            Self.introVideoName = "intro_dlc_silent"
            Self.introSongName = "intro_dlc"
        End If

        TextLog.Message("ControllerIntro: Loading video...")
        Debug.TraceNotImplemented("ControllerIntro.New() (Video)")
    End Method

    Field splashScreen: Sprite
    Field videoImg: Image
    Field introVideoName: String = "intro_silent"
    Field introSongName: String = "intro"
    Field subtitles: List<SubtitleData> = New List<SubtitleData>()
    Field splashStartTime: Int = -1
    Field numKeyHits: Int
    Field delayFrame: Bool
    Field currentFramePixels: Int[]
    Field startedPlayback: Bool
    Field videoSprInitialized: Bool
    Field curSubtitle: SubtitleData
    Field subtitleImg: Sprite
    Field endVideoDelay: Int = 60
    Field splashAlpha: Float = 1.0

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
