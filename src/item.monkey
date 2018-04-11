'Strict

Import monkey.map
Import entity
Import logger

Class Item Extends Entity

    Global lastChestItemClass1: String
    Global lastChestItemClass2: String
    Global seenItems: StringMap<Int> = New StringMap<Int>()
    Global pickupList: List<Item> = New List<Item>()

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
        Debug.TraceNotImplemented("Item.CreateItemPools()")
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

    Function GetPickupAt: Object(xVal: Int, yVal: Int, slf: Object)
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

    Function IsUnlocked: Bool(t: Int)
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
