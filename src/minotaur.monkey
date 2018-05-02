'Strict

Import enemy
Import logger
Import point
Import shrine

Class Minotaur Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "minotaur", "", -1, -1)

        Self.overrideHitSound = "minotaurHit"
        Self.overrideAttackSound = "minotaurAttack"
        Self.overrideDeathSound = "minotaurDeath"

        Self.initalYOff = Self.yOff
    End Method

    Field initalYOff: Int
    Field hasRoared: Bool
    Field chargingDir: Int = -1
    Field stunnedTime: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Minotaur.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Minotaur.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Minotaur.MoveSucceed(Bool, Bool)")
    End Method

    Method TryChargeAt: Int(targetX: Int, targetY: Int)
        Debug.TraceNotImplemented("Minotaur.TryChargeAt(Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Minotaur.Update()")
    End Method

End Class
