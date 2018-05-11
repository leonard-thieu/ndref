Strict

Import point
Import rect
Import room_base
Import roomdata
Import util

Class RectRoom Extends RoomBase

    Function _EditorFix: Void() End

    Method New(rd: RoomData)
        Self.body = New Rect(rd.x, rd.y, rd.w, rd.h)
    End Method

    Method New(body: Rect)
        Self.body = body
    End Method

    Field body: Rect

    Method GetBounds: Rect()
        Return Self.body.Copy()
    End Method

    Method GetRandPoint: Point()
        Local xOff := Util.RndIntRangeFromZero(Self.body.w - 2, True)
        Local x := Self.body.x + xOff + 1
        Local yOff := Util.RndIntRangeFromZero(Self.body.h - 2, True)
        Local y := Self.body.y + yOff + 1

        Return New Point(x, y)
    End Method

    Method IsFloor: Bool(x: Int, y: Int)
        Return Not Self.IsOutside(x, y) And
               Not Self.body.OnBorder(x, y)
    End Method

    Method IsOutside: Bool(x: Int, y: Int)
        Return Not Self.body.Contains(x, y)
    End Method

    Method IsWall: Bool(x: Int, y: Int)
        Return Self.body.OnBorder(x, y)
    End Method

    Method ToRoomData: RoomData(roomType: Int)
        Return New RoomData(Self.body.x, Self.body.y, Self.body.w, Self.body.h, roomType, False)
    End Method

End Class
