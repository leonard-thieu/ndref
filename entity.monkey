Strict

Import monkey.list
Import renderableobject
Import sprite

Class Entity Extends RenderableObject Abstract

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
        Throw New Throwable()
    End Function

    Function AnyPlayerHaveCircletOrGlassTorch: Bool()
        Throw New Throwable()
    End Function

    Function AnyPlayerHaveForesightTorch: Bool()
        Throw New Throwable()
    End Function

    Function AnyPlayerHaveGlassTorch: Bool()
        Throw New Throwable()
    End Function

    Function AnyPlayerHaveNazarCharm: Bool()
        Throw New Throwable()
    End Function

    Function AnyPlayerHaveWallsTorch: Bool()
        Throw New Throwable()
    End Function

    Function GetEntityAt: Entity(x: Int, y: Int, includePlayer: Bool)
        Throw New Throwable()
    End Function

    Function RemoveAnyPerishedEntities: Void()
        Throw New Throwable()
    End Function

    Function RemoveFromList: Void(entity: Entity)
        Entity.entityList.RemoveEach(entity)
        Entity.deadEntityList.AddLast(entity)
    End Function

    Function RenderAll: Void()
        Throw New Throwable()
    End Function

    Function UpdateVisibility: Void()
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

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
    Field sprite2: Sprite
    Field yOff: Float
    Field xOff: Float
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
        Throw New Throwable()
    End Method

    Method BounceToward: Void(p: Point, bufferTween: Bool)
        Throw New Throwable()
    End Method

    Method CancelTween: Void()
        Throw New Throwable()
    End Method

    Method CheckRingOfShadows: Bool()
        Throw New Throwable()
    End Method

    Method Die: Void()
        If Not Self.dead
            Local field_58 := Self.field_58
            If field_58
                ' TODO: Determine what field_58 is.
            End If

            Entity.RemoveFromList(Self)

            Super.Die()
        End If
    End Method

    Method Fall: Void(keepMultiplier: Bool)
        Throw New Throwable()
    End Method

    Method FlagForDeath: Void(numFrames: Int)
        Throw New Throwable()
    End Method

    Method Flicker: Void(duration: Int)
        Throw New Throwable()
    End Method

    Method Freeze: Bool(duration: Int, stone: Bool)
        Throw New Throwable()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int) Abstract

    Method IsConfused: Bool()
        Throw New Throwable()
    End Method

    Method IsFrozen: Bool(ignoreLastBeat: Bool)
        Throw New Throwable()
    End Method

    Method IsInAnyPlayerLineOfSight: Bool()
        Throw New Throwable()
    End Method

    Method IsVisible: Bool()
        Throw New Throwable()
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Throw New Throwable()
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Method PerformMovement: Int(p: Point)
        Return Self.PerformMovement(p.x, p.y)
    End Method

    Method PerformTween: Void(xVal: Int, yVal: Int, oldX: Int, oldY: Int, tweenType: Int, shadowTweenType: Int, bufferTween: Bool)
        Throw New Throwable()
    End Method

    Method Render: Void()
        Throw New Throwable()
    End Method

    Method RenderSprite: Void(img: Sprite)
        Throw New Throwable()
    End Method

    Method SkipNextDraw: Void()
        Throw New Throwable()
    End Method

    Method Update: Void()
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        Super.NoTrim()
        AnyPlayerHaveCirclet()
        AnyPlayerHaveCircletOrGlassTorch()
        AnyPlayerHaveForesightTorch()
        AnyPlayerHaveGlassTorch()
        AnyPlayerHaveNazarCharm()
        AnyPlayerHaveWallsTorch()
        GetEntityAt(0, 0, False)
        RemoveAnyPerishedEntities()
        RemoveFromList(Null)
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
