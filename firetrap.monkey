Strict

Import trap

Class FireTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, d: Int, m: Bool)
        Throw New Throwable()
    End Method

    Field subtype: Int

End Class
