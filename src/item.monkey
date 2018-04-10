Strict

Import monkey.map
Import entity

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
        Throw New Throwable()
    End Function

    Function ClearAllSingleChoiceItems: Void(takenItem: Object)
        Throw New Throwable()
    End Function

    Function ConsumeCoinsRemainingOnLevel: Int()
        Throw New Throwable()
    End Function

    Function CreateAmountOfCoins: Void(xVal: Int, yVal: Int, amt: Int)
        Throw New Throwable()
    End Function

    Function CreateItemPools: Void()
        Throw New Throwable()
    End Function

    Function DropItem: Object(xVal: Int, yVal: Int, t: Int)
        Throw New Throwable()
    End Function

    Function FilterDisabledItems: Void(list: Object)
        Throw New Throwable()
    End Function

    Function FindAllGoldPiles: Object()
        Throw New Throwable()
    End Function

    Function GetAllItemsInClass: Object(itemClass: Int)
        Throw New Throwable()
    End Function

    Function GetAppropriateCoinItemForQuantity: Int(quantity: Int)
        Throw New Throwable()
    End Function

    Function GetCost: Int(i: Int)
        Throw New Throwable()
    End Function

    Function GetFlyawayText: Int(i: Int)
        Throw New Throwable()
    End Function

    Function GetHeavyGlassFrame: Int(quantity: Int)
        Throw New Throwable()
    End Function

    Function GetIntAttribute: Int(i: Int, attr: Int, dflt: Int)
        Throw New Throwable()
    End Function

    Function GetItemXML: Object(i: Int)
        Throw New Throwable()
    End Function

    Function GetPickupAt: Object(xVal: Int, yVal: Int, slf: Object)
        Throw New Throwable()
    End Function

    Function GetPickupsAt: Object(xVal: Int, yVal: Int, slf: Object)
        Throw New Throwable()
    End Function

    Function GetRandomItemInClass: Int(itemClass: Int, requestedLevel: Int, randomType: Int, chestColor: Int, ignorePendingMetaGameItems: Bool, itemSlot: Int, nonDeterministic: Bool)
        Throw New Throwable()
    End Function

    Function GetRandomItemInClassByPredicate: Int(predicate: Object, requestedLevel: Int, randomType: Int, nonDeterministic: Bool)
        Throw New Throwable()
    End Function

    Function GetSet: Int(n: Object)
        Throw New Throwable()
    End Function

    Function GetSlot: Int(n: Object)
        Throw New Throwable()
    End Function

    Function GetSlot2: Int(i: Int)
        Throw New Throwable()
    End Function

    Function GetStringAttribute: Int(i: Int, attr: Int, dflt: Int)
        Throw New Throwable()
    End Function

    Function GetValue: Int(t: Int)
        Throw New Throwable()
    End Function

    Function GetWeaponBaseType: Int(t: Int)
        Throw New Throwable()
    End Function

    Function GetWeaponShapeClass: Int(t: Int)
        Throw New Throwable()
    End Function

    Function HasSeenItemXTimes: Bool(itemName: Int, x: Int)
        Throw New Throwable()
    End Function

    Function InitAll: Void()
        Throw New Throwable()
    End Function

    Function IsCourageItem: Bool(n: Object)
        Throw New Throwable()
    End Function

    Function IsDamageBonusItem: Bool(n: Object)
        Throw New Throwable()
    End Function

    Function IsDamageReductionItem: Bool(n: Object)
        Throw New Throwable()
    End Function

    Function IsDisabled: Bool(item: Int)
        Throw New Throwable()
    End Function

    Function IsDiscountItem: Bool(n: Object)
        Throw New Throwable()
    End Function

    Function IsGoldGeneratingItem: Bool(n: Object)
        Throw New Throwable()
    End Function

    Function IsHealthBonusItem: Bool(n: Object)
        Throw New Throwable()
    End Function

    Function IsImmediatelyConsumed: Bool(t: Int)
        Throw New Throwable()
    End Function

    Function IsItemOfClass: Bool(n: Object, itemClass: Int)
        Throw New Throwable()
    End Function

    Function IsItemOfType: Bool(i: Int, query: Int)
        Throw New Throwable()
    End Function

    Function IsPainItem: Bool(n: Object)
        Throw New Throwable()
    End Function

    Function IsUnlocked: Bool(t: Int)
        Throw New Throwable()
    End Function

    Function IsValidItemForCurrentChars: Bool(n: Object)
        Throw New Throwable()
    End Function

    Function IsValidItemForCurrentChars2: Bool(name: Int)
        Throw New Throwable()
    End Function

    Function IsValidRandomItem: Bool(t: Int)
        Throw New Throwable()
    End Function

    Function MoveAll: Void()
        Throw New Throwable()
    End Function

    Function RandomHardModeHelperItem: Int()
        Throw New Throwable()
    End Function

    Function RenderItemAt: Void(iType: Int, xVal: Int, yVal: Int, zVal: Int, inWorld: Bool, scale: Float, alpha: Float, frame: Int)
        Throw New Throwable()
    End Function

    Function RenderItemImageAt: Void(img: Object, xVal: Int, yVal: Int, zVal: Int, inWorld: Bool, scale: Float, alpha: Float, frame: Int)
        Throw New Throwable()
    End Function

    Function TransmuteAllItems: Void()
        Throw New Throwable()
    End Function

    Function TransmuteNearbyItems: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
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
        Throw New Throwable()
    End Method

    Method Die: Void()
        Throw New Throwable()
    End Method

    Method GetFlyawayText: Int()
        Throw New Throwable()
    End Method

    Method GetIntAttribute: Int(attr: Int, dflt: Int)
        Throw New Throwable()
    End Method

    Method GetSlot: Int()
        Throw New Throwable()
    End Method

    Method GetStringAttribute: Int(attr: Int, dflt: Int)
        Throw New Throwable()
    End Method

    Method GetValue: Int()
        Throw New Throwable()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Return False
    End Method

    Method IsItemOfClass: Bool(itemClass: Int)
        Throw New Throwable()
    End Method

    Method IsItemOfType: Bool(query: Int)
        Throw New Throwable()
    End Method

    Method IsVisible: Bool()
        Throw New Throwable()
    End Method

    Method Move: Void()
        Throw New Throwable()
    End Method

    Method Pickup: Int(player: Object)
        Throw New Throwable()
    End Method

    Method Render: Void()
        Throw New Throwable()
    End Method

    Method SetMystery: Void()
        Throw New Throwable()
    End Method

    Method Transmute: Void()
        Throw New Throwable()
    End Method

    Method Update: Void()
        Throw New Throwable()
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
