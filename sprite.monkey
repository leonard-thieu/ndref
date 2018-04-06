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
    End Function

    Function GetNextTempImageName: Int()
    End Function

    Function LoadImageFromPath: Object(p: Int, allowMod: Bool)
    End Function

    Function ReloadAllSprites: Bool()
    End Function

    Function RenderAll: Void(captureFrame: Bool, frameNum: Int)
    End Function

    Function RenderFrameCapture: Void(frameNum: Int, isReplay: Bool)
    End Function

    Function UpdateImageMap: Bool(path: Int, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int, checkDimensions: Bool)
    End Function

    Function _EditorFix() End

    Method New(p: String, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int)
    End Method

    Method New(p: String, frames: Int, flags: Int)
    End Method

    Method DiscardTempImage: Void()
    End Method

    Method Draw: Void(x: Float, y: Float, frameOverride: Int, sX: Int, sY: Int, sW: Int, sH: Int)
    End Method

    Method FlipX: Void(f: Bool, withOffset: Bool)
    End Method

    Method FlipY: Void(f: Bool, withOffset: Bool)
    End Method

    Method GetAlphaValue: Float()
    End Method

    Method GetFrame: Int()
    End Method

    Method GetImage: Object()
    End Method

    Method GetNumFrames: Int()
    End Method

    Method GetZOff: Float()
    End Method

    Method Height: Int()
    End Method

    Method InitSprite: Void(p: Int)
    End Method

    Method InitSprite: Void(img: Object)
    End Method

    Method InitSprite: Void(p: String, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int)
    End Method

    Method InWorld: Void(world: Bool)
    End Method

    Method SetAlphaTweenFromCurrent: Void(finalVal: Float, duration: Int)
    End Method

    Method SetAlphaValue: Void(a: Float)
    End Method

    Method SetCutoffY: Void(cY: Int)
    End Method

    Method SetFlipXOff: Void(x: Int)
    End Method

    Method SetFrame: Void(f: Int)
    End Method

    Method SetHandle: Void(xVal: Int, yVal: Int)
    End Method

    Method SetRotation: Void(r: Float)
    End Method

    Method SetScale: Void(scaleVal: Float)
    End Method

    Method SetScaleX: Void(sX: Float)
    End Method

    Method SetScaleY: Void(sY: Float)
    End Method

    Method SetZ: Void(zVal: Float)
    End Method

    Method SetZOff: Void(zVal: Float)
    End Method

    Method SkipNextDraw: Void()
    End Method

    Method ToggleFlipY: Void()
    End Method

    Method UnsetCutoffY: Void()
    End Method

    Method UnSetZ: Void()
    End Method

    Method Width: Int()
    End Method

    Method NoTrim: Void()
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
