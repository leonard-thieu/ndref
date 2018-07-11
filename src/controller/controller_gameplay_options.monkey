'Strict

Import controller
Import controller.controller_popup
Import gui.checkbox
Import gui.guiborder
Import gui.optionlist
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerGameplayOptions Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerGameplayOptions.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field optionsText: TextSprite
    Field cadenceBody: Sprite
    Field cadenceHead: Sprite
    Field defaultBody: Sprite
    Field defaultHead: Sprite
    Field gui: OptionList
    Field defaultPlayer1Text: TextLabel
    Field defaultCharText: TextLabel
    Field itemHintBox: Checkbox
    Field itemNameBox: Checkbox
    Field showHeartsBox: Checkbox
    Field lobbyBox: Checkbox
    Field diamondBox: Checkbox
    Field pauseBox: Checkbox
    Field cutscenesBox: Checkbox
    Field bossIntrosBox: Checkbox
    Field deleteText: TextLabel
    Field exitText: TextLabel
    Field popUpController: ControllerPopUp
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerGameplayOptions.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerGameplayOptions.GUICallback(Int, Bool)")
    End Method

    Method ReloadSprites: Void()
        Debug.TraceNotImplemented("ControllerGameplayOptions.ReloadSprites()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerGameplayOptions.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerGameplayOptions.Update()")
    End Method

End Class
