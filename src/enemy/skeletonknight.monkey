'Strict

Import monkey.math
Import enemy
Import level
Import audio2
Import camera
Import crystal_shards
Import entity
Import logger
Import point
Import shrine
Import util

Class SkeletonKnight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()
        
        If Shrine.warShrineActive
            l = math.Max(3, l)
        End If

        Self.Init(xVal, yVal, l, "skeletonknight")

        Self.enableTell = False
        Self.swarmCulprit = True

        Self.overrideHitSound = "skeletonKnightDeath"
        Self.overrideDeathSound = "skeletonKnightDeath"
        Self.overrideAttackSound = "skeletonKnightAttack"
    End Method

    Field hasHead: Bool = True
    Field cachedMoveDir: Point = New Point(0, 0)
    Field directionHitFrom: Int = Direction.None
    Field gotBounced: Bool
    Field hasHorse: Bool = True
    Field shieldDestroyed: Bool
    Field shieldDir: Int = Direction.Down
    Field hasRoared: Bool
    Field justBounced: Bool
    Field willHaveHead: Bool = True

    Method AdjustShieldDir: Void()
        If Self.cachedMoveDir.x > 0
            Self.shieldDir = Direction.Right
        Else If Self.cachedMoveDir.x < 0
            Self.shieldDir = Direction.Left
        Else If Self.cachedMoveDir.y > 0
            Self.shieldDir = Direction.Down
        Else If Self.cachedMoveDir.y < 0
            Self.shieldDir = Direction.Up
        End If
    End Method

    Method Beheadable: Bool()
        Debug.TraceNotImplemented("SkeletonKnight.Beheadable()")
    End Method

    Method DestroyHorse: Void(dir: Int)
        Debug.TraceNotImplemented("SkeletonKnight.DestroyHorse(Int)")
    End Method

    Method DestroyShield: Void(dir: Int)
        Debug.TraceNotImplemented("SkeletonKnight.DestroyShield(Int)")
    End Method

    Method Die: Void()
        If Self.level = 4
            New CrystalShards(Self.x, Self.y)
        End If

        Super.Die()
    End Method

    Method GetMovementDirection: Point()
        If Not Self.hasHead
            Return Util.GetPointFromDir(Self.directionHitFrom)
        End If

        Self.cachedMoveDir = Self.BasicSeek()

        Return Self.cachedMoveDir
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("SkeletonKnight.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("SkeletonKnight.Knockback(Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("SkeletonKnight.MoveFail()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("SkeletonKnight.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Super.MoveSucceed(hitPlayer, moveDelayed)

        If Self.justBounced
            Self.justBounced = False
        Else
            Self.AdjustShieldDir()
        End If
    End Method

    Method Update: Void()
        If Not Self.hasHorse And
           Not Self.shieldDestroyed
            Select Self.shieldDir
                Case Direction.Left
                    Self.image.FlipX(False, True)
                Case Direction.Right
                    Self.image.FlipX(True, True)
            End Select
        End If

        If Self.directionHitFrom <> Direction.None And
           Self.gotBounced And
           Not Self.hasHead
            Self.gotBounced = False

            If Self.x < Self.lastX
                Self.directionHitFrom = Direction.Left
            Else If Self.x > Self.lastX
                Self.directionHitFrom = Direction.Right
            Else If Self.y < Self.lastY
                Self.directionHitFrom = Direction.Up
            Else If Self.y > Self.lastY
                Self.directionHitFrom = Direction.Down
            End If
        End If

        If Not Self.hasHorse And
           Not Self.shieldDestroyed
            Select Self.shieldDir
                Case Direction.Right,
                     Direction.Left
                    Self.animOverrideState = 2
                Case Direction.Up
                    Self.animOverrideState = 0
                Default
                    Self.animOverrideState = 4
            End Select

            If Audio.IsBeatAnimTime(False, False)
                Self.animOverride = 1
            Else
                Self.animOverride = 0
            End If
        End If

        If Not Self.invisible And
           Self.IsVisible() And
           Camera.IsOnScreen(Self.x, Self.y) And
           Not Self.hasRoared And
           Not Level.isLevelEditor
            If Self.hasHorse
                Audio.PlayGameSoundAt("skeletonKnightCry", Self.x, Self.y, True, -1, False)
            End If

            Self.hasRoared = True
        End If

        Super.Update()
    End Method

End Class
