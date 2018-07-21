'Strict

Import enemy
Import logger
Import point

Class Harpy Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "harpy")

        Self.movesRegardlessOfDistance = True

        Self.overrideHitSound = "harpyHit"
        Self.overrideDeathSound = "harpyDeath"
        Self.overrideAttackSound = "harpyAttack"
    End Method

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Harpy.CanBeLord()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Harpy.GetMovementDirection()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Harpy.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Harpy.Update()")
    End Method

End Class
