'Strict

Import gui.guicomponent
Import logger
Import textsprite

Class TextLabel Extends GuiComponent

    Function _EditorFix: Void() End

    Method New(t: String, j: Int, sc: Float, left: Bool)
        Debug.TraceNotImplemented("TextLabel.New(String, Int, Float, Bool)")
    End Method

    Field justification: Int
    Field normalSpr: TextSprite
    Field selectedSpr: TextSprite
    Field allowLeft: Bool

    Method Discard: Void()
        Debug.TraceNotImplemented("TextLabel.Discard()")
    End Method

    Method Draw2: Void(x: Float, y: Float, frameOverride: Int)
        Debug.TraceNotImplemented("TextLabel.Draw2(Float, Float, Int)")
    End Method

    Method GetLocalizationXOffset: Int()
        Debug.TraceNotImplemented("TextLabel.GetLocalizationXOffset()")
    End Method

    Method GetLocalizationYOffset: Int()
        Debug.TraceNotImplemented("TextLabel.GetLocalizationYOffset()")
    End Method

    Method GetText: Int()
        Debug.TraceNotImplemented("TextLabel.GetText()")
    End Method

    Method IsActive: Bool()
        Debug.TraceNotImplemented("TextLabel.IsActive()")
    End Method

    Method Left: Bool()
        Debug.TraceNotImplemented("TextLabel.Left()")
    End Method

    Method SelectifyText: Int(t: Int)
        Debug.TraceNotImplemented("TextLabel.SelectifyText(Int)")
    End Method

    Method SetActive: Void(a: Bool)
        Debug.TraceNotImplemented("TextLabel.SetActive(Bool)")
    End Method

    Method SetLocalizationOffset: Void(xOff: Int, yOff: Int)
        Debug.TraceNotImplemented("TextLabel.SetLocalizationOffset(Int, Int)")
    End Method

    Method SetText: TextLabel(t: String)
        Debug.TraceNotImplemented("TextLabel.SetText(String)")
    End Method

End Class
