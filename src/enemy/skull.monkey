'Strict

Import monkey.math
Import enemy
Import entity
Import logger
Import shrine

Class Skull Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = math.Min(3, l)
        End If

        Self.Init(xVal, yVal, l, "skull")

        Self.overrideHitSound = "skullHit"
        Self.overrideDeathSound = "skullDeath"
        Self.overrideAttackSound = "skullAttack"
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Skull.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

End Class
