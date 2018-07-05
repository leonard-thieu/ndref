'Strict

Import logger
Import point
Import sprite

Class Arrow

    Global arrowList: Object

    Function RenderAll: Void()
        Debug.TraceNotImplemented("Arrow.RenderAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(origX: Int, origY: Int, xOff: Int, yOff: Int, tmpDir: Int, type_: Int)
        Debug.TraceNotImplemented("Arrow.New(Int, Int, Int, Int, Int, Int)")
    End Method

    Field type: Int
    Field startTile: Point
    Field tileDist: Int
    Field dir: Int
    Field image: Sprite
    Field renderFrames: Int

    Method Render: Void()
        Debug.TraceNotImplemented("Arrow.Render()")
    End Method

End Class
