'Strict

Import logger
Import trap

Class FireTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, d: Int, m: Bool)
        Debug.TraceNotImplemented("FireTrap.New()")
    End Method

    Field subtype: Int

End Class
