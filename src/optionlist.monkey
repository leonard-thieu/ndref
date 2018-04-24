'Strict

Import guicomponent
Import guicontainer
Import logger

Class OptionList

    Function _EditorFix: Void() End

    Method New(c: Object, w: Bool, cOff: Int)
        Debug.TraceNotImplemented("OptionList.New(Object, Bool, Int)")
    End Method

    Field cont: GuiContainer
    Field wrap: Bool
    Field callbackOffset: Int
    Field numOptions: Int
    Field options: GuiComponent[]
    Field selectedIndex: Int

    Method Add5: Void(g: Object)
        Debug.TraceNotImplemented("OptionList.Add5(Object)")
    End Method

    Method Cancel: Void()
        Debug.TraceNotImplemented("OptionList.Cancel()")
    End Method

    Method Confirm: Void()
        Debug.TraceNotImplemented("OptionList.Confirm()")
    End Method

    Method GetSelected: Object()
        Debug.TraceNotImplemented("OptionList.GetSelected()")
    End Method

    Method NextOption: Void()
        Debug.TraceNotImplemented("OptionList.NextOption()")
    End Method

    Method PollInput: Void()
        Debug.TraceNotImplemented("OptionList.PollInput()")
    End Method

    Method PrevOption: Void()
        Debug.TraceNotImplemented("OptionList.PrevOption()")
    End Method

    Method SetSelectedIndex: Void(index: Int)
        Debug.TraceNotImplemented("OptionList.SetSelectedIndex(Int)")
    End Method

End Class
