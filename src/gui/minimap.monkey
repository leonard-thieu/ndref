'Strict

Import monkey.list
Import mojo.graphics
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
        Debug.TraceNotImplemented("Minimap.New()")
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
