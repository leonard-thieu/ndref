'Strict

Import gui.textlabel
Import logger
Import sprite

Class Checkbox Extends TextLabel

    Function _EditorFix: Void() End

    Method New(c: Bool, t: Int, j: Int, sc: Float)
        Debug.TraceNotImplemented("Checkbox.New(Bool, Int, Int, Float)")
    End Method

    Field checked: Bool
    Field scale: Float
    Field checkboxSpr: Sprite

    Method Draw2: Void(x: Float, y: Float, frameOverride: Int)
        Debug.TraceNotImplemented("Checkbox.Draw2(Float, Float, Int)")
    End Method

    Method Right: Bool()
        Debug.TraceNotImplemented("Checkbox.Right()")
    End Method

End Class
