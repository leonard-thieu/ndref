'Strict

Import controller
Import guiborder
Import logger
Import sprite
Import textinput
Import textsprite

Class ControllerInputPopup Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object, txt1: Int, txt2: Int, dbg: Bool)
        Debug.TraceNotImplemented("ControllerInputPopup.New(Object, Int, Int, Bool)")
    End Method

    Field result: String
    Field cGame: Controller
    Field text1: String
    Field text2: String
    Field isDebug: Bool
    Field inputText: TextInput
    Field inputText2: TextInput
    Field overlayBlack: Sprite
    Field popupText: TextSprite
    Field popupText2: TextSprite
    Field useInput2: Bool
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerInputPopup.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerInputPopup.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerInputPopup.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerInputPopup.Update()")
    End Method

End Class
