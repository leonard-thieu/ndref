'Strict

Import entity
Import logger

Class CrystalShards Extends Entity

    Global shardsList: Object

    Function AnyAt: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("CrystalShards.AnyAt(Int, Int)")
    End Function

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int)
        Debug.TraceNotImplemented("CrystalShards.New(Int, Int)")
    End Method

    Field fadeBeats: Int

    Method Die: Void()
        Debug.TraceNotImplemented("CrystalShards.Die()")
    End Method

    Method Move: Void()
        Debug.TraceNotImplemented("CrystalShards.Move()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("CrystalShards.Render()")
    End Method

End Class
