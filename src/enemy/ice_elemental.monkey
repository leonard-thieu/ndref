'Strict

Import enemy.elemental_base
Import logger

Class IceElemental Extends ElementalBase

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "iceelemental")

        Self.overrideAttackSound = "elementalIceAttack"
        Self.overrideHitSound = "elementalIceHit"
        Self.overrideDeathSound = "elementalIceDeath"
    End Method

    Method DropTile: Void()
        Debug.TraceNotImplemented("IceElemental.DropTile()")
    End Method

End Class
