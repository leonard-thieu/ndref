'Strict

Import elemental_base
Import logger

Class FireElemental Extends ElementalBase

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "fireelemental")

        Self.overrideAttackSound = "elementalFireAttack"
        Self.overrideHitSound = "elementalFireHit"
        Self.overrideDeathSound = "elementalFireDeath"
    End Method

    Method DropTile: Void()
        Debug.TraceNotImplemented("FireElemental.DropTile()")
    End Method

End Class
