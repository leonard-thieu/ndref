'Strict

Import monkey.map
Import monkey.stack
Import mojo.app
Import gui.controller_game
Import bomb
Import chest
Import entity
Import gamedata
Import logger
Import necrodancer
Import necrodancergame
Import xml

Function GetResourceCoinType: String(amount: Int)
    Return "resource_coin" + math.Clamp(amount, 1, 10)
End Function

Class Item Extends Entity

    Const NoItem: String = "no_item"

    Global debugTrailerMode: Bool
    Global diamondDealerItems1: Object
    Global diamondDealerItems2: Object
    Global diamondDealerItems3: Object
    Global hephItems1: Object
    Global hephItems2: Object
    Global hephItems3: Object
    Global itemImages: Object
    Global itemPoolAnyChest: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolAnyChest2: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolChest: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolChest2: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolLockedChest: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolLockedChest2: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolLockedShop: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolLockedShop2: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolRandom: List<XMLNode> = New List<XMLNode>()
    Global itemPoolRandom2: List<XMLNode> = New List<XMLNode>()
    Global itemPoolShop: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolShop2: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolUrn: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global itemPoolUrn2: List<XMLNode>[] = [New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>(), New List<XMLNode>()]
    Global lastChestItemClass1: String
    Global lastChestItemClass2: String
    Global merlinItems1: Object
    Global merlinItems2: Object
    Global merlinItems3: Object
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

    Function ClearAllSingleChoiceItems: Void(takenItem: Object)
        Debug.TraceNotImplemented("Item.ClearAllSingleChoiceItems(Object)")
    End Function

    Function ConsumeCoinsRemainingOnLevel: Int()
        Debug.TraceNotImplemented("Item.ConsumeCoinsRemainingOnLevel()")
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

        For Local i := 0 Until 2
            For Local j := 0 To 7
                Local kMax := 1
                If j <> 7
                    kMax = 6
                End If

                For Local k := 0 Until kMax
                    attributeNames.Clear()

                    ' Select the pool to fill.
                    Local itemPool: List<XMLNode>
                    If j <> 7
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
                                If j = 7
                                    chance = Int(chancesStrs[0])
                                End If
                            End If

                            If chance > 0
                                If Level.isHardcoreMode Or
                                   Item.IsUnlocked(itemNode.GetAttribute("name", ""))
                                    unlockedItems.Push(itemNode)

                                    If j = 7
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

                        Local name := itemPoolCandidate.Name
                        If Item.IsDisabled(name) Then Continue

                        itemPool.AddLast(itemPoolCandidate)
                    End For

                    If necrodancer.DUMP_ITEM_POOLS
                        Debug.WriteLine()
                        Local itemPoolName: String
                        If j <> 7
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
                        If j <> 7 Then itemPoolName += "[" + j + "]"

                        Debug.WriteLine(itemPoolName)
                        For Local itemNode := EachIn itemPool
                            Local name := itemNode.Name
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

    Function FilterDisabledItems: Void(list: Object)
        Debug.TraceNotImplemented("Item.FilterDisabledItems(Object)")
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

    Function GetPickupAt: Item(xVal: Int, yVal: Int, slf: Item)
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
                    Local name := itemNode.Name

                    If Not Item.HasSeenItemXTimes(name, j)
                        Item.AddToSeenItems(name)

                        Return name
                    End If
                End If
            End For
        End For

        Debug.Log("GetRandomItemInClassByPredicate: NO VALID ITEM!  Spawning coins")

        Return "resource_hoard_gold"
    End Function

    Function GetSet: Int(n: Object)
        Debug.TraceNotImplemented("Item.GetSet(Object)")
    End Function

    Function GetSlot: String(n: XMLNode)
        Return n.GetAttribute("slot", Item.NoItem)
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
        Debug.TraceNotImplemented("Item.InitAll()")
    End Function

    Function IsCourageItem: Bool(n: XMLNode)
        Local name := n.Name

        Select name
            Case "ring_courage",
                 "shovel_courage"
                Return True
        End Select

        Return False
    End Function

    Function IsDamageBonusItem: Bool(n: XMLNode)
        Local name := n.Name

        Select name
            Case "blood_drum",
                 "charm_risk",
                 "charm_strength",
                 "feet_boots_strength",
                 "head_glass_jaw",
                 "head_spiked_ears",
                 "head_sunglasses",
                 "ring_courage",
                 "ring_frost",
                 "ring_might",
                 "ring_piercing",
                 "ring_war",
                 "shovel_battle",
                 "torch_strength",
                 "war_drum"
                Return True
        End Select

        Return False
    End Function

    Function IsDamageReductionItem: Bool(n: XMLNode)
        Local name := n.Name

        Select name
            Case "armor_chainmail",
                 "armor_heavyplate",
                 "armor_leather",
                 "armor_obsidian",
                 "armor_platemail",
                 "armor_quartz",
                 "charm_protection",
                 "feet_greaves",
                 "head_helm",
                 "ring_protection"
                Return True
        End Select

        Return False
    End Function

    Function IsDisabled: Bool(item: String)
        If Not necrodancer.DEBUG_BUILD Or
           Not controller_game.debugEnablePrototypes
            Select item
                Case "familiar_shield"
                    Return True
            End Select
        End If

        Return False
    End Function

    Function IsDiscountItem: Bool(n: XMLNode)
        Local name := n.Name

        Select name
            Case "misc_coupon",
                 "ring_charisma"
                Return True
        End Select

        Return False
    End Function

    Function IsGoldGeneratingItem: Bool(n: XMLNode)
        Local name := n.Name

        Select name
            Case "familiar_shopkeeper",
                 "ring_gold",
                 "scroll_riches"
                Return True
        End Select

        Return False
    End Function

    Function IsHealthBonusItem: Bool(n: XMLNode)
        If Item.IsItemOfClass(n, "isFood") Then Return True

        Local name := n.Name

        Select name
            Case "charm_gluttony",
                 "cursed_potion",
                 "head_crown_of_thorns",
                 "misc_heart_container",
                 "misc_heart_container2",
                 "misc_heart_container_cursed",
                 "misc_heart_container_cursed2",
                 "misc_heart_container_empty",
                 "misc_heart_container_empty2",
                 "ring_regeneration",
                 "spell_heal"
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
        Local name := n.Name

        Select name
            Case "feet_boots_pain",
                 "ring_pain"
                Return True
        End Select

        Return False
    End Function

    Function IsUnlocked: Bool(t: String)
        Debug.TraceNotImplemented("Item.IsUnlocked(String)")
    End Function

    Function IsValidItemForCurrentChars: Bool(n: XMLNode)
        Local slot := Item.GetSlot(n)
        Local name := n.Name

        If Util.IsWeaponlessCharacterActive()
            If slot = "weapon" Then Return False
        End If

        If Util.IsCharacterActive(Character.Aria)
            If Item.IsDamageReductionItem(n) Then Return False
            If Item.IsHealthBonusItem(n) Then Return False
            If Item.IsPainItem(n) Then Return False

            Select name
                Case "blood_drum",
                     "charm_nazar",
                     "charm_risk",
                     "feet_ballet_shoes",
                     "holster",
                     "scroll_enchant_weapon",
                     "shovel_blood",
                     "war_drum"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Melody)
            If Item.IsPainItem(n) Then Return False
            If Item.IsDamageBonusItem(n) Then Return False
            If Item.IsItemOfClass(n, "isFamiliar") Then Return False

            Select name
                Case "feet_boots_leaping",
                     "feet_boots_lunging",
                     "holster",
                     "scroll_enchant_weapon"
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
                Case "blood_drum",
                     "charm_nazar",
                     "feet_ballet_shoes",
                     "holster",
                     "ring_shadows",
                     "scroll_enchant_weapon",
                     "shovel_blood"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Dove)
            If Item.IsPainItem(n) Then Return False
            If Item.IsDamageBonusItem(n) Then Return False
            If Item.IsItemOfClass(n, "isShovel") Then Return False

            Select name
                Case "charm_grenade",
                     "familiar_dove",
                     "familiar_rat",
                     "feet_boots_lunging",
                     "head_crown_of_thorns",
                     "holster",
                     "holy_water",
                     "misc_coupon",
                     "ring_gold",
                     "ring_phasing",
                     "ring_shadows",
                     "scroll_earthquake",
                     "scroll_enchant_weapon",
                     "scroll_fireball",
                     "scroll_pulse",
                     "scroll_riches",
                     "spell_earth",
                     "spell_fireball",
                     "spell_pulse",
                     "throwing_stars",
                     "tome_earth",
                     "tome_fireball",
                     "tome_pulse",
                     "torch_infernal"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Eli)
            If slot = "shovel" Then Return False
            If Item.IsPainItem(n) Then Return False
            If Item.IsDamageBonusItem(n) Then Return False

            Select name
                Case "bomb",
                     "bomb3",
                     "charm_bomb",
                     "charm_grenade",
                     "charm_nazar",
                     "head_blast_helm",
                     "head_crown_of_thorns",
                     "holster",
                     "ring_gold",
                     "scroll_enchant_weapon",
                     "spell_bomb"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Bard)
            Select name
                Case "double_heart_transplant",
                     "feet_boots_speed",
                     "heart_transplant"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Bolt)
            Select name
                Case "charm_nazar",
                     "feet_ballet_shoes",
                     "weapon_spear"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Dorian)
            If slot = "feet" Then Return False
            If slot = "body" Then Return False

            Select name
                Case "misc_compass",
                     "pickaxe",
                     "ring_gold",
                     "ring_might",
                     "weapon_blunderbuss",
                     "weapon_rifle"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Monk)
            If Item.IsGoldGeneratingItem(n) Then Return False
            If Item.IsCourageItem(n) Then Return False
            If Item.IsDiscountItem(n) Then Return False

            Select name
                Case "ring_shadows",
                     "shovel_blood"
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
                Case "charm_grenade",
                     "feet_boots_leaping",
                     "feet_boots_lunging",
                     "holster",
                     "hud_backpack",
                     "ring_mana",
                     "throwing_stars",
                     "weapon_blunderbuss",
                     "weapon_rifle"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Reaper)
            If Item.IsItemOfClass(n, "isFamiliar") Then Return False
            If name.Contains("familiar") Then Return False

            Select name
                Case "feet_boots_leaping",
                     "feet_boots_lunging"
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
                Case "head_circlet_telepathy",
                     "scroll_enchant_weapon",
                     "weapon_dagger_jeweled"
                    Return False
                Default
            End Select
        End If

        If Util.IsCharacterActive(Character.Mary)
            If name.Contains("familiar") Then Return False

            Select name
                Case "head_blast_helm",
                     "weapon_spear"
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
                Case "feet_boots_explorers",
                     "feet_boots_winged",
                     "feet_glass_slippers",
                     "scroll_freeze_enemies",
                     "spell_freeze_enemies",
                     "tome_freeze"
                    Return False
            End Select
        End If

        If Level.isPhasingMode
            Select name
                Case "ring_phasing"
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
            Case Item.NoItem,
                 "resource_hoard_gold"
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

        If Not itemNode.IsValid()
            Debug.Log("ERROR: Unrecognized item type " + type)

            type = "food_1"
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
            Self.image = New Sprite(resourceCoinPath, frameWidth, frameHeight, frameCount, Image.DefaultFlags)

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
                resourceCoinPath = "items/" + resourceCoinNode.Value
                Self.image = New Sprite(resourceCoinPath, frameWidth, frameHeight, frameCount, Image.DefaultFlags)

                Self.itemType = resourceCoinType
            End For

            If Self.utility >= 50
                resourceCoinNode = Item.GetItemXML("resource_hoard_gold")
                resourceCoinPath = "items/" + resourceCoinNode.Value
                Self.image = New Sprite(resourceCoinPath, 24, 24, 2, Image.DefaultFlags)
            Else If Self.utility >= 25
                resourceCoinNode = Item.GetItemXML("resource_hoard_gold_small")
                resourceCoinPath = "items/" + resourceCoinNode.Value
                Self.image = New Sprite(resourceCoinPath, 24, 24, 2, Image.DefaultFlags)
            End If

            Self.image.SetZOff(-18.0)
        Else
            Local bomb := Bomb(Self)
            If Level.isMysteryMode And Not bomb
                Self.image = New Sprite("entities/mystery_item.png", 18, 21, 2, Image.DefaultFlags)

                Self.isMysteried = True
                Self.xOff = 3.0
                Self.yOff = 1.0
            Else
                Local path := "items/" + itemNode.Value
                Self.image = New Sprite(path, 18, 21, 2, Image.DefaultFlags)
            End If

            Self.shadow = New Sprite("entities/TEMP_shadow_standard.png", 1, Image.DefaultFlags)

            If Self.itemType = "weapon_golden_lute"
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
                If Self.itemType <> "bomb" And
                   Not Self.IsItemOfType("isCoin")
                    hint = "?"
                End If
            End If

            Self.hintText = New TextSprite(2)
            Self.hintText.SetText(hint, False)
            Self.hintText.InWorld(True)
        End If

        Local flyaway := Self.GetFlyawayText()
        If flyaway <> ""
            Self.nameText = New TextSprite(2)
            Self.nameText.SetText(flyaway, False)
            Self.nameText.InWorld(True)
        End If

        If Self.IsItemOfType("isStackable") And
           Not Self.hideQuantity
            Self.quantityText = New TextSprite(1)
        End If

        If Self.itemType = "weapon_golden_lute"
            Self.image = New Sprite("items/golden_lute_magic.png", 32, 33, 8, Image.DefaultFlags)
            Self.image.SetZOff(124.0)
        End If

        If Self.IsItemOfType("isTorch") Or
           Self.itemType = "weapon_golden_lute"
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

    Field itemType: String = Item.NoItem
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

    Method IsItemOfClass: Bool(itemClass: Int)
        Debug.TraceNotImplemented("Item.IsItemOfClass(Int)")
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

    Method Pickup: Int(player: Object)
        Debug.TraceNotImplemented("Item.Pickup(Object)")
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
