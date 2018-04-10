Strict

Import image
Import trap

Class TravelRune Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, toX: Int, toY: Int, runeNum: Int)
        Self.trapType = TrapType.TravelRune
        Self.isRune = True

        Self.runeType = runeNum
        Self.x = xVal
        Self.y = yVal
        Self.xOff = -1.0
        Self.yOff = 12.0
        Self.travelToX = toX
        Self.travelToY = toY
        
        Local image := New Sprite("traps/travelrune.png", 24, 24, 4, Image.DefaultFlags)
        image.SetZ(-995.0)
        Self.image = image
    End Method

    Field runeType: Int = 1
    Field travelToX: Int
    Field travelToY: Int
    Field retractCounter: Int

End Class

Class TravelRuneType

    Const Transmogrifier: Int = 1
    Const Arena: Int = 2
    Const BloodShop: Int = 3
    Const GlassShop: Int = 4
    Const HealthShop: Int = 5
    Const Conjurer: Int = 6
    Const Shriner: Int = 7
    Const Pawnbroker: Int = 8

End Class
