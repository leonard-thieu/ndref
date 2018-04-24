'Strict

Import controller
Import guiborder
Import logger
Import optionlist
Import sprite
Import textlabel
Import textsprite

Class ControllerPopUp Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object, pText: Int, pText2: Int, pText3: Int, option1: Int, option2: Int, opt1Default: Bool, ignoreInpt: Bool, pText4: Int)
        Debug.TraceNotImplemented("ControllerPopUp.New(Object, Int, Int, Int, Int, Int, Bool, Bool, Int)")
    End Method

    Field cachedScaleVal: Bool
    Field cGame: Controller
    Field option1Default: Bool
    Field option2Exists: Bool
    Field popupTextVal: String
    Field popupText2Val: String
    Field popupText3Val: String
    Field popupText4Val: String
    Field ignoreInput: Bool
    Field overlayBlack: Sprite
    Field popupText: TextSprite
    Field popupText2: TextSprite
    Field option1Text: TextLabel
    Field option2Text: TextLabel
    Field gui: OptionList
    Field retval: Int
    Field bestiaryImage: Sprite
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerPopUp.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerPopUp.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerPopUp.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerPopUp.Update()")
    End Method

End Class
