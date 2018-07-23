'Strict

Import monkey.list
Import entity
Import logger
Import mobileentity
Import player_class
Import sprite
Import util

Class Familiar Extends MobileEntity

    Global familiarList: List<Familiar> = New List<Familiar>()

    Function GetFamiliarAt: Familiar(x: Int, y: Int)
        For Local familiar := EachIn Familiar.familiarList
            If familiar.x = x And
               familiar.y = y
                Return familiar
            End If
        End For

        Return Null
    End Function

    Function IsAnyAt: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("Familiar.IsAnyAt(Int, Int)")
    End Function

    Function _EditorFix: Void() End

    Method New(owner_: Player)
        Super.New()

        Self.image = New Sprite("entities/familiar_lamb.png", 19, 16, 4)
        Self.shadow = New Sprite("entities/TEMP_shadow_standard.png", 1)
        Self.hasSilhouette = False

        Familiar.familiarList.AddLast(Self)
        Self.isFamiliar = True

        Self.owner = owner_
        Self.x = owner_.x
        Self.y = owner_.y
        Self.lastX = owner_.x
        Self.lastY = owner_.y

        Self.xOff = (24 - Self.image.Width()) / 2
        Self.yOff = ((24 - Self.image.Height()) / 2) + 7
        Self.image.SetZOff(-5.0)
    End Method

    Field owner: Player
    Field squishParticle: String = "particles/TEMP_particle_blood.png"
    Field recalled: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("Familiar.Die()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int = Direction.None, hitter: Entity = Null, hitAtLastTile: Bool = False, hitType: Int = 0)
        Debug.TraceNotImplemented("Familiar.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsObstructedAt: Bool(targetX: Int, targetY: Int)
        Debug.TraceNotImplemented("Familiar.IsObstructedAt(Int, Int)")
    End Method

    Method MaybeBaa: Void()
        Debug.TraceNotImplemented("Familiar.MaybeBaa()")
    End Method

    Method Move: Void()
        Debug.TraceNotImplemented("Familiar.Move()")
    End Method

    Method Recall: Void()
        Debug.TraceNotImplemented("Familiar.Recall()")
    End Method

    Method Squish: Void()
        Debug.TraceNotImplemented("Familiar.Squish()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Familiar.Update()")
    End Method

End Class
