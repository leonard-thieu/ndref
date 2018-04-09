Strict

Import monkey.list
Import entity
Import point

Class RenderableObject Abstract
    
    Global deletingAll: Bool
    Global lightSourceList: List<RenderableObject> = New List<RenderableObject>()
    Global renderableObjectList: List<RenderableObject> = New List<RenderableObject>()

    Function DeleteAll: Void(spareThePlayers: Bool)
        RenderableObject.deletingAll = True

        If spareThePlayers
            For Local renderableObj := EachIn RenderableObject.renderableObjectList
                If Not (renderableObj.isPlayer And renderableObj.isFamiliar)
                    renderableObj.Die()
                End If
            End For
        Else
            For Local renderableObj := EachIn RenderableObject.renderableObjectList
                renderableObj.Die()
            End For
        End If

        Entity.deadEntityList.Clear()

        RenderableObject.deletingAll = False
    End Function
    
    Function HitTile: Bool(damageSource: String, xVal: Int, yVal: Int, damage: Int, dir: Int, hitter: Entity, allowSelfHits: Bool, phasing: Bool, piercing: Bool, confuse: Bool, frost: Bool)
        Throw New Throwable()
    End Function

    Function IsExplosiveDamage: Bool(damageSource: String)
        Throw New Throwable()
    End Function

    Function IsParryableDamage: Bool(damageSource: String)
        Throw New Throwable()
    End Function

    Function IsPlayerMeleeDamage: Bool(damageSource: String)
        Throw New Throwable()
    End Function
    
    Function UpdateAll: Void()
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

    Method New()
        RenderableObject.renderableObjectList.AddLast(Self)

        Self.lastFrameX = Self.x
        Self.lastFrameY = Self.y
    End Method

    Field perished: Bool
    Field dead: Bool
    Field x: Int
    Field y: Int
    Field collides: Bool
    Field lastFrameX: Int
    Field lastFrameY: Int
    Field lightSourceMin: Float
    Field lightSourceMax: Float
    Field isFamiliar: Bool
    Field isPlayer: Bool
    Field playerOverrideCollide: Bool
    Field width: Int = 1
    Field height: Int = 1
    Field clampedOn: Bool
    Field isCrate: Bool
    Field isItem: Bool
    Field lightSource: Bool
    Field constLightSourceMax: Float
    Field wasHitAlreadyDuringHitTile: Bool
    Field lightSourceBrightness: Float = 1.0
    Field isTrap: Bool
    Field isNPC: Bool
    Field isChest: Bool
    Field isMobile: Bool
    Field isEnemy: Bool
    Field constLightSourceBrightness: Float = 1.0
    
    Method ActivateLight: Void(lMin: Float, lMax: Float)
        Self.lightSource = True
        Self.lightSourceMin = lMin
        Self.lightSourceMax = lMax
        Self.constLightSourceMax = lMax

        RenderableObject.lightSourceList.AddLast(Self)
    End Method
    
    Method Die: Void()
        If Not Self.dead
            RenderableObject.renderableObjectList.RemoveEach(Self)
            RenderableObject.lightSourceList.RemoveEach(Self)
            Self.dead = True
        End If
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int) Abstract
    
    Method GetLocation: Point()
        Throw New Throwable()
    End Method
    
    Method IsFrozen: Bool(ignoreLastBeat: Bool)
        Throw New Throwable()
    End Method
    
    Method IsOnScreen: Bool()
        Throw New Throwable()
    End Method
    
    Method IsOnTile: Bool(px: Int, py: Int)
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        DeleteAll(False)
        HitTile("", 0, 0, 0, 0, Null, False, False, False, False, False)
        IsExplosiveDamage("")
        IsParryableDamage("")
        IsPlayerMeleeDamage("")
        UpdateAll()
        ActivateLight(0, 0)
        Die()
        GetLocation()
        IsFrozen(False)
        IsOnScreen()
        IsOnTile(0, 0)
    End Method
    
End
