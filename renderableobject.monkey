Import monkey.list
Import entity
Import point

Class RenderableObject
    
    Global deletingAll: Bool
    Global lightSourceList: List<RenderableObject>
    Global renderableObjectList: List<RenderableObject>

    Function DeleteAll: Void(spareThePlayers: Bool)
        RenderableObject.deletingAll = True

        If spareThePlayers
            For Local renderableObj := EachIn RenderableObject.renderableObjectList
                If Not (renderableObj.field_31 And renderableObj.field_30)
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
    End Function

    Function IsExplosiveDamage: Bool(damageSource: String)
    End Function

    Function IsParryableDamage: Bool(damageSource: String)
    End Function

    Function IsPlayerMeleeDamage: Bool(damageSource: String)
    End Function
    
    Function UpdateAll: Void()
    End Function

    Function _EditorFix() End

    Method New()
        RenderableObject.renderableObjectList.AddLast(Self)

        Self.x2 = Self.x
        Self.y2 = Self.y
    End Method

    Field field_10: Bool
    Field dead: Bool
    Field x: Int
    Field y: Int
    Field field_1C: Bool
    Field x2: Int
    Field y2: Int
    Field field_28: Int
    Field field_2C: Int
    Field field_30: Bool
    Field field_31: Bool
    Field field_32: Bool
    Field field_34: Int = 1
    Field field_38: Int = 1
    Field field_3C: Bool
    Field field_3D: Bool
    Field field_3E: Bool
    Field field_3F: Bool
    Field field_40: Int
    Field field_44: Bool
    Field field_48: Float = 1.0
    Field field_4C: Bool
    Field field_4D: Bool
    Field field_4E: Bool
    Field field_4F: Bool
    Field field_50: Bool
    Field field_54: Float = 1.0
    
    Method ActivateLight(lMin: Float, lMax: Float)
    End Method
    
    Method Die: Void()
    	If Not Self.dead
    		RenderableObject.renderableObjectList.RemoveEach(Self)
    		RenderableObject.lightSourceList.RemoveEach(Self)
    		Self.dead = True
    	End If
    End Method
    
    Method GetLocation: Point()
    End Method
    
    Method IsFrozen: Bool(ignoreLastBeat: Bool)
    End Method
    
    Method IsOnScreen: Bool()
    End Method
    
    Method IsOnTile: Bool(px: Int, py: Int)
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
