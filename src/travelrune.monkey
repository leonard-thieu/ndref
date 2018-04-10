Strict

Import trap

Class TravelRune Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, toX: Int, toY: Int, runeNum: Int)
        Throw New Throwable()
    End Method

    Field runeType: Int
    Field travelToX: Int
    Field travelToY: Int
    Field retractCounter: Int

End Class

Class TravelRuneType

    Const Transmogrifier: Int = 1
    Const Unknown2: Int = 2
    Const Unknown3: Int = 3
    Const GlassShop: Int = 4
    Const Unknown5: Int = 5
    Const Conjurer: Int = 6
    Const Shriner: Int = 7
    Const Pawnbroker: Int = 8

End Class
