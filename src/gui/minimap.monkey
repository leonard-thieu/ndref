'Strict

Import monkey.list
Import mojo.graphics
Import level
Import logger
Import point
Import sprite

Class Minimap

    Global dirtyPoints: List<Point> = New List<Point>()
    Global showMinimap: Bool = True
    Global wasShowingMinimap: Bool = True

    Function AddDirty: Void(p: Point)
        Debug.TraceNotImplemented("Minimap.AddDirty(Point)")
    End Function

    Function AddDirty: Void(x: Int, y: Int)
        Debug.TraceNotImplemented("Minimap.AddDirty(Int, Int)")
    End Function

    Function IsOutsideMinimapBounds: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("Minimap.IsOutsideMinimapBounds(Int, Int)")
    End Function

    Function _EditorFix: Void() End

    Method New()
        Minimap.dirtyPoints.Clear()

        Self.width = Level.maxLevelMinimapX - Level.minLevelMinimapX + 1
        Self.height = Level.maxLevelMinimapY - Level.minLevelMinimapY + 1

        Local pixelDataWidth := 2 * Self.width
        Local pixelDataHeight := 2 * Self.height
        Local pixelDataLength := pixelDataWidth * pixelDataHeight

        ' HACK: pixelDataLength can become too large to allocate an array.
        If pixelDataLength > 10000
            pixelDataLength = 10000
        End If

        Self.pixelData = New Int[pixelDataLength]

        Self.minimapImg = graphics.CreateImage(pixelDataWidth, pixelDataHeight)
        Self.minimapSpr = New Sprite(Self.minimapImg)
        Self.minimapSpr.SetZ(10000.0)
        Self.minimapSpr.InWorld = False

        Self.minimapPlayerPixels[0] = New Sprite("level/minimap_player_pixel.png", 1)
        Self.minimapPlayerPixels[0].SetZ(10001.0)
        Self.minimapPlayerPixels[0].InWorld = False
        Self.minimapPlayerPixels[1] = New Sprite("level/minimap_player_pixel.png", 1)
        Self.minimapPlayerPixels[1].SetZ(10001.0)
        Self.minimapPlayerPixels[1].InWorld = False

        Self.UpdateAll()
    End Method

    Field minimapSpr: Sprite
    Field width: Int
    Field height: Int
    Field pixelData: Int[]
    Field minimapImg: Image
    Field minimapPlayerPixels: Sprite[2]

    Method Draw: Void()
        Debug.TraceNotImplemented("Minimap.Draw()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Minimap.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Minimap.Update()")
    End Method

    Method UpdateAll: Void()
        Debug.TraceNotImplemented("Minimap.UpdateAll()")
    End Method

    Method UpdateAt: Void(x: Int, y: Int)
        Debug.TraceNotImplemented("Minimap.UpdateAt(Int, Int)")
    End Method

End Class
