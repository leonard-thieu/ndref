'Strict

Import enemy
Import logger
Import player_class
Import point
Import shrine
Import util

Class Queen Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "queen")

        Self.initialYOff = Self.yOff

        Self.ActivateLight(0.01, 0.02)

        Self.overrideAttackSound = "queenAttack"
        Self.overrideDeathSound = "queenDeath"

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Field initialYOff: Int

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Queen.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        If Self.bounce <> Null
            Self.yOff = Self.bounce.GetVal() + Self.initialYOff
        End If

        Super.Update()
    End Method

End Class
