'Strict

Import monkey.list
Import checkbox
Import guicomponent
Import guicontainer
Import logger
Import optionlist
Import textlabel

Class FileChooser Extends GuiComponent

    Function _EditorFix: Void() End

    Method New(c: Object)
        Debug.TraceNotImplemented("FileChooser.New(Object)")
    End Method

    Field cont: GuiContainer
    Field songList: OptionList
    Field defaultText: TextLabel
    Field parentText: TextLabel
    Field pgUpText: TextLabel
    Field songLabels: TextLabel[]
    Field pgDownText: TextLabel
    Field addToPlaylistBox: Checkbox
    Field curPath: String
    Field fileList: List<Object>
    Field fileIndex: Int
    Field songFilenameWithPreservedCase: String[]
    Field visible: Bool
    Field chosenIndex: Int

    Method Discard: Void()
        Debug.TraceNotImplemented("FileChooser.Discard()")
    End Method

    Method Draw4: Void(x: Float, y: Float)
        Debug.TraceNotImplemented("FileChooser.Draw4(Float, Float)")
    End Method

    Method GetFilename: Int()
        Debug.TraceNotImplemented("FileChooser.GetFilename()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("FileChooser.GUICallback(Int, Bool)")
    End Method

    Method PollInput: Void()
        Debug.TraceNotImplemented("FileChooser.PollInput()")
    End Method

    Method Refresh: Void()
        Debug.TraceNotImplemented("FileChooser.Refresh()")
    End Method

    Method Reload: Void()
        Debug.TraceNotImplemented("FileChooser.Reload()")
    End Method

    Method SetVisible: Void(v: Bool)
        Debug.TraceNotImplemented("FileChooser.SetVisible(Bool)")
    End Method

    Method SlashPadPath: Int(p: Int)
        Debug.TraceNotImplemented("FileChooser.SlashPadPath(Int)")
    End Method

End Class
