Strict

Class RoomData

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, width: Int, height: Int, type: Int, field_24: Bool)
        Self.x = xVal
        Self.y = yVal
        Self.width = width
        Self.height = height
        Self.type = type
        Self.field_24 = field_24
    End Method

    Field x: Int
    Field y: Int
    Field width: Int
    Field height: Int
    Field type: Int
    Field field_24: Bool

    Method GetBounds: Object()
        Throw New Throwable()
    End Method

    Method GetLocation: Object()
        Throw New Throwable()
    End Method

    Method GetSize: Object()
        Throw New Throwable()
    End Method

    Method ToString: String()
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        GetBounds()
        GetLocation()
        GetSize()
        ToString()
    End Method

End Class
