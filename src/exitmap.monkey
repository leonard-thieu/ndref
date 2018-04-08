Strict

Import monkey.map
Import point

Class ExitMap Extends Map<Point, Point>

    Function _EditorFix: Void() End

    Method Compare: Int(lhs: Point, rhs: Point)
        Throw New Throwable()
    End Method

End Class
