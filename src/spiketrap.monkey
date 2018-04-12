'Strict

Import logger
Import trap

Class SpikeTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("SpikeTrap.New()")
    End Method

    Field retractCounter: Int
    Field frameToShow: Int

End Class
