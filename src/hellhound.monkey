'Strict

Import enemy
Import logger

Class Hellhound Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "hellhound")

        Self.overrideAttackSound = "hellhoundAttack"
        Self.overrideDeathSound = "hellhoundDeath"

        Self.swarmCulprit = True
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Hellhound.Die()")
    End Method

End Class
