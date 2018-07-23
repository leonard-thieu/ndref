'Strict

Import enemy
Import logger
Import particles
Import point

Class Mummy Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "mummy")

        Self.movesRegardlessOfDistance = True

        Self.overrideAttackSound = "mummyAttack"
        Self.overrideDeathSound = "mummyDeath"

        Local particleSystemX := (Self.x * 24) + 12
        Local particleSystemY := (Self.y * 24) + 24
        New ParticleSystem(particleSystemX, particleSystemY, ParticleSystemData.MOLE_DIG, -1, "")
    End Method

    Field animNum: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Mummy.GetMovementDirection()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Mummy.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        If Self.currentMoveDelay = 1
            Self.animOverride = -1
        Else
            Self.animOverride = Self.animNum + 4
        End If

        Super.Update()
    End Method

End Class
