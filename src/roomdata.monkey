'Strict

Import logger
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

    Method GetBounds: Object()
        Debug.TraceNotImplemented("RoomData.GetBounds()")
    End Method

    Method GetLocation: Object()
        Debug.TraceNotImplemented("RoomData.GetLocation()")
    End Method

    Method GetSize: Object()
        Debug.TraceNotImplemented("RoomData.GetSize()")
    End Method

    Method ToString: String()
        Local rect := New Rect(Self.x, Self.y, Self.w, Self.h)

        Return rect.ToString()
    End Method

End Class
