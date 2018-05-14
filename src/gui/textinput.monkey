'Strict

Import gui.textlabel
Import logger
Import sprite

Class TextInput Extends TextLabel

    Function _EditorFix: Void() End

    Method New(t: Int, j: Int, sc: Float, size: Int)
        Debug.TraceNotImplemented("TextInput.New(Int, Int, Float, Int)")
    End Method

    Field maxSize: Int
    Field caretSpr: Sprite

    Method Append: Void(c: Int)
        Debug.TraceNotImplemented("TextInput.Append(Int)")
    End Method

    Method Backspace: Void()
        Debug.TraceNotImplemented("TextInput.Backspace()")
    End Method

    Method Discard: Void()
        Debug.TraceNotImplemented("TextInput.Discard()")
    End Method

    Method Draw2: Void(x: Float, y: Float, frameOverride: Int)
        Debug.TraceNotImplemented("TextInput.Draw2(Float, Float, Int)")
    End Method

End Class
