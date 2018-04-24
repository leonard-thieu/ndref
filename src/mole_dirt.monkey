'Strict

Import entity
Import logger

Class MoleDirt Extends Entity

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("MoleDirt.New(Int, Int)")
    End Method

    Field occupied: Bool
    Field vibrate: Bool
    Field vibrateCounter: Int
    Field vibrateOffset: Float
    Field preFadeCounter: Int
    Field PREFADE_TIME: Int
    Field fadeCounter: Int
    Field FADE_TIME: Int

    Method Render: Void()
        Debug.TraceNotImplemented("MoleDirt.Render()")
    End Method

    Method Unoccupy: Void()
        Debug.TraceNotImplemented("MoleDirt.Unoccupy()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("MoleDirt.Update()")
    End Method

    Method UpdateFade: Void()
        Debug.TraceNotImplemented("MoleDirt.UpdateFade()")
    End Method

End Class
