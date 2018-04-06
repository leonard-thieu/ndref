Class Point
    
    Function Add: Point(a: Point, b: Point)
    End Function

    Function _EditorFix() End

    Method New(xVal: Int, yVal: Int)
    End Method

    Field x: Int
    Field y: Int

    Method Add: Point(other: Point)
    End Method

    Method Add: Point(dx: Int, dy: Int)
    End Method

    Method Compare: Int(other: Point)
    End Method

    Method Equals: Bool(other: Point)
    End Method

    Method RotateCWAbout: Point(origin: Point)
    End Method

    Method Scale: Point(scalar: Int)
    End Method

    Method ToString: Int()
    End Method

    Method NoTrim()
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
