'Strict

Import logger
Import tweenable

Class Sprite Extends Tweenable

    Global currentScaleFactor: Float
    Global currentScaleXOff: Int
    Global currentScaleYOff: Int
    Global debugDumpRender: Bool
    Global imageInitData: Object
    Global imageMap: Object
    Global newAlphaDrawVal: Float
    Global scaleToFitScreen: Bool
    Global sourceImageMap: Object
    Global textMap: Object

    Function DrawSpriteText: Void(str: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Sprite.DrawSpriteText()")
    End Function

    Function GetNextTempImageName: Int()
        Debug.TraceNotImplemented("Sprite.GetNextTempImageName()")
    End Function

    Function LoadImageFromPath: Object(p: Int, allowMod: Bool)
        Debug.TraceNotImplemented("Sprite.LoadImageFromPath()")
    End Function

    Function ReloadAllSprites: Bool()
        Debug.TraceNotImplemented("Sprite.ReloadAllSprites()")
    End Function

    Function RenderAll: Void(captureFrame: Bool, frameNum: Int)
        Debug.TraceNotImplemented("Sprite.RenderAll()")
    End Function

    Function RenderFrameCapture: Void(frameNum: Int, isReplay: Bool)
        Debug.TraceNotImplemented("Sprite.RenderFrameCapture()")
    End Function

    Function UpdateImageMap: Bool(path: Int, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int, checkDimensions: Bool)
        Debug.TraceNotImplemented("Sprite.UpdateImageMap()")
    End Function

    Function _EditorFix: Void() End

    Method New(p: String, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int)
        Self.InitSprite(p, frameWidth, frameHeight, frameCount, flags)
    End Method

    Method New(p: String, frames: Int, flags: Int)
        Debug.TraceNotImplemented("Sprite.New(p()")
    End Method

    Field path: String
    Field zSet: Bool
    Field z: Float
    Field inWorld: Bool = True
    Field isLocalizedText: Bool
    Field srcX: Int
    Field srcW: Int
    Field srcH: Int
    Field xOffLocalization: Int
    Field scaleX: Float = 1.0
    Field scaleY: Float = 1.0
    Field zOff: Float
    Field frame: Int
    Field flipX: Bool
    Field flipXWithOffset: Bool = True
    Field flipXOff: Int
    Field flipY: Bool
    Field flipYWithOffset: Bool
    Field alpha: Float = 1.0
    Field renderX: Float
    Field renderLastX: Float
    Field renderY: Float
    Field renderLastY: Float
    Field srcY: Int
    Field cutoffYSet: Bool
    Field cutoffXSet: Bool
    Field cutoffX: Int
    Field cutoffY: Int
    Field skipNextDraw: Bool
    Field rotation: Float
    Field blendMode: Int
    Field hideInReplay: Bool

    Method DiscardTempImage: Void()
        Debug.TraceNotImplemented("Sprite.DiscardTempImage()")
    End Method

    Method Draw: Void(x: Float, y: Float, frameOverride: Int, sX: Int, sY: Int, sW: Int, sH: Int)
        Debug.TraceNotImplemented("Sprite.Draw()")
    End Method

    Method FlipX: Void(f: Bool, withOffset: Bool)
        Debug.TraceNotImplemented("Sprite.FlipX()")
    End Method

    Method FlipY: Void(f: Bool, withOffset: Bool)
        Debug.TraceNotImplemented("Sprite.FlipY()")
    End Method

    Method GetAlphaValue: Float()
        Debug.TraceNotImplemented("Sprite.GetAlphaValue()")
    End Method

    Method GetFrame: Int()
        Debug.TraceNotImplemented("Sprite.GetFrame()")
    End Method

    Method GetImage: Object()
        Debug.TraceNotImplemented("Sprite.GetImage()")
    End Method

    Method GetNumFrames: Int()
        Debug.TraceNotImplemented("Sprite.GetNumFrames()")
    End Method

    Method GetZOff: Float()
        Debug.TraceNotImplemented("Sprite.GetZOff()")
    End Method

    Method Height: Int()
        Debug.TraceNotImplemented("Sprite.Height()")
    End Method

    Method InitSprite: Void(p: Int)
        Debug.TraceNotImplemented("Sprite.InitSprite()")
    End Method

    Method InitSprite: Void(img: Object)
        Debug.TraceNotImplemented("Sprite.InitSprite()")
    End Method

    Method InitSprite: Void(p: String, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int)
        Debug.TraceNotImplemented("Sprite.InitSprite()")
    End Method

    Method InWorld: Void(world: Bool)
        Debug.TraceNotImplemented("Sprite.InWorld()")
    End Method

    Method SetAlphaTweenFromCurrent: Void(finalVal: Float, duration: Int)
        Debug.TraceNotImplemented("Sprite.SetAlphaTweenFromCurrent()")
    End Method

    Method SetAlphaValue: Void(a: Float)
        Debug.TraceNotImplemented("Sprite.SetAlphaValue()")
    End Method

    Method SetCutoffY: Void(cY: Int)
        Debug.TraceNotImplemented("Sprite.SetCutoffY()")
    End Method

    Method SetFlipXOff: Void(x: Int)
        Debug.TraceNotImplemented("Sprite.SetFlipXOff()")
    End Method

    Method SetFrame: Void(f: Int)
        Debug.TraceNotImplemented("Sprite.SetFrame()")
    End Method

    Method SetHandle: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Sprite.SetHandle()")
    End Method

    Method SetRotation: Void(r: Float)
        Debug.TraceNotImplemented("Sprite.SetRotation()")
    End Method

    Method SetScale: Void(scaleVal: Float)
        Debug.TraceNotImplemented("Sprite.SetScale()")
    End Method

    Method SetScaleX: Void(sX: Float)
        Debug.TraceNotImplemented("Sprite.SetScaleX()")
    End Method

    Method SetScaleY: Void(sY: Float)
        Debug.TraceNotImplemented("Sprite.SetScaleY()")
    End Method

    Method SetZ: Void(zVal: Float)
        Debug.TraceNotImplemented("Sprite.SetZ()")
    End Method

    Method SetZOff: Void(zVal: Float)
        Debug.TraceNotImplemented("Sprite.SetZOff()")
    End Method

    Method SkipNextDraw: Void()
        Debug.TraceNotImplemented("Sprite.SkipNextDraw()")
    End Method

    Method ToggleFlipY: Void()
        Debug.TraceNotImplemented("Sprite.ToggleFlipY()")
    End Method

    Method UnsetCutoffY: Void()
        Debug.TraceNotImplemented("Sprite.UnsetCutoffY()")
    End Method

    Method UnSetZ: Void()
        Debug.TraceNotImplemented("Sprite.UnSetZ()")
    End Method

    Method Width: Int()
        Debug.TraceNotImplemented("Sprite.Width()")
    End Method

    Method NoTrim: Void()
        Super.NoTrim()
        DrawSpriteText(0, 0, 0)
        GetNextTempImageName()
        LoadImageFromPath(0, False)
        ReloadAllSprites()
        RenderAll(False, 0)
        RenderFrameCapture(0, False)
        UpdateImageMap(0, 0, 0, 0, 0, False)
        DiscardTempImage()
        Draw(0, 0, 0, 0, 0, 0, 0)
        FlipX(False, False)
        FlipY(False, False)
        GetAlphaValue()
        GetFrame()
        GetImage()
        GetNumFrames()
        GetZOff()
        Height()
        InitSprite(0)
        InitSprite(Null)
        InitSprite(0, 0, 0, 0, 0)
        InWorld(False)
        SetAlphaTweenFromCurrent(0, 0)
        SetAlphaValue(0)
        SetCutoffY(0)
        SetFlipXOff(0)
        SetFrame(0)
        SetHandle(0, 0)
        SetRotation(0)
        SetScale(0)
        SetScaleX(0)
        SetScaleY(0)
        SetZ(0)
        SetZOff(0)
        SkipNextDraw()
        ToggleFlipY()
        UnsetCutoffY()
        UnSetZ()
        Width()
    End Method

End Class
