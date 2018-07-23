'Strict

Import enemy
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
        Debug.TraceNotImplemented("Devil.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Devil.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Devil.Update()")
    End Method

End Class
