'Strict

Import logger

Class Point
    
    Function Add: Point(a: Point, b: Point)
        Debug.TraceNotImplemented("Point.Add()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Self.x = xVal
        Self.y = yVal
    End Method

    Field x: Int
    Field y: Int

    Method Add: Point(other: Point)
        Local x := Self.x + other.x
        Local y := Self.y + other.y

        Return New Point(x, y)
    End Method

    Method Add: Point(dx: Int, dy: Int)
        Debug.TraceNotImplemented("Point.Add()")
    End Method

    Method Compare: Int(other: Point)
        Debug.TraceNotImplemented("Point.Compare()")
    End Method

    Method Equals: Bool(other: Point)
        Debug.TraceNotImplemented("Point.Equals()")
    End Method

    Method RotateCWAbout: Point(origin: Point)
        Debug.TraceNotImplemented("Point.RotateCWAbout()")
    End Method

    Method Scale: Point(scalar: Int)
        Debug.TraceNotImplemented("Point.Scale()")
    End Method

    Method ToString: Int()
        Debug.TraceNotImplemented("Point.ToString()")
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
