'Strict

Import gui.controller
Import gui.guiborder
Import gui.optionlist
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerPopUp Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Controller, pText: String, pText2: String, pText3: String, option1: String, option2: String, opt1Default: Bool, ignoreInpt: Bool, pText4: String)
        Super.New()

        Self.cachedScaleVal = Sprite.scaleToFitScreen
        Sprite.scaleToFitScreen = False

        Self.cGame = game
        Self.option1Default = opt1Default
        Self.option2Exists = option2 <> ""
        Self.popupTextVal = pText
        Self.popupText2Val = pText2
        Self.popupText3Val = pText3
        Self.ignoreInput = ignoreInpt
        Self.popupText4Val = pText4

        Self.overlayBlack = New Sprite("gui/TEMP_overlay_black.png", 1)
        Self.overlayBlack.SetZ(20000.0)
        Self.overlayBlack.InWorld = False

        Self.popupText.zVal = 20002
        Self.popupText2.zVal = 20002

        Self.option1Text.SetText(option1)
        Self.option1Text.selectedSpr.scaleVal *= 1.25

        If Self.option2Exists
            Self.option2Text.SetText(option2)
            Self.option2Text.selectedSpr.scaleVal *= 1.25
        End If

        Self.gui = New OptionList(Self, False, 0)
        Self.gui.Add(Self.option1Text)

        If Self.option2Exists
            Self.gui.Add(Self.option2Text)
        End If
    End Method

    Field cachedScaleVal: Bool
    Field cGame: Controller
    Field option1Default: Bool = True
    Field option2Exists: Bool
    Field popupTextVal: String
    Field popupText2Val: String
    Field popupText3Val: String
    Field popupText4Val: String
    Field ignoreInput: Bool
    Field overlayBlack: Sprite
    Field popupText: TextSprite = New TextSprite(2, 2.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field popupText2: TextSprite = New TextSprite(2, 2.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
    Field option1Text: TextLabel = New TextLabel("DEFAULT1", 2, 2.0, False)
    Field option2Text: TextLabel = New TextLabel("DEFAULT2", 2, 2.0, False)
    Field gui: OptionList
    Field retval: Int = -1
    Field bestiaryImage: Sprite
    Field border: GuiBorder = New GuiBorder(460, 180, 0, 0)

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerPopUp.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerPopUp.GUICallback(Int, Bool)")
    End Method

    Method RegainFocus: Void()
        Debug.TraceNotImplemented("ControllerPopUp.RegainFocus()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerPopUp.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerPopUp.Update()")
    End Method

End Class
