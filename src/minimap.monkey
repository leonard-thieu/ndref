'Strict

Import mojo.graphics
Import logger
Import sprite

Class Minimap

    Global dirtyPoints: Object
    Global showMinimap: Bool

    Function AddDirty: Void(p: Object)
        Debug.TraceNotImplemented("Minimap.AddDirty(Object)")
    End Function

    Function AddDirty: Void(x: Int, y: Int)
        Debug.TraceNotImplemented("Minimap.AddDirty(Int, Int)")
    End Function

    Function _EditorFix: Void() End

    Field minimapSpr: Sprite
    Field width: Int
    Field height: Int
    Field pixelData: Int[]
    Field minimapImg: Image
    Field minimapPlayerPixels: Sprite[]

    Method Draw3: Void()
        Debug.TraceNotImplemented("Minimap.Draw3()")
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
