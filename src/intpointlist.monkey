'Strict

Import monkey.list
Import logger
Import point

Class IntPointList Extends List<Point>

    Function _EditorFix: Void() End

    Method Equals: Bool(a: Point, b: Point)
        Return a.x = b.x And
               a.y = b.y
    End Method

End Class
