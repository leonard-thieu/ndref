'Strict

Import monkey.map
Import logger
Import point

Class ExitMap Extends Map<Point, Point>

    Function _EditorFix: Void() End

    Method Compare: Int(lhs: Point, rhs: Point)
        Debug.TraceNotImplemented("ExitMap.Compare()")
    End Method

End Class
