'Strict

Import mojo.app
Import mojo.graphics
Import gui.controller
Import gui.controller_changelog
Import gui.controller_cutscene
Import gui.controller_intro
Import gui.controller_popup
Import camera
Import gamedata
Import item
Import logger
Import necrodancergame
Import particles
Import player_class
Import sprite
Import steam
Import textlog
Import textsprite
Import util

Class ControllerMainMenu Extends Controller

    Function _EditorFix: Void() End

    Method New()
        Super.New()

        Sprite.scaleToFitScreen = True
        GameData.LoadGameDataXML(False)
        Self.showCloudSavePopup = GameData.LoadPlayerDataXML(True)

        If GameData.GetDefaultMod() <> ""
            GameData.activeMod = GameData.GetDefaultMod()
            GameData.LoadGameDataXML(False)
        End If

        If GameData.GetShownNocturnaIntro() Or
           (Not GameData.GetDLCPlayed() And GameData.GetZone2Unlocked(Character.Cadence)) Or
           GameData.IsCharUnlocked(Character.Melody)
            GameData.SetShownNocturnaIntro(True)
            Self.mainmenuSongName = "zone5_3"
            Self.mainmenuTitlescreen = "mainmenu/amplified_titlescreen.png"
        End If

        util.SetVSync(GameData.GetVSync())

        ' ???
        GameData.GetFullscreen()
        If GameData.GetResolutionW() > 0
            GameData.GetResolutionH()
            GameData.GetResolutionW()
        End If

        If steam.g_SteamLeaderboards <> Null
            Util.GetLeaderboardScores(1, 1, 0, "", True, False, True)
        End If

        TextSprite.Init()
        ControllerCutscene.InitSubtitles()

        TextLog.Message("ControllerMainMenu: Loading images1...")
        Self.mainMenu = New Sprite(Self.mainmenuTitlescreen, 1, Image.DefaultFlags)
        Self.mainMenu.SetZ(9998.0)
        Self.mainMenu.InWorld = False

        TextLog.Message("ControllerMainMenu: Loading images3...")
        Self.continueImage = New Sprite("mainmenu/continue.png", 1, Image.DefaultFlags)
        Self.continueImage.SetZ(9999.0)
        Self.continueImage.InWorld = False

        If steam.SteamApps() <> Null And 
           steam.SteamApps().BIsDlcInstalled(379400)
            Self.alphaWarning = New Sprite("mainmenu/collectors_edition.png", 1, Image.DefaultFlags)
        Else If steam.SteamApps() <> Null And 
                steam.SteamApps().BIsDlcInstalled(314680)
            Self.alphaWarning = New Sprite("mainmenu/soundtrack_edition.png", 1, Image.DefaultFlags)
        Else
            Self.haveShownAlphaWarning = True
        End If

        If Self.alphaWarning <> Null
            Self.alphaWarning.SetZ(10000.0)
            Self.alphaWarning.InWorld = False
        End If

        Self.seizureWarning = New Sprite("mainmenu/seizure_warning.png", 1, Image.DefaultFlags)

        If GameData.GetShownSeizureWarning()
            Self.haveShownSeizureWarning = True
        End If

        TextLog.Message("ControllerMainMenu: Loading ControllerIntro...")
        New ControllerIntro()
    End Method

    Field showCloudSavePopup: Bool
    Field mainmenuSongName: String = "zone1_3"
    Field mainmenuTitlescreen: String = "mainmenu/mainmenu.png"
    Field mainMenu: Sprite
    Field continueImage: Sprite
    Field alphaWarning: Sprite
    Field haveShownAlphaWarning: Bool
    Field seizureWarning: Sprite
    Field haveShownSeizureWarning: Bool
    Field passingToCalibration: Bool
    Field hasSentToGameplay: Bool
    Field popUpController: ControllerPopUp
    Field showingAlphaWarning: Bool
    Field showingSeizureWarning: Bool
    Field loaded: Bool
    Field gameLoadedAndStatsCallbackReceived: Bool
    Field startedWaitingForStatsCallback: Int = -1
    Field firstRun: Int = 2
    Field gameLoaded: Bool
    Field versionImage: TextSprite = New TextSprite(2, 1.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field loadingImage: TextSprite = New TextSprite(2, 1.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerMainMenu.Destructor()")
    End Method

    Method LoadGame: Void()
        TextLog.Message("NECRODANCER INIT: Loading game")

        Util.AddMetric("event", "necrodancerLoad", True, True)

        NecroDancerGame.textFont = graphics.LoadImage("TEMP_font.png", 96, Image.XYPadding)
        graphics.SetFont(NecroDancerGame.textFont)

        Camera.Init()
        ParticleSystem.Init()
        Item.InitAll()

        ' SKIPPED: Preload assets.

        Self.startedWaitingForStatsCallback = app.Millisecs()
    End Method

    Method PassFocusToNextController: Void()
        Debug.TraceNotImplemented("ControllerMainMenu.PassFocusToNextController()")
    End Method

    Method RegainFocus: Void()
        Sprite.scaleToFitScreen = True

        If Self.passingToCalibration
            Self.passingToCalibration = False

            If GameData.GetChangeLogShownForCurrentVersion()
                New ControllerGame()
                Self.hasSentToGameplay = True
            Else
                GameData.SetChangeLogShownForCurrentVersion()
                New ControllerChangeLog()
            End If

            Self.loaded = False
        Else
            If Self.popUpController <> Null
                Self.showCloudSavePopup = False

                If Self.popUpController.retval = 1
                    GameData.LoadPlayerDataXML(True)
                End If

                Self.popUpController = Null
                GameData.playerDataLoadPending = False

                Self.PassFocusToNextController()
            End If

            Self.loaded = False
        End If
    End Method

    Method Render: Void()
        ' SKIPPED: Show alpha warning.
        ' SKIPPED: Show seizure warning.
        ' SKIPPED: Draw main menu.
        ' SKIPPED: Draw video sprite.
        ' SKIPPED: Draw version image.

        If Self.firstRun > 0
            Self.firstRun -= 1
        End If

        ' SKIPPED: Draw continue image.
        ' SKIPPED: Draw loading image.
    End Method

    Method Update: Void()
        ' SKIPPED: Steam Stats

        If Self.firstRun > 0
            Return
        End If

        If Not Self.loaded
            ' SKIPPED: On quit intro
            ' SKIPPED: Video sprite

            ControllerIntro.quitIntro = True
            Self.loaded = True
        end If

        Audio.Update(False)

        ' SKIPPED: Main menu song

        ' SKIPPED: Check intro video finished.
        If Not Self.gameLoaded
            Self.gameLoaded = True
            Self.LoadGame()
        End If

        ' SKIPPED: Main menu input handling

        New ControllerGame()
        Self.hasSentToGameplay = True
    End Method

End Class
