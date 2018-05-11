Strict

Import monkey.math
Import monkey.stack
Import point
Import util

Class Rect

    Function MakeBounds: Rect(minX: Int, minY: Int, maxX: Int, maxY: Int)
        Return New Rect(minX, minY, maxX - minX, maxY - minY)
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Self.x = xVal
        Self.y = yVal
        Self.w = wVal
        Self.h = hVal
    End Method

    Field x: Int
    Field y: Int
    Field w: Int
    Field h: Int

    Method Copy: Rect()
        Return New Rect(Self.x, Self.y, Self.w, Self.h)
    End Method

    Method Contains: Bool(other: Point)
        Return Self.Contains(New Rect(other.x, other.y, 0, 0))
    End Method

    Method Contains: Bool(other: Rect)
        If Self.x > other.x Then Return False
        If Self.GetRight() < other.GetRight() Then Return False
        If Self.y > other.y Then Return False
        If Self.GetBottom() < other.GetBottom() Then Return False

        Return True
    End Method

    Method Contains: Bool(px: Int, py: Int)
        Return Self.Contains(New Point(px, py))
    End Method

    Method ContainsNoCorners: Bool(other: Rect)
        For Local corner := EachIn Self.GetCorners()
            If other.Contains(corner.x, corner.y)
                Return False
            End If
        End For

        Return Self.Contains(other)
    End Method

    Method GetBottom: Int()
        Return Self.y + Self.h
    End Method

    Method GetCenter: Point()
        Local centerX := Self.x + (Self.w / 2)
        Local centerY := Self.y + (Self.h / 2)

        Return New Point(centerX, centerY)
    End Method

    Method GetCorners: Stack<Point>()
        Local corners := New Stack<Point>()

        corners.Push(New Point(Self.GetLeft(), Self.GetTop()))
        corners.Push(New Point(Self.GetLeft(), Self.GetBottom()))
        corners.Push(New Point(Self.GetRight(), Self.GetTop()))
        corners.Push(New Point(Self.GetRight(), Self.GetBottom()))

        Return corners
    End Method

    Method GetLeft: Int()
        Return Self.x
    End Method

    Method GetL1Dist: Int(other: Point)
        Local xDiff := 0
        If other.x < Self.x
            xDiff = Self.x - other.x
        Else If other.x > Self.GetRight()
            xDiff = other.x - Self.GetRight()
        End If

        Local yDiff := 0
        If other.y < Self.y
            yDiff = Self.y - other.y
        Else If other.y > Self.GetBottom()
            yDiff = other.y - Self.GetBottom()
        End If

        Return xDiff + yDiff
    End Method

    Method GetL1Dist: Int(other: Rect)
        Local l1Dist := 999999

        For Local corner := EachIn Self.GetCorners()
            l1Dist = math.Min(l1Dist, other.GetL1Dist(corner))
        End For

        For Local otherCorner := EachIn other.GetCorners()
            l1Dist = math.Min(l1Dist, Self.GetL1Dist(otherCorner))
        End For

        Return l1Dist
    End Method

    Method GetPoints: Stack<Point>()
        Local points := New Stack<Point>()

        Local xMax := Self.x + Self.w
        Local yMax := Self.y + Self.h
        For Local x := Self.x To xMax
            For Local y := Self.y To yMax
                points.Push(New Point(x, y))
            End For
        End For

        Return points
    End Method

    Method GetRight: Int()
        Return Self.x + Self.w
    End Method

    Method GetTop: Int()
        Return Self.y
    End Method

    Method OnBorder: Bool(px: Int, py: Int)
        If Not Self.Contains(px, py) Then Return False

        If px = Self.x Then Return True
        If py = Self.y Then Return True
        If px = Self.x + Self.w Then Return True
        If py = Self.y + Self.h Then Return True

        Return False
    End Method

    Method RandomPoint: Point()
        Local x := Util.RndIntRange(Self.x, Self.x + Self.w, False, -1)
        Local y := Util.RndIntRange(Self.y, Self.y + Self.h, False, -1)

        Return New Point(x, y)
    End Method

    Method ToString: String()
        Return "[" + Self.x + ", " + Self.GetRight() + "]" + " x " +
               "[" + Self.y + ", " + Self.GetBottom() + "]"
    End Method

End Class
