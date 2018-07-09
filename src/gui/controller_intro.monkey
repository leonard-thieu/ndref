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

        Self.splashScreen = New Sprite("mainmenu/splash_screen.png", 1)
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

        ' SKIPPED: Load video.
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
        ' SKIPPED: Clean up video-related.

        Sprite.scaleToFitScreen = False
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
        ' SKIPPED: Input handling.
        ' SKIPPED: Play intro.

        ControllerIntro.quitIntro = True
        Audio.PauseSong(True)
        Self.ReleaseFocus()
    End Method

End Class
