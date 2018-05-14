'Strict

Import enemy.mummy
Import enemy
Import logger

Class Mommy Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "mommy")

        Self.overrideHitSound = "mommyHit"
        Self.overrideDeathSound = "mommyDeath"
        Self.overrideCrySound = "mommyCry"
    End Method

    Field readyToSpawn: Bool
    Field theMummy: Mummy

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Mommy.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Mommy.Update()")
    End Method

End Class
