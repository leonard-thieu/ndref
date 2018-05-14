'Strict

Import gui.controller
Import gui.guiborder
Import gui.optionlist
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerSkin Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerSkin.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field optionsText: TextSprite
    Field gui: OptionList
    Field charBodies: Sprite[]
    Field charHeads: Sprite[]
    Field charLabels: TextLabel[]
    Field skinNames: String[]
    Field exitText: TextLabel
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerSkin.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerSkin.GUICallback(Int, Bool)")
    End Method

    Method ReloadLabel: Void(characterID: Int)
        Debug.TraceNotImplemented("ControllerSkin.ReloadLabel(Int)")
    End Method

    Method ReloadSprites2: Void(characterID: Int)
        Debug.TraceNotImplemented("ControllerSkin.ReloadSprites2(Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerSkin.Render()")
    End Method

End Class
