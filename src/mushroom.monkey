'Strict

Import enemy
Import logger

Class Mushroom Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Mushroom.New(Int, Int, Int)")
    End Method

    Field vibrateCounter: Int
    Field vibrateOffset: Float

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Mushroom.MoveFail()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Mushroom.Update()")
    End Method

End Class
