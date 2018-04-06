Import item
Import medic
Import shopkeeper

Class SaleItem Extends Item

    Global lastSaleItemClass1: String
    Global lastSaleItemClass2: String
    Global randomSaleItemList: List<String>
    Global currentSaleItems: List<SaleItem>

    Method New(xVal: Int, yVal: Int, type: String, bldCost: Bool, sk: Shopkeeper, fCost: Float, m: Medic)
        Super.New(xVal, yVal, type, False, -1, False)

        currentSaleItems.AddLast(Self)
        field_F6 = True
        bldCost = bldCost
        fCost = fCost
        SetCost()
        shopkeeper = sk
        medic = m
    End Method

    Field shopkeeper: Shopkeeper
    Field medic: Medic
    Field bldCost: Bool
    Field fCost: Float
    Field field_144: Int
    Field field_148: Int

    Method SetCost: Void()
    End Method

End Class
