'Strict

Import enemy
Import entity
Import logger
Import shrine

Class Golem Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive And
           l = 1
            l = 2
        End If

        Self.Init(xVal, yVal, l, "golem")

        Self.overrideAttackSound = "golemAttack"
        Self.overrideHitSound = "golemHit"
        Self.overrideDeathSound = "golemDeath"
        Self.overrideMoveSound = "golemChase"
    End Method

    Field droppedOoze: Bool
    Field prevFrame: Int

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Golem.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        If Self.droppedOoze
            Self.animOffset = 5

            If Self.IsFrozen(False)
                Self.animOverrideState = (Self.prevFrame Mod 5) + 5
            End If
        End If

        Super.Update()

        Self.prevFrame = Self.image.GetFrame()
    End Method

End Class
