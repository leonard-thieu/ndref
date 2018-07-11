'Strict

Import controller
Import gui.checkbox
Import gui.guiborder
Import gui.optionlist
Import gui.slider
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerAudioOptions Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerAudioOptions.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field optionsText: TextSprite
    Field gui: OptionList
    Field indexSound: Int
    Field soundSlider: Slider
    Field indexMusic: Int
    Field musicSlider: Slider
    Field indexPreBoss: Int
    Field enablePreBossEffectBox: Checkbox
    Field indexDaoust: Int
    Field enableDaoustVocalsBox: Checkbox
    Field indexExit: Int
    Field exitText: TextLabel
    Field border: GuiBorder
    Field sfxChangeSound: Int

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerAudioOptions.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerAudioOptions.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerAudioOptions.Render()")
    End Method

End Class
