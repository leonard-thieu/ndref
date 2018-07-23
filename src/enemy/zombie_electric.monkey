'Strict

Import enemy
Import level
Import audio2
Import entity
Import logger
Import point
Import util

Class ZombieElectric Extends Enemy

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int, l: Int)
        Super.New()

        Self.Init(x_, y_, l, "zombie_electric")

        Self.facing = Util.RndIntRange(Direction.MinCardinalDirection, Direction.MaxCardinalDirection, True)
        Self.movesRegardlessOfDistance = True
        Self.facing = Self.GetMovementDir()

        Self.overrideAttackSound = "eleczombieAttack"
        Self.overrideDeathSound = "eleczombieDeath"
    End Method

    Field facing: Int = Direction.None
    Field turnToFace: Int = Direction.None
    Field rested: Bool
    Field queueRest: Bool

    Method GetMovementDir: Int()
        Debug.TraceNotImplemented("ZombieElectric.GetMovementDir()")
    End Method

    Method GetMovementDirection: Point()
        Self.queueRest = False

        If Self.turnToFace <> Direction.None
            Return New Point(0, 0)
        End If

        If Not Level.IsWireAt(Self.x, Self.y) And
           Not Self.rested
            Self.queueRest = True

            Return New Point(0, 0)
        End If

        Return Util.GetPointFromDir(Self.facing)
    End Method

    Method GetNextMovementDir: Int()
        Debug.TraceNotImplemented("ZombieElectric.GetNextMovementDir()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("ZombieElectric.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("ZombieElectric.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Self.rested = False

        If Self.queueRest
            Self.rested = True
            Self.queueRest = False
        End If

        If Self.turnToFace <> Direction.None
            Self.facing = Self.turnToFace
            Self.turnToFace = Direction.None

            Self.BounceInPlace(False)
        End If

        Self.facing = Self.GetMovementDir()

        Super.MoveSucceed(hitPlayer, moveDelayed)
    End Method

    Method Update: Void()
        Select Self.facing
            Case Direction.Left
                Self.image.FlipX(False, True)
            Case Direction.Right
                Self.image.FlipX(True, True)
        End Select

        Local animOverrideBase := 0

        Select Self.facing
            Case Direction.Left,
                 Direction.Right
                animOverrideBase = 16
            Case Direction.Down
                animOverrideBase = 32
        End Select

        If Level.IsWireLikeAt(Self.x, Self.y)
            animOverrideBase += 8
        Else If Not Self.rested
            animOverrideBase += 4
        End If

        Self.animOverride = Audio.GetBeatAnimFrame4() + animOverrideBase

        Super.Update()
    End Method

End Class
