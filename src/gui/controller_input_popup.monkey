'Strict

Import gui.controller
Import gui.guiborder
Import gui.textinput
Import logger
Import sprite
Import textsprite

Class ControllerInputPopup Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Controller, txt1: String, txt2: String, dbg: Bool)
        Super.New()

        Self.cGame = game
        Self.text1 = txt1
        Self.text2 = txt2
        Self.isDebug = dbg

        If dbg
            Self.inputText = New TextInput("", 2, 2.0, 100)
            Self.inputText2 = New TextInput("", 2, 2.0, 100)
        Else
            Self.inputText = New TextInput("", 2, 2.0, 10)
            Self.inputText2 = New TextInput("", 2, 2.0, 100)
        End If

        Self.overlayBlack = New Sprite("gui/TEMP_overlay_black.png", 1)
        Self.overlayBlack.SetZ(20000.0)
        Self.overlayBlack.InWorld = False

        Self.popupText = 20002
        Self.popupText2 = 20002
    End Method

    Field result: String
    Field cGame: Controller
    Field text1: String
    Field text2: String
    Field isDebug: Bool
    Field inputText: TextInput
    Field inputText2: TextInput
    Field overlayBlack: Sprite
    Field popupText: TextSprite = New TextSprite(2, 2.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field popupText2: TextSprite = New TextSprite(2, 2.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field useInput2: Bool
    Field border: GuiBorder = New GuiBorder(460, 180, 0, 0)

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerInputPopup.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerInputPopup.GUICallback(Int, Bool)")
    End Method

    Method RegainFocus: Void()
        Debug.TraceNotImplemented("ControllerInputPopup.RegainFocus()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerInputPopup.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerInputPopup.Update()")
    End Method

End Class
