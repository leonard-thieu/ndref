'Strict

Import enemy
Import entity
Import logger
Import point
Import shrine
Import util

Class Orc Extends Enemy

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 3
        End If

        Self.Init(x_, y_, l, "orc")

        Self.facing = Util.RndIntRangeFromZero(3, True)

        Self.overrideAttackSound = "orcAttack"
        Self.overrideHitSound = "orcHit"
        Self.overrideDeathSound = "orcDeath"
    End Method

    Field facing: Int = Direction.None
    Field nextFacing: Int = Direction.None

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Orc.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Orc.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Orc.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Orc.Update()")
    End Method

End Class
