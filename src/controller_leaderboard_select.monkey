'Strict

Import controller
Import controller_game
Import guiborder
Import logger
Import optionlist
Import sprite
Import textlabel
Import textsprite

Class ControllerLeaderboardSelect Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerLeaderboardSelect.New(Object)")
    End Method

    Field cGame: ControllerGame
    Field overlayBlack: Sprite
    Field pausedText: TextSprite
    Field gui: OptionList
    Field dailyText: TextLabel
    Field hardcoreText: TextLabel
    Field speedrunText: TextLabel
    Field seededText: TextLabel
    Field seededSpeedrunText: TextLabel
    Field exitText: TextLabel
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerLeaderboardSelect.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerLeaderboardSelect.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerLeaderboardSelect.Render()")
    End Method

End Class
