Strict

Import monkey.list
Import entity
Import rng

Class Shrine Extends Entity

    Global spaceShrineActive: Bool
    Global shrineList: List<Shrine>

    Function AddPendingShrinesToUsedList: Void()
        Throw New Throwable()
    End Function

    Function GetAdjacentShrine: Object(x: Int, y: Int)
        Throw New Throwable()
    End Function

    Function GetHintText: Int(shrineType: Int)
        Throw New Throwable()
    End Function

    Function GetRandomShrineInt: Int(isShriner: Bool, banType1: Int, banType2: Int)
        Throw New Throwable()
    End Function

    Function GetShrineAt: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsValidShrine: Bool(shrineType: Int)
        Throw New Throwable()
    End Function

    Function ResetCosts: Void()
        Throw New Throwable()
    End Function

    Function ResetShrines: Void()
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, cType: Int, rng_: RNG, saleShrine: Bool, pending: Bool)
        Throw New Throwable()
    End Method

    Field cType: Int

    Method Activate: Bool(player: Object, dir: Int, fromMiniboss: Bool)
        Throw New Throwable()
    End Method

    Method AdjacentKill: Void(wasMiniboss: Bool)
        Throw New Throwable()
    End Method

    Method AdjacentPain: Void(player: Object, damage: Int)
        Throw New Throwable()
    End Method

    Method CanSteal: Bool()
        Throw New Throwable()
    End Method

    Method Die: Void()
        Throw New Throwable()
    End Method

    Method GenBossContents: Void()
        Throw New Throwable()
    End Method

    Method GenPainContents: Void()
        Throw New Throwable()
    End Method

    Method GenUncertaintyContents: Void()
        Throw New Throwable()
    End Method

    Method GetBombItem: Int()
        Throw New Throwable()
    End Method

    Method GiveOutChanceItem: Void(xVal: Int, yVal: Int, forceHere: Bool)
        Throw New Throwable()
    End Method

    Method GiveOutPainItem: Void(targetX: Int, targetY: Int)
        Throw New Throwable()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Throw New Throwable()
    End Method

    Method LoadBombImage: Void()
        Throw New Throwable()
    End Method

    Method RandomGlassWeapon: Int()
        Throw New Throwable()
    End Method

    Method Render: Void()
        Throw New Throwable()
    End Method

    Method SetCost: Void()
        Throw New Throwable()
    End Method

    Method SpawnChoiceOfThree: Void(item1: Int, item2: Int, item3: Int)
        Throw New Throwable()
    End Method

    Method TryYourLuck: Bool()
        Throw New Throwable()
    End Method

    Method Update: Void()
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        Super.NoTrim()
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
