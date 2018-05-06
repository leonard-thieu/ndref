'Strict

Import enemy
Import level
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
        If Self.enableDeathEffects And
           Self.falling
            Level.PlaceHotCoalTileAt(Self.x, Self.y)
        End If

        Super.Die()
    End Method

End Class
