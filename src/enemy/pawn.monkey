'Strict

Import enemy
Import logger
Import player_class
Import point
Import shrine
Import util

Class Pawn Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "pawn")

        Self.startY = yVal

        Self.ActivateLight(0.01, 0.02)

        Self.overrideAttackSound = "chessAttack"
        Self.overrideDeathSound = "chessDeath"

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Field startY: Int
    Field hasMoved: Bool
    Field isQueen: Bool

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Pawn.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Pawn.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Pawn.MoveSucceed(Bool, Bool)")
    End Method

End Class
