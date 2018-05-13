'Strict

Import monkey.list
Import bouncer
Import logger
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
        Debug.TraceNotImplemented("Entity.AnyPlayerHaveCirclet()")
    End Function

    Function AnyPlayerHaveCircletOrGlassTorch: Bool()
        Debug.TraceNotImplemented("Entity.AnyPlayerHaveCircletOrGlassTorch()")
    End Function

    Function AnyPlayerHaveForesightTorch: Bool()
        Debug.TraceNotImplemented("Entity.AnyPlayerHaveForesightTorch()")
    End Function

    Function AnyPlayerHaveGlassTorch: Bool()
        Debug.TraceNotImplemented("Entity.AnyPlayerHaveGlassTorch()")
    End Function

    Function AnyPlayerHaveNazarCharm: Bool()
        Debug.TraceNotImplemented("Entity.AnyPlayerHaveNazarCharm()")
    End Function

    Function AnyPlayerHaveWallsTorch: Bool()
        Debug.TraceNotImplemented("Entity.AnyPlayerHaveWallsTorch()")
    End Function

    Function GetEntityAt: Entity(x: Int, y: Int, includePlayer: Bool)
        Debug.TraceNotImplemented("Entity.GetEntityAt(Int, Int, Bool)")
    End Function

    Function RemoveAnyPerishedEntities: Void()
        Debug.TraceNotImplemented("Entity.RemoveAnyPerishedEntities()")
    End Function

    Function RemoveFromList: Void(entity: Entity)
        Entity.entityList.RemoveEach(entity)
        Entity.deadEntityList.AddLast(entity)
    End Function

    Function RenderAll: Void()
        Debug.TraceNotImplemented("Entity.RenderAll()")
    End Function

    Function UpdateVisibility: Void()
        Debug.TraceNotImplemented("Entity.UpdateVisibility()")
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
        Debug.TraceNotImplemented("Entity.BounceInPlace(Bool)")
    End Method

    Method BounceToward: Void(p: Point, bufferTween: Bool)
        Debug.TraceNotImplemented("Entity.BounceToward(Point, Bool)")
    End Method

    Method CancelTween: Void()
        Debug.TraceNotImplemented("Entity.CancelTween()")
    End Method

    Method CheckRingOfShadows: Bool()
        Debug.TraceNotImplemented("Entity.CheckRingOfShadows()")
    End Method

    Method Die: Void()
        If Not Self.dead
            If Self.confusedParticles
                Self.confusedParticles.visible = False
                Self.confusedParticles.active = False
            End If

            Entity.RemoveFromList(Self)

            Super.Die()
        End If
    End Method

    Method Fall: Void(keepMultiplier: Bool)
        Debug.TraceNotImplemented("Entity.Fall(Bool)")
    End Method

    Method FlagForDeath: Void(numFrames: Int)
        Debug.TraceNotImplemented("Entity.FlagForDeath(Int)")
    End Method

    Method Flicker: Void(duration: Int)
        Debug.TraceNotImplemented("Entity.Flicker(Int)")
    End Method

    Method Freeze: Bool(duration: Int, stone: Bool)
        Debug.TraceNotImplemented("Entity.Freeze(Int, Bool)")
    End Method

    Method IsConfused: Bool()
        Debug.TraceNotImplemented("Entity.IsConfused()")
    End Method

    Method IsFrozen: Bool(ignoreLastBeat: Bool)
        Debug.TraceNotImplemented("Entity.IsFrozen(Bool)")
    End Method

    Method IsInAnyPlayerLineOfSight: Bool()
        Debug.TraceNotImplemented("Entity.IsInAnyPlayerLineOfSight()")
    End Method

    Method IsVisible: Bool()
        Debug.TraceNotImplemented("Entity.IsVisible()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Entity.MoveImmediate(Int, Int, String)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Entity.PerformMovement(Int, Int)")
    End Method

    Method PerformMovement: Int(p: Point)
        Return Self.PerformMovement(p.x, p.y)
    End Method

    Method PerformTween: Void(xVal: Int, yVal: Int, oldX: Int, oldY: Int, tweenType: Int, shadowTweenType: Int, bufferTween: Bool)
        Debug.TraceNotImplemented("Entity.PerformTween(Int, Int, Int, Int, Int, Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Entity.Render()")
    End Method

    Method RenderSprite: Void(img: Sprite)
        Debug.TraceNotImplemented("Entity.RenderSprite(Sprite)")
    End Method

    Method SkipNextDraw: Void()
        Debug.TraceNotImplemented("Entity.SkipNextDraw()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Entity.Update()")
    End Method

End Class
