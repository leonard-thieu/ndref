'Strict

Import enemy
Import audio2
Import entity
Import logger
Import shrine

Class Devil Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "devil")

        Self.allowDiagonalFlip = True

        Self.overrideAttackSound = "devilAttack"
        Self.overrideHitSound = "devilHit"
        Self.overrideDeathSound = "devilDeath"
    End Method

    Field inEgg: Bool = True

    Method GetMovementDirection: Point()
        Return Self.BasicSeekIncludeDiagonals()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Devil.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        If Self.inEgg
            Self.animOverrideState = 1
        Else
            Self.animOverrideState = 8
            Self.animOverride = Audio.GetBeatAnimFrame4()
        End If

        Super.Update()
    End Method

End Class
