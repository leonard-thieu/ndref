'Strict

Import enemy
Import logger
Import player_class
Import point
Import shrine
Import util

Class King Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "king", "", -1, -1)

        Self.initialYOff = Self.yOff

        Self.ActivateLight(0.01, 0.02)

        Self.overrideAttackSound = "kingAttack"
        Self.overrideDeathSound = "kingDeath"
        Self.overrideHitSound = "kingHit"

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Field initialYOff: Int
    Field castled: Bool
    Field lastMan: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("King.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("King.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("King.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("King.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("King.Update()")
    End Method

End Class
