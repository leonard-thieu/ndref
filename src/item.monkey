'Strict

Import monkey.list
Import monkey.map
Import monkey.math
Import monkey.stack
Import mojo.app
Import gui.controller_game
Import enemy.necrodancer_enemy
Import level
Import audio2
Import bomb
Import chest
Import entity
Import gamedata
Import logger
Import necrodancer
Import necrodancergame
Import player_class
Import sprite
Import util
Import xml

Const NUM_ITEM_POOLS: Int = 7

Function GetResourceCoinType: String(amount: Int)
    Return "resource_coin" + math.Clamp(amount, 1, 10)
End Function

Class Item Extends Entity

    Global debugTrailerMode: Bool
    Global diamondDealerItems1: List<String> = New List<String>()
    Global diamondDealerItems2: List<String> = New List<String>()
    Global diamondDealerItems3: List<String> = New List<String>()
    Global hephItems1: List<String> = New List<String>()
    Global hephItems2: List<String> = New List<String>()
    Global hephItems3: List<String> = New List<String>()
    Global itemImages: StringMap<Sprite> = New StringMap<Sprite>()
    Global itemPoolAnyChest: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolAnyChest2: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolChest: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolChest2: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolLockedChest: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolLockedChest2: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolLockedShop: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolLockedShop2: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolRandom: List<XMLNode> = New List<XMLNode>()
    Global itemPoolRandom2: List<XMLNode> = New List<XMLNode>()
    Global itemPoolShop: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolShop2: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolUrn: List<XMLNode>[NUM_ITEM_POOLS]
    Global itemPoolUrn2: List<XMLNode>[NUM_ITEM_POOLS]
    Global lastChestItemClass1: String
    Global lastChestItemClass2: String
    Global merlinItems1: List<String> = New List<String>()
    Global merlinItems2: List<String> = New List<String>()
    Global merlinItems3: List<String> = New List<String>()
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
        Debug.TraceNotImplemented("Item.ChangeWeaponMaterial(Int, Int)")
    End Function

    Function ClearAllSingleChoiceItems: Void(takenItem: Item)
        If takenItem.x >= 150 Or
           takenItem.y >= 150 Or
           Not Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfShadows, False)

            Local loop: Bool
            Repeat
                loop = False

                For Local pickup := EachIn Item.pickupList
                    If pickup.singleChoiceItem And
                       pickup <> takenItem And
                       Util.GetDist(pickup.x, pickup.y, takenItem.x, takenItem.y) < 5.0
                        pickup.Die()
                        loop = True

                        Exit
                    End If
                End For
            Until Not loop
        End If
    End Function

    Function ConsumeCoinsRemainingOnLevel: Int()
        Local numCoins: Int

        For Local pickup := EachIn Item.pickupList
            If Not pickup.flaggedForDeath And
               Not pickup.dead And
               pickup.pickupable And
               pickup.IsItemOfType("isCoin")
                numCoins += pickup.GetValue()

                pickup.flaggedForDeath = True
            End If
        End For

        Return numCoins
    End Function

    Function CreateAmountOfCoins: Void(xVal: Int, yVal: Int, amt: Int)
        Debug.TraceNotImplemented("Item.CreateAmountOfCoins(Int, Int, Int)")
    End Function

    Function CreateItemPools: Void()
        Local startTime := app.Millisecs()

        Local itemsNode := necrodancergame.xmlData.GetChild("items")
        Local itemNodes := itemsNode.GetChildren()

        Local attributeNames := New StringStack()
        Local unlockedItems := New Stack<XMLNode>()
        Local unlockedItemsChances := New IntStack()
        Local itemPoolCandidates := New Stack<XMLNode>()

        Const jLength := item.NUM_ITEM_POOLS + 1
        For Local i := 0 Until 2
            For Local j := 0 Until jLength
                Local kMax := 1
                If j <> jLength - 1
                    kMax = 6
                End If

                For Local k := 0 Until kMax
                    attributeNames.Clear()

                    ' Select the pool to fill.
                    Local itemPool: List<XMLNode>
                    If j <> jLength - 1
                        Select k
                            Case 0
                                itemPool = Item.itemPoolChest[j]
                                If i = 1 Then itemPool = Item.itemPoolChest2[j]

                                attributeNames.Push("chestChance")
                            Case 1
                                itemPool = Item.itemPoolLockedChest[j]
                                If i = 1 Then itemPool = Item.itemPoolLockedChest2[j]

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
                    Else
                        itemPool = Item.itemPoolRandom
                        If i = 1 Then itemPool = Item.itemPoolRandom2

                        attributeNames.Push("chestChance")
                        attributeNames.Push("lockedChestChance")
                        attributeNames.Push("shopChance")
                        attributeNames.Push("lockedShopChance")
                    End If

                    itemPool.Clear()
                    unlockedItems.Clear()
                    unlockedItemsChances.Clear()

                    For Local itemNode := EachIn itemNodes
                        Local m := 0

                        For Local attributeName := EachIn attributeNames
                            Local chancesStr := itemNode.GetAttribute(attributeName, "0")
                            Local chancesStrs := chancesStr.Split("|")

                            Local chanceIndexMax := math.Min(j, chancesStrs.Length() - 1)
                            Local chance := Int(chancesStrs[chanceIndexMax])
                            If chance = 0
                                If j = jLength - 1
                                    chance = Int(chancesStrs[0])
                                End If
                            End If

                            If chance > 0
                                If Level.isHardcoreMode Or
                                   Item.IsUnlocked(itemNode.GetAttribute("name", ""))
                                    unlockedItems.Push(itemNode)

                                    If j = jLength - 1
                                        unlockedItemsChances.Push(1)
                                    Else
                                        If m > 0
                                            chance = math.Ceil(chance / 10.0)
                                        End If

                                        If Item.debugTrailerMode
                                            Local itemSet := itemNode.GetAttribute("set", "base")
                                            If itemSet = "dlc"
                                                chance *= 50
                                            End If
                                        End If

                                        unlockedItemsChances.Push(chance)
                                    End If

                                    Exit
                                End If
                            End If

                            m += 1
                        End For
                    End For

                    itemPoolCandidates.Clear()

                    While Not unlockedItems.IsEmpty()
                        Local high := 0
                        For Local chance := EachIn unlockedItemsChances
                            high += chance
                        End For

                        Local randomValue := Util.RndIntRangeFromZero(high - 1, True)

                        Local n := 0
                        For n = n Until unlockedItemsChances.Length()
                            Local chance := unlockedItemsChances.Get(n)

                            If randomValue < chance Then Exit

                            randomValue -= chance
                        End For

                        If n >= unlockedItemsChances.Length() Then n = 0

                        Local itemPoolCandidate := unlockedItems.Get(n)
                        itemPoolCandidates.Push(itemPoolCandidate)
                        unlockedItems.Remove(n)
                        unlockedItemsChances.Remove(n)
                    End While

                    For Local itemPoolCandidate := EachIn itemPoolCandidates
                        If Not Item.IsValidItemForCurrentChars(itemPoolCandidate) Then Continue

                        Local name := itemPoolCandidate.name
                        If Item.IsDisabled(name) Then Continue

                        itemPool.AddLast(itemPoolCandidate)
                    End For

                    If necrodancer.DUMP_ITEM_POOLS
                        Debug.WriteLine()
                        Local itemPoolName: String
                        If j <> jLength - 1
                            Select k
                                Case 0  itemPoolName = "itemPoolChest"
                                Case 1  itemPoolName = "itemPoolLockedChest"
                                Case 2  itemPoolName = "itemPoolAnyChest"
                                Case 3  itemPoolName = "itemPoolShop"
                                Case 4  itemPoolName = "itemPoolLockedShop"
                                Default itemPoolName = "itemPoolUrn"
                            End Select
                        Else
                            itemPoolName = "itemPoolRandom"
                        End If

                        If i = 1 Then itemPoolName += "2"
                        If j <> jLength - 1 Then itemPoolName += "[" + j + "]"

                        Debug.WriteLine(itemPoolName)
                        For Local itemNode := EachIn itemPool
                            Local name := itemNode.name
                            Debug.WriteLine(name)
                        End For
                    End If
                End For
            End For
        End For

        If necrodancer.DUMP_ITEM_POOLS
            Debug.WriteLine()
        End If

        Local endTime := app.Millisecs()
        Local totalTime := endTime - startTime

        Debug.Log("Item pool generation took " + totalTime + " ms.")
    End Function

    Function DropItem: Object(xVal: Int, yVal: Int, t: Int)
        Debug.TraceNotImplemented("Item.DropItem(Int, Int, Int)")
    End Function

    Function FilterDisabledItems: Void(list: List<String>)
        For Local itemName := EachIn list
            If Item.IsDisabled(itemName)
                list.Remove(itemName)
            End If
        End For
    End Function

    Function FindAllGoldPiles: Object()
        Debug.TraceNotImplemented("Item.FindAllGoldPiles()")
    End Function

    Function GetAllItemsInClass: List<XMLNode>(itemClass: String)
        Local itemsNode := necrodancergame.xmlData.GetChild("items")

        Return itemsNode.GetChildrenWithAttributes(itemClass + "=True")
    End Function

    Function GetAppropriateCoinItemForQuantity: Int(quantity: Int)
        Debug.TraceNotImplemented("Item.GetAppropriateCoinItemForQuantity(Int)")
    End Function

    Function GetCost: Int(i: String)
        Local itemNode := Item.GetItemXML(i)

        Return itemNode.GetAttribute("coinCost", 0)
    End Function

    Function GetDisplayName: String(itemName: String)
        Local itemNode := Item.GetItemXML(itemName)
        If itemNode <> Null
            itemName = itemNode.GetAttribute("displayName", itemName)
        End If

        Return itemName
    End Function

    Function GetFlyawayText: Int(i: Int)
        Debug.TraceNotImplemented("Item.GetFlyawayText(Int)")
    End Function

    Function GetHeavyGlassFrame: Int(quantity: Int)
        Debug.TraceNotImplemented("Item.GetHeavyGlassFrame(Int)")
    End Function

    Function GetIntAttribute: Int(i: String, attr: String, dflt: Int)
        Debug.TraceNotImplemented("Item.GetIntAttribute(String, String, Int)")
    End Function

    Function GetItemXML: XMLNode(i: String)
        Return necrodancergame.xmlData.GetChildAtPath("items/" + i)
    End Function

    Function GetPickupAt: Item(xVal: Int, yVal: Int, slf: Item = Null)
        For Local pickup := EachIn Item.pickupList
            If pickup.x = xVal And
               pickup.y = yVal
                If pickup.IsItemOfType("isCoin") Then Return pickup
            End If
        End For

        For Local pickup := EachIn Item.pickupList
            If pickup = slf Then Continue

            If pickup.x = xVal And
               pickup.y = yVal
                If pickup.pickupable
                    If pickup.dropX <> xVal Or
                       pickup.dropY <> yVal
                        Return pickup
                    End If
                End If
            End If
        End For

        Return Null
    End Function

    Function GetPickupsAt: List<Item>(xVal: Int, yVal: Int, slf: Item)
        Local pickups := New List<Item>()

        For Local pickup := EachIn Item.pickupList
            If pickup <> slf And
               Not pickup.flaggedForDeath And
               Not pickup.dead And
               pickup.pickupable And
               (pickup.x = xVal And pickup.y = yVal) And
               (pickup.dropX <> xVal Or pickup.dropY <> yVal)
               pickups.AddLast(pickup)
            End If
        End For

        Return pickups
    End Function

    Function GetRandomItemInClass: String(itemClass: String, requestedLevel: Int, randomType: String, chestColor: Int = Chest.CHEST_COLOR_NONE, ignorePendingMetaGameItems: Bool = False, itemSlot: String = "", nonDeterministic: Bool = False)
        If Not ignorePendingMetaGameItems And
           Not Level.isHardcoreMode
            For Local i := 0 Until GameData.GetNumPendingSpawnItems()
                ' TODO: Pending metagame items
            End For
        End If

        Local predicate := New StandardItemPredicate(itemClass, chestColor, itemSlot)

        Return Item.GetRandomItemInClassByPredicate(predicate, requestedLevel, randomType, nonDeterministic)
    End Function

    Function GetRandomItemInClassByPredicate: String(predicate: IItemPredicate, requestedLevel: Int, randomType: String, nonDeterministic: Bool)
        Local itemPool: List<XMLNode>
        If requestedLevel <= 0
            itemPool = Item.itemPoolRandom
            If nonDeterministic Then itemPool = Item.itemPoolRandom2
        Else
            Local i := requestedLevel - 1
            If controller_game.currentDepth > 1
                i += 1
            End If

            i = math.Min(i, 6)

            Select randomType
                Case "chestChance"
                    itemPool = Item.itemPoolChest[i]
                    If nonDeterministic Then itemPool = Item.itemPoolChest2[i]
                Case "lockedChestChance"
                    itemPool = Item.itemPoolLockedChest[i]
                    If nonDeterministic Then itemPool = Item.itemPoolLockedChest2[i]
                Case "anyChest"
                    itemPool = Item.itemPoolAnyChest[i]
                    If nonDeterministic Then itemPool = Item.itemPoolAnyChest2[i]
                Case "shopChance"
                    itemPool = Item.itemPoolShop[i]
                    If nonDeterministic Then itemPool = Item.itemPoolShop2[i]
                Case "lockedShopChance"
                    itemPool = Item.itemPoolLockedShop[i]
                    If nonDeterministic Then itemPool = Item.itemPoolLockedShop2[i]
                Default
                    itemPool = Item.itemPoolUrn[i]
                    If nonDeterministic Then itemPool = Item.itemPoolUrn2[i]
            End Select
        End If

        For Local j := 1 Until 10
            For Local itemNode := EachIn itemPool
                If predicate.Call(itemNode)
                    Local name := itemNode.name

                    If Not Item.HasSeenItemXTimes(name, j)
                        Item.AddToSeenItems(name)

                        Return name
                    End If
                End If
            End For
        End For

        Debug.Log("GetRandomItemInClassByPredicate: NO VALID ITEM!  Spawning coins")

        Return ItemType.GoldHoard
    End Function

    Function GetSet: Int(n: Object)
        Debug.TraceNotImplemented("Item.GetSet(Object)")
    End Function

    Function GetSlot: String(n: XMLNode)
        Return n.GetAttribute("slot", ItemType.NoItem)
    End Function

    Function GetSlot: String(i: String)
        Local itemNode := necrodancergame.xmlData.GetChildAtPath("items/" + i)

        Return Item.GetSlot(itemNode)
    End Function

    Function GetStringAttribute: Int(i: Int, attr: Int, dflt: Int)
        Debug.TraceNotImplemented("Item.GetStringAttribute(Int, Int, Int)")
    End Function

    Function GetValue: Int(t: String)
        Local itemNode := Item.GetItemXML(t)

        Return itemNode.GetAttribute("data", 0)
    End Function

    Function GetWeaponBaseType: Int(t: Int)
        Debug.TraceNotImplemented("Item.GetWeaponBaseType(Int)")
    End Function

    Function GetWeaponShapeClass: Int(t: Int)
        Debug.TraceNotImplemented("Item.GetWeaponShapeClass(Int)")
    End Function

    Function HasSeenItemXTimes: Bool(itemName: String, x: Int)
        If Item.seenItems.Contains(itemName)
            Return Item.seenItems.Get(itemName) >= x
        End If

        Return False
    End Function

    Function InitAll: Void()
        ' SKIPPED: Load item images.

        For Local i := 0 Until item.NUM_ITEM_POOLS
            Item.itemPoolChest[i] = New List<XMLNode>()
            Item.itemPoolLockedChest[i] = New List<XMLNode>()
            Item.itemPoolAnyChest[i] = New List<XMLNode>()
            Item.itemPoolShop[i] = New List<XMLNode>()
            Item.itemPoolLockedShop[i] = New List<XMLNode>()
            Item.itemPoolUrn[i] = New List<XMLNode>()
            
            Item.itemPoolChest2[i] = New List<XMLNode>()
            Item.itemPoolLockedChest2[i] = New List<XMLNode>()
            Item.itemPoolAnyChest2[i] = New List<XMLNode>()
            Item.itemPoolShop2[i] = New List<XMLNode>()
            Item.itemPoolLockedShop2[i] = New List<XMLNode>()
            Item.itemPoolUrn2[i] = New List<XMLNode>()
        End For

        Item.hephItems1.AddLast("armor_chainmail")
        Item.hephItems1.AddLast("armor_platemail")
        Item.hephItems1.AddLast("armor_obsidian")
        Item.hephItems1.AddLast("armor_gi")
        Item.hephItems1.AddLast("armor_glass")
        Item.hephItems1.AddLast("head_helm")
        Item.hephItems1.AddLast("feet_greaves")
        Item.hephItems1.AddLast("armor_heavyplate")
        Item.hephItems1.AddLast("head_blast_helm")
        Item.hephItems1.AddLast("head_sunglasses")
        Item.hephItems1.AddLast("head_glass_jaw")
        Item.hephItems1.AddLast("head_spiked_ears")
        Item.hephItems1.AddLast("armor_quartz")
        Item.hephItems1.AddLast("armor_heavyglass")

        Item.hephItems2.AddLast("food_2")
        Item.hephItems2.AddLast("torch_2")
        Item.hephItems2.AddLast("holster")
        Item.hephItems2.AddLast("food_3")
        Item.hephItems2.AddLast("pickaxe")
        Item.hephItems2.AddLast("head_crown_of_thorns")
        Item.hephItems2.AddLast("torch_obsidian")
        Item.hephItems2.AddLast("war_drum")
        Item.hephItems2.AddLast("torch_3")
        Item.hephItems2.AddLast("bag_holding")
        Item.hephItems2.AddLast("shovel_obsidian")
        Item.hephItems2.AddLast("blood_drum")
        Item.hephItems2.AddLast("torch_infernal")
        Item.hephItems2.AddLast("food_4")
        Item.hephItems2.AddLast("shovel_glass")
        Item.hephItems2.AddLast("holy_water")
        Item.hephItems2.AddLast("torch_glass")
        Item.hephItems2.AddLast("heart_transplant")
        Item.hephItems2.AddLast("torch_foresight")
        Item.hephItems2.AddLast("food_carrot")
        Item.hephItems2.AddLast("food_cookies")
        Item.hephItems2.AddLast("torch_strength")
        Item.hephItems2.AddLast("shovel_courage")
        Item.hephItems2.AddLast("shovel_strength")
        Item.hephItems2.AddLast("cursed_potion")
        Item.hephItems2.AddLast("familiar_rat")
        Item.hephItems2.AddLast("familiar_dove")
        Item.hephItems2.AddLast("throwing_stars")
        Item.hephItems2.AddLast("familiar_ice_spirit")
        Item.hephItems2.AddLast("torch_walls")
        Item.hephItems2.AddLast("familiar_shopkeeper")
        Item.hephItems2.AddLast("familiar_shield")
        Item.hephItems2.AddLast("shovel_battle")

        Item.hephItems3.AddLast("weapon_spear")
        Item.hephItems3.AddLast("weapon_whip")
        Item.hephItems3.AddLast("weapon_rapier")
        Item.hephItems3.AddLast("weapon_longsword")
        Item.hephItems3.AddLast("weapon_flail")
        Item.hephItems3.AddLast("weapon_cat")
        Item.hephItems3.AddLast("shovel_blood")
        Item.hephItems3.AddLast("weapon_rifle")
        Item.hephItems3.AddLast("weapon_axe")
        Item.hephItems3.AddLast("weapon_harp")
        Item.hephItems3.AddLast("weapon_warhammer")
        Item.hephItems3.AddLast("weapon_staff")

        Item.merlinItems1.AddLast("spell_freeze_enemies")
        Item.merlinItems1.AddLast("spell_heal")
        Item.merlinItems1.AddLast("spell_shield")
        Item.merlinItems1.AddLast("spell_bomb")
        Item.merlinItems1.AddLast("spell_transmute")

        Item.merlinItems2.AddLast("ring_luck")
        Item.merlinItems2.AddLast("ring_gold")
        Item.merlinItems2.AddLast("ring_peace")
        Item.merlinItems2.AddLast("ring_might")
        Item.merlinItems2.AddLast("ring_courage")
        Item.merlinItems2.AddLast("ring_war")
        Item.merlinItems2.AddLast("ring_mana")
        Item.merlinItems2.AddLast("ring_shadows")
        Item.merlinItems2.AddLast("ring_regeneration")
        Item.merlinItems2.AddLast("ring_protection")
        Item.merlinItems2.AddLast("ring_shielding")
        Item.merlinItems2.AddLast("ring_pain")
        Item.merlinItems2.AddLast("ring_frost")
        Item.merlinItems2.AddLast("ring_piercing")

        Item.merlinItems3.AddLast("scroll_riches")
        Item.merlinItems3.AddLast("scroll_enchant_weapon")
        Item.merlinItems3.AddLast("scroll_transmute")
        Item.merlinItems3.AddLast("scroll_fear")
        Item.merlinItems3.AddLast("scroll_need")
        Item.merlinItems3.AddLast("scroll_earthquake")
        Item.merlinItems3.AddLast("feet_boots_pain")
        Item.merlinItems3.AddLast("tome_earth")
        Item.merlinItems3.AddLast("tome_fireball")
        Item.merlinItems3.AddLast("tome_freeze")
        Item.merlinItems3.AddLast("tome_shield")
        Item.merlinItems3.AddLast("tome_transmute")
        Item.merlinItems3.AddLast("tome_pulse")

        Item.diamondDealerItems1.AddLast("weapon_spear")
        Item.diamondDealerItems1.AddLast("weapon_spear")
        Item.diamondDealerItems1.AddLast("weapon_spear")
        Item.diamondDealerItems1.AddLast("weapon_broadsword")
        Item.diamondDealerItems1.AddLast("weapon_broadsword")
        Item.diamondDealerItems1.AddLast("weapon_rapier")
        Item.diamondDealerItems1.AddLast("weapon_rapier")
        Item.diamondDealerItems1.AddLast("weapon_titanium_dagger")
        Item.diamondDealerItems1.AddLast("weapon_obsidian_dagger")
        Item.diamondDealerItems1.AddLast("weapon_blood_dagger")
        Item.diamondDealerItems1.AddLast("weapon_glass_dagger")
        Item.diamondDealerItems1.AddLast("weapon_golden_spear")
        Item.diamondDealerItems1.AddLast("weapon_bow")
        Item.diamondDealerItems1.AddLast("weapon_titanium_bow")
        Item.diamondDealerItems1.AddLast("weapon_crossbow")
        Item.diamondDealerItems1.AddLast("weapon_obsidian_crossbow")
        Item.diamondDealerItems1.AddLast("weapon_longsword")
        Item.diamondDealerItems1.AddLast("weapon_glass_longsword")
        Item.diamondDealerItems1.AddLast("weapon_cat")
        Item.diamondDealerItems1.AddLast("weapon_golden_cat")
        Item.diamondDealerItems1.AddLast("weapon_flail")
        Item.diamondDealerItems1.AddLast("weapon_blood_flail")
        Item.diamondDealerItems1.AddLast("weapon_obsidian_rapier")
        Item.diamondDealerItems1.AddLast("weapon_titanium_broadsword")
        Item.diamondDealerItems1.AddLast("weapon_whip")
        Item.diamondDealerItems1.AddLast("weapon_golden_whip")
        Item.diamondDealerItems1.AddLast("weapon_axe")
        Item.diamondDealerItems1.AddLast("weapon_harp")
        Item.diamondDealerItems1.AddLast("weapon_warhammer")
        Item.diamondDealerItems1.AddLast("weapon_staff")
        Item.diamondDealerItems1.AddLast("weapon_cutlass")
        Item.diamondDealerItems1.AddLast("weapon_titanium_cutlass")

        Item.diamondDealerItems2.AddLast("food_1")
        Item.diamondDealerItems2.AddLast("food_1")
        Item.diamondDealerItems2.AddLast("food_2")
        Item.diamondDealerItems2.AddLast("food_2")
        Item.diamondDealerItems2.AddLast("food_3")
        Item.diamondDealerItems2.AddLast("food_4")
        Item.diamondDealerItems2.AddLast("holy_water")
        Item.diamondDealerItems2.AddLast("food_carrot")
        Item.diamondDealerItems2.AddLast("food_carrot")
        Item.diamondDealerItems2.AddLast("food_cookies")
        Item.diamondDealerItems2.AddLast("cursed_potion")
        Item.diamondDealerItems2.AddLast("throwing_stars")

        Item.diamondDealerItems3.AddLast("armor_leather")
        Item.diamondDealerItems3.AddLast("armor_platemail")
        Item.diamondDealerItems3.AddLast("armor_gi")
        Item.diamondDealerItems3.AddLast("feet_boots_winged")
        Item.diamondDealerItems3.AddLast("feet_boots_explorers")
        Item.diamondDealerItems3.AddLast("feet_boots_leaping")
        Item.diamondDealerItems3.AddLast("war_drum")
        Item.diamondDealerItems3.AddLast("head_miners_cap")
        Item.diamondDealerItems3.AddLast("head_monocle")
        Item.diamondDealerItems3.AddLast("misc_compass")
        Item.diamondDealerItems3.AddLast("ring_courage")
        Item.diamondDealerItems3.AddLast("ring_luck")
        Item.diamondDealerItems3.AddLast("ring_war")
        Item.diamondDealerItems3.AddLast("ring_peace")
        Item.diamondDealerItems3.AddLast("scroll_riches")
        Item.diamondDealerItems3.AddLast("scroll_shield")
        Item.diamondDealerItems3.AddLast("scroll_need")
        Item.diamondDealerItems3.AddLast("shovel_titanium")
        Item.diamondDealerItems3.AddLast("pickaxe")
        Item.diamondDealerItems3.AddLast("spell_fireball")
        Item.diamondDealerItems3.AddLast("spell_transmute")
        Item.diamondDealerItems3.AddLast("torch_2")
        Item.diamondDealerItems3.AddLast("torch_infernal")
        Item.diamondDealerItems3.AddLast("familiar_rat")
        Item.diamondDealerItems3.AddLast("familiar_dove")
        Item.diamondDealerItems3.AddLast("feet_glass_slippers")
        Item.diamondDealerItems3.AddLast("spell_earth")
        Item.diamondDealerItems3.AddLast("familiar_ice_spirit")
        Item.diamondDealerItems3.AddLast("familiar_shopkeeper")
        Item.diamondDealerItems3.AddLast("familiar_shield")
        Item.diamondDealerItems3.AddLast("ring_piercing")
        Item.diamondDealerItems3.AddLast("shovel_battle")
        Item.diamondDealerItems3.AddLast("spell_pulse")

        Item.FilterDisabledItems(Item.hephItems1)
        Item.FilterDisabledItems(Item.hephItems2)
        Item.FilterDisabledItems(Item.hephItems3)
        Item.FilterDisabledItems(Item.merlinItems1)
        Item.FilterDisabledItems(Item.merlinItems2)
        Item.FilterDisabledItems(Item.merlinItems3)
        Item.FilterDisabledItems(Item.diamondDealerItems1)
        Item.FilterDisabledItems(Item.diamondDealerItems2)
        Item.FilterDisabledItems(Item.diamondDealerItems3)
    End Function

    Function IsCourageItem: Bool(n: XMLNode)
        Local name := n.name

        Select name
            Case ItemType.RingOfCourage,
                 ItemType.ShovelOfCourage
                Return True
        End Select

        Return False
    End Function

    Function IsDamageBonusItem: Bool(n: XMLNode)
        Local name := n.name

        Select name
            Case ItemType.BloodDrum,
                 ItemType.RiskCharm,
                 ItemType.StrengthCharm,
                 ItemType.BootsOfStrength,
                 ItemType.GlassJaw,
                 ItemType.SpikedEars,
                 ItemType.Sunglasses,
                 ItemType.RingOfCourage,
                 ItemType.RingOfFrost,
                 ItemType.RingOfMight,
                 ItemType.RingOfPiercing,
                 ItemType.RingOfWar,
                 ItemType.BattleShovel,
                 ItemType.TorchOfStrength,
                 ItemType.WarDrum
                Return True
        End Select

        Return False
    End Function

    Function IsDamageReductionItem: Bool(n: XMLNode)
        Local name := n.name

        Select name
            Case ItemType.Chainmail,
                 ItemType.HeavyPlate,
                 ItemType.LeatherArmor,
                 ItemType.ObsidianArmor,
                 ItemType.PlateArmor,
                 ItemType.QuartzArmor,
                 ItemType.ProtectionCharm,
                 ItemType.Hargreaves,
                 ItemType.Helm,
                 ItemType.RingOfProtection
                Return True
        End Select

        Return False
    End Function

    Function IsDisabled: Bool(item: String)
        If Not Player.ArePrototypesEnabled()
            Select item
                Case ItemType.ShieldFamiliar
                    Return True
            End Select
        End If

        Return False
    End Function

    Function IsDiscountItem: Bool(n: XMLNode)
        Local name := n.name

        Select name
            Case ItemType.Coupon,
                 ItemType.RingOfCharisma
                Return True
        End Select

        Return False
    End Function

    Function IsGoldGeneratingItem: Bool(n: XMLNode)
        Local name := n.name

        Select name
            Case ItemType.ShopkeeperFamiliar,
                 ItemType.RingOfGold,
                 ItemType.RichesScroll
                Return True
        End Select

        Return False
    End Function

    Function IsHealthBonusItem: Bool(n: XMLNode)
        If Item.IsItemOfClass(n, "isFood") Then Return True

        Local name := n.name

        Select name
            Case ItemType.GluttonyCharm,
                 ItemType.CursedPotion,
                 ItemType.CrownOfThorns,
                 ItemType.HeartContainer,
                 ItemType.DoubleHeartContainer,
                 ItemType.CursedHeartContainer,
                 ItemType.CursedDoubleHeartContainer,
                 ItemType.EmptyHeartContainer,
                 ItemType.EmptyDoubleHeartContainer,
                 ItemType.RingOfRegeneration,
                 ItemType.HealSpell
                Return True
        End Select

        Return False
    End Function

    Function IsImmediatelyConsumed: Bool(t: Int)
        Debug.TraceNotImplemented("Item.IsImmediatelyConsumed(Int)")
    End Function

    Function IsItemOfClass: Bool(n: XMLNode, itemClass: String)
        ' WHYYYYYYYY
        Local isItemOfClass := n.GetAttribute(itemClass, "false")

        Return isItemOfClass.ToUpper() = "TRUE"
    End Function

    Function IsItemOfType: Bool(i: String, query: String)
        Local itemNode := Item.GetItemXML(i)

        Return itemNode.GetAttribute(query, False)
    End Function

    Function IsPainItem: Bool(n: XMLNode)
        Local name := n.name

        Select name
            Case ItemType.BootsOfPain,
                 ItemType.RingOfPain
                Return True
        End Select

        Return False
    End Function

    Function IsUnlocked: Bool(t: String)
        Debug.TraceNotImplemented("Item.IsUnlocked(String)")
    End Function

    Function IsValidItemForCurrentChars: Bool(n: XMLNode)
        Local slot := Item.GetSlot(n)
        Local name := n.name

        If Util.IsWeaponlessCharacterActive()
            If slot = "weapon" Then Return False
        End If

        If Util.IsCharacterActive(Character.Aria)
            If Item.IsDamageReductionItem(n) Then Return False
            If Item.IsHealthBonusItem(n) Then Return False
            If Item.IsPainItem(n) Then Return False

            Select name
                Case ItemType.BloodDrum,
                     ItemType.NazarCharm,
                     ItemType.RiskCharm,
                     ItemType.BalletShoes,
                     ItemType.Holster,
                     ItemType.EnchantWeaponScroll,
                     ItemType.BloodShovel,
                     ItemType.WarDrum
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Melody)
            If Item.IsPainItem(n) Then Return False
            If Item.IsDamageBonusItem(n) Then Return False
            If Item.IsItemOfClass(n, "isFamiliar") Then Return False

            Select name
                Case ItemType.BootsOfLeaping,
                     ItemType.BootsOfLunging,
                     ItemType.Holster,
                     ItemType.EnchantWeaponScroll
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Coda)
            If Item.IsDamageReductionItem(n) Then Return False
            If Item.IsHealthBonusItem(n) Then Return False
            If Item.IsPainItem(n) Then Return False
            If Item.IsGoldGeneratingItem(n) Then Return False
            If Item.IsCourageItem(n) Then Return False
            If Item.IsDiscountItem(n) Then Return False

            Select name
                Case ItemType.BloodDrum,
                     ItemType.NazarCharm,
                     ItemType.BalletShoes,
                     ItemType.Holster,
                     ItemType.RingOfShadows,
                     ItemType.EnchantWeaponScroll,
                     ItemType.BloodShovel
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Dove)
            If Item.IsPainItem(n) Then Return False
            If Item.IsDamageBonusItem(n) Then Return False
            If Item.IsItemOfClass(n, "isShovel") Then Return False

            Select name
                Case ItemType.GrenadeCharm,
                     ItemType.DoveFamiliar,
                     ItemType.RatFamiliar,
                     ItemType.BootsOfLunging,
                     ItemType.CrownOfThorns,
                     ItemType.Holster,
                     ItemType.HolyWater,
                     ItemType.Coupon,
                     ItemType.RingOfGold,
                     ItemType.RingOfPhasing,
                     ItemType.RingOfShadows,
                     ItemType.EarthquakeScroll,
                     ItemType.EnchantWeaponScroll,
                     ItemType.FireballScroll,
                     ItemType.PulseScroll,
                     ItemType.RichesScroll,
                     ItemType.EarthSpell,
                     ItemType.FireballSpell,
                     ItemType.PulseSpell,
                     ItemType.ThrowingStars,
                     ItemType.EarthTome,
                     ItemType.FireballTome,
                     ItemType.PulseTome,
                     ItemType.InfernalTorch
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Eli)
            If slot = "shovel" Then Return False
            If Item.IsPainItem(n) Then Return False
            If Item.IsDamageBonusItem(n) Then Return False

            Select name
                Case ItemType.Bomb,
                     ItemType.Bomb3,
                     ItemType.BombCharm,
                     ItemType.GrenadeCharm,
                     ItemType.NazarCharm,
                     ItemType.BlastHelm,
                     ItemType.CrownOfThorns,
                     ItemType.Holster,
                     ItemType.RingOfGold,
                     ItemType.EnchantWeaponScroll,
                     ItemType.BombSpell
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Bard)
            Select name
                Case ItemType.DoubleHeartTransplant,
                     ItemType.BootsOfSpeed,
                     ItemType.HeartTransplant
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Bolt)
            Select name
                Case ItemType.NazarCharm,
                     ItemType.BalletShoes,
                     ItemType.Spear
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Dorian)
            If slot = "feet" Then Return False
            If slot = "body" Then Return False

            Select name
                Case ItemType.Compass,
                     ItemType.Pickaxe,
                     ItemType.RingOfGold,
                     ItemType.RingOfMight,
                     ItemType.Blunderbuss,
                     ItemType.Rifle
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Monk)
            If Item.IsGoldGeneratingItem(n) Then Return False
            If Item.IsCourageItem(n) Then Return False
            If Item.IsDiscountItem(n) Then Return False

            Select name
                Case ItemType.RingOfShadows,
                     ItemType.BloodShovel
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Diamond)
            If slot = "weapon"
                If Item.IsItemOfClass(n, "isBow") Then Return True
                If Item.IsItemOfClass(n, "isCutlass") Then Return True
                If Item.IsItemOfClass(n, "isDagger") Then Return True
                If Item.IsItemOfClass(n, "isHarp") Then Return True
                If Item.IsItemOfClass(n, "isLongsword") Then Return True
                If Item.IsItemOfClass(n, "isRapier") Then Return True
                If Item.IsItemOfClass(n, "isSpear") Then Return True
                If Item.IsItemOfClass(n, "isStaff") Then Return True

                Return False
            End If
            If slot = "spell" Then Return False

            Select name
                Case ItemType.GrenadeCharm,
                     ItemType.BootsOfLeaping,
                     ItemType.BootsOfLunging,
                     ItemType.Holster,
                     ItemType.Backpack,
                     ItemType.RingOfMana,
                     ItemType.ThrowingStars,
                     ItemType.Blunderbuss,
                     ItemType.Rifle
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Reaper)
            If Item.IsItemOfClass(n, "isFamiliar") Then Return False
            If name.Contains("familiar") Then Return False

            Select name
                Case ItemType.BootsOfLeaping,
                     ItemType.BootsOfLunging
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Tempo)
            If slot = "weapon"
                If name.Contains("titanium") Then Return False
                If name.Contains("obsidian") Then Return False
                If name.Contains("glass") Then Return False
            End If
            If Item.IsDamageBonusItem(n) Then Return False

            Select name
                Case ItemType.CircletOfTelepathy,
                     ItemType.EnchantWeaponScroll,
                     ItemType.JeweledDagger
                    Return False
                Default
            End Select
        End If

        If Util.IsCharacterActive(Character.Mary)
            If name.Contains("familiar") Then Return False

            Select name
                Case ItemType.BlastHelm,
                     ItemType.Spear
                    Return False
            End Select
        End If

        If Item.debugTrailerMode And Item.IsItemOfClass(n, "isTemp")
            Return False
        End If

        If Level.isFloorIsLavaMode
            If slot = "weapon"
                If Not Item.IsItemOfClass(n, "isCat") Then Return False
            End If

            Select name
                Case ItemType.ExplorersBoots,
                     ItemType.WingedBoots,
                     ItemType.GlassSlippers,
                     ItemType.FreezeEnemiesScroll,
                     ItemType.FreezeEnemiesSpell,
                     ItemType.FreezeTome
                    Return False
            End Select
        End If

        If Level.isPhasingMode
            Select name
                Case ItemType.RingOfPhasing
                    Return False
            End Select
        End If

        Return True
    End Function

    Function IsValidItemForCurrentChars: Bool(name: String)
        Debug.TraceNotImplemented("Item.IsValidItemForCurrentChars(String)")
    End Function

    Function IsValidRandomItem: Bool(t: String)
        Select t
            Case ItemType.NoItem,
                 ItemType.GoldHoard
                Return False
        End Select

        Return True
    End Function

    Function MoveAll: Void()
        Debug.TraceNotImplemented("Item.MoveAll()")
    End Function

    Function RandomHardModeHelperItem: Int()
        Debug.TraceNotImplemented("Item.RandomHardModeHelperItem()")
    End Function

    Function RenderItemAt: Void(iType: Int, xVal: Int, yVal: Int, zVal: Int, inWorld: Bool, scale: Float, alpha: Float, frame: Int)
        Debug.TraceNotImplemented("Item.RenderItemAt(Int, Int, Int, Int, Bool, Float, Float, Int)")
    End Function

    Function RenderItemImageAt: Void(img: Object, xVal: Int, yVal: Int, zVal: Int, inWorld: Bool, scale: Float, alpha: Float, frame: Int)
        Debug.TraceNotImplemented("Item.RenderItemImageAt(Object, Int, Int, Int, Bool, Float, Float, Int)")
    End Function

    Function TransmuteAllItems: Void()
        Debug.TraceNotImplemented("Item.TransmuteAllItems()")
    End Function

    Function TransmuteNearbyItems: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Item.TransmuteNearbyItems(Int, Int)")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, type: String, drop: Bool, utl: Int, isTrainingWeapon: Bool)
        Super.New()

        If necrodancer.DEBUG_BUILD
            Debug.Log("ITEM NEW: " + xVal + ", " + yVal + " itemType: " + type + " entityNum: " + Self.entityNum)
        End If

        Local itemNode := Item.GetItemXML(type)

        If Not itemNode.valid
            Debug.Log("ERROR: Unrecognized item type " + type)

            type = ItemType.Apple
            itemNode = Item.GetItemXML(type)
        End If

        If utl <> -1
            Self.utility = utl
        Else
            Self.utility = itemNode.GetAttribute("data", 0)
        End If

        Self.stackQuantity = itemNode.GetAttribute("quantity", 1)
        Self.hideQuantity = itemNode.GetAttribute("hideQuantity", False)
        Self.diamondCost = itemNode.GetAttribute("diamondCost", 0)
        Self.diamondDealerPrice = itemNode.GetAttribute("diamondDealable", 1)
        Self.coinCost = itemNode.GetAttribute("coinCost", 0)
        Self.quantityYOff = itemNode.GetAttribute("quantityYOff", 0)

        Self.isItem = True
        Self.x = xVal
        Self.y = yVal
        Self.trainingWeapon = isTrainingWeapon
        Self.itemType = type

        If drop
            Self.dropX = xVal
            Self.dropY = yVal
            Self.droppedByPlayer = True
        End If

        Local itemData := New ItemData(itemNode)
        Self.xOff = itemData.xOff
        Self.yOff = itemData.yOff
        Self.imageFrames = itemData.imageFrames

        If Self.IsItemOfType("isCoin")
            Local frameWidth := itemData.imageW
            Local frameHeight := itemData.imageH
            Local frameCount := itemData.imageFrames

            Local resourceCoinType := item.GetResourceCoinType(Self.utility)
            Local resourceCoinNode := Item.GetItemXML(resourceCoinType)
            Local resourceCoinPath := "items/" + resourceCoinNode.value
            Self.image = New Sprite(resourceCoinPath, frameWidth, frameHeight, frameCount)

            Self.yOff += 5.0

            If Not Level.IsWallAt(Self.x, Self.y + 1, False, False)
                Self.yOff += 5.0
            End If

            For Local pickup := EachIn Item.GetPickupsAt(Self.x, Self.y, Self)
                If Not pickup.IsItemOfType("isCoin") Then Continue

                Self.utility += pickup.GetValue()
                pickup.FlagForDeath(0)

                resourceCoinType = GetResourceCoinType(Self.utility)
                resourceCoinNode = Item.GetItemXML(resourceCoinType)
                resourceCoinPath = "items/" + resourceCoinNode.value
                Self.image = New Sprite(resourceCoinPath, frameWidth, frameHeight, frameCount)

                Self.itemType = resourceCoinType
            End For

            If Self.utility >= 50
                resourceCoinNode = Item.GetItemXML(ItemType.GoldHoard)
                resourceCoinPath = "items/" + resourceCoinNode.value
                Self.image = New Sprite(resourceCoinPath, 24, 24, 2)
            Else If Self.utility >= 25
                resourceCoinNode = Item.GetItemXML(ItemType.SmallGoldHoard)
                resourceCoinPath = "items/" + resourceCoinNode.value
                Self.image = New Sprite(resourceCoinPath, 24, 24, 2)
            End If

            Self.image.SetZOff(-18.0)
        Else
            Local bomb := Bomb(Self)
            If Level.isMysteryMode And Not bomb
                Self.image = New Sprite("entities/mystery_item.png", 18, 21, 2)

                Self.isMysteried = True
                Self.xOff = 3.0
                Self.yOff = 1.0
            Else
                Local path := "items/" + itemNode.value
                Self.image = New Sprite(path, 18, 21, 2)
            End If

            Self.shadow = New Sprite("entities/TEMP_shadow_standard.png", 1)

            If Self.itemType = ItemType.GoldenLute
                Self.bounce = New Bouncer(-2.5, 0.0, 1.5, 40)
                Self.yOff -= 18.0
                Self.shadowYOff = -8
                Self.shadow.UnSetZ()
                Self.shadow.SetZOff(Self.image.zOff + 24.0)
                Self.image.SetZOff(Self.image.zOff + 124.0)
            Else If itemData.bouncer
                Self.bounce = New Bouncer(-2.5, 0.0, 1.5, 40)
                Self.image.SetZOff(Self.yOff)
                Self.yOff -= 2.0
            Else
                Self.shadowYOff = 4
                Self.yOff += 11.0
                Self.image.SetZOff(-13.0)
            End If
        End If

        Local hint := itemNode.GetAttribute("hint", "")
        If hint <> ""
            If Level.isMysteryMode
                If Self.itemType <> ItemType.Bomb And
                   Not Self.IsItemOfType("isCoin")
                    hint = "?"
                End If
            End If

            Self.hintText = New TextSprite(2)
            Self.hintText.SetText(hint, False)
            Self.hintText.InWorld = True
        End If

        Local flyaway := Self.GetFlyawayText()
        If flyaway <> ""
            Self.nameText = New TextSprite(2)
            Self.nameText.SetText(flyaway, False)
            Self.nameText.InWorld = True
        End If

        If Self.IsItemOfType("isStackable") And
           Not Self.hideQuantity
            Self.quantityText = New TextSprite(1)
        End If

        If Self.itemType = ItemType.GoldenLute
            Self.image = New Sprite("items/golden_lute_magic.png", 32, 33, 8)
            Self.image.SetZOff(124.0)
        End If

        If Self.IsItemOfType("isTorch") Or
           Self.itemType = ItemType.GoldenLute
            Local lMax := Self.GetValue() + 0.5
            Self.ActivateLight(1.0, lMax)
        End If

        Item.AddToSeenItems(Self.itemType)
        Item.pickupList.AddLast(Self)

        Local familiar := FamiliarFixed.GetFamiliarAt(Self.x, Self.y)
        If familiar <> Null Then familiar.TryPickup()

        Local displayName := itemNode.GetAttribute("displayName", Self.itemType)
        Debug.WriteLine("Placed " + displayName + " at " + (New Point(Self.x, Self.y)).ToString())
    End Method

    Field itemType: String = ItemType.NoItem
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
        Item.pickupList.RemoveEach(Self)
        If Self.hintText <> Null Then Self.hintText.Discard()
        If Self.nameText <> Null Then Self.nameText.Discard()
        If Self.quantityText <> Null Then Self.quantityText.Discard()

        Super.Die()
    End Method

    Method GetFlyawayText: Int()
        Debug.TraceNotImplemented("Item.GetFlyawayText()")
    End Method

    Method GetIntAttribute: Int(attr: Int, dflt: Int)
        Debug.TraceNotImplemented("Item.GetIntAttribute(Int, Int)")
    End Method

    Method GetSlot: String()
        Debug.TraceNotImplemented("Item.GetSlot()")
    End Method

    Method GetStringAttribute: Int(attr: Int, dflt: Int)
        Debug.TraceNotImplemented("Item.GetStringAttribute(Int, Int)")
    End Method

    Method GetValue: Int()
        Return Self.utility
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Return False
    End Method

    Method IsItemOfClass: Bool(itemClass: String)
        Local itemNode := Item.GetItemXML(Self.itemType)

        Return Item.IsItemOfClass(itemNode, itemClass)
    End Method

    Method IsItemOfType: Bool(query: String)
        Return Item.IsItemOfType(Self.itemType, query)
    End Method

    Method IsVisible: Bool()
        Debug.TraceNotImplemented("Item.IsVisible()")
    End Method

    Method Move: Void()
        Debug.TraceNotImplemented("Item.Move()")
    End Method

    Method Pickup: String(player: Player)
        If Self.dead
            Return ItemType.NoItem
        End If

        Select Self.itemType
            Case ItemType.Key,
                 ItemType.GoldenKey,
                 ItemType.GoldenKey2,
                 ItemType.GoldenKey3,
                 ItemType.GlassKey
                If player.HasItemOfType(Self.itemType)
                    Return Self.PickupFail(player)
                End If
        End Select

        If Self.trainingWeapon
            Select player.characterID
                Case Character.Aria,
                     Character.Melody,
                     Character.Coda,
                     Character.Dove,
                     Character.Eli
                    Return Self.PickupFail(player)
            End Select
        End If

        If player.characterID = Character.Diamond
            Select Self.itemType
                Case ItemType.BootsOfLeaping,
                     ItemType.BootsOfLunging
                    Return Self.PickupFail(player)
            End Select

            Select Self.GetSlot()
                Case "weapon"
                    If Self.IsItemOfClass("isDagger") Or
                       Self.IsItemOfClass("isLongsword") Or
                       Self.IsItemOfClass("isSpear") Or
                       Self.IsItemOfClass("isRapier") Or
                       Self.IsItemOfClass("isBow") Or
                       Self.IsItemOfClass("isHarp") Or
                       Self.IsItemOfClass("isStaff") Or
                       Self.IsItemOfClass("isCutlass")
                        Return Self.PickupFail(player)
                    End If
                Case "spell"
                    Return Self.PickupFail(player)
            End Select
        End If

        If Self.itemType = ItemType.GoldenLute
            If player.isHelper
                Return Self.PickupFail(player)
            End If

            If Necrodancer.necrodancer <> Null And
               Necrodancer.necrodancer.level = 1 And
               Not Necrodancer.necrodancer.saidLutePhrase
                Audio.PlayGameSound("necrodancerGiveMeThatLute", -1, 1.0)
                Necrodancer.necrodancer.saidLutePhrase = True
            End If
        End If

        If Self.singleChoiceItem
            Item.ClearAllSingleChoiceItems(Self)
        End If

        If Not Self.droppedByPlayer
            If Not Self.IsItemOfType("isCoin") And
               Not Self.IsItemOfType("isDiamond")
                player.lastKillBeat = Audio.GetClosestBeatNum(True)
            End If
        End If

        Local pickupSound := "pickupGeneral"
        If Self.itemType = ItemType.Diamond
            pickupSound = "pickupDiamond"
        Else If Self.IsItemOfType("isCoin")
            pickupSound = "pickupGold"
        Else If Self.IsItemOfType("isWeapon")
            pickupSound = "pickupWeapon"
        Else If Self.IsItemOfType("isArmor")
            pickupSound = "pickupArmor"
        End If

        Audio.PlayGameSound(pickupSound, 2, 1.0)

        If Self.trainingWeapon
            Self.dropX = Self.x
            Self.dropY = Self.y
        Else
            Self.Die()
        End If

        Return Self.itemType
    End Method

    Method PickupFail: String(player: Player)
        Audio.PlayGameSound("error", 2, 1.0)
        player.ImmediatelyMoveTo(player.lastX - player.x, player.lastY - player.y, False, False, False, False, False)

        Return ItemType.NoItem
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

End Class

Class ItemList Extends List<String>

    Function _EditorFix: Void() End

    Method Compare: Int(a: String, b: String)
        Debug.TraceNotImplemented("ItemList.Compare(String, String)")
    End Method

End Class

Class ItemData

    Function _EditorFix: Void() End

    Method New(itemXML: XMLNode)
        Self.imageFrames = 2 * itemXML.GetAttribute("numFrames", 1)
        Self.imageW = itemXML.GetAttribute("imageW", 24)
        Self.imageH = itemXML.GetAttribute("imageH", 24)
        Self.bouncer = itemXML.GetAttribute("bouncer", True)

        Local xOffDefault := (24 - Self.imageW) / 2
        Self.xOff = itemXML.GetAttribute("xOff", xOffDefault)

        Local yOffDefault := 0
        If Self.bouncer Then yOffDefault = (24 - Self.imageH) / 2
        Self.yOff = itemXML.GetAttribute("yOff", yOffDefault)
    End Method

    Field imageFrames: Int
    Field imageW: Int
    Field imageH: Int
    Field bouncer: Bool = True
    Field xOff: Int
    Field yOff: Int

End Class

Interface IItemPredicate

    Method Call: Bool(n: XMLNode)

End Interface

Class StandardItemPredicate Implements IItemPredicate

    Function _EditorFix: Void() End

    Method New(itemClass_: String, chestColor_: Int, itemSlot_: String)
        Self.itemClass = itemClass_
        Self.chestColor = chestColor_
        Self.itemSlot = itemSlot_
    End Method

    Field itemClass: String
    Field chestColor: Int
    Field itemSlot: String

    Method Call: Bool(n: XMLNode)
        If Self.itemClass <> ""
            If Not Item.IsItemOfClass(n, Self.itemClass)
                Return False
            End If
        End If

        If Self.itemSlot <> ""
            Local slot := n.GetAttribute("slot", "")
            If slot.ToUpper() <> Self.itemSlot.ToUpper()
                Return False
            End If
        End If

        If Self.chestColor <> Chest.CHEST_COLOR_NONE
            Local name := n.GetAttribute("name", "")
            If Not Chest.IsItemAppropriateForChestColor(name, Self.chestColor)
                Return False
            End If
        End If

        Return True
    End Method

End Class

Class TransmutePredicate Implements IItemPredicate

    Function _EditorFix: Void() End

    Method Call: Bool(n: XMLNode)
        Debug.TraceNotImplemented("TransmutePredicate.Call(XMLNode)")
    End Method

End Class

Class ItemType

    Const NoItem: String = "no_item"

    Const AddBlackChest: String = "addchest_black"
    Const AddRedChest: String = "addchest_red"
    Const AddPurpleChest: String = "addchest_white"
    Const Chainmail: String = "armor_chainmail"
    Const HeavyGlassArmor: String = "armor_heavyglass"
    Const HeavyPlate: String = "armor_heavyplate"
    Const LeatherArmor: String = "armor_leather"
    Const PlateArmor: String = "armor_platemail"
    Const PlateArmorDorian: String = "armor_platemail_dorian"
    Const KarateGi: String = "armor_gi"
    Const GlassArmor: String = "armor_glass"
    Const ObsidianArmor: String = "armor_obsidian"
    Const QuartzArmor: String = "armor_quartz"
    Const CoinMultiplier1: String = "coins_x15"
    Const CoinMultiplier2: String = "coins_x2"
    Const CursedPotion: String = "cursed_potion"
    Const BalletShoes: String = "feet_ballet_shoes"
    Const BootsOfSpeed: String = "feet_boots_speed"
    Const WingedBoots: String = "feet_boots_winged"
    Const ExplorersBoots: String = "feet_boots_explorers"
    Const LeadBoots: String = "feet_boots_lead"
    Const BootsOfLeaping: String = "feet_boots_leaping"
    Const BootsOfLunging: String = "feet_boots_lunging"
    Const BootsOfPain: String = "feet_boots_pain"
    Const Hargreaves: String = "feet_greaves"
    Const BootsOfStrength: String = "feet_boots_strength"
    Const GlassSlippers: String = "feet_glass_slippers"
    Const Apple: String = "food_1"
    Const Cheese: String = "food_2"
    Const Drumstick: String = "food_3"
    Const Ham: String = "food_4"
    Const Carrot: String = "food_carrot"
    Const Cookies: String = "food_cookies"
    Const MagicApple: String = "food_magic_1"
    Const MagicCheese: String = "food_magic_2"
    Const MagicDrumstick: String = "food_magic_3"
    Const MagicHam: String = "food_magic_4"
    Const MagicCarrot: String = "food_magic_carrot"
    Const MagicCookies: String = "food_magic_cookies"
    Const HolyWater: String = "holy_water"
    Const LordCrown: String = "lord_crown"
    Const Bomb: String = "bomb"
    Const Bomb3: String = "bomb_3"
    Const Grenade: String = "bomb_grenade"
    Const WarDrum: String = "war_drum"
    Const BloodDrum: String = "blood_drum"
    Const DoubleHeartTransplant: String = "double_heart_transplant"
    Const HeartTransplant: String = "heart_transplant"
    Const CrownOfThorns: String = "head_crown_of_thorns"
    Const CrownOfGreed: String = "head_crown_of_greed"
    Const CrownOfTeleportation: String = "head_crown_of_teleportation"
    Const CircletOfTelepathy: String = "head_circlet_telepathy"
    Const MinersCap: String = "head_miners_cap"
    Const Monocle: String = "head_monocle"
    Const NinjaMask: String = "head_ninja_mask"
    Const Helm: String = "head_helm"
    Const GlassJaw: String = "head_glass_jaw"
    Const BlastHelm: String = "head_blast_helm"
    Const SpikedEars: String = "head_spiked_ears"
    Const Sunglasses: String = "head_sunglasses"
    Const Sonar: String = "head_sonar"
    Const Backpack: String = "hud_backpack"
    Const Holster: String = "holster"
    Const PackOfHolding: String = "bag_holding"
    Const Compass: String = "misc_compass"
    Const Coupon: String = "misc_coupon"
    Const GoldenKey: String = "misc_golden_key"
    Const GoldenKey2: String = "misc_golden_key2"
    Const GoldenKey3: String = "misc_golden_key3"
    Const GlassKey: String = "misc_glass_key"
    Const HeartContainer: String = "misc_heart_container"
    Const DoubleHeartContainer: String = "misc_heart_container2"
    Const CursedHeartContainer: String = "misc_heart_container_cursed"
    Const CursedDoubleHeartContainer: String = "misc_heart_container_cursed2"
    Const EmptyHeartContainer: String = "misc_heart_container_empty"
    Const EmptyDoubleHeartContainer: String = "misc_heart_container_empty2"
    Const Key: String = "misc_key"
    Const GoldMagnet: String = "misc_magnet"
    Const Map: String = "misc_map"
    Const MonkeysPaw: String = "misc_monkey_paw"
    Const Potion: String = "misc_potion"
    Const BombCharm: String = "charm_bomb"
    Const FrostCharm: String = "charm_frost"
    Const GluttonyCharm: String = "charm_gluttony"
    Const GrenadeCharm: String = "charm_grenade"
    Const LuckyCharm: String = "charm_luck"
    Const NazarCharm: String = "charm_nazar"
    Const ProtectionCharm: String = "charm_protection"
    Const RiskCharm: String = "charm_risk"
    Const StrengthCharm: String = "charm_strength"
    Const PermanentHeartContainer2: String = "perm_heart2"
    Const PermanentHeartContainer3: String = "perm_heart3"
    Const PermanentHeartContainer4: String = "perm_heart4"
    Const PermanentHeartContainer5: String = "perm_heart5"
    Const PermanentHeartContainer6: String = "perm_heart6"
    Const Coin0: String = "resource_coin0"
    Const Coin1: String = "resource_coin1"
    Const Coin2: String = "resource_coin2"
    Const Coin3: String = "resource_coin3"
    Const Coin4: String = "resource_coin4"
    Const Coin5: String = "resource_coin5"
    Const Coin6: String = "resource_coin6"
    Const Coin7: String = "resource_coin7"
    Const Coin8: String = "resource_coin8"
    Const Coin9: String = "resource_coin9"
    Const Coin10: String = "resource_coin10"
    Const Coin50: String = "resource_coin50"
    Const Coin100: String = "resource_coin100"
    Const Coin150: String = "resource_coin150"
    Const Diamond: String = "resource_diamond"
    Const Diamond2: String = "resource_diamond2"
    Const Diamond3: String = "resource_diamond3"
    Const Diamond4: String = "resource_diamond4"
    Const Diamonds5: String = "resource_hoard1"
    Const Diamonds10: String = "resource_hoard2"
    Const Diamonds15: String = "resource_hoard3"
    Const Diamonds20: String = "resource_hoard4"
    Const SmallGoldHoard: String = "resource_hoard_gold_small"
    Const GoldHoard: String = "resource_hoard_gold"
    Const RingOfCourage: String = "ring_courage"
    Const RingOfWar: String = "ring_war"
    Const RingOfPeace: String = "ring_peace"
    Const RingOfMana: String = "ring_mana"
    Const RingOfShadows: String = "ring_shadows"
    Const RingOfMight: String = "ring_might"
    Const RingOfCharisma: String = "ring_charisma"
    Const RingOfLuck: String = "ring_luck"
    Const RingOfGold: String = "ring_gold"
    Const RingOfPhasing: String = "ring_phasing"
    Const RingOfPiercing: String = "ring_piercing"
    Const RingOfRegeneration: String = "ring_regeneration"
    Const RingOfProtection: String = "ring_protection"
    Const RingOfShielding: String = "ring_shielding"
    Const RingOfBecoming: String = "ring_becoming"
    Const RingOfWonder: String = "ring_wonder"
    Const RingOfPain: String = "ring_pain"
    Const RingOfFrost: String = "ring_frost"
    Const EarthquakeScroll: String = "scroll_earthquake"
    Const FearScroll: String = "scroll_fear"
    Const FireballScroll: String = "scroll_fireball"
    Const FreezeEnemiesScroll: String = "scroll_freeze_enemies"
    Const GigantismScroll: String = "scroll_gigantism"
    Const RichesScroll: String = "scroll_riches"
    Const ShieldScroll: String = "scroll_shield"
    Const EnchantWeaponScroll: String = "scroll_enchant_weapon"
    Const ScrollOfNeed: String = "scroll_need"
    Const PulseScroll: String = "scroll_pulse"
    Const TransmuteScroll: String = "scroll_transmute"
    Const CrystalShovel: String = "shovel_crystal"
    Const BattleShovel: String = "shovel_battle"
    Const TitaniumShovel: String = "shovel_titanium"
    Const BloodShovel: String = "shovel_blood"
    Const ObsidianShovel: String = "shovel_obsidian"
    Const GlassShovel: String = "shovel_glass"
    Const GlassShardShovel: String = "shovel_shard"
    Const Shovel: String = "shovel_basic"
    Const ShovelOfCourage: String = "shovel_courage"
    Const ShovelOfStrength: String = "shovel_strength"
    Const Pickaxe: String = "pickaxe"
    Const EarthSpell: String = "spell_earth"
    Const FireballSpell: String = "spell_fireball"
    Const PulseSpell: String = "spell_pulse"
    Const FreezeEnemiesSpell: String = "spell_freeze_enemies"
    Const HealSpell: String = "spell_heal"
    Const BombSpell: String = "spell_bomb"
    Const ShieldSpell: String = "spell_shield"
    Const TransmuteSpell: String = "spell_transmute"
    Const CharmSpell: String = "spell_charm"
    Const TransformSpell: String = "spell_transform"
    Const ThrowingStars: String = "throwing_stars"
    Const DoveFamiliar: String = "familiar_dove"
    Const IceSpiritFamiliar: String = "familiar_ice_spirit"
    Const ShopkeeperFamiliar: String = "familiar_shopkeeper"
    Const ShieldFamiliar: String = "familiar_shield"
    Const RatFamiliar: String = "familiar_rat"
    Const EarthTome: String = "tome_earth"
    Const FireballTome: String = "tome_fireball"
    Const FreezeTome: String = "tome_freeze"
    Const PulseTome: String = "tome_pulse"
    Const ShieldTome: String = "tome_shield"
    Const TransmuteTome: String = "tome_transmute"
    Const Torch: String = "torch_1"
    Const BrightTorch: String = "torch_2"
    Const LuminousTorch: String = "torch_3"
    Const TorchOfForesight: String = "torch_foresight"
    Const GlassTorch: String = "torch_glass"
    Const InfernalTorch: String = "torch_infernal"
    Const ObsidianTorch: String = "torch_obsidian"
    Const TorchOfStrength: String = "torch_strength"
    Const TorchOfWalls: String = "torch_walls"
    Const Eli: String = "weapon_eli"
    Const Fangs: String = "weapon_fangs"
    Const Flower: String = "weapon_flower"
    Const GoldenLute: String = "weapon_golden_lute"
    Const Dagger: String = "weapon_dagger"
    Const GlassShardWeapon: String = "weapon_dagger_shard"
    Const TitaniumDagger: String = "weapon_titanium_dagger"
    Const ObsidianDagger: String = "weapon_obsidian_dagger"
    Const GoldenDagger: String = "weapon_golden_dagger"
    Const BloodDagger: String = "weapon_blood_dagger"
    Const GlassDagger: String = "weapon_glass_dagger"
    Const ElectricDagger: String = "weapon_dagger_electric"
    Const JeweledDagger: String = "weapon_dagger_jeweled"
    Const DaggerOfFrost: String = "weapon_dagger_frost"
    Const DaggerOfPhasing: String = "weapon_dagger_phasing"
    Const Broadsword: String = "weapon_broadsword"
    Const TitaniumBroadsword: String = "weapon_titanium_broadsword"
    Const ObsidianBroadsword: String = "weapon_obsidian_broadsword"
    Const GoldenBroadsword: String = "weapon_golden_broadsword"
    Const BloodBroadsword: String = "weapon_blood_broadsword"
    Const GlassBroadsword: String = "weapon_glass_broadsword"
    Const Longsword: String = "weapon_longsword"
    Const TitaniumLongsword: String = "weapon_titanium_longsword"
    Const ObsidianLongsword: String = "weapon_obsidian_longsword"
    Const GoldenLongsword: String = "weapon_golden_longsword"
    Const BloodLongsword: String = "weapon_blood_longsword"
    Const GlassLongsword: String = "weapon_glass_longsword"
    Const Whip: String = "weapon_whip"
    Const TitaniumWhip: String = "weapon_titanium_whip"
    Const ObsidianWhip: String = "weapon_obsidian_whip"
    Const GoldenWhip: String = "weapon_golden_whip"
    Const BloodWhip: String = "weapon_blood_whip"
    Const GlassWhip: String = "weapon_glass_whip"
    Const Spear: String = "weapon_spear"
    Const TitaniumSpear: String = "weapon_titanium_spear"
    Const ObsidianSpear: String = "weapon_obsidian_spear"
    Const GoldenSpear: String = "weapon_golden_spear"
    Const BloodSpear: String = "weapon_blood_spear"
    Const GlassSpear: String = "weapon_glass_spear"
    Const Rapier: String = "weapon_rapier"
    Const TitaniumRapier: String = "weapon_titanium_rapier"
    Const ObsidianRapier: String = "weapon_obsidian_rapier"
    Const GoldenRapier: String = "weapon_golden_rapier"
    Const BloodRapier: String = "weapon_blood_rapier"
    Const GlassRapier: String = "weapon_glass_rapier"
    Const Bow: String = "weapon_bow"
    Const TitaniumBow: String = "weapon_titanium_bow"
    Const ObsidianBow: String = "weapon_obsidian_bow"
    Const GoldenBow: String = "weapon_golden_bow"
    Const BloodBow: String = "weapon_blood_bow"
    Const GlassBow: String = "weapon_glass_bow"
    Const Crossbow: String = "weapon_crossbow"
    Const TitaniumCrossbow: String = "weapon_titanium_crossbow"
    Const ObsidianCrossbow: String = "weapon_obsidian_crossbow"
    Const GoldenCrossbow: String = "weapon_golden_crossbow"
    Const BloodCrossbow: String = "weapon_blood_crossbow"
    Const GlassCrossbow: String = "weapon_glass_crossbow"
    Const Flail: String = "weapon_flail"
    Const TitaniumFlail: String = "weapon_titanium_flail"
    Const ObsidianFlail: String = "weapon_obsidian_flail"
    Const GoldenFlail: String = "weapon_golden_flail"
    Const BloodFlail: String = "weapon_blood_flail"
    Const GlassFlail: String = "weapon_glass_flail"
    Const CatONineTails: String = "weapon_cat"
    Const TitaniumCat: String = "weapon_titanium_cat"
    Const ObsidianCat: String = "weapon_obsidian_cat"
    Const GoldenCat: String = "weapon_golden_cat"
    Const BloodCat: String = "weapon_blood_cat"
    Const GlassCat: String = "weapon_glass_cat"
    Const Blunderbuss: String = "weapon_blunderbuss"
    Const Rifle: String = "weapon_rifle"
    Const Axe: String = "weapon_axe"
    Const TitaniumAxe: String = "weapon_titanium_axe"
    Const ObsidianAxe: String = "weapon_obsidian_axe"
    Const GoldenAxe: String = "weapon_golden_axe"
    Const BloodAxe: String = "weapon_blood_axe"
    Const GlassAxe: String = "weapon_glass_axe"
    Const Harp: String = "weapon_harp"
    Const TitaniumHarp: String = "weapon_titanium_harp"
    Const ObsidianHarp: String = "weapon_obsidian_harp"
    Const GoldenHarp: String = "weapon_golden_harp"
    Const BloodHarp: String = "weapon_blood_harp"
    Const GlassHarp: String = "weapon_glass_harp"
    Const Warhammer: String = "weapon_warhammer"
    Const TitaniumWarhammer: String = "weapon_titanium_warhammer"
    Const ObsidianWarhammer: String = "weapon_obsidian_warhammer"
    Const GoldenWarhammer: String = "weapon_golden_warhammer"
    Const BloodWarhammer: String = "weapon_blood_warhammer"
    Const GlassWarhammer: String = "weapon_glass_warhammer"
    Const Staff: String = "weapon_staff"
    Const TitaniumStaff: String = "weapon_titanium_staff"
    Const ObsidianStaff: String = "weapon_obsidian_staff"
    Const GoldenStaff: String = "weapon_golden_staff"
    Const BloodStaff: String = "weapon_blood_staff"
    Const GlassStaff: String = "weapon_glass_staff"
    Const Cutlass: String = "weapon_cutlass"
    Const TitaniumCutlass: String = "weapon_titanium_cutlass"
    Const ObsidianCutlass: String = "weapon_obsidian_cutlass"
    Const GoldenCutlass: String = "weapon_golden_cutlass"
    Const BloodCutlass: String = "weapon_blood_cutlass"
    Const GlassCutlass: String = "weapon_glass_cutlass"

End Class
