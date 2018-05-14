'Strict

Import monkey.math
Import audio2
Import enemy
Import entity
Import logger
Import point
Import shrine

Class ArmoredSkeleton Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = math.Min(3, l)
        End If

        Self.Init(xVal, yVal, l, "armoredskeleton")

        Self.animOverride = False

        Self.overrideHitSound = "skeletonHit"
        Self.overrideDeathSound = "skeletonDeath"
        Self.overrideAttackSound = "skeletonAttack"

        If Audio.debugEnablePlaceholders And
           l = 4
            Self.overrideDeathSound = "iceBreak"
        End If

        If Self.isFormationDancer
            Self.beatsPerMove = 4
            Self.currentMoveDelay = 4
        End If
    End Method

    Field hasHead: Bool = True
    Field cachedMoveDir: Point = New Point(0, 0)
    Field directionHitFrom: Int = -1
    Field gotBounced: Bool
    Field shieldDestroyed: Bool
    Field shieldDir: Int = 1
    Field justBounced: Bool
    Field willHaveHead: Bool = True

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("ArmoredSkeleton.CanBeLord()")
    End Method

    Method DestroyShield: Void(dir: Int)
        Debug.TraceNotImplemented("ArmoredSkeleton.DestroyShield(Int)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("ArmoredSkeleton.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("ArmoredSkeleton.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("ArmoredSkeleton.Knockback(Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("ArmoredSkeleton.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ArmoredSkeleton.Update()")
    End Method

End Class
