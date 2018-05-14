'Strict

Import enemy
Import entity
Import logger

Class Beetle Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "beetle")

        Self.overrideHitSound = "beetleHit"
        Self.overrideAttackSound = "beetleAttack"
        Self.overrideDeathSound = "beetleDeath"

        Self.swarmCulprit = True
    End Method

    Field hasArmor: Bool = True

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Beetle.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Beetle.MoveImmediate(Int, Int, String)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Beetle.Update()")
    End Method

End Class
