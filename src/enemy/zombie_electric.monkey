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
        Local movementDir := Self.GetNextMovementDir()
        If movementDir = Util.InvertDir(Self.facing)
            Self.turnToFace = movementDir

            Return Self.facing
        End If

        Return movementDir
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
        Local tile := Level.GetTileAt(Self.x, Self.y)
        If tile = Null Or
           Not tile.IsWire()
            Return Self.facing
        End If

        Local dirMask := 0

        For Local dir := Direction.MinCardinalDirection To Direction.MaxCardinalDirection
            Local dirPoint := Util.GetPointFromDir(dir)
            Local bit := 1 Shl dir

            If tile.wireMask & bit <> 0 And
               Not Level.IsExitAt(Self.x + dirPoint.x, Self.y + dirPoint.y)
                dirMask |= bit
            End If
        End For

        Local nextMovementDir := Util.InvertDir(Self.facing)
        Local i := 0
        Local anyNewConnDir := Direction.None
        Local otherDir := Direction.None

        For Local dir := Direction.MinCardinalDirection To Direction.MaxCardinalDirection
            Local bit := 1 Shl dir

            If dirMask & bit <> 0
                i += 1

                otherDir = dir
                If nextMovementDir <> dir
                    anyNewConnDir = dir
                End If
            End If
        End For

        Local bit := 1 Shl Self.facing
        If dirMask & bit <> 0
            Return Self.facing
        End If

        Select i
            Case 1
                Return otherDir
            Case 2
                Debug.Assert(anyNewConnDir <> Direction.None)
        End Select

        Return anyNewConnDir
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
