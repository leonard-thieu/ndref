Strict

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
        Throw New Throwable()
    End Function

    Function GetNextTempImageName: Int()
        Throw New Throwable()
    End Function

    Function LoadImageFromPath: Object(p: Int, allowMod: Bool)
        Throw New Throwable()
    End Function

    Function ReloadAllSprites: Bool()
        Throw New Throwable()
    End Function

    Function RenderAll: Void(captureFrame: Bool, frameNum: Int)
        Throw New Throwable()
    End Function

    Function RenderFrameCapture: Void(frameNum: Int, isReplay: Bool)
        Throw New Throwable()
    End Function

    Function UpdateImageMap: Bool(path: Int, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int, checkDimensions: Bool)
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

    Method New(p: String, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int)
        Throw New Throwable()
    End Method

    Method New(p: String, frames: Int, flags: Int)
        Throw New Throwable()
    End Method

    Method DiscardTempImage: Void()
        Throw New Throwable()
    End Method

    Method Draw: Void(x: Float, y: Float, frameOverride: Int, sX: Int, sY: Int, sW: Int, sH: Int)
        Throw New Throwable()
    End Method

    Method FlipX: Void(f: Bool, withOffset: Bool)
        Throw New Throwable()
    End Method

    Method FlipY: Void(f: Bool, withOffset: Bool)
        Throw New Throwable()
    End Method

    Method GetAlphaValue: Float()
        Throw New Throwable()
    End Method

    Method GetFrame: Int()
        Throw New Throwable()
    End Method

    Method GetImage: Object()
        Throw New Throwable()
    End Method

    Method GetNumFrames: Int()
        Throw New Throwable()
    End Method

    Method GetZOff: Float()
        Throw New Throwable()
    End Method

    Method Height: Int()
        Throw New Throwable()
    End Method

    Method InitSprite: Void(p: Int)
        Throw New Throwable()
    End Method

    Method InitSprite: Void(img: Object)
        Throw New Throwable()
    End Method

    Method InitSprite: Void(p: String, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int)
        Throw New Throwable()
    End Method

    Method InWorld: Void(world: Bool)
        Throw New Throwable()
    End Method

    Method SetAlphaTweenFromCurrent: Void(finalVal: Float, duration: Int)
        Throw New Throwable()
    End Method

    Method SetAlphaValue: Void(a: Float)
        Throw New Throwable()
    End Method

    Method SetCutoffY: Void(cY: Int)
        Throw New Throwable()
    End Method

    Method SetFlipXOff: Void(x: Int)
        Throw New Throwable()
    End Method

    Method SetFrame: Void(f: Int)
        Throw New Throwable()
    End Method

    Method SetHandle: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Method SetRotation: Void(r: Float)
        Throw New Throwable()
    End Method

    Method SetScale: Void(scaleVal: Float)
        Throw New Throwable()
    End Method

    Method SetScaleX: Void(sX: Float)
        Throw New Throwable()
    End Method

    Method SetScaleY: Void(sY: Float)
        Throw New Throwable()
    End Method

    Method SetZ: Void(zVal: Float)
        Throw New Throwable()
    End Method

    Method SetZOff: Void(zVal: Float)
        Throw New Throwable()
    End Method

    Method SkipNextDraw: Void()
        Throw New Throwable()
    End Method

    Method ToggleFlipY: Void()
        Throw New Throwable()
    End Method

    Method UnsetCutoffY: Void()
        Throw New Throwable()
    End Method

    Method UnSetZ: Void()
        Throw New Throwable()
    End Method

    Method Width: Int()
        Throw New Throwable()
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
