Strict

Class Point
    
    Function Add: Point(a: Point, b: Point)
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Field x: Int
    Field y: Int

    Method Add: Point(other: Point)
        Throw New Throwable()
    End Method

    Method Add: Point(dx: Int, dy: Int)
        Throw New Throwable()
    End Method

    Method Compare: Int(other: Point)
        Throw New Throwable()
    End Method

    Method Equals: Bool(other: Point)
        Throw New Throwable()
    End Method

    Method RotateCWAbout: Point(origin: Point)
        Throw New Throwable()
    End Method

    Method Scale: Point(scalar: Int)
        Throw New Throwable()
    End Method

    Method ToString: Int()
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        Add(Null, Null)
        Add(Null)
        Add(0, 0)
        Compare(Null)
        Equals(Null)
        RotateCWAbout(Null)
        Scale(0)
        ToString()
    End Method

End Class

Class Point2

End Class
