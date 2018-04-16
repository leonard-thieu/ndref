'Strict

Import logger
Import mobileentity

Class Familiar Extends MobileEntity

    Global familiarList: List<Familiar> = New List<Familiar>()

    Function GetFamiliarAt: Object(x: Int, y: Int)
        Debug.TraceNotImplemented("TextSprite.GetFamiliarAt()")
    End Function

    Function IsAnyAt: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("TextSprite.IsAnyAt()")
    End Function

    Function _EditorFix: Void() End

    Method New(owner_: Player)
        Super.New()

        Self.image = New Sprite("entities/familiar_lamb.png", 19, 16, 4, Image.DefaultFlags)
        Self.shadow = New Sprite("entities/TEMP_shadow_standard.png", 1, Image.DefaultFlags)
        Self.hasSilhouette = False

        Familiar.familiarList.AddLast(Self)
        Self.isFamiliar = True

        Self._owner = owner_
        Self.x = owner_.x
        Self.y = owner_.y
        Self.lastX = owner_.x
        Self.lastY = owner_.y

        Self.xOff = (24 - Self.image.Width()) / 2
        Self.yOff = ((24 - Self.image.Height()) / 2) + 7
        Self.image.SetZOff(-5.0)
    End Method

    Field _owner: Player
    Field squishParticle: String = "particles/TEMP_particle_blood.png"
    Field recalled: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("TextSprite.Die()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("TextSprite.Hit()")
    End Method

    Method IsObstructedAt: Bool(targetX: Int, targetY: Int)
        Debug.TraceNotImplemented("TextSprite.IsObstructedAt()")
    End Method

    Method MaybeBaa: Void()
        Debug.TraceNotImplemented("TextSprite.MaybeBaa()")
    End Method

    Method Move: Void()
        Debug.TraceNotImplemented("TextSprite.Move()")
    End Method

    Method Recall: Void()
        Debug.TraceNotImplemented("TextSprite.Recall()")
    End Method

    Method Squish: Void()
        Debug.TraceNotImplemented("TextSprite.Squish()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TextSprite.Update()")
    End Method

    Method NoTrim: Void()
        GetFamiliarAt(0, 0)
        IsAnyAt(0, 0)
        Die()
        Hit(0, 0, 0, Null, False, 0)
        IsObstructedAt(0, 0)
        MaybeBaa()
        Move()
        Recall()
        Squish()
        Update()
    End Method

End Class
