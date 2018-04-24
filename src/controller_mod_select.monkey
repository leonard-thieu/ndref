'Strict

Import controller
Import controller_game
Import guiborder
Import logger
Import optionlist
Import sprite
Import textlabel
Import textsprite

Class ControllerModSelect Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerModSelect.New(Object)")
    End Method

    Field cGame: ControllerGame
    Field overlayBlack: Sprite
    Field pausedText: TextSprite
    Field infoText: TextSprite
    Field gui: OptionList
    Field playText: TextLabel
    Field publishText: TextLabel
    Field stopText: TextLabel
    Field exitText: TextLabel
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerModSelect.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerModSelect.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerModSelect.Render()")
    End Method

End Class
