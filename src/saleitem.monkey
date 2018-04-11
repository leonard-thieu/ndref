'Strict

Import monkey.list
Import item
Import logger
Import medic
Import shopkeeper
Import sprite

Class SaleItem Extends Item

    Const CHARISMA_DISCOUNT: Float = 0.5

    Global currentSaleItems: List<SaleItem> = New List<SaleItem>()
    Global randomSaleItemList: List<String> = New List<String>()
    Global lastSaleItemClass1: String
    Global lastSaleItemClass2: String

    Function GetCostMultiplier: Float()
        Debug.TraceNotImplemented("SaleItem.GetCostMultiplier()")
    End Function

    Function GetMinCost: Int()
        Debug.TraceNotImplemented("SaleItem.GetMinCost()")
    End Function

    Function GetRandomItem: Int(level: Int, randType: Int)
        Debug.TraceNotImplemented("SaleItem.GetRandomItem()")
    End Function

    Function ResetCosts: Void()
        Debug.TraceNotImplemented("SaleItem.ResetCosts()")
    End Function

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

    Method ApplyDiscount: Void(val: Float)
        Debug.TraceNotImplemented("SaleItem.ApplyDiscount()")
    End Method

    Method CanSeeShopkeeper: Bool()
        Debug.TraceNotImplemented("SaleItem.CanSeeShopkeeper()")
    End Method

    Method CanSteal: Bool()
        Debug.TraceNotImplemented("SaleItem.CanSteal()")
    End Method

    Method CostsBlood: Bool()
        Debug.TraceNotImplemented("SaleItem.CostsBlood()")
    End Method

    Method CostsDiamonds: Bool()
        Debug.TraceNotImplemented("SaleItem.CostsDiamonds()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("SaleItem.Die()")
    End Method

    Method GetCost: Float()
        Debug.TraceNotImplemented("SaleItem.GetCost()")
    End Method

    Method Pickup: Int(player: Object)
        Debug.TraceNotImplemented("SaleItem.Pickup()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("SaleItem.Render()")
    End Method

    Method SetBloodCost: Void()
        Debug.TraceNotImplemented("SaleItem.SetBloodCost()")
    End Method

    Method SetCost: Void()
        Debug.TraceNotImplemented("SaleItem.SetCost()")
    End Method

    Method SetCostHelper: Void()
        Debug.TraceNotImplemented("SaleItem.SetCostHelper()")
    End Method

    Method SkipNextDraw: Void()
        Debug.TraceNotImplemented("SaleItem.SkipNextDraw()")
    End Method

    Method NoTrim: Void()
        GetCostMultiplier()
        GetMinCost()
        GetRandomItem(0, 0)
        ResetCosts()
        ApplyDiscount(0)
        CanSeeShopkeeper()
        CanSteal()
        CostsBlood()
        CostsDiamonds()
        Die()
        GetCost()
        Pickup(Null)
        Render()
        SetBloodCost()
        SetCost()
        SetCostHelper()
        SkipNextDraw()
    End Method

End Class
