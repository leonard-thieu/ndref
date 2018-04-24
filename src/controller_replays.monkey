'Strict

Import monkey.list
Import controller
Import guiborder
Import logger
Import optionlist
Import sprite
Import textlabel
Import textsprite

Class ControllerReplays Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerReplays.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field replayText: TextSprite
    Field replayList: List<Object>
    Field gui: OptionList
    Field pgUpText: TextLabel
    Field replayLabels: TextLabel[]
    Field pgDownText: TextLabel
    Field exitText: TextLabel
    Field replayIndex: Int
    Field replayFilenames: String[]
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerReplays.Destructor()")
    End Method

    Method FormatReplayString: Int(filename: Int)
        Debug.TraceNotImplemented("ControllerReplays.FormatReplayString(Int)")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerReplays.GUICallback(Int, Bool)")
    End Method

    Method Refresh: Void()
        Debug.TraceNotImplemented("ControllerReplays.Refresh()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerReplays.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerReplays.Update()")
    End Method

End Class
