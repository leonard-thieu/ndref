'Strict

Import monkey.stack
Import logger
Import point

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
        Debug.TraceNotImplemented("Rect.GetBottom()")
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
        Debug.TraceNotImplemented("Rect.GetPoints()")
    End Method

    Method GetRight: Int()
        Debug.TraceNotImplemented("Rect.GetRight()")
    End Method

    Method OnBorder: Bool(px: Int, py: Int)
        Debug.TraceNotImplemented("Rect.OnBorder()")
    End Method

    Method RandomPoint: Point()
        Debug.TraceNotImplemented("Rect.RandomPoint()")
    End Method

    Method ToString: Int()
        Debug.TraceNotImplemented("Rect.ToString()")
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
