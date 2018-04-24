'Strict

Import controller
Import controller_popup
Import logger
Import sprite
Import textsprite

Class ControllerMainMenu Extends Controller

    Function _EditorFix: Void() End

    Field showCloudSavePopup: Bool
    Field mainmenuSongName: String
    Field mainmenuTitlescreen: String
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
    Field startedWaitingForStatsCallback: Int
    Field firstRun: Int
    Field gameLoaded: Bool
    Field versionImage: TextSprite
    Field loadingImage: TextSprite

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerMainMenu.Destructor()")
    End Method

    Method LoadGame: Void()
        Debug.TraceNotImplemented("ControllerMainMenu.LoadGame()")
    End Method

    Method PassFocusToNextController: Void()
        Debug.TraceNotImplemented("ControllerMainMenu.PassFocusToNextController()")
    End Method

    Method RegainFocus: Void()
        Debug.TraceNotImplemented("ControllerMainMenu.RegainFocus()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerMainMenu.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerMainMenu.Update()")
    End Method

End Class
