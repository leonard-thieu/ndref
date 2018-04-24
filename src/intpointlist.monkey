'Strict

Import monkey.list
Import logger
Import point

Class IntPointList Extends List<Point>

    Function _EditorFix: Void() End

    Method Equals: Bool(a: Point, b: Point)
        Debug.TraceNotImplemented("IntPointList.Equals(Point, Point)")
    End Method

End Class
