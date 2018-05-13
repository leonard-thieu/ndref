'Strict

Import enemy
Import entity
Import logger
Import point
Import shrine
Import util

Class MetroGnome Extends Enemy

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive Then l = 2

        Self.Init(x_, y_, l, "metrognome")

        Self.overrideAttackSound = "metrognomeAttack"
        Self.overrideHitSound = "metrognomeHit"
        Self.overrideDeathSound = "metrognomeDeath"
        Self.overrideCrySound = "metrognomeCry"

        Local flipX := Util.RndBool(False)
        Self.image.FlipX(flipX, True)

        Self.hasOrigin = True
        Self.originX = Self.x
        Self.originY = Self.y
    End Method

    Field hasOrigin: Bool
    Field originX: Int
    Field originY: Int
    Field attackCounter: Int = 3
    Field soundParity: Bool = True

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("MetroGnome.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("MetroGnome.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("MetroGnome.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("MetroGnome.MoveSucceed(Bool, Bool)")
    End Method

    Method Tick: Void()
        Debug.TraceNotImplemented("MetroGnome.Tick()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("MetroGnome.Update()")
    End Method

End Class
