'Strict

Import monkey.stack
Import logger
Import point
Import util

Class Rect

    Function MakeBounds: Rect(minX: Int, minY: Int, maxX: Int, maxY: Int)
        Debug.TraceNotImplemented("Rect.MakeBounds()")
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

    Method Contains: Bool(other: Point)
        Debug.TraceNotImplemented("Rect.Contains()")
    End Method

    Method Contains: Bool(other: Rect)
        Debug.TraceNotImplemented("Rect.Contains()")
    End Method

    Method Contains: Bool(px: Int, py: Int)
        Debug.TraceNotImplemented("Rect.Contains()")
    End Method

    Method ContainsNoCorners: Bool(other: Rect)
        Debug.TraceNotImplemented("Rect.ContainsNoCorners()")
    End Method

    Method GetBottom: Int()
        Return Self.y + Self.h
    End Method

    Method GetCenter: Point()
        Debug.TraceNotImplemented("Rect.GetCenter()")
    End Method

    Method GetCorners: Stack<Point>()
        Debug.TraceNotImplemented("Rect.GetCorners()")
    End Method

    Method GetL1Dist: Int(other: Point)
        Debug.TraceNotImplemented("Rect.GetL1Dist()")
    End Method

    Method GetL1Dist: Int(other: Rect)
        Debug.TraceNotImplemented("Rect.GetL1Dist()")
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

    Method OnBorder: Bool(px: Int, py: Int)
        Debug.TraceNotImplemented("Rect.OnBorder()")
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

    Method NoTrim: Void()
        MakeBounds(0, 0, 0, 0)
        Contains(New Point())
        Contains(New Rect())
        Contains(0, 0)
        ContainsNoCorners(Null)
        GetBottom()
        GetCenter()
        GetCorners()
        GetL1Dist(New Point())
        GetL1Dist(New Rect())
        GetPoints()
        GetRight()
        OnBorder(0, 0)
        RandomPoint()
        ToString()
    End Method
    
End
