'Strict

Import gui.controller
Import gui.guiborder
Import gui.optionlist
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerOptions Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerOptions.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field optionsText: TextSprite
    Field gui: OptionList
    Field gameplayText: TextLabel
    Field audioText: TextLabel
    Field graphicsText: TextLabel
    Field reassignText: TextLabel
    Field calibrateText: TextLabel
    Field soundtrackText: TextLabel
    Field skinText: TextLabel
    Field languageText: TextLabel
    Field exitText: TextLabel
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerOptions.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerOptions.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerOptions.Render()")
    End Method

End Class
