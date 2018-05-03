'Strict

Import enemy
Import logger
Import player_class
Import point
Import shrine
Import util

Class Bishop Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "bishop", "", -1, -1)

        Self.ActivateLight(0.01, 0.02)

        Self.overrideAttackSound = "chessAttack"
        Self.overrideDeathSound = "chessDeath"

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Bishop.GetMovementDirection()")
    End Method

End Class
