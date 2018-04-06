Import monkey.map
Import entity

Class Item Extends Entity

    Global lastChestItemClass1: String
    Global lastChestItemClass2: String
    Global seenItems: StringMap<Int>
    Global pickupList: List<Item>

    Function AddToSeenItems: Void(itemName: String)
        If seenItems.Contains(itemName)
            Local seen := seenItems.Get(itemName)
            seenItems.Update(itemName, seen + 1)
        Else
            seenItems.Insert(itemName, 1)
        End If
    End Function

    Function ChangeWeaponMaterial: Int(t: Int, materialClass: Int)
    End Function

    Function ClearAllSingleChoiceItems: Void(takenItem: Object)
    End Function

    Function ConsumeCoinsRemainingOnLevel: Int()
    End Function

    Function CreateAmountOfCoins: Void(xVal: Int, yVal: Int, amt: Int)
    End Function

    Function CreateItemPools: Void()
    End Function

    Function DropItem: Object(xVal: Int, yVal: Int, t: Int)
    End Function

    Function FilterDisabledItems: Void(list: Object)
    End Function

    Function FindAllGoldPiles: Object()
    End Function

    Function GetAllItemsInClass: Object(itemClass: Int)
    End Function

    Function GetAppropriateCoinItemForQuantity: Int(quantity: Int)
    End Function

    Function GetCost: Int(i: Int)
    End Function

    Function GetFlyawayText: Int(i: Int)
    End Function

    Function GetHeavyGlassFrame: Int(quantity: Int)
    End Function

    Function GetIntAttribute: Int(i: Int, attr: Int, dflt: Int)
    End Function

    Function GetItemXML: Object(i: Int)
    End Function

    Function GetPickupAt: Object(xVal: Int, yVal: Int, slf: Object)
    End Function

    Function GetPickupsAt: Object(xVal: Int, yVal: Int, slf: Object)
    End Function

    Function GetRandomItemInClass: Int(itemClass: Int, requestedLevel: Int, randomType: Int, chestColor: Int, ignorePendingMetaGameItems: Bool, itemSlot: Int, nonDeterministic: Bool)
    End Function

    Function GetRandomItemInClassByPredicate: Int(predicate: Object, requestedLevel: Int, randomType: Int, nonDeterministic: Bool)
    End Function

    Function GetSet: Int(n: Object)
    End Function

    Function GetSlot: Int(n: Object)
    End Function

    Function GetSlot2: Int(i: Int)
    End Function

    Function GetStringAttribute: Int(i: Int, attr: Int, dflt: Int)
    End Function

    Function GetValue: Int(t: Int)
    End Function

    Function GetWeaponBaseType: Int(t: Int)
    End Function

    Function GetWeaponShapeClass: Int(t: Int)
    End Function

    Function HasSeenItemXTimes: Bool(itemName: Int, x: Int)
    End Function

    Function InitAll: Void()
    End Function

    Function IsCourageItem: Bool(n: Object)
    End Function

    Function IsDamageBonusItem: Bool(n: Object)
    End Function

    Function IsDamageReductionItem: Bool(n: Object)
    End Function

    Function IsDisabled: Bool(item: Int)
    End Function

    Function IsDiscountItem: Bool(n: Object)
    End Function

    Function IsGoldGeneratingItem: Bool(n: Object)
    End Function

    Function IsHealthBonusItem: Bool(n: Object)
    End Function

    Function IsImmediatelyConsumed: Bool(t: Int)
    End Function

    Function IsItemOfClass: Bool(n: Object, itemClass: Int)
    End Function

    Function IsItemOfType: Bool(i: Int, query: Int)
    End Function

    Function IsPainItem: Bool(n: Object)
    End Function

    Function IsUnlocked: Bool(t: Int)
    End Function

    Function IsValidItemForCurrentChars: Bool(n: Object)
    End Function

    Function IsValidItemForCurrentChars2: Bool(name: Int)
    End Function

    Function IsValidRandomItem: Bool(t: Int)
    End Function

    Function MoveAll: Void()
    End Function

    Function RandomHardModeHelperItem: Int()
    End Function

    Function RenderItemAt: Void(iType: Int, xVal: Int, yVal: Int, zVal: Int, inWorld: Bool, scale: Float, alpha: Float, frame: Int)
    End Function

    Function RenderItemImageAt: Void(img: Object, xVal: Int, yVal: Int, zVal: Int, inWorld: Bool, scale: Float, alpha: Float, frame: Int)
    End Function

    Function TransmuteAllItems: Void()
    End Function

    Function TransmuteNearbyItems: Void(xVal: Int, yVal: Int)
    End Function

    Function _EditorFix() End

    Method New(xVal: Int, yVal: Int, type: String, drop: Bool, utl: Int, isTrainingWeapon: Bool)
        Super.New()
    End Method

    Field type: String
    Field field_F4: Bool
    Field bldCost: Bool
    Field field_F6: Bool
    Field field_F8: Int = -1
    Field field_FC: Int
    Field field_100: Int
    Field field_104: Bool
    Field field_108: Int = 1
    Field field_10C: Bool
    Field field_110: Int
    Field field_114: Int = 1
    Field field_118: Int
    Field field_11C: Int = -100000
    Field field_120: Int = -100000
    Field field_124: Bool
    Field field_125: Bool
    Field field_126: Bool = True
    Field field_128: Int
    Field field_12C: Int
    Field field_130: Int
    Field field_134: Bool
    Field field_135: Bool
    Field field_136: Bool
    Field field_138: Int = 8
    Field field_13C: Int

    Method CheckAdjacentItems: Void()
    End Method

    Method Die: Void()
    End Method

    Method GetFlyawayText: Int()
    End Method

    Method GetIntAttribute: Int(attr: Int, dflt: Int)
    End Method

    Method GetSlot: Int()
    End Method

    Method GetStringAttribute: Int(attr: Int, dflt: Int)
    End Method

    Method GetValue: Int()
    End Method

    Method IsItemOfClass: Bool(itemClass: Int)
    End Method

    Method IsItemOfType: Bool(query: Int)
    End Method

    Method IsVisible: Bool()
    End Method

    Method Move: Void()
    End Method

    Method Pickup: Int(player: Object)
    End Method

    Method Render: Void()
    End Method

    Method SetMystery: Void()
    End Method

    Method Transmute: Void()
    End Method

    Method Update: Void()
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
