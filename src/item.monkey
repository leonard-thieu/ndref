'Strict

Import monkey.map
Import monkey.stack
Import controller_game
Import entity
Import logger
Import NecroDancer
Import necrodancergame

Function GetString: String(obj: JsonObject, key: String, defval: String)
    If Not obj.Contains(key) Then Return defval

    Local value := obj.Get(key)
    If value = JsonNull.Instance Then Return defval

    Return value.StringValue()
End Function

Class Item Extends Entity

    Global debugTrailerMode: Bool
    Global diamondDealerItems1: Int
    Global diamondDealerItems2: Int
    Global diamondDealerItems3: Int
    Global hephItems1: Int
    Global hephItems2: Int
    Global hephItems3: Int
    Global itemImages: Int
    Global itemPoolAnyChest: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolAnyChest2: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolChest: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolChest2: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolLockedChest: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolLockedChest2: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolLockedShop: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolLockedShop2: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolRandom: List<JsonObject> = New List<JsonObject>()
    Global itemPoolRandom2: List<JsonObject> = New List<JsonObject>()
    Global itemPoolShop: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolShop2: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolUrn: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
    Global itemPoolUrn2: List<JsonObject>[] = [New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>(), New List<JsonObject>()]
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
        Local itemNodes := JsonArray(necrodancergame.xmlData.Get("items")).GetData()

        Local attributeNames := New Stack<String>()
        Local unlockedItems := New Stack<JsonObject>()
        Local unlockedItemsChances := New Stack<Int>()
        Local itemPoolCandidates := New Stack<JsonObject>()

        For Local i := 0 Until 2
            For Local j := 0 Until 8
                Local kMax := 1
                If Not (j = 7)
                    kMax = 6
                End If

                For Local k := 0 To kMax
                    attributeNames.Clear()

                    Local itemPool: List<JsonObject>
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
                    unlockedItems.Clear()
                    unlockedItemsChances.Clear()

                    For Local itemNodeValue := EachIn itemNodes
                        Local itemNode := JsonObject(itemNodeValue)
                        Local m := 0

                        For Local attributeName := EachIn attributeNames
                            Local chancesStr := GetString(itemNode, attributeName, "0")
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
                                   Item.IsUnlocked(GetString(itemNode, "_name", "no_item"))
                                    unlockedItems.Push(itemNode)

                                    If j = 7
                                        unlockedItemsChances.Push(1)
                                    Else
                                        If m > 0
                                            chance = math.Ceil(chance / 10.0)
                                        End If

                                        If Item.debugTrailerMode
                                            Local itemSet := GetString(itemNode, "set", "base")
                                            If itemSet = "dlc"
                                                chance *= 50
                                            End If
                                        End If

                                        unlockedItemsChances.Push(chance)

                                        Exit
                                    End If
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

                            If randomValue > chance Then Exit

                            randomValue -= chance
                        End For

                        If n >= unlockedItemsChances.Length() Then n = 0

                        itemPoolCandidates.Push(unlockedItems.Get(n))
                        unlockedItems.Remove(n)
                        unlockedItemsChances.Remove(n)
                    End While

                    For Local itemNode := EachIn itemPoolCandidates
                        If Item.IsValidItemForCurrentChars(itemNode)
                            Local name := GetString(itemNode, "_name", "no_item")
                            If Not Item.IsDisabled(name)
                                itemPool.AddLast(itemNode)
                            End If
                        End If
                    End For
                End For
            End For
        End For

        ' Requires OpenAL for timing information.
        Debug.Log("Item pool generation took some ms.")
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

    Function GetSlot: String(n: JsonObject)
        Return GetString(n, "slot", "no_item")
    End Function

    Function GetSlot: String(i: String)
        Local itemNodes := JsonArray(necrodancergame.xmlData.Get("items")).GetData()

        For Local itemNode := EachIn itemNodes
            Local itemObj := JsonObject(itemNode)
            If itemObj.GetString("_name") = i
                Return GetString(itemObj, "slot", "no_item")
            End If
        End For

        Return "no_item"
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

    Function IsCourageItem: Bool(n: JsonObject)
        Local name := GetString(n, "_name", "no_item")

        Select name
            Case "ring_courage"
            Case "shovel_courage"
                Return True
        End Select

        Return False
    End Function

    Function IsDamageBonusItem: Bool(n: JsonObject)
        Local name := GetString(n, "_name", "no_item")

        Select name
            Case "blood_drum"
            Case "charm_risk"
            Case "charm_strength"
            Case "feet_boots_strength"
            Case "head_glass_jaw"
            Case "head_spiked_ears"
            Case "head_sunglasses"
            Case "ring_courage"
            Case "ring_frost"
            Case "ring_might"
            Case "ring_piercing"
            Case "ring_war"
            Case "shovel_battle"
            Case "torch_strength"
            Case "war_drum"
                Return True
        End Select

        Return False
    End Function

    Function IsDamageReductionItem: Bool(n: JsonObject)
        Local name := GetString(n, "_name", "no_item")

        Select name
            Case "armor_chainmail"
            Case "armor_heavyplate"
            Case "armor_leather"
            Case "armor_obsidian"
            Case "armor_platemail"
            Case "armor_quartz"
            Case "charm_protection"
            Case "feet_greaves"
            Case "head_helm"
            Case "ring_protection"
                Return True
        End Select

        Return False
    End Function

    Function IsDisabled: Bool(item: String)
        If Not NecroDancer.DEBUG_BUILD Or
           Not controller_game.debugEnablePrototypes
            Select item
                Case "familiar_shield"
                    Return True
            End Select
        End If

        Return False
    End Function

    Function IsDiscountItem: Bool(n: JsonObject)
        Local name := GetString(n, "_name", "no_item")

        Select name
            Case "misc_coupon"
            Case "ring_charisma"
                Return True
        End Select

        Return False
    End Function

    Function IsGoldGeneratingItem: Bool(n: JsonObject)
        Local name := GetString(n, "_name", "no_item")

        Select name
            Case "familiar_shopkeeper"
            Case "ring_gold"
            Case "scroll_riches"
                Return True
        End Select

        Return False
    End Function

    Function IsHealthBonusItem: Bool(n: JsonObject)
        If n.GetBool("isFood") Return True

        Local name := GetString(n, "_name", "no_item")

        Select name
            Case "charm_gluttony"
            Case "cursed_potion"
            Case "head_crown_of_thorns"
            Case "misc_heart_container"
            Case "misc_heart_container2"
            Case "misc_heart_container_cursed"
            Case "misc_heart_container_cursed2"
            Case "misc_heart_container_empty"
            Case "misc_heart_container_empty2"
            Case "ring_regeneration"
            Case "spell_heal"
                Return True
        End Select

        Return False
    End Function

    Function IsImmediatelyConsumed: Bool(t: Int)
        Debug.TraceNotImplemented("Item.IsImmediatelyConsumed()")
    End Function

    Function IsItemOfClass: Bool(n: JsonObject, itemClass: String)
        Debug.TraceNotImplemented("Item.IsItemOfClass()")
    End Function

    Function IsItemOfType: Bool(i: Int, query: Int)
        Debug.TraceNotImplemented("Item.IsItemOfType()")
    End Function

    Function IsPainItem: Bool(n: JsonObject)
        Local name := GetString(n, "_name", "no_item")

        Select name
            Case "feet_boots_pain"
            Case "ring_pain"
                Return True
        End Select

        Return False
    End Function

    Function IsUnlocked: Bool(t: String)
        Debug.TraceNotImplemented("Item.IsUnlocked()")
    End Function

    Function IsValidItemForCurrentChars: Bool(n: JsonObject)
        Local slot := Item.GetSlot(n)
        Local name := GetString(n, "_name", "no_item")

        If Util.IsWeaponlessCharacterActive()
            If slot = "weapon" Then Return False
        End If

        If Util.IsCharacterActive(Character.Aria)
            If Item.IsDamageReductionItem(n) Then Return False
            If Item.IsHealthBonusItem(n) Then Return False
            If Item.IsPainItem(n) Then Return False

            Select name
                Case "blood_drum"
                Case "charm_nazar"
                Case "charm_risk"
                Case "feet_ballet_shoes"
                Case "holster"
                Case "scroll_enchant_weapon"
                Case "shovel_blood"
                Case "war_drum"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Melody)
            If Item.IsPainItem(n) Then Return False
            If Item.IsDamageBonusItem(n) Then Return False
            If Item.IsItemOfClass(n, "isFamiliar") Then Return False

            Select name
                Case "feet_boots_leaping"
                Case "feet_boots_lunging"
                Case "holster"
                Case "scroll_enchant_weapon"
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
                Case "blood_drum"
                Case "charm_nazar"
                Case "feet_ballet_shoes"
                Case "holster"
                Case "ring_shadows"
                Case "scroll_enchant_weapon"
                Case "shovel_blood"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Dove)
            If Item.IsPainItem(n) Then Return False
            If Item.IsDamageBonusItem(n) Then Return False
            If Item.IsItemOfClass(n, "isShovel") Then Return False

            Select name
                Case "charm_grenade"
                Case "familiar_dove"
                Case "familiar_rat"
                Case "feet_boots_lunging"
                Case "head_crown_of_thorns"
                Case "holster"
                Case "holy_water"
                Case "misc_coupon"
                Case "ring_gold"
                Case "ring_phasing"
                Case "ring_shadows"
                Case "scroll_earthquake"
                Case "scroll_enchant_weapon"
                Case "scroll_fireball"
                Case "scroll_pulse"
                Case "scroll_riches"
                Case "spell_earth"
                Case "spell_fireball"
                Case "spell_pulse"
                Case "throwing_stars"
                Case "tome_earth"
                Case "tome_fireball"
                Case "tome_pulse"
                Case "torch_infernal"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Eli)
            If slot = "shovel" Then Return False
            If Item.IsPainItem(n) Then Return False
            If Item.IsDamageBonusItem(n) Then Return False

            Select name
                Case "bomb"
                Case "bomb3"
                Case "charm_bomb"
                Case "charm_grenade"
                Case "charm_nazar"
                Case "head_blast_helm"
                Case "head_crown_of_thorns"
                Case "holster"
                Case "ring_gold"
                Case "scroll_enchant_weapon"
                Case "spell_bomb"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Bard)
            Select name
                Case "double_heart_transplant"
                Case "feet_boots_speed"
                Case "heart_transplant"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Bolt)
            Select name
                Case "charm_nazar"
                Case "feet_ballet_shoes"
                Case "weapon_spear"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Dorian)
            If slot = "feet" Then Return False
            If slot = "body" Then Return False

            Select name
                Case "misc_compass"
                Case "pickaxe"
                Case "ring_gold"
                Case "ring_might"
                Case "weapon_blunderbuss"
                Case "weapon_rifle"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Monk)
            If Item.IsGoldGeneratingItem(n) Then Return False
            If Item.IsCourageItem(n) Then Return False
            If Item.IsDiscountItem(n) Then Return False

            Select name
                Case "ring_shadows"
                Case "shovel_blood"
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
                Case "charm_grenade"
                Case "feet_boots_leaping"
                Case "feet_boots_lunging"
                Case "holster"
                Case "hud_backpack"
                Case "ring_mana"
                Case "throwing_stars"
                Case "weapon_blunderbuss"
                Case "weapon_rifle"
                    Return False
            End Select
        End If

        If Util.IsCharacterActive(Character.Unknown14)
            If Item.IsItemOfClass(n, "isFamiliar") Then Return False
            If name.Contains("familiar") Then Return False

            Select name
                Case "feet_boots_leaping"
                Case "feet_boots_lunging"
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
                Case "head_circlet_telepathy"
                Case "scroll_enchant_weapon"
                Case "weapon_dagger_jeweled"
                    Return False
                Default
            End Select
        End If

        If Util.IsCharacterActive(Character.Mary)
            If name.Contains("familiar") Then Return False

            Select name
                Case "head_blast_helm"
                Case "weapon_spear"
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
                Case "feet_boots_explorers"
                Case "feet_boots_winged"
                Case "feet_glass_slippers"
                Case "scroll_freeze_enemies"
                Case "spell_freeze_enemies"
                Case "tome_freeze"
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

    Function IsValidItemForCurrentChars: Bool(n: XMLNode)
        Debug.TraceNotImplemented("Item.IsValidItemForCurrentChars()")
    End Function

    Function IsValidItemForCurrentChars: Bool(name: Int)
        Debug.TraceNotImplemented("Item.IsValidItemForCurrentChars()")
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

        Debug.TraceNotImplemented("Item.New()")
    End Method

    Field itemType: String = "no_item"
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

    Method GetSlot: String()
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
        GetSlot("")
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
        IsValidItemForCurrentChars(JsonObject(Null))
        IsValidItemForCurrentChars(XMLNode(Null))
        IsValidItemForCurrentChars(0)
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
