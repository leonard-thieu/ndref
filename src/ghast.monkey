'Strict

Import enemy
Import entity
Import logger
Import player_class
Import point
Import util

Class Ghast Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "ghast")

        Self.invisible = True
        Self.collides = False
        Self.blink_MIN = 120
        Self.blink_MAX = 240
        Self.blink_DUR = 10

        Self.overrideAttackSound = "ghastAttack"
        Self.overrideDeathSound = "ghastDeath"

        Self.image.SetZOff(18.0)

        Self.isWraithLike = True

        If Util.IsCharacterActive(Character.Eli)
            Self.coinsToDrop = 0
            Self.Die()
        End If
    End Method

    Field seeking: Bool
    Field teleporting: Bool
    Field hitDir: Int = -1
    Field hitPlayer: Entity
    Field skippedMove: Bool
    Field hasRoared: Bool
    Field beenHit: Bool

    Method BecomeCorporeal: Void(force: Bool)
        Debug.TraceNotImplemented("Ghast.BecomeCorporeal(Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Ghast.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Ghast.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Ghast.Update()")
    End Method

End Class
