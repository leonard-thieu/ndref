Strict

Import logger
Import rect
Import rect_room

Class RoomWithDoor Extends RectRoom

    Function _EditorFix: Void() End

    Method New(body_: Rect, door_: Rect)
        Self.body = body_
        Self.door = door_

        Debug.Assert(Self.body.Contains(Self.door))
    End Method

    Field door: Rect

    Method IsWall: Bool(x: Int, y: Int)
        Return Self.body.OnBorder(x, y) And
               Not Self.door.Contains(x, y)
    End Method

End Class
