'Strict

Import monkey.list
Import controller_game
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

    Function GetRandomItem: String(level: Int, randType: String)
        Local randomItem: String
        Local itemClass: String

        Local i := 0
        For i = i Until 500
            randomItem = Item.GetRandomItemInClass("", level, randType, Chest.CHEST_COLOR_NONE, True, "", False)
            itemClass = Item.GetSlot(randomItem)

            Local isValid := True
            For Local j := 0 Until controller_game.numPlayers
                Local player := controller_game.players[j]

                If Level.randSeed = -1
                    If player.HasItemOfType(itemClass, False)
                        isValid = False
                        Exit
                    End If

                    Local itemInSlot := player.GetItemInSlot(itemClass, False)
                    If itemInSlot <> Item.NoItem
                        If Item.GetIntAttribute(itemInSlot, "slotPriority", -1) >
                           Item.GetIntAttribute(randomItem, "slotPriority", -1)
                            isValid = False
                            Exit
                        End If
                    End If
                End If

                If itemClass = "weapon" And
                   player.IsWeaponlessCharacter()
                    isValid = False
                    Exit
                End If

                If itemClass = "shovel" And
                   player.characterID = Character.Eli
                    isValid = False
                    Exit
                End If
            End For

            If isValid
                If itemClass <> SaleItem.lastSaleItemClass1 And
                   itemClass <> SaleItem.lastSaleItemClass2
                    If SaleItem.randomSaleItemList.Contains(randomItem) Then Exit
                End If
            End If
        End For

        If i = 500
            ' Doesn't set item class?
            randomItem = "armor_heavyplate"
        End If

        SaleItem.randomSaleItemList.AddLast(randomItem)

        SaleItem.lastSaleItemClass2 = SaleItem.lastSaleItemClass1
        SaleItem.lastSaleItemClass1 = itemClass
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
        SaleItem.currentSaleItems.RemoveEach(Self)

        Super.Die()
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
