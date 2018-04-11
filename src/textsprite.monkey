'Strict

Import logger

Class TextSprite

    Function _EditorFix: Void() End

    Method New(j: Int, sc: Float, c: Int, z: Int, shad: Bool, shadC: Int, sOffX: Int, sOffY: Int)
        Debug.TraceNotImplemented("TextSprite.New()")
    End Method

    Method Discard: Void()
        Debug.TraceNotImplemented("TextSprite.Discard()")
    End Method

    Method Draw: Void(x: Float, y: Float, frameOverride: Int)
        Debug.TraceNotImplemented("TextSprite.Draw()")
    End Method

    Method DrawSprites: Float(sprites: Object, x: Float, y: Float, frameOverride: Int, dryRun: Bool)
        Debug.TraceNotImplemented("TextSprite.DrawSprites()")
    End Method

    Method DrawText: Void(t: Int, x: Float, y: Float, force: Bool, hideInReplays: Bool)
        Debug.TraceNotImplemented("TextSprite.DrawText()")
    End Method

    Method GetText: Int()
        Debug.TraceNotImplemented("TextSprite.GetText()")
    End Method

    Method GetWidthOffset: Int()
        Debug.TraceNotImplemented("TextSprite.GetWidthOffset()")
    End Method

    Method Height: Int()
        Debug.TraceNotImplemented("TextSprite.Height()")
    End Method

    Method HideInReplays: Void()
        Debug.TraceNotImplemented("TextSprite.HideInReplays()")
    End Method

    Method InWorld: Void(b: Bool)
        Debug.TraceNotImplemented("TextSprite.InWorld()")
    End Method

    Method ScaledWidth: Float()
        Debug.TraceNotImplemented("TextSprite.ScaledWidth()")
    End Method

    Method SetAlphaTweenFromCurrent: Void(finalVal: Float, duration: Int)
        Debug.TraceNotImplemented("TextSprite.SetAlphaTweenFromCurrent()")
    End Method

    Method SetAlphaValue: Void(a: Float)
        Debug.TraceNotImplemented("TextSprite.SetAlphaValue()")
    End Method

    Method SetText: Void(t: Int, force: Bool)
        Debug.TraceNotImplemented("TextSprite.SetText()")
    End Method

    Method SetZOff: Void(zOff: Int)
        Debug.TraceNotImplemented("TextSprite.SetZOff()")
    End Method

    Method NoTrim: Void()
        Discard()
        Draw2(0, 0, 0)
        DrawSprites(Null, 0, 0, 0, False)
        DrawText(0, 0, 0, False, False)
        GetText()
        GetWidthOffset()
        Height()
        HideInReplays()
        InWorld(False)
        ScaledWidth()
        SetAlphaTweenFromCurrent(0, 0)
        SetAlphaValue(0)
        SetText(0, False)
        SetZOff2(0)
    End Method

End Class
