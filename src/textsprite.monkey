'Strict

Import monkey.list
Import logger
Import sprite

Class TextSprite

    Global localizationXML: Object

    Function Init: Void()
        Debug.TraceNotImplemented("TextSprite.Init()")
    End Function

    Function _EditorFix: Void() End

    Method New(j: Int, sc: Float, c: Int, z: Int, shad: Bool, shadC: Int, sOffX: Int, sOffY: Int)
        Self.justification = j
        Self.scaleVal = sc
        Self.color = c
        Self.zVal = z
        Self.showShadow = shad
        Self.shadowColor = shadC
        Self.shadowOffX = sOffX
        Self.shadowOffY = sOffY

        If (sc Mod 3.0) = 0.0
            Self.fontScale = 3
            Self.scaleVal /= 3.0
        Else If (sc Mod 2.0) = 0.0
            Self.fontScale = 2
            Self.scaleVal /= 2.0
        End If
    End Method

    Method New(j: Int, sc: Float, c: Int, z: Int)
        Self.justification = j
        Self.scaleVal = sc
        Self.color = c
        Self.zVal = z
    End Method

    Method New(j: Int, sc: Float)
        Self.justification = j
        Self.scaleVal = sc
    End Method

    Method New(j: Int)
        Self.justification = j
    End Method

    Field justification: Int
    Field scaleVal: Float = 1.0
    Field color: Int = -1
    Field zVal: Int = 10000
    Field showShadow: Bool = True
    Field shadowColor: Int = $FF000000
    Field shadowOffX: Int = 1
    Field shadowOffY: Int = 1
    Field fontScale: Int = 1
    Field containedText: String = "SOME_NONSENSE_GARBAGE_%*(#$*@"
    Field textLanguage: String
    Field containedSprites: List<Sprite> = New List<Sprite>()
    Field containedSpriteShadows: List<Sprite> = New List<Sprite>()
    Field xOffLocalization: Int
    Field yOffLocalization: Int
    Field overallYOffLocalization: Int
    Field scaleLocalization: Float = 1.0

    Method Discard: Void()
        Debug.TraceNotImplemented("TextSprite.Discard()")
    End Method

    Method Draw: Void(x: Float, y: Float, frameOverride: Int)
        Debug.TraceNotImplemented("TextSprite.Draw(Float, Float, Int)")
    End Method

    Method DrawSprites: Float(sprites: Object, x: Float, y: Float, frameOverride: Int, dryRun: Bool)
        Debug.TraceNotImplemented("TextSprite.DrawSprites(Object, Float, Float, Int, Bool)")
    End Method

    Method DrawText: Void(t: Int, x: Float, y: Float, force: Bool, hideInReplays: Bool)
        Debug.TraceNotImplemented("TextSprite.DrawText(Int, Float, Float, Bool, Bool)")
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
        For Local containedSprite := EachIn Self.containedSprites
            containedSprite.InWorld(b)
        End For

        For Local containedSpriteShadow := EachIn Self.containedSpriteShadows
            containedSpriteShadow.InWorld(b)
        End For
    End Method

    Method ScaledWidth: Float()
        Debug.TraceNotImplemented("TextSprite.ScaledWidth()")
    End Method

    Method SetAlphaTweenFromCurrent: Void(finalVal: Float, duration: Int)
        Debug.TraceNotImplemented("TextSprite.SetAlphaTweenFromCurrent(Float, Int)")
    End Method

    Method SetAlphaValue: Void(a: Float)
        Debug.TraceNotImplemented("TextSprite.SetAlphaValue(Float)")
    End Method

    Method SetText: Void(t: String, force: Bool)
        Debug.TraceNotImplemented("TextSprite.SetText(String, Bool)")
    End Method

    Method SetZOff: Void(zOff: Int)
        Debug.TraceNotImplemented("TextSprite.SetZOff(Int)")
    End Method

End Class
