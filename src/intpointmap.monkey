Strict

Import monkey.map
Import point

Class IntPointMap<T> Extends Map<Point, T>

    Function _EditorFix: Void() End

    Method Compare: Int(lhs: Point, rhs: Point)
        If lhs.x > rhs.x Then Return 1
        If lhs.x < rhs.x Then Return -1
        If lhs.y > rhs.y Then Return 1
        If lhs.y < rhs.y Then Return -1

        Return 0
    End Method

End Class
