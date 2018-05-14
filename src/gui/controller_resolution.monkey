'Strict

Import gui.controller
Import gui.guiborder
Import gui.optionlist
Import gui.textinput
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerResolution Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerResolution.New(Object)")
    End Method

    Field cGame: Controller
    Field oldWidth: Int
    Field oldHeight: Int
    Field text1: String
    Field text2: String
    Field inputText: TextInput
    Field overlayBlack: Sprite
    Field popupText: TextSprite
    Field popupText2: TextSprite
    Field option1Text: TextLabel
    Field option2Text: TextLabel
    Field gui: OptionList
    Field progressStep: Int
    Field timerStart: Int
    Field width: Int
    Field height: Int
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerResolution.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerResolution.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerResolution.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerResolution.Update()")
    End Method

End Class
