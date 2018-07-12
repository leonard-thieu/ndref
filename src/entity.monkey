'Strict

Import monkey.list
Import level
Import audio2
Import bouncer
Import item
Import logger
Import necrodancergame
Import particles
Import renderableobject
Import sprite
Import tile

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
        If Entity.anyPlayerHaveCircletCachedFrame <> necrodancergame.globalFrameCounter
            Entity.anyPlayerHaveCircletCachedFrame = necrodancergame.globalFrameCounter
            Entity.anyPlayerHaveCircletCached = Player.DoesAnyPlayerHaveItemOfType(ItemType.CircletOfTelepathy, False) Or
                                                Player.DoesAnyPlayerHaveItemOfType(ItemType.Sonar, False)
        End If

        Return Entity.anyPlayerHaveCircletCached
    End Function

    Function AnyPlayerHaveCircletOrGlassTorch: Bool()
        Return Entity.AnyPlayerHaveCirclet() Or
               Entity.AnyPlayerHaveGlassTorch()
    End Function

    Function AnyPlayerHaveForesightTorch: Bool()
        Debug.TraceNotImplemented("Entity.AnyPlayerHaveForesightTorch()")
    End Function

    Function AnyPlayerHaveGlassTorch: Bool()
        If Entity.anyPlayerHaveGlassTorchCachedFrame <> necrodancergame.globalFrameCounter
            Entity.anyPlayerHaveGlassTorchCachedFrame = necrodancergame.globalFrameCounter
            Entity.anyPlayerHaveGlassTorchCached = Player.DoesAnyPlayerHaveItemOfType(ItemType.GlassTorch, False)
        End If

        Return Entity.anyPlayerHaveGlassTorchCached
    End Function

    Function AnyPlayerHaveNazarCharm: Bool()
        If Entity.anyPlayerHaveNazarCharmCachedFrame <> necrodancergame.globalFrameCounter
            Entity.anyPlayerHaveNazarCharmCachedFrame = necrodancergame.globalFrameCounter
            Entity.anyPlayerHaveNazarCharmCached = Player.DoesAnyPlayerHaveItemOfType(ItemType.NazarCharm, False)
        End If

        Return Entity.anyPlayerHaveNazarCharmCached
    End Function

    Function AnyPlayerHaveWallsTorch: Bool()
        If Entity.anyPlayerHaveWallsTorchCachedFrame <> necrodancergame.globalFrameCounter
            Entity.anyPlayerHaveWallsTorchCachedFrame = necrodancergame.globalFrameCounter
            Entity.anyPlayerHaveWallsTorchCached = Player.DoesAnyPlayerHaveItemOfType(ItemType.TorchOfWalls, False)
        End If

        Return Entity.anyPlayerHaveWallsTorchCached
    End Function

    Function GetEntityAt: Entity(x: Int, y: Int, includePlayer: Bool)
        For Local entity := EachIn Entity.entityList
            If (includePlayer Or
                Not entity.isPlayer) And
               entity.IsOnTile(x, y)
                Return entity
            End If
        End For

        Return Null
    End Function

    Function RemoveAnyPerishedEntities: Void()
        For Local entity := EachIn Entity.entityList
            If entity.perished
                entity.Die()

                Entity.RemoveAnyPerishedEntities()
            End If
        End For
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
        Self.PerformTween(Self.x + p.x, Self.y + p.y, Self.x, Self.y, 10, 11, bufferTween)
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
        Return Self.confusedUntil > Audio.GetClosestBeatNum(True)
    End Method

    Method IsFrozen: Bool(ignoreLastBeat: Bool)
        If Self.frozenPermanently
            Return True
        End If

        If ignoreLastBeat
            Return Self.frozenDuration > 1
        End If

        Return Self.frozenDuration > 0
    End Method

    Method IsInAnyPlayerLineOfSight: Bool()
        If Self.invisible
            Return False
        End If

        Local tile := Level.GetTileAt(Self.x, Self.y)
        If tile = Null
            Return False
        End If

        Return tile.IsInAnyPlayerLineOfSight()
    End Method

    Method IsVisible: Bool()
        If Self.clampedOn
            Return True
        End If

        If Self.invisible
            Return False
        End If

        Return Level.IsVisibleTileAt(Self.x, Self.y)
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
        If Self.flaggedForDeath And
           Self.flaggedForDeathCounter <= 0
            Self.Die()

            Return
        End If

        Self.flaggedForDeathCounter -= 1

        If Self.bounce <> Null And
           Not Self.IsFrozen(False)
            Self.bounce.Update()
        End If

        If Self.flickerTimer > 0
            Self.flickerTimer -= 1
            Self.flickerCurrentTimer -= 1

            If Self.flickerCurrentTimer <= 0 Or
               Self.flickerHide
                Self.flickerHide = Not Self.flickerHide
                Self.flickerCurrentTimer = 4
            End If
        Else
            Self.flickerHide = False
        End If

        If Tile.IsNearNightmare(Self.x, Self.y) And
           Self.IsInAnyPlayerLineOfSight()
            Self.hasBeenVisible = True
        End If

        Self.wasTeleported = False
    End Method

End Class
