'Strict

Import enemy
Import logger
Import shrine

Class ElectricMage Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 3
        End If

        Self.Init(xVal, yVal, l, "electric_mage")

        Self.overrideHitSound = "elecmageHit"
        Self.overrideDeathSound = "elecmageDeath"
        Self.overrideAttackSound = "elecmageAttackMelee"
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("ElectricMage.MoveImmediate(Int, Int, String)")
    End Method

End Class
