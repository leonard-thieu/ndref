'Strict

Import enemy
Import logger

Class Hellhound Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Hellhound.New(Int, Int, Int)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Hellhound.Die()")
    End Method

End Class
