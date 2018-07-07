'Strict

Import monkey.map
Import monkey.math
Import mojo.graphics
Import level
Import logger
Import spriteinitdata
Import tweenable

Class Sprite Extends Tweenable

    Global currentScaleFactor: Float
    Global currentScaleXOff: Int
    Global currentScaleYOff: Int
    Global debugDumpRender: Bool
    Global imageInitData: StringMap<SpriteInitData> = New StringMap<SpriteInitData>()
    Global imageMap: StringMap<Image> = New StringMap<Image>()
    Global modErrorImageName: String
    Global newAlphaDrawVal: Float
    Global scaleToFitScreen: Bool
    Global sourceImageMap: StringMap<Image> = New StringMap<Image>()
    Global textMap: Object

    Function DrawSpriteText: Void(str: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Sprite.DrawSpriteText(Int, Int, Int)")
    End Function

    Function GetNextTempImageName: Int()
        Debug.TraceNotImplemented("Sprite.GetNextTempImageName()")
    End Function

    Function LoadImageFromPath: Image(p: String, allowMod: Bool)
        Debug.TraceNotImplemented("Sprite.LoadImageFromPath(String, Bool)")
    End Function

    Function ReloadAllSprites: Bool()
        Debug.TraceNotImplemented("Sprite.ReloadAllSprites()")
    End Function

    Function RenderAll: Void(captureFrame: Bool, frameNum: Int)
        Debug.TraceNotImplemented("Sprite.RenderAll(Bool, Int)")
    End Function

    Function RenderFrameCapture: Void(frameNum: Int, isReplay: Bool)
        Debug.TraceNotImplemented("Sprite.RenderFrameCapture(Int, Bool)")
    End Function

    Function UpdateImageMap: Bool(path: String, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int, checkDimensions: Bool)
        Debug.TraceNotImplemented("Sprite.UpdateImageMap(String, Int, Int, Int, Int, Bool)")
    End Function

    Function _EditorFix: Void() End

    Method New(p: String, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int)
        'Self.InitSprite(p, frameWidth, frameHeight, frameCount, flags)
    End Method

    Method New(p: String, frames: Int, flags: Int)
        'Self.InitSprite(p, 0, 0, frames, flags)
    End Method

    Method New(img: Image)
        'Self.InitSprite(img)
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
        Debug.TraceNotImplemented("Sprite.Draw(Float, Float, Int, Int, Int, Int, Int)")
    End Method

    Method FlipX: Void(f: Bool, withOffset: Bool)
        Self.flipX = f
        Self.flipXWithOffset = withOffset
    End Method

    Method FlipY: Void(f: Bool, withOffset: Bool)
        Debug.TraceNotImplemented("Sprite.FlipY(Bool, Bool)")
    End Method

    Method GetAlphaValue: Float()
        Return Self.alpha
    End Method

    Method GetFrame: Int()
        Debug.TraceNotImplemented("Sprite.GetFrame()")
    End Method

    Method GetImage: Image()
        Return Sprite.imageMap.Get(Self.path)
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
        Debug.TraceNotImplemented("Sprite.InitSprite(Int)")
    End Method

    Method InitSprite: Void(img: Image)
        Debug.TraceNotImplemented("Sprite.InitSprite(Image)")
    End Method

    Method InitSprite: Void(p: String, frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int)
        If p = ""
            Debug.WriteLine("INITSPRITE ERROR: Path is null, ")
            Throw New Throwable()
        End If

        Self.path = p

        Local initData := New SpriteInitData(frameWidth, frameHeight, frameCount, flags)
        Sprite.imageInitData.Set(p, initData)

        If Not Sprite.sourceImageMap.Contains(p)
            Sprite.LoadImageFromPath(p, True)
        End If

        If Not Sprite.UpdateImageMap(p, frameWidth, frameHeight, frameCount, flags, True)
            Level.ShowModPopup(Sprite.modErrorImageName)
            Debug.WriteLine("Trying to fall back to loading without the mod of image")

            Sprite.LoadImageFromPath(p, False)
            If Not Sprite.UpdateImageMap(p, frameWidth, frameHeight, frameCount, flags, True)
                Debug.WriteLine("ERROR: Even bypassing mod, still could not load image")
            End If
        End If
        Debug.TraceNotImplemented("Sprite.InitSprite()")
    End Method

    Method InWorld: Void(world: Bool) Property
        Self.inWorld = world
    End Method

    Method SetAlphaTweenFromCurrent: Void(finalVal: Float, duration: Int)
        Self.SetAlphaTween(Self.alpha, finalVal, duration)
    End Method

    Method SetAlphaValue: Void(a: Float)
        Self.alpha = math.Clamp(a, 0.0, 1.0)
    End Method

    Method SetCutoffY: Void(cY: Int)
        Debug.TraceNotImplemented("Sprite.SetCutoffY(Int)")
    End Method

    Method SetFlipXOff: Void(x: Int)
        Debug.TraceNotImplemented("Sprite.SetFlipXOff(Int)")
    End Method

    Method SetFrame: Void(f: Int)
        'Debug.TraceNotImplemented("Sprite.SetFrame()")
    End Method

    Method SetHandle: Void(xVal: Int, yVal: Int)
        'Self.GetImage().SetHandle(xVal, yVal)
        Debug.TraceNotImplemented("Sprite.SetHandle(Int, Int)")
    End Method

    Method SetRotation: Void(r: Float)
        Debug.TraceNotImplemented("Sprite.SetRotation(Float)")
    End Method

    Method SetScale: Void(scaleVal: Float)
        Debug.TraceNotImplemented("Sprite.SetScale(Float)")
    End Method

    Method SetScaleX: Void(sX: Float)
        Debug.TraceNotImplemented("Sprite.SetScaleX(Float)")
    End Method

    Method SetScaleY: Void(sY: Float)
        Debug.TraceNotImplemented("Sprite.SetScaleY(Float)")
    End Method

    Method SetZ: Void(zVal: Float)
        Self.zSet = True
        Self.z = zVal
    End Method

    Method SetZOff: Void(zVal: Float)
        Self.zOff = zVal
    End Method

    Method SkipNextDraw: Void()
        Debug.TraceNotImplemented("Sprite.SkipNextDraw()")
    End Method

    Method ToggleFlipY: Void()
        Debug.TraceNotImplemented("Sprite.ToggleFlipY()")
    End Method

    Method UnsetCutoffY: Void()
        Self.cutoffYSet = False
    End Method

    Method UnSetZ: Void()
        Self.zSet = False
        Self.z = 0.0
    End Method

    Method Width: Int()
        Debug.TraceNotImplemented("Sprite.Width()")
    End Method

End Class
