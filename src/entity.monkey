Strict

Import monkey.list
Import image
Import particles
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
    Global deadEntityList: List<Entity> = New List<Entity>()
    Global entityList: List<Entity> = New List<Entity>()

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
        Self.entityNum = Entity.entityCount
        Entity.entityList.AddLast(Self)

        Self.lastX = Self.x
        Self.lastY = Self.y
    End Method

    Field confusedParticles: ParticleSystem
    Field image: Sprite
    Field shadow: Sprite
    Field yOff: Float
    Field xOff: Float
    Field lastX: Int
    Field lastY: Int
    Field floating: Bool
    Field falling: Bool
    Field frozenDuration: Int
    Field hasBeenVisible: Bool
    Field entityNum: Int = -1
    Field hasSilhouette: Bool = True
    Field ignoreCollisionWhenMoving: Bool
    Field canMoveOntoPlayer: Bool
    Field bounce: Bouncer
    Field ignoreWalls: Bool
    Field isGentle: Bool
    Field friendlyName: String
    Field damagePerHit: Int = 1
    Field hitType: Int
    Field invisible: Bool
    Field hasBeenSilhouetted: Bool
    Field isMysteried: Bool
    Field shadowYOff: Int
    Field flaggedForDeath: Bool
    Field flaggedForDeathCounter: Int
    Field level: Int
    Field xmlName: String
    Field shadowXOff: Int
    Field coinsToDrop: Int = 1
    Field frozenImage: Sprite
    Field frozenPermanently: Bool
    Field overrideAttackSound: String
    Field canBeFrozen: Bool = True
    Field frozenStone: Bool
    Field flickerCurrentTimer: Int
    Field flickerTimer: Int
    Field flickerHide: Bool
    Field wasTeleported: Bool
    Field confusedUntil: Int = -1
    Field isWraithLike: Bool
    Field frozenStoneImage: Sprite
    Field frozenXOff: Int
    Field frozenYOff: Int
    Field waterOffset: Int
    Field deAggroed: Bool
    Field renderSilhouette: Bool
    Field neverSilhouette: Bool
    Field showConfuseOverride: Bool

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
            Local confusedParticles := Self.confusedParticles
            If confusedParticles
                ' TODO: this section
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
