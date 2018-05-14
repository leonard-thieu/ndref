'Strict

Import gui.checkbox
Import gui.controller
Import gui.guiborder
Import gui.optionlist
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerGraphicsOptions Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerGraphicsOptions.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field optionsText: TextSprite
    Field multiplierText: TextLabel
    Field gui: OptionList
    Field fullscreenBox: Checkbox
    Field enableVSync: Checkbox
    Field enableHUDHeart: Checkbox
    Field enableHUDBeatBars: Checkbox
    Field enableScreenShake: Checkbox
    Field enableSpeedrunTimer: Checkbox
    Field enableDiscoFloor: Checkbox
    Field enablePostDeathReplay: Checkbox
    Field enableParticles: Checkbox
    Field resolutionText: TextLabel
    Field exitText: TextLabel
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerGraphicsOptions.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerGraphicsOptions.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerGraphicsOptions.Render()")
    End Method

    Method UpdateMultiplierText: Void()
        Debug.TraceNotImplemented("ControllerGraphicsOptions.UpdateMultiplierText()")
    End Method

End Class
