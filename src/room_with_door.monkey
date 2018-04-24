'Strict

Import logger
Import rect
Import rect_room

Class RoomWithDoor Extends RectRoom

    Function _EditorFix: Void() End

    Method New(body_: Object, door_: Object)
        Debug.TraceNotImplemented("RoomWithDoor.New(Object, Object)")
    End Method

    Field door: Rect

    Method IsWall: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("RoomWithDoor.IsWall(Int, Int)")
    End Method

End Class
