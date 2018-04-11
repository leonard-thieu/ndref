'Strict

Import logger
Import trap

Class ConfuseTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("ConfuseTrap.New()")
    End Method

End Class
