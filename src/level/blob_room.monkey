Strict

Import monkey.math
Import monkey.stack
Import level.room_base
Import intpointset
Import point
Import rect
Import tiledata

Class BlobRoom Extends RoomBase

    Function _EditorFix: Void() End

    Field footprint: IntPointSet = New IntPointSet()

    Method FillRect: Void(x: Int, y: Int, w: Int, h: Int)
        For Local a := x To x + w
            For Local b := y To y + h
                Local tileLocation := New Point(a, b)
                If Not Self.footprint.Contains(tileLocation)
                    Self.footprint.Insert(tileLocation)
                End If
            End For
        End For
    End Method

    Method GetBounds: Rect()
        Local x := 999999999
        Local y := 999999999
        Local xMax := -999999999
        Local yMax := -999999999

        For Local tileLocation := EachIn Self.footprint
            x = math.Min(x, tileLocation.x)
            y = math.Min(y, tileLocation.y)
            xMax = math.Max(xMax, tileLocation.x)
            yMax = math.Max(yMax, tileLocation.y)
        End For

        Return New Rect(x, y, xMax - x, yMax - y)
    End Method

    Method IsFloor: Bool(x: Int, y: Int)
        Return Self.IsFloorPoint(New Point(x, y))
    End Method

    Method IsFloorPoint: Bool(p: Point)
        Return Not Self.IsOutsidePoint(p) And
               Not Self.IsWallPoint(p)
    End Method

    Method IsOutside: Bool(x: Int, y: Int)
        Return Self.IsOutsidePoint(New Point(x, y))
    End Method

    Method IsOutsidePoint: Bool(p: Point)
        Return Not Self.footprint.Contains(p)
    End Method

    Method IsWall: Bool(x: Int, y: Int)
        If Self.IsOutside(x, y) Then Return False

        For Local a := x - 1 To x + 1
            For Local b := y - 1 To y + 1
                If Self.IsOutside(a, b) Then Return True
            End For
        End For

        Return False
    End Method

    Method IsWallPoint: Bool(p: Point)
        Return Self.IsWall(p.x, p.y)
    End Method

    Method MakeTiles: Stack<TileData>()
        Local tiles := New Stack<TileData>()

        For Local tilePoint := EachIn Self.footprint
            Local tileType := TileType.Floor
            If Self.IsWallPoint(tilePoint)
                tileType = TileType.DirtWall
            End If

            Local tileData := New TileData(tilePoint.x, tilePoint.y, tileType)
            tiles.Push(tileData)
        End For

        Return tiles
    End Method

    Method ReflectHorizontallyAbout: Void(x: Int)
        Local footprint := New IntPointSet()

        For Local tileLocation := EachIn Self.footprint
            Local reflectedLocation := New Point(x + x - tileLocation.x, tileLocation.y)
            footprint.Insert(reflectedLocation)
        End For

        Self.footprint = footprint
    End Method

    Method RotateCWAbout: Void(origin: Point)
        Local footprint := New IntPointSet()

        For Local tileLocation := EachIn Self.footprint
            Local rotatedPoint := tileLocation.RotateCWAbout(origin)
            footprint.Insert(rotatedPoint)
        End For

        Self.footprint = footprint
    End Method

    Method TranslateBy: Void(shift: Point)
        Local footprint := New IntPointSet()

        For Local tileLocation := EachIn Self.footprint
            Local translatedX := tileLocation.x + shift.x
            Local translatedY := tileLocation.y + shift.y
            Local translatedPoint := New Point(translatedX, translatedY)
            footprint.Insert(translatedPoint)
        End For

        Self.footprint = footprint
    End Method

End Class
