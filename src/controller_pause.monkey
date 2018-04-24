'Strict

Import controller
Import controller_game
Import guiborder
Import logger
Import optionlist
Import sprite
Import textlabel
Import textsprite

Class ControllerPause Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerPause.New(Object)")
    End Method

    Field cGame: ControllerGame
    Field quickRestartActive: Bool
    Field quitToLobbyActive: Bool
    Field exitActive: Bool
    Field lobbyText: TextLabel
    Field overlayBlack: Sprite
    Field pausedText: TextSprite
    Field seedText: TextSprite
    Field lowPercentText: TextSprite
    Field gui: OptionList
    Field continueText: TextLabel
    Field leaderboardsText: TextLabel
    Field replaysText: TextLabel
    Field optionsText: TextLabel
    Field musicText: TextLabel
    Field modsText: TextLabel
    Field quickRestartText: TextLabel
    Field exitText: TextLabel
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerPause.Destructor()")
    End Method

    Method ExitGame: Void()
        Debug.TraceNotImplemented("ControllerPause.ExitGame()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerPause.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerPause.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerPause.Update()")
    End Method

End Class
