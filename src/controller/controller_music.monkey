'Strict

Import controller
Import controller.controller_beat
Import gui.checkbox
Import gui.filechooser
Import gui.guiborder
Import gui.optionlist
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerMusic Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerMusic.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field musicText: TextSprite
    Field musicText2: TextSprite
    Field musicText3: TextSprite
    Field musicText4: TextSprite
    Field musicText5: TextSprite
    Field processingText: TextSprite
    Field acknowledgementText: TextSprite
    Field gui: OptionList
    Field songLabels: TextLabel[]
    Field modeText: TextLabel
    Field exitText: TextLabel
    Field gui2: OptionList
    Field chooseText: TextLabel
    Field defaultText: TextLabel
    Field doubleSpeedBox: Checkbox
    Field halfSpeedBox: Checkbox
    Field manualBeatLabel: TextLabel
    Field backText: TextLabel
    Field fileChooser: FileChooser
    Field songSelected: Bool
    Field filebrowserResult: String
    Field wasFullscreen: Bool
    Field songIndex: Int
    Field useFilebrowser: Bool
    Field processStep: Int
    Field gui2Active: Bool
    Field border: GuiBorder
    Field cBeat: ControllerBeat

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerMusic.Destructor()")
    End Method

    Method GetBaseTextForIndex: Int(index: Int)
        Debug.TraceNotImplemented("ControllerMusic.GetBaseTextForIndex(Int)")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerMusic.GUICallback(Int, Bool)")
    End Method

    Method ProcessCustomSong: Void(filepath: Int, filename: Int)
        Debug.TraceNotImplemented("ControllerMusic.ProcessCustomSong(Int, Int)")
    End Method

    Method RefreshModeText: Void()
        Debug.TraceNotImplemented("ControllerMusic.RefreshModeText()")
    End Method

    Method RegainFocus: Void()
        Debug.TraceNotImplemented("ControllerMusic.RegainFocus()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerMusic.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerMusic.Update()")
    End Method

End Class
