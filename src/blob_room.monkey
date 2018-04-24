'Strict

Import intpointset
Import logger
Import point
Import room_base

Class BlobRoom Extends RoomBase

    Function _EditorFix: Void() End

    Field footprint: IntPointSet

    Method FillRect: Void(x: Int, y: Int, w: Int, h: Int)
        Debug.TraceNotImplemented("BlobRoom.FillRect(Int, Int, Int, Int)")
    End Method

    Method GetBounds: Object()
        Debug.TraceNotImplemented("BlobRoom.GetBounds()")
    End Method

    Method IsFloor: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("BlobRoom.IsFloor(Int, Int)")
    End Method

    Method IsFloorPoint: Bool(p: Point)
        Debug.TraceNotImplemented("BlobRoom.IsFloorPoint(Point)")
    End Method

    Method IsOutside: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("BlobRoom.IsOutside(Int, Int)")
    End Method

    Method IsOutsidePoint: Bool(p: Point)
        Debug.TraceNotImplemented("BlobRoom.IsOutsidePoint(Point)")
    End Method

    Method IsWall: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("BlobRoom.IsWall(Int, Int)")
    End Method

    Method IsWallPoint: Bool(p: Point)
        Debug.TraceNotImplemented("BlobRoom.IsWallPoint(Point)")
    End Method

    Method MakeTiles: Object()
        Debug.TraceNotImplemented("BlobRoom.MakeTiles()")
    End Method

    Method ReflectHorizontallyAbout: Void(x: Int)
        Debug.TraceNotImplemented("BlobRoom.ReflectHorizontallyAbout(Int)")
    End Method

    Method RotateCWAbout: Void(origin: Object)
        Debug.TraceNotImplemented("BlobRoom.RotateCWAbout(Object)")
    End Method

    Method TranslateBy: Void(shift: Object)
        Debug.TraceNotImplemented("BlobRoom.TranslateBy(Object)")
    End Method

End Class
