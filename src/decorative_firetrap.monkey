'Strict

Import logger
Import trap

Class DecorativeFireTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("DecorativeFireTrap.New(Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("DecorativeFireTrap.Update()")
    End Method

End Class
