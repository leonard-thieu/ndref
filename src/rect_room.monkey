'Strict

Import logger
Import rect
Import room_base

Class RectRoom Extends RoomBase

    Function _EditorFix: Void() End

    Method New(rd: Object)
        Debug.TraceNotImplemented("RectRoom.New(Object)")
    End Method

    Field body: Rect

    Method GetBounds: Object()
        Debug.TraceNotImplemented("RectRoom.GetBounds()")
    End Method

    Method GetRandPoint: Object()
        Debug.TraceNotImplemented("RectRoom.GetRandPoint()")
    End Method

    Method IsFloor: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("RectRoom.IsFloor(Int, Int)")
    End Method

    Method IsOutside: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("RectRoom.IsOutside(Int, Int)")
    End Method

    Method IsWall: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("RectRoom.IsWall(Int, Int)")
    End Method

    Method ToRoomData: Object(roomType: Int)
        Debug.TraceNotImplemented("RectRoom.ToRoomData(Int)")
    End Method

End Class
