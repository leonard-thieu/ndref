Strict

Import point
Import rect

Class RoomData

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, wVal: Int, hVal: Int, type: Int, hasExit: Bool)
        Self.x = xVal
        Self.y = yVal
        Self.w = wVal
        Self.h = hVal
        Self.type = type
        Self.hasExit = hasExit
    End Method

    Field x: Int
    Field y: Int
    Field w: Int
    Field h: Int
    Field type: Int
    Field hasExit: Bool

    Method GetBounds: Rect()
        Return New Rect(Self.x, Self.y, Self.w, Self.h)
    End Method

    Method GetLocation: Point()
        Return New Point(Self.x, Self.y)
    End Method

    Method GetSize: Point()
        Return New Point(Self.w, Self.h)
    End Method

    Method ToString: String()
        Return Self.GetBounds().ToString()
    End Method

End Class
