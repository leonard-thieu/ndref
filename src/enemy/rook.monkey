'Strict

Import enemy
Import logger
Import player_class
Import point
Import shrine
Import util

Class Rook Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "rook")

        Self.ActivateLight(0.01, 0.02)

        Self.overrideAttackSound = "chessAttack"
        Self.overrideDeathSound = "chessDeath"

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Field castleNextMove: Bool

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Rook.GetMovementDirection()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Rook.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Self.image.flipX = False

        Super.Update()
    End Method

End Class
