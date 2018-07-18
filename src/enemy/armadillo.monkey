'Strict

Import monkey.math
Import enemy
Import entity
Import logger
Import necrodancergame
Import point
Import shrine
Import util

Class Armadillo Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive And
           l = 1
            l = 2
        End If

        Self.Init(xVal, yVal, l, "armadillo")

        Self.overrideHitSound = "armadilloHit"
        Self.overrideAttackSound = "armadilloAttack"
        Self.overrideDeathSound = "armadilloDeath"
    End Method

    Field chargeNext: Int = Direction.None
    Field chargingDir: Int = Direction.None
    Field stunnedTime: Int

    Method AttemptCharge: Void(target: Entity, immediate: Bool)
        Debug.TraceNotImplemented("Armadillo.AttemptCharge(Entity, Bool)")
    End Method

    Method AttemptCharge: Void(immediate: Bool)
        Debug.TraceNotImplemented("Armadillo.AttemptCharge(Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Armadillo.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Armadillo.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("Armadillo.Knockback(Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Armadillo.MoveFail()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Armadillo.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Armadillo.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        If Self.lastX > Self.x
            Self.image.FlipX(False, True)
        Else If Self.lastX < Self.x
            Self.image.FlipX(True, True)
        End If

        Local chargingDir := Self.chargingDir

        If Self.level <> 3
            Select Self.chargingDir
                Case Direction.DownLeft,
                     Direction.UpLeft
                    chargingDir = Direction.Left
                Case Direction.DownRight,
                     Direction.UpRight
                    chargingDir = Direction.Right
            End Select
        End If

        Local animOverrideOffset: Int
        
        Select chargingDir
            Case Direction.UpLeft,
                 Direction.UpRight
                animOverrideOffset = 11
            Case Direction.DownRight,
                 Direction.DownLeft
                animOverrideOffset = 15
            Case Direction.Right,
                 Direction.Left
                animOverrideOffset = 7
            Case Direction.Up,
                 Direction.Down
                animOverrideOffset = 3
            Case Direction.None
                If Self.stunnedTime <= 0
                    Self.animOverride = -1
                End If
        End Select

        If animOverrideOffset <> 0
            Self.animOverride = animOverrideOffset + math.Floor((necrodancergame.globalFrameCounter Mod 8) * 0.5)

            If Self.lastX > Self.x
                Self.image.FlipX(True, True)
            Else If Self.lastX < Self.x
                Self.image.FlipX(False, True)
            End If
        End If

        Self.AttemptCharge(False)

        Super.Update()
    End Method

End Class
