'Strict

Import enemy
Import logger
Import player_class
Import point
Import util

Class Wight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "wight")

        Self.invisible = True
        Self.collides = False
        Self.blink_MIN = 120
        Self.blink_MAX = 240
        Self.blink_DUR = 10

        Self.overrideAttackSound = "wightAttack"
        Self.overrideDeathSound = "wightDeath"

        Self.image.SetZOff(18.0)

        Self.isWraithLike = True

        If Util.IsCharacterActive(Character.Eli)
            Self.coinsToDrop = 0
            Self.Die()
        End If
    End Method

    Field seeking: Bool
    Field hasRoared: Bool

    Method BecomeCorporeal: Void(force: Bool)
        Debug.TraceNotImplemented("Wight.BecomeCorporeal(Bool)")
    End Method

    Method CheckCorporeality: Void()
        Debug.TraceNotImplemented("Wight.CheckCorporeality()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Wight.GetMovementDirection()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Wight.Update()")
    End Method

End Class
