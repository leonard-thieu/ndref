'Strict

Import enemy
Import audio2
Import beatanimationdata
Import entity
Import logger
Import point
Import util

Class ZombieSnake Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "zombie_snake")

        Self.movesRegardlessOfDistance = True
        Self.wasSeekingX = False

        Self.ActivateLight(0.01, 0.02)
    End Method

    Field zsChild: ZombieSnake
    Field zsParent: ZombieSnake
    Field cachedMoveDir: Point = New Point(0, 0)
    Field facing: Int = -1

    Method AdjustFacingDir: Void()
        Debug.TraceNotImplemented("ZombieSnake.AdjustFacingDir()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("ZombieSnake.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("ZombieSnake.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("ZombieSnake.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("ZombieSnake.MoveSucceed(Bool, Bool)")
    End Method

    Method SetChild: Void(zs: ZombieSnake)
        Self.zsChild = zs
    End Method

    Method SetParent: Void(zs: ZombieSnake)
        Self.zsParent = zs
        Self.movePriority = zs.movePriority - 1
    End Method

    Method Update: Void()
        Local disownedChild := False
        Local disownedParent := False

        If Enemy.enemiesFearfulDuration > 0 Or
           Self.IsConfused()
            If Self.zsChild <> Null
                Self.zsChild = Null
                disownedChild = True
            End If

            If Self.zsParent <> Null
                Self.zsParent = Null
                disownedParent = True
            End If
        Else
            If Self.zsChild <> Null And
               Self.zsChild.dead
                Self.zsChild = Null
                disownedChild = True
            End If

            If Self.zsParent <> Null And
               Self.zsParent.dead
                Self.zsParent = Null
                disownedParent = True
            End If
        End If

        If Self.zsChild = Null And
           Self.zsParent = Null And
           (disownedChild Or
            disownedParent)
            Self.beatsPerMove = 1
            Self.currentMoveDelay = 2

            Self.animNormal.Set(0, New BeatAnimationData(10, 0.74, 0.99, False))
            Self.animNormal.Set(1, New BeatAnimationData(11, 0.49, 0.74, False))
            Self.animNormal.Set(2, New BeatAnimationData(12, 0.24, 0.49, False))
            Self.animNormal.Set(3, New BeatAnimationData(13, 0.99, 0.24, False))
            Self.animBlink.Set(1, New BeatAnimationData(14, 0.49, 0.74, False))
        Else If Self.zsChild <> Null And
                (Self.zsParent = Null And
                 disownedParent) Or
                (Self.animNormal.Get(0).frame <> 0 And
                 Self.zsParent = Null)

            Self.animNormal.Set(0, New BeatAnimationData(5, 0.74, 0.99, False))
            Self.animNormal.Set(1, New BeatAnimationData(6, 0.49, 0.74, False))
            Self.animNormal.Set(2, New BeatAnimationData(7, 0.24, 0.49, False))
            Self.animNormal.Set(3, New BeatAnimationData(8, 0.99, 0.24, False))
            Self.animBlink.Set(1, New BeatAnimationData(9, 0.49, 0.74, False))
        End If

        Local animOverrideOff := 0

        If Self.zsParent = Null
            If Self.zsChild <> Null
                animOverrideOff = 24
            Else
                animOverrideOff = 48
            End If
        End If

        Select Self.facing
            Case Direction.Right,
                 Direction.Left
                animOverrideOff += 8
            Case Direction.Down
                animOverrideOff += 16
        End Select

        If Self.currentMoveDelay > 1
            animOverrideOff += 4
        End If

        Self.animOverride = animOverrideOff + Audio.GetBeatAnimFrame4()

        Super.Update()
    End Method

End Class
