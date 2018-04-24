'Strict

Import enemy
Import logger

Class ElectricMage Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("ElectricMage.New(Int, Int, Int)")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("ElectricMage.MoveImmediate(Int, Int, String)")
    End Method

End Class
