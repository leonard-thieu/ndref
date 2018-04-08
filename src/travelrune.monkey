Strict

Import trap

Class TravelRune Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, toX: Int, toY: Int, runeNum: Int)
        Throw New Throwable()
    End Method

    Field subtype: Int

End Class
