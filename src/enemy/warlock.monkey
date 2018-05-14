'Strict

Import enemy
Import entity
Import logger
Import shrine

Class Warlock Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            If l = 1
                l = 2
            End If
        End If

        Self.Init(xVal, yVal, l, "warlock")

        Self.overrideHitSound = "warlockHit"
        Self.overrideDeathSound = "warlockDeath"
        Self.overrideAttackSound = "warlockAttack"
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Warlock.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Warlock.Render()")
    End Method

End Class
