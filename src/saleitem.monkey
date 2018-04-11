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

    Function GetCostMultiplier: Float()
        Throw New Throwable()
    End Function

    Function GetMinCost: Int()
        Throw New Throwable()
    End Function

    Function GetRandomItem: Int(level: Int, randType: Int)
        Throw New Throwable()
    End Function

    Function ResetCosts: Void()
        Throw New Throwable()
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
        Throw New Throwable()
    End Method

    Method CanSeeShopkeeper: Bool()
        Throw New Throwable()
    End Method

    Method CanSteal: Bool()
        Throw New Throwable()
    End Method

    Method CostsBlood: Bool()
        Throw New Throwable()
    End Method

    Method CostsDiamonds: Bool()
        Throw New Throwable()
    End Method

    Method Die: Void()
        Throw New Throwable()
    End Method

    Method GetCost: Float()
        Throw New Throwable()
    End Method

    Method Pickup: Int(player: Object)
        Throw New Throwable()
    End Method

    Method Render: Void()
        Throw New Throwable()
    End Method

    Method SetBloodCost: Void()
        Throw New Throwable()
    End Method

    Method SetCost: Void()
        Throw New Throwable()
    End Method

    Method SetCostHelper: Void()
        Throw New Throwable()
    End Method

    Method SkipNextDraw: Void()
        Throw New Throwable()
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
