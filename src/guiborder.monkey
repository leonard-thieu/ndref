'Strict

Import logger
Import sprite

Class GuiBorder

    Function _EditorFix: Void() End

    Method New(wVal: Int, hVal: Int, hGapW: Int, yO: Int)
        Debug.TraceNotImplemented("GuiBorder.New(Int, Int, Int, Int)")
    End Method

    Field w: Int
    Field h: Int
    Field headerGapWidth: Int
    Field yOff: Int
    Field corner1: Sprite
    Field corner2: Sprite
    Field corner3: Sprite
    Field corner4: Sprite
    Field horizTop1: Sprite
    Field horizTop2: Sprite
    Field horizBottom: Sprite
    Field vertLeft: Sprite
    Field vertRight: Sprite
    Field overlayBlack: Sprite
    Field xOff: Int
    Field tempX: Int
    Field tempY: Int
    Field headerGapStart: Int
    Field headerGapEnd: Int

    Method Render: Void()
        Debug.TraceNotImplemented("GuiBorder.Render()")
    End Method

End Class
