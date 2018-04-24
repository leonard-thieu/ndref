'Strict

Import guicontainer
Import logger

Class Controller Extends GuiContainer

    Global currentController: Object

    Function GiveFocus: Void(c: Object)
        Debug.TraceNotImplemented("Controller.GiveFocus(Object)")
    End Function

    Function _EditorFix: Void() End

    Field parent: Controller

    Method HasFocus: Bool()
        Debug.TraceNotImplemented("Controller.HasFocus()")
    End Method

    Method ReleaseFocus: Void()
        Debug.TraceNotImplemented("Controller.ReleaseFocus()")
    End Method

End Class
