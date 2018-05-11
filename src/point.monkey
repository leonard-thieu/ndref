'Strict

Import logger

Class Point

    Function Add: Point(a: Point, b: Point)
        Debug.TraceNotImplemented("Point.Add(Point, Point)")
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
        Debug.TraceNotImplemented("Point.Add(Int, Int)")
    End Method

    Method Compare: Int(other: Point)
        Debug.TraceNotImplemented("Point.Compare(Point)")
    End Method

    Method Equals: Bool(other: Point)
        Return Self.x = other.x And
               Self.y = other.y
    End Method

    Method RotateCWAbout: Point(origin: Point)
        Local rotatedX := origin.x - origin.y + Self.y
        Local rotatedY := origin.x + origin.y - Self.x

        Return New Point(rotatedX, rotatedY)
    End Method

    Method Scale: Point(scalar: Int)
        Local scaledX := scalar * Self.x
        Local scaledY := scalar * Self.y

        Return New Point(scaledX, scaledY)
    End Method

    Method ToString: String()
        Return "(" + Self.x + ", " + Self.y + ")"
    End Method

End Class

Class Point2

    Function _EditorFix: Void() End

    Field x: Float
    Field y: Float

End Class
