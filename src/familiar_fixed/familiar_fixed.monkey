'Strict

Import monkey.list
Import entity
Import logger
Import player_class

Class FamiliarFixed Extends Entity Abstract

    Global debugTouchDamage: Bool = True
    Global familiarList: List<FamiliarFixed> = New List<FamiliarFixed>()

    Function GetFamiliarAt: FamiliarFixed(x: Int, y: Int)
        For Local familiar := EachIn FamiliarFixed.familiarList
            If x = familiar.x And
               y = familiar.y
                Return familiar
            End If
        End For

        Return Null
    End Function

    Function _EditorFix: Void() End

    Method New()
        Super.New()

        FamiliarFixed.familiarList.AddLast(Self)
    End Method

    Field offsetX: Int
    Field offsetY: Int
    Field type: Int
    Field enableAutoFlip: Bool = True
    Field owner: Player
    Field hasMovedThisFrame: Bool

    Method ApplyEffect: Bool(dir: Int)
        Return False
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("FamiliarFixed.Die()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("FamiliarFixed.Hit()")
    End Method

    Method Init: Void(x_: Int, y_: Int, type_: Int)
        Debug.TraceNotImplemented("FamiliarFixed.Init(Int, Int, Int)")
    End Method

    Method IsSoul: Bool()
        Debug.TraceNotImplemented("FamiliarFixed.IsSoul()")
    End Method

    Method MoveTo: Void(x_: Int, y_: Int)
        Debug.TraceNotImplemented("FamiliarFixed.MoveTo(Int, Int)")
    End Method

    Method TryPickup: Void()
        ' Empty implementation
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("FamiliarFixed.Update()")
    End Method

    Method WarpTo: Void(x_: Int, y_: Int)
        Debug.TraceNotImplemented("FamiliarFixed.WarpTo(Int, Int)")
    End Method

End Class
