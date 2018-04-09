Strict

Import monkey.list
Import item
Import medic
Import shopkeeper
Import sprite

Class SaleItem Extends Item

    Const CHARISMA_DISCOUNT: Float = 0.5

    Global currentSaleItems: List<SaleItem> = New List<SaleItem>()
    Global randomSaleItemList: List<String> = New List<String>()
    Global lastSaleItemClass1: String
    Global lastSaleItemClass2: String

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, type: String, bldCost: Bool, sk: Shopkeeper, fCost: Float, m: Medic)
        Super.New(xVal, yVal, type, False, -1, False)

        Self.isSaleItem = True
        SaleItem.currentSaleItems.AddLast(Self)

        Self.hasBloodCost = bldCost
        Self.forceCost = fCost
        Self.SetCost()

        Self.shopkeeper = sk
        Self.medic = m
    End Method

    Field bloodCost: Float
    Field cost: Float = 999.0
    Field discount: Float = 1.0
    Field forceCost: Float = -1.0
    Field miniDiamond: Sprite
    Field miniHeart: Sprite
    Field digits: Sprite[]
    Field digitVal: int[]
    Field shopkeeper: Shopkeeper
    Field medic: Medic

    Method SetCost: Void()
    End Method

End Class
