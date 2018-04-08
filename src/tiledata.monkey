Strict

Class TileData

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, type: Int)
        Self.x = xVal
        Self.y = yVal
        Self.type = type
    End Method

    Field x: Int
    Field y: Int
    Field type: Int

End Class
