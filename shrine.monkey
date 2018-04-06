Import monkey.list
Import entity
Import rng

Class Shrine Extends Entity

    Global spaceShrineActive: Bool
    Global shrineList: List<Shrine>

    Function AddPendingShrinesToUsedList: Void()
    End Function

    Function GetAdjacentShrine: Object(x: Int, y: Int)
    End Function

    Function GetHintText: Int(shrineType: Int)
    End Function

    Function GetRandomShrineInt: Int(isShriner: Bool, banType1: Int, banType2: Int)
    End Function

    Function GetShrineAt: Object(xVal: Int, yVal: Int)
    End Function

    Function IsValidShrine: Bool(shrineType: Int)
    End Function

    Function ResetCosts: Void()
    End Function

    Function ResetShrines: Void()
    End Function

    Function _EditorFix() End

    Method New(xVal: Int, yVal: Int, cType: Int, rng_: RNG, saleShrine: Bool, pending: Bool)
    End Method

    Field cType: Int

    Method Activate: Bool(player: Object, dir: Int, fromMiniboss: Bool)
    End Method

    Method AdjacentKill: Void(wasMiniboss: Bool)
    End Method

    Method AdjacentPain: Void(player: Object, damage: Int)
    End Method

    Method CanSteal: Bool()
    End Method

    Method Die: Void()
    End Method

    Method GenBossContents: Void()
    End Method

    Method GenPainContents: Void()
    End Method

    Method GenUncertaintyContents: Void()
    End Method

    Method GetBombItem: Int()
    End Method

    Method GiveOutChanceItem: Void(xVal: Int, yVal: Int, forceHere: Bool)
    End Method

    Method GiveOutPainItem: Void(targetX: Int, targetY: Int)
    End Method

    Method Hit: Bool(damageSource: Int, damage: Int, dir: Int, hitter: Object, hitAtLastTile: Bool, hitType: Int)
    End Method

    Method LoadBombImage: Void()
    End Method

    Method RandomGlassWeapon: Int()
    End Method

    Method Render: Void()
    End Method

    Method SetCost: Void()
    End Method

    Method SpawnChoiceOfThree: Void(item1: Int, item2: Int, item3: Int)
    End Method

    Method TryYourLuck: Bool()
    End Method

    Method Update: Void()
    End Method

    Method NoTrim: Void()
        AddPendingShrinesToUsedList()
        GetAdjacentShrine(0, 0)
        GetHintText(0)
        GetRandomShrineInt(False, 0, 0)
        GetShrineAt(0, 0)
        IsValidShrine(0)
        ResetCosts()
        ResetShrines()
        Activate(Null, 0, False)
        AdjacentKill(False)
        AdjacentPain(Null, 0)
        CanSteal()
        Die()
        GenBossContents()
        GenPainContents()
        GenUncertaintyContents()
        GetBombItem()
        GiveOutChanceItem(0, 0, False)
        GiveOutPainItem(0, 0)
        Hit(0, 0, 0, Null, False, 0)
        LoadBombImage()
        RandomGlassWeapon()
        Render()
        SetCost()
        SpawnChoiceOfThree(0, 0, 0)
        TryYourLuck()
        Update()
    End Method

End Class
