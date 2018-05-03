'Strict

Import enemy
Import entity
Import logger
Import point
Import shrine

Class Armadillo Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive And
           l = 1
            l = 2
        End If

        Self.Init(xVal, yVal, l, "armadillo")

        Self.overrideHitSound = "armadilloHit"
        Self.overrideAttackSound = "armadilloAttack"
        Self.overrideDeathSound = "armadilloDeath"
    End Method

    Field chargeNext: Int = -1
    Field chargingDir: Int = -1
    Field stunnedTime: Int

    Method AttemptCharge: Void(target: Entity, immediate: Bool)
        Debug.TraceNotImplemented("Armadillo.AttemptCharge(Entity, Bool)")
    End Method

    Method AttemptCharge: Void(immediate: Bool)
        Debug.TraceNotImplemented("Armadillo.AttemptCharge(Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Armadillo.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Armadillo.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("Armadillo.Knockback(Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Armadillo.MoveFail()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Armadillo.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Armadillo.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Armadillo.Update()")
    End Method

End Class
