Strict

Import monkey.stack
Import point

Class Rect

    Function MakeBounds: Rect(minX: Int, minY: Int, maxX: Int, maxY: Int)
        Throw New Throwable()
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
        Throw New Throwable()
    End Method

    Method Contains: Bool(other: Rect)
        Throw New Throwable()
    End Method

    Method Contains: Bool(px: Int, py: Int)
        Throw New Throwable()
    End Method

    Method ContainsNoCorners: Bool(other: Rect)
        Throw New Throwable()
    End Method

    Method GetBottom: Int()
        Throw New Throwable()
    End Method

    Method GetCenter: Point()
        Throw New Throwable()
    End Method

    Method GetCorners: Stack<Point>()
        Throw New Throwable()
    End Method

    Method GetL1Dist: Int(other: Point)
        Throw New Throwable()
    End Method

    Method GetL1Dist: Int(other: Rect)
        Throw New Throwable()
    End Method

    Method GetPoints: Stack<Point>()
        Throw New Throwable()
    End Method

    Method GetRight: Int()
        Throw New Throwable()
    End Method

    Method OnBorder: Bool(px: Int, py: Int)
        Throw New Throwable()
    End Method

    Method RandomPoint: Point()
        Throw New Throwable()
    End Method

    Method ToString: Int()
        Throw New Throwable()
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
