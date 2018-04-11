'Strict

Import logger
Import trap

Class SlowDownTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("SlowDownTrap.New(xVal()")
    End Method

End Class
