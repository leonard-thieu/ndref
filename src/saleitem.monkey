'Strict

Import monkey.list
Import enemy.npc.shopkeeper
Import enemy.npc.medic
Import gui.controller_game
Import level
Import item
Import logger
Import player_class
Import sprite
Import util

Class SaleItem Extends Item

    Const CHARISMA_DISCOUNT: Float = 0.5

    Global currentSaleItems: List<SaleItem> = New List<SaleItem>()
    Global randomSaleItemList: List<String> = New List<String>()
    Global lastSaleItemClass1: String
    Global lastSaleItemClass2: String

    Function GetCostMultiplier: Float()
        Local costMultiplier := 1.0

        If Player.DoesAnyPlayerHaveItemOfType("ring_charisma") Or
           Player.DoesAnyPlayerHaveItemOfType("ring_wonder")
            costMultiplier = SaleItem.CHARISMA_DISCOUNT
        End If

        If Level.isHardcoreMode
            costMultiplier *= (controller_game.currentDepth * 0.5) + 2.0
        End If

        Return costMultiplier
    End Function

    Function GetMinCost: Int()
        Local minCost := 999999

        For Local currentSaleItem := EachIn SaleItem.currentSaleItems
            Local cost := currentSaleItem.GetCost()
            If cost < minCost And
               Not currentSaleItem.janitorItem And
               Not currentSaleItem.diamondDealerItem
                minCost = cost
            End If
        End for

        Return minCost
    End Function

    Function GetRandomItem: String(level: Int, randType: String)
        Local itemName: String
        Local itemClass: String

        Local i := 0
        For i = i Until 500
            itemName = Item.GetRandomItemInClass("", level, randType, Chest.CHEST_COLOR_NONE, True, "", False)
            itemClass = Item.GetSlot(itemName)

            Local isValid := True
            For Local j := 0 Until controller_game.numPlayers
                Local player := controller_game.players[j]

                If Level.randSeed = -1
                    If player.HasItemOfType(itemClass)
                        isValid = False
                        Exit
                    End If

                    Local itemInSlot := player.GetItemInSlot(itemClass, False)
                    If itemInSlot <> Item.NoItem
                        If Item.GetIntAttribute(itemInSlot, "slotPriority", -1) >
                           Item.GetIntAttribute(itemName, "slotPriority", -1)
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
                    If Not SaleItem.randomSaleItemList.Contains(itemName) Then Exit
                End If
            End If
        End For

        If i = 500
            ' Doesn't set item class?
            itemName = "armor_heavyplate"
        End If

        SaleItem.randomSaleItemList.AddLast(itemName)

        SaleItem.lastSaleItemClass2 = SaleItem.lastSaleItemClass1
        SaleItem.lastSaleItemClass1 = itemClass

        Return itemName
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
    Field digitVal: Int[]
    Field shopkeeper: Shopkeeper
    Field medic: Medic

    Method ApplyDiscount: Void(val: Float)
        Self.discount = val
        Self.SetCost()
    End Method

    Method CanSeeShopkeeper: Bool()
        Debug.TraceNotImplemented("SaleItem.CanSeeShopkeeper()")
    End Method

    Method CanSteal: Bool()
        Debug.TraceNotImplemented("SaleItem.CanSteal()")
    End Method

    Method CostsBlood: Bool()
        Return Self.bloodCost > 0.0
    End Method

    Method CostsDiamonds: Bool()
        Return Self.diamondCost > 0 And
               controller_game.currentLevel = -2
    End Method

    Method Die: Void()
        SaleItem.currentSaleItems.RemoveEach(Self)

        Super.Die()
    End Method

    Method GetCost: Float()
        Debug.TraceNotImplemented("SaleItem.GetCost()")
    End Method

    Method Pickup: String(player: Player)
        Debug.TraceNotImplemented("SaleItem.Pickup(Player)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("SaleItem.Render()")
    End Method

    Method SetBloodCost: Void()
        Self.bloodCost = 0.0

        If Self.hasBloodCost
            Self.bloodCost = 0.5
            If Self.coinCost >=  25 Then Self.bloodCost = 1.0
            If Self.coinCost >= 120 Then Self.bloodCost = 1.5
            If Self.coinCost >  400 Then Self.bloodCost = 2.0

            If Player.DoesAnyPlayerHaveItemOfType("ring_charisma") Or
               Player.DoesAnyPlayerHaveItemOfType("ring_wonder")
                Self.bloodCost -= 1.0
            End If

            If Not Level.isHardcoreMode And
               Not Level.isLevelEditor
                Self.bloodCost *= 2
            End If

            If Self.bloodCost <= 0.0 Then Self.bloodCost = 0.5
            If Self.forceCost Then Self.bloodCost = Self.forceCost
        End If
    End Method

    Method SetCost: Void()
        Self.SetCostHelper()
        Self.SetBloodCost()
        Self.SetCostHelper()
    End Method

    Method SetCostHelper: Void()
        Self.cost = Self.coinCost

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Dove) Or
           Util.IsCharacterActive(Character.Coda)
            Self.cost = 0.0
        End If

        Local baseCost: Float
        If Self.CostsBlood()
            baseCost = Self.bloodCost
        Else If Self.CostsDiamonds()
            baseCost = Self.diamondCost
        Else
            baseCost = SaleItem.GetCostMultiplier() * Self.cost
        End If

        Self.cost = baseCost * Self.discount

        If Self.forceCost > 0.0
            Self.cost = Self.forceCost
        End If

        Self.saleItem = True

        Self.miniDiamond = New Sprite("gui/TEMP_mini_diamond.png", 1, Image.DefaultFlags)
        Self.miniDiamond.SetZ(-980.0)
        Self.miniHeart = New Sprite("gui/TEMP_mini_heart.png", 1, Image.DefaultFlags)
        Self.miniHeart.SetZ(-980.0)

        ' TODO: Set digits sprites
        Debug.TraceNotImplemented("SaleItem.SetCostHelper()")
    End Method

    Method SkipNextDraw: Void()
        Debug.TraceNotImplemented("SaleItem.SkipNextDraw()")
    End Method

End Class
