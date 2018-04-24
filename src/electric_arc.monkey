'Strict

Import entity
Import logger

Class ElectricArc

    Global animRenderFrames: Object
    Global arcList: Object
    Global imageDown: Object
    Global imageDownLeft: Object
    Global imageFlash: Object
    Global totalRenderFrames: Int

    Function RenderAll: Void()
        Debug.TraceNotImplemented("ElectricArc.RenderAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(targetX_: Int, targetY_: Int, inDir: Int, delay_: Int, flashOnly_: Bool)
        Debug.TraceNotImplemented("ElectricArc.New(Int, Int, Int, Int, Bool)")
    End Method

    Field targetX: Int
    Field targetY: Int
    Field outDir: Int
    Field delayFrames: Int
    Field flashOnly: Bool
    Field lightSource: Entity
    Field renderFrames: Int

    Method GetFrameIndexFromRenderFrames: Int(renderFrame: Int)
        Debug.TraceNotImplemented("ElectricArc.GetFrameIndexFromRenderFrames(Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ElectricArc.Render()")
    End Method

End Class
