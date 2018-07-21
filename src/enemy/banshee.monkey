'Strict

Import enemy
Import audio2
Import entity
Import logger
Import shrine

Class Banshee Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "banshee")

        Self.overrideAttackSound = "bansheeAttack"
        Self.overrideDeathSound = "bansheeDeath"
        Self.overrideHitSound = "bansheeHit"
        Self.overrideCrySound = "bansheeCry"
    End Method

    Field hasShrieked: Bool

    Method Die: Void()
        ' SKIPPED: Audio section.

        Super.Die()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Banshee.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Self.animOverride = Audio.GetBeatAnimFrame4()
        If Self.hasShrieked
            Self.animOverride += 4
        End If

        Super.Update()
    End Method

End Class
