'Strict

Import monkey.math
Import audio2
Import enemy
Import entity
Import logger
Import point
Import shrine
Import util

Class Skeleton Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = math.Max(l, 3)
        End If

        Self.Init(xVal, yVal, l, "skeleton")

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
    Field directionHitFrom: Int = -1
    Field gotBounced: Bool

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Skeleton.CanBeLord()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Skeleton.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Skeleton.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("Skeleton.Knockback(Int)")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Skeleton.MoveImmediate(Int, Int, String)")
    End Method

    Method Update: Void()
        If Self.directionHitFrom <> Direction.None And
           Self.gotBounced
            If Self.x > Self.lastX
                Self.directionHitFrom = Direction.Right
            Else If Self.x < Self.lastX
                Self.directionHitFrom = Direction.Left
            Else If Self.y > Self.lastY
                Self.directionHitFrom = Direction.Down
            Else If Self.y < Self.lastY
                Self.directionHitFrom = Direction.Up
            End If
        End If

        If Self.isMosh And
           Self.level <= 3
            Self.animOffset = 8
        End If

        Super.Update()
    End Method

End Class
