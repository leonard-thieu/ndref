'Strict

Import enemy
Import entity
Import logger
Import point
Import shrine

Class Nightmare Extends Enemy

    Global nightmare: Nightmare

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "nightmare")

        If l > 1
            Self.NIGHTMARE_DARKNESS_RADIUS = 3.5
        End If

        Self.ActivateLight(0.1, Self.NIGHTMARE_DARKNESS_RADIUS)
        Self.lightSourceBrightness = -15.0

        Nightmare.nightmare = Self

        Self.overrideAttackSound = "nightmareAttack"
        Self.overrideDeathSound = "nightmareDeath"
        Self.overrideHitSound = "nightmareHit"
        Self.overrideCrySound = "nightmareCry"
    End Method

    Field NIGHTMARE_DARKNESS_RADIUS: Float = 2.5
    Field seekDistance: Int = 9
    Field failedLastMove: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("Nightmare.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Nightmare.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Nightmare.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsVisible: Bool()
        Debug.TraceNotImplemented("Nightmare.IsVisible()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Nightmare.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Nightmare.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Nightmare.Update()")
    End Method

End Class