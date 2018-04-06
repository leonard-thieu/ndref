Import monkey.list
Import renderableobject
Import sprite

Class Entity Extends RenderableObject

    Global anyPlayerHaveNazarCharmCached: Bool
    Global anyPlayerHaveNazarCharmCachedFrame: Int
    Global anyPlayerHaveWallsTorchCached: Bool
    Global anyPlayerHaveWallsTorchCachedFrame: Int
    Global anyPlayerHaveForesightTorchCached: Bool
    Global anyPlayerHaveForesightTorchCachedFrame: Int
    Global anyPlayerHaveGlassTorchCached: Bool
    Global anyPlayerHaveGlassTorchCachedFrame: Int
    Global anyPlayerHaveCircletCached: Bool
    Global anyPlayerHaveCircletCachedFrame: Int
    Global entityCount: Int
    Global deadEntityList: List<Entity>
    Global entityList: List<Entity>

    Function AnyPlayerHaveCirclet: Bool()
    End Function

    Function AnyPlayerHaveCircletOrGlassTorch: Bool()
    End Function

    Function AnyPlayerHaveForesightTorch: Bool()
    End Function

    Function AnyPlayerHaveGlassTorch: Bool()
    End Function

    Function AnyPlayerHaveNazarCharm: Bool()
    End Function

    Function AnyPlayerHaveWallsTorch: Bool()
    End Function

    Function GetEntityAt: Entity(x: Int, y: Int, includePlayer: Bool)
    End Function

    Function RemoveAnyPerishedEntities: Void()
    End Function

    Function RemoveFromList(entity: Entity)
        Entity.entityList.RemoveEach(entity)
        Entity.deadEntityList.AddLast(entity)
    End Function

    Function RenderAll: Void()
    End Function

    Function UpdateVisibility: Void()
    End Function

    Function _EditorFix() End

    Method New()
        Super.New()

        Entity.entityCount += 1
        Self.entityCount_ = Entity.entityCount
        Entity.entityList.AddLast(Self)

        Self.x3 = Self.x
        Self.y3 = Self.y
    End Method

    Field field_58: Object
    Field sprite: Sprite
    Field field_60: Int
    Field field_64: Float
    Field field_68: Float
    Field x3: Int
    Field y3: Int
    Field field_74: Bool
    Field field_75: Bool
    Field field_78: Int
    Field field_7C: Bool
    Field entityCount_: Int = -1
    Field field_84: Bool = True
    Field field_85: Bool
    Field field_86: Bool
    Field field_88: Bouncer
    Field field_8C: Bool
    Field field_8D: Bool
    Field field_90: String
    Field field_94: Int = 1
    Field field_98: Int
    Field field_9C: Bool
    Field field_9D: Bool
    Field field_9E: Bool
    Field field_A0: Int
    Field field_A4: Bool
    Field field_A8: Int
    Field field_AC: Int
    Field field_B0: String
    Field field_B4: Int
    Field field_B8: Int = 1
    Field field_BC: Sprite
    Field field_C0: Bool
    Field field_C4: String
    Field field_C8: Bool = True
    Field field_C9: Bool
    Field field_CC: Int
    Field field_D0: Int
    Field field_D4: Bool
    Field field_D5: Bool
    Field field_D8: Int = -1
    Field field_DC: Bool
    Field field_E0: Sprite
    Field field_E4: Int
    Field field_E8: Int
    Field field_EC: Int
    Field field_F0: Bool
    Field field_F1: Bool
    Field field_F2: Bool
    Field field_F3: Bool

    Method BounceInPlace: Void(bufferTween: Bool)
    End Method

    Method BounceToward: Void(p: Point, bufferTween: Bool)
    End Method

    Method CancelTween: Void()
    End Method

    Method CheckRingOfShadows: Bool()
    End Method

    Method Die: Void()
        If Not Self.dead
            Local field_58 := Self.field_58
            If field_58 <> Null
                ' TODO: Determine what field_58 is.
            End If

            Entity.RemoveFromList(Self)

            Super.Die()
        End If
    End Method

    Method Fall: Void(keepMultiplier: Bool)
    End Method

    Method FlagForDeath: Void(numFrames: Int)
    End Method

    Method Flicker: Void(duration: Int)
    End Method

    Method Freeze: Bool(duration: Int, stone: Bool)
    End Method

    Method IsConfused: Bool()
    End Method

    Method IsFrozen: Bool(ignoreLastBeat: Bool)
    End Method

    Method IsInAnyPlayerLineOfSight: Bool()
    End Method

    Method IsVisible: Bool()
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
    End Method

    Method PerformMovement: Int(p: Point)
        Return Self.PerformMovement(p.x, p.y)
    End Method

    Method PerformTween: Void(xVal: Int, yVal: Int, oldX: Int, oldY: Int, tweenType: Int, shadowTweenType: Int, bufferTween: Bool)
    End Method

    Method Render: Void()
    End Method

    Method RenderSprite: Void(img: Sprite)
    End Method

    Method SkipNextDraw: Void()
    End Method

    Method Update: Void()
    End Method

    Method NoTrim: Void()
        AnyPlayerHaveCirclet()
        AnyPlayerHaveCircletOrGlassTorch()
        AnyPlayerHaveForesightTorch()
        AnyPlayerHaveGlassTorch()
        AnyPlayerHaveNazarCharm()
        AnyPlayerHaveWallsTorch()
        GetEntityAt(0, 0, False)
        RemoveAnyPerishedEntities()
        RenderAll()
        UpdateVisibility()
        BounceInPlace(False)
        BounceToward(Null, False)
        CancelTween()
        CheckRingOfShadows()
        Die()
        Fall(False)
        FlagForDeath(0)
        Flicker(0)
        Freeze(0, False)
        IsConfused()
        IsFrozen(False)
        IsInAnyPlayerLineOfSight()
        IsVisible()
        MoveImmediate(0, 0, 0)
        PerformMovement(0, 0)
        PerformMovement(Null)
        PerformTween(0, 0, 0, 0, 0, 0, False)
        Render()
        RenderSprite(Null)
        SkipNextDraw()
        Update()
    End Method

End Class
