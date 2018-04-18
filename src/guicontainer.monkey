'Strict

Import logger

Class GuiContainer

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("GuiContainer.GUICallback()")
    End Method

    Method NoTrim: Void()
        GUICallback(0, False)
    End Method

End Class
