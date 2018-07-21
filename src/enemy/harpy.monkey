'Strict

Import monkey.list
Import monkey.math
Import enemy
Import level
Import logger
Import point
Import util

Class Harpy Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "harpy")

        Self.movesRegardlessOfDistance = True

        Self.overrideHitSound = "harpyHit"
        Self.overrideDeathSound = "harpyDeath"
        Self.overrideAttackSound = "harpyAttack"
    End Method

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Harpy.CanBeLord()")
    End Method

    Method GetMovementDirection: Point()
        Local movementDirection := New Point(0, 0)

        Local closestPlayer := Util.GetClosestPlayerIncludeItemEffects(Self.x, Self.y, False)
        If closestPlayer = Null
            Return movementDirection
        End If

        Self.seekingPlayer = closestPlayer

        If Util.GetDist(Self.x, Self.y, closestPlayer.x, closestPlayer.y) <= 1.0
            Return Self.BasicSeek()
        End If

        Local points := New List<Point>()

        For Local xOff := -3 To 3
            For Local yOff := -3 To 3
                Local nextX := Self.x + xOff
                Local nextY := Self.y + yOff

                ' The first condition is probably checking L1 distance semantically.
                If math.Abs(xOff) + math.Abs(yOff) <= 3 And
                   Not Util.IsGlobalCollisionAt(nextX, nextY, False, False, False, False) And
                   Not Util.IsAnyPlayerAt(nextX, nextY) And
                   Level.CheckLOS(Self.x, Self.y, nextX, nextY, True)
                    points.AddLast(New Point(xOff, yOff))
                End If
            End For
        End For

        Local l1DistToClosestPlayer := Util.GetL1Dist(closestPlayer.x, closestPlayer.y, Self.x, Self.y)

        For Local point := EachIn points
            Local nextL1Dist := Util.GetL1Dist(closestPlayer.x, closestPlayer.y, Self.x + point.x, Self.y + point.y)
            ' Looks like this is trying to find the closest point. Consider flipping the comparisons around to make it more obvious.
            If l1DistToClosestPlayer > nextL1Dist Or
               Util.GetDist(movementDirection.x, movementDirection.y, 0, 0) > Util.GetDist(point.x, point.y, 0, 0)
                movementDirection = point
            End If
        End For

        If movementDirection.x = 0 And
           movementDirection.y = 0
            Return Self.BasicSeek()
        End If

        Return movementDirection
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Harpy.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Harpy.Update()")
    End Method

End Class
