'Strict

Import monkey.map
Import monkey.stack
Import entity
Import logger
Import necrodancergame
Import xml

Class Item Extends Entity

    Global debugTrailerMode: Bool
    Global diamondDealerItems1: Int
    Global diamondDealerItems2: Int
    Global diamondDealerItems3: Int
    Global hephItems1: Int
    Global hephItems2: Int
    Global hephItems3: Int
    Global itemImages: Int
    Global itemPoolAnyChest: List<XMLNode>[7]
    Global itemPoolAnyChest2: List<XMLNode>[7]
    Global itemPoolChest: List<XMLNode>[7]
    Global itemPoolChest2: List<XMLNode>[7]
    Global itemPoolLockedChest: List<XMLNode>[7]
    Global itemPoolLockedChest2: List<XMLNode>[7]
    Global itemPoolLockedShop: List<XMLNode>[7]
    Global itemPoolLockedShop2: List<XMLNode>[7]
    Global itemPoolRandom: List<XMLNode> = New List<XMLNode>()
    Global itemPoolRandom2: List<XMLNode> = New List<XMLNode>()
    Global itemPoolShop: List<XMLNode>[7]
    Global itemPoolShop2: List<XMLNode>[7]
    Global itemPoolUrn: List<XMLNode>[7]
    Global itemPoolUrn2: List<XMLNode>[7]
    Global lastChestItemClass1: String
    Global lastChestItemClass2: String
    Global merlinItems1: Int
    Global merlinItems2: Int
    Global merlinItems3: Int
    Global pickupList: List<Item> = New List<Item>()
    Global seenItems: StringMap<Int> = New StringMap<Int>()

    Function AddToSeenItems: Void(itemName: String)
        If seenItems.Contains(itemName)
            Local seen := seenItems.Get(itemName)
            seenItems.Update(itemName, seen + 1)
        Else
            seenItems.Insert(itemName, 1)
        End If
    End Function

    Function ChangeWeaponMaterial: Int(t: Int, materialClass: Int)
        Debug.TraceNotImplemented("Item.ChangeWeaponMaterial()")
    End Function

    Function ClearAllSingleChoiceItems: Void(takenItem: Object)
        Debug.TraceNotImplemented("Item.ClearAllSingleChoiceItems()")
    End Function

    Function ConsumeCoinsRemainingOnLevel: Int()
        Debug.TraceNotImplemented("Item.ConsumeCoinsRemainingOnLevel()")
    End Function

    Function CreateAmountOfCoins: Void(xVal: Int, yVal: Int, amt: Int)
        Debug.TraceNotImplemented("Item.CreateAmountOfCoins()")
    End Function

    Function CreateItemPools: Void()
        Local itemsNode := necrodancergame.xmlData.GetChild("items")
        Local itemNodes := itemsNode.GetChildren()

        Local attributeNames := New Stack<String>()
        Local v3 := New Stack<XMLNode>()
        Local v4 := New Stack<Int>()
        Local v5 := New Stack<XMLNode>()

        For Local i := 0 Until 2
            For Local j := 0 Until 8
                Local kMax := 1
                If Not (j = 7)
                    kMax += 6
                End If

                For Local k := 0 To kMax
                    attributeNames.Clear()

                    Local itemPool: List<XMLNode>
                    If j = 7
                        itemPool = Item.itemPoolRandom
                        If i = 1 Then itemPool = Item.itemPoolRandom2

                        attributeNames.Push("chestChance")
                        attributeNames.Push("lockedChestChance")
                        attributeNames.Push("shopChance")
                        attributeNames.Push("lockedShopChance")
                    Else
                        Select k
                            Case 0
                                itemPool = Item.itemPoolChest[j]
                                If i = 1 Then itemPool = Item.itemPoolChest2[j]

                                attributeNames.Push("chestChance")
                            Case 1
                                itemPool = Item.itemPoolAnyChest[j]
                                If i = 1 Then itemPool = Item.itemPoolAnyChest2[j]

                                attributeNames.Push("lockedChestChance")
                            Case 2
                                itemPool = Item.itemPoolAnyChest[j]
                                If i = 1 Then itemPool = Item.itemPoolAnyChest2[j]

                                attributeNames.Push("chestChance")
                                attributeNames.Push("lockedChestChance")
                            Case 3
                                itemPool = Item.itemPoolShop[j]
                                If i = 1 Then itemPool = Item.itemPoolShop2[j]

                                attributeNames.Push("shopChance")
                            Case 4
                                itemPool = Item.itemPoolLockedShop[j]
                                If i = 1 Then itemPool = Item.itemPoolLockedShop2[j]

                                attributeNames.Push("lockedShopChance")
                            Default
                                itemPool = Item.itemPoolUrn[j]
                                If i = 1 Then itemPool = Item.itemPoolUrn2[j]

                                attributeNames.Push("urnChance")
                        End Select
                    End If

                    itemPool.Clear()
                    v3.Clear()
                    v4.Clear()

                    For Local itemNode := EachIn itemNodes
                        Local m := 0

                        For Local attributeName := EachIn attributeNames
                            Local chancesStr := itemNode.GetAttribute(attributeName, "0")
                            Local chancesStrs := chancesStr.Split("|")

                            Local chanceIndexMax := math.Min(j, chancesStrs.Length() - 1)
                            Local chance := Int(chancesStrs[chanceIndexMax])
                            If chance = 0 And
                               j = 7
                                chance = Int(chancesStrs[0])
                            End If

                            If chance > 0
                                If Level.isHardcoreMode Or
                                   Item.IsUnlocked(itemNode.name)
                                    v3.Push(itemNode)
                                    If j = 7
                                        v4.Push(1)
                                    Else
                                        If Not (m = 0)
                                            ' TODO: Random roll here?
                                        End If

                                        ' Might be debug only. Possible to ignore this section?
                                        If Item.debugTrailerMode
                                            ' TODO: debugTrailerMode section
                                        End If

                                        v4.Push(chance)

                                        Exit
                                    End If
                                End If
                            End If

                            m += 1
                        End For

                        ' TODO: Copy String[]?
                        'goto LABEL_38 (This is in the middle of `String.Split`)
                    End For

                    v5.Clear()

                    While Not v3.IsEmpty()
                        Local high := 0
                        For Local v4Value := EachIn v4
                            high += v4Value
                        End For

                        Local randomValue := Util.RndIntRangeFromZero(high - 1, True)

                        Local n := 0
                        For n = n Until v4.Length()
                            Local v4Value := v4.Get(n)

                            If randomValue > v4Value Then Exit

                            randomValue -= v4Value
                        End For

                        v5.Push(v3.Get(n))
                        v3.Remove(n)
                        v4.Remove(n)
                    End While

                    For Local itemNode := EachIn v5
                        If Item.IsValidItemForCurrentChars(itemNode)
                            ' TODO: Something about "familiar_shield"

                            itemPool.AddLast(itemNode)
                        End If
                    End For
                End For
            End For
        End For

        ' TODO: Log item to complete item pool generation.
    End Function

    Function DropItem: Object(xVal: Int, yVal: Int, t: Int)
        Debug.TraceNotImplemented("Item.DropItem()")
    End Function

    Function FilterDisabledItems: Void(list: Object)
        Debug.TraceNotImplemented("Item.FilterDisabledItems()")
    End Function

    Function FindAllGoldPiles: Object()
        Debug.TraceNotImplemented("Item.FindAllGoldPiles()")
    End Function

    Function GetAllItemsInClass: Object(itemClass: Int)
        Debug.TraceNotImplemented("Item.GetAllItemsInClass()")
    End Function

    Function GetAppropriateCoinItemForQuantity: Int(quantity: Int)
        Debug.TraceNotImplemented("Item.GetAppropriateCoinItemForQuantity()")
    End Function

    Function GetCost: Int(i: Int)
        Debug.TraceNotImplemented("Item.GetCost()")
    End Function

    Function GetFlyawayText: Int(i: Int)
        Debug.TraceNotImplemented("Item.GetFlyawayText()")
    End Function

    Function GetHeavyGlassFrame: Int(quantity: Int)
        Debug.TraceNotImplemented("Item.GetHeavyGlassFrame()")
    End Function

    Function GetIntAttribute: Int(i: Int, attr: Int, dflt: Int)
        Debug.TraceNotImplemented("Item.GetIntAttribute()")
    End Function

    Function GetItemXML: Object(i: Int)
        Debug.TraceNotImplemented("Item.GetItemXML()")
    End Function

    Function GetPickupAt: Item(xVal: Int, yVal: Int, slf: Item)
        Debug.TraceNotImplemented("Item.GetPickupAt()")
    End Function

    Function GetPickupsAt: Object(xVal: Int, yVal: Int, slf: Object)
        Debug.TraceNotImplemented("Item.GetPickupsAt()")
    End Function

    Function GetRandomItemInClass: String(itemClass: String, requestedLevel: Int, randomType: String, chestColor: Int, ignorePendingMetaGameItems: Bool, itemSlot: String, nonDeterministic: Bool)
        Debug.TraceNotImplemented("Item.GetRandomItemInClass()")
    End Function

    Function GetRandomItemInClassByPredicate: String(predicate: Object, requestedLevel: Int, randomType: String, nonDeterministic: Bool)
        Debug.TraceNotImplemented("Item.GetRandomItemInClassByPredicate()")
    End Function

    Function GetSet: Int(n: Object)
        Debug.TraceNotImplemented("Item.GetSet()")
    End Function

    Function GetSlot: Int(n: Object)
        Debug.TraceNotImplemented("Item.GetSlot()")
    End Function

    Function GetSlot2: Int(i: Int)
        Debug.TraceNotImplemented("Item.GetSlot2()")
    End Function

    Function GetStringAttribute: Int(i: Int, attr: Int, dflt: Int)
        Debug.TraceNotImplemented("Item.GetStringAttribute()")
    End Function

    Function GetValue: Int(t: Int)
        Debug.TraceNotImplemented("Item.GetValue()")
    End Function

    Function GetWeaponBaseType: Int(t: Int)
        Debug.TraceNotImplemented("Item.GetWeaponBaseType()")
    End Function

    Function GetWeaponShapeClass: Int(t: Int)
        Debug.TraceNotImplemented("Item.GetWeaponShapeClass()")
    End Function

    Function HasSeenItemXTimes: Bool(itemName: Int, x: Int)
        Debug.TraceNotImplemented("Item.HasSeenItemXTimes()")
    End Function

    Function InitAll: Void()
        Debug.TraceNotImplemented("Item.InitAll()")
    End Function

    Function IsCourageItem: Bool(n: Object)
        Debug.TraceNotImplemented("Item.IsCourageItem()")
    End Function

    Function IsDamageBonusItem: Bool(n: Object)
        Debug.TraceNotImplemented("Item.IsDamageBonusItem()")
    End Function

    Function IsDamageReductionItem: Bool(n: Object)
        Debug.TraceNotImplemented("Item.IsDamageReductionItem()")
    End Function

    Function IsDisabled: Bool(item: Int)
        Debug.TraceNotImplemented("Item.IsDisabled()")
    End Function

    Function IsDiscountItem: Bool(n: Object)
        Debug.TraceNotImplemented("Item.IsDiscountItem()")
    End Function

    Function IsGoldGeneratingItem: Bool(n: Object)
        Debug.TraceNotImplemented("Item.IsGoldGeneratingItem()")
    End Function

    Function IsHealthBonusItem: Bool(n: Object)
        Debug.TraceNotImplemented("Item.IsHealthBonusItem()")
    End Function

    Function IsImmediatelyConsumed: Bool(t: Int)
        Debug.TraceNotImplemented("Item.IsImmediatelyConsumed()")
    End Function

    Function IsItemOfClass: Bool(n: Object, itemClass: Int)
        Debug.TraceNotImplemented("Item.IsItemOfClass()")
    End Function

    Function IsItemOfType: Bool(i: Int, query: Int)
        Debug.TraceNotImplemented("Item.IsItemOfType()")
    End Function

    Function IsPainItem: Bool(n: Object)
        Debug.TraceNotImplemented("Item.IsPainItem()")
    End Function

    Function IsUnlocked: Bool(t: String)
        Debug.TraceNotImplemented("Item.IsUnlocked()")
    End Function

    Function IsValidItemForCurrentChars: Bool(n: Object)
        Debug.TraceNotImplemented("Item.IsValidItemForCurrentChars()")
    End Function

    Function IsValidItemForCurrentChars2: Bool(name: Int)
        Debug.TraceNotImplemented("Item.IsValidItemForCurrentChars2()")
    End Function

    Function IsValidRandomItem: Bool(t: Int)
        Debug.TraceNotImplemented("Item.IsValidRandomItem()")
    End Function

    Function MoveAll: Void()
        Debug.TraceNotImplemented("Item.MoveAll()")
    End Function

    Function RandomHardModeHelperItem: Int()
        Debug.TraceNotImplemented("Item.RandomHardModeHelperItem()")
    End Function

    Function RenderItemAt: Void(iType: Int, xVal: Int, yVal: Int, zVal: Int, inWorld: Bool, scale: Float, alpha: Float, frame: Int)
        Debug.TraceNotImplemented("Item.RenderItemAt()")
    End Function

    Function RenderItemImageAt: Void(img: Object, xVal: Int, yVal: Int, zVal: Int, inWorld: Bool, scale: Float, alpha: Float, frame: Int)
        Debug.TraceNotImplemented("Item.RenderItemImageAt()")
    End Function

    Function TransmuteAllItems: Void()
        Debug.TraceNotImplemented("Item.TransmuteAllItems()")
    End Function

    Function TransmuteNearbyItems: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Item.TransmuteNearbyItems()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, type: String, drop: Bool, utl: Int, isTrainingWeapon: Bool)
        Super.New()
    End Method

    Field itemType: String
    Field singleChoiceItem: Bool
    Field hasBloodCost: Bool
    Field isSaleItem: Bool
    Field utility: Int = -1
    Field coinCost: Int
    Field diamondCost: Int
    Field saleItem: Bool
    Field stackQuantity: Int = 1
    Field hideQuantity: Bool
    Field diamondDealerPrice: Int
    Field imageFrames: Int = 1
    Field quantityYOff: Int
    Field dropX: Int = -100000
    Field dropY: Int = -100000
    Field droppedByPlayer: Bool
    Field trainingWeapon: Bool
    Field pickupable: Bool = True
    Field hintText: TextSprite
    Field nameText: TextSprite
    Field quantityText: TextSprite
    Field isMystery: Bool
    Field janitorItem: Bool
    Field diamondDealerItem: Bool
    Field leprechaunBeats: Int = 8
    Field numAdjacentItems: Int
    Field frameToShow: Int

    Method CheckAdjacentItems: Void()
        Debug.TraceNotImplemented("Item.CheckAdjacentItems()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Item.Die()")
    End Method

    Method GetFlyawayText: Int()
        Debug.TraceNotImplemented("Item.GetFlyawayText()")
    End Method

    Method GetIntAttribute: Int(attr: Int, dflt: Int)
        Debug.TraceNotImplemented("Item.GetIntAttribute()")
    End Method

    Method GetSlot: Int()
        Debug.TraceNotImplemented("Item.GetSlot()")
    End Method

    Method GetStringAttribute: Int(attr: Int, dflt: Int)
        Debug.TraceNotImplemented("Item.GetStringAttribute()")
    End Method

    Method GetValue: Int()
        Debug.TraceNotImplemented("Item.GetValue()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Return False
    End Method

    Method IsItemOfClass: Bool(itemClass: Int)
        Debug.TraceNotImplemented("Item.IsItemOfClass()")
    End Method

    Method IsItemOfType: Bool(query: Int)
        Debug.TraceNotImplemented("Item.IsItemOfType()")
    End Method

    Method IsVisible: Bool()
        Debug.TraceNotImplemented("Item.IsVisible()")
    End Method

    Method Move: Void()
        Debug.TraceNotImplemented("Item.Move()")
    End Method

    Method Pickup: Int(player: Object)
        Debug.TraceNotImplemented("Item.Pickup()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Item.Render()")
    End Method

    Method SetMystery: Void()
        Debug.TraceNotImplemented("Item.SetMystery()")
    End Method

    Method Transmute: Void()
        Debug.TraceNotImplemented("Item.Transmute()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Item.Update()")
    End Method

    Method NoTrim: Void()
        AddToSeenItems(0)
        ChangeWeaponMaterial(0, 0)
        ClearAllSingleChoiceItems(Null)
        ConsumeCoinsRemainingOnLevel()
        CreateAmountOfCoins(0, 0, 0)
        CreateItemPools()
        DropItem(0, 0, 0)
        FilterDisabledItems(Null)
        FindAllGoldPiles()
        GetAllItemsInClass(0)
        GetAppropriateCoinItemForQuantity(0)
        GetCost(0)
        GetFlyawayText(0)
        GetHeavyGlassFrame(0)
        GetIntAttribute(0, 0, 0)
        GetItemXML(0)
        GetPickupAt(0, 0, Null)
        GetPickupsAt(0, 0, Null)
        GetRandomItemInClass(0, 0, 0, 0, False, 0, False)
        GetRandomItemInClassByPredicate(Null, 0, 0, False)
        GetSet(Null)
        GetSlot(Null)
        GetSlot2(0)
        GetStringAttribute(0, 0, 0)
        GetValue(0)
        GetWeaponBaseType(0)
        GetWeaponShapeClass(0)
        HasSeenItemXTimes(0, 0)
        InitAll()
        IsCourageItem(Null)
        IsDamageBonusItem(Null)
        IsDamageReductionItem(Null)
        IsDisabled(0)
        IsDiscountItem(Null)
        IsGoldGeneratingItem(Null)
        IsHealthBonusItem(Null)
        IsImmediatelyConsumed(0)
        IsItemOfClass(Null, 0)
        IsItemOfType(0, 0)
        IsPainItem(Null)
        IsUnlocked(0)
        IsValidItemForCurrentChars(Null)
        IsValidItemForCurrentChars2(0)
        IsValidRandomItem(0)
        MoveAll()
        RandomHardModeHelperItem()
        RenderItemAt(0, 0, 0, 0, False, 0, 0, 0)
        RenderItemImageAt(Null, 0, 0, 0, False, 0, 0, 0)
        TransmuteAllItems()
        TransmuteNearbyItems(0, 0)
        CheckAdjacentItems()
        Die()
        GetFlyawayText()
        GetIntAttribute(0, 0)
        GetSlot()
        GetStringAttribute(0, 0)
        GetValue()
        IsItemOfClass(0)
        IsItemOfType(0)
        IsVisible()
        Move()
        Pickup(Null)
        Render()
        SetMystery()
        Transmute()
        Update()
    End Method

End Class

Class ItemData

    Field numFrames: Int
    Field imageWidth: Int
    Field imageHeight: Int
    Field bouncer: Bool = True
    Field xOff: Int
    Field yOff: Int

End Class
