'Strict

Import enemy
Import logger
Import player_class
Import sprite

Class Lich Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Lich.New(Int, Int, Int)")
    End Method

    Field gustImage: Sprite
    Field playerGusted: Player
    Field animStartAt: Int

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Lich.MoveImmediate(Int, Int, String)")
    End Method

End Class
