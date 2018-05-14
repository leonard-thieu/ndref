'Strict

Import gui.textlabel
Import logger
Import sprite

Class Slider Extends TextLabel

    Function _EditorFix: Void() End

    Method New(v: Float, t: Int, j: Int, sc: Float)
        Debug.TraceNotImplemented("Slider.New(Float, Int, Int, Float)")
    End Method

    Field sliderVal: Float
    Field sliderTrack: Sprite
    Field sliderKnob: Sprite

    Method Draw2: Void(x: Float, y: Float, frameOverride: Int)
        Debug.TraceNotImplemented("Slider.Draw2(Float, Float, Int)")
    End Method

    Method Left: Bool()
        Debug.TraceNotImplemented("Slider.Left()")
    End Method

    Method Right: Bool()
        Debug.TraceNotImplemented("Slider.Right()")
    End Method

End Class
