Class RoomData

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
    End Method

    Method GetLocation: Object()
    End Method

    Method GetSize: Object()
    End Method

    Method ToString: String()
    End Method

    Method NoTrim()
        GetBounds()
        GetLocation()
        GetSize()
        ToString()
    End Method

End Class
