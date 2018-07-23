'Strict

Import enemy
Import logger
Import point
Import shrine
Import textlog
Import util

Class EvilEye Extends Enemy

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(x_, y_, l, "evileye")

        Self.image.FlipX(False, True)
        If Util.RndBool(False)
            Self.image.FlipX(True, True)
        End If

        Self.overrideAttackSound = "evileyeAttack"
        Self.overrideHitSound = "evileyeHit"
        Self.overrideDeathSound = "evileyeDeath"
    End Method

    Field dashDir: Int = Direction.None

    Method CheckDash: Void()
        Debug.TraceNotImplemented("EvilEye.CheckDash()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("EvilEye.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("EvilEye.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("EvilEye.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        If Not Self.hasBeenVisible
            Self.currentMoveDelay = 2
        Else If Self.wasVisibleLastFrame
            TextLog.Message("Evil Eye at " + Self.GetLocation() + " setting wasVisibleLastFrame=True")

            Self.wasVisibleLastFrame = True
            Self.currentMoveDelay = 1
        End If

        If Self.dashDir <> Direction.None
            Self.overrideNormal2Timing = 1
        Else
            Self.overrideNormal2Timing = 0
        End If

        If Self.dashDir = Direction.Right
            Self.image.FlipX(True, True)
        End If

        If Self.dashDir = Direction.Left
            Self.image.FlipX(False, True)
        End If

        Super.Update()
    End Method

End Class
