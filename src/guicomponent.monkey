'Strict

Import guicontainer
Import logger

Class GuiComponent Extends GuiContainer

    Function _EditorFix: Void() End

    Field selected: Bool
    Field active: Bool

    Method Right: Bool()
        Debug.TraceNotImplemented("GuiComponent.Right()")
    End Method

    Method SetSelected: Void(s: Bool)
        Debug.TraceNotImplemented("GuiComponent.SetSelected(Bool)")
    End Method

End Class
