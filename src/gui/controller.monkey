Strict

Import gui.guicontainer

Class Controller Extends GuiContainer Abstract

    Global currentController: Controller

    Function GiveFocus: Void(c: Controller)
        c.parent = Controller.currentController
        Controller.currentController = c
        Controller.currentController.RegainFocus()
    End Function

    Function UpdateCurrent: Void()
        If Controller.currentController <> Null
            Controller.currentController.Update()
        End If
    End Function

    Function UpdateRender: Void()
        If Controller.currentController <> Null
            Controller.currentController.Render()
        End If
    End Function

    Function _EditorFix: Void() End

    Method New()
        Self.parent = Controller.currentController
        Controller.currentController = Self
    End Method

    Field parent: Controller

    Method RegainFocus: Void() Abstract

    Method Update: Void() Abstract

    Method Render: Void() Abstract

    Method Suspend: Void()
        ' Empty implementation
    End Method

    Method Resume: Void()
        ' Empty implementation
    End Method

    Method Destructor: Void() Abstract

    Method ReleaseFocus: Void()
        Controller.currentController = Self.parent
        Self.Destructor()
        Controller.currentController.RegainFocus()
    End Method

    Method HasFocus: Bool()
        Return Controller.currentController = Self
    End Method

End Class
