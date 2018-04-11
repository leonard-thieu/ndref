'Strict

Import monkey.list
Import entity
Import logger
Import rng
Import sprite
Import textsprite

Class Shrine Extends Entity

    Global spaceShrineActive: Bool
    Global shrineList: List<Shrine> = New List<Shrine>()

    Function AddPendingShrinesToUsedList: Void()
        Debug.TraceNotImplemented("Shrine.AddPendingShrinesToUsedList()")
    End Function

    Function GetAdjacentShrine: Object(x: Int, y: Int)
        Debug.TraceNotImplemented("Shrine.GetAdjacentShrine()")
    End Function

    Function GetHintText: Int(shrineType: Int)
        Debug.TraceNotImplemented("Shrine.GetHintText()")
    End Function

    Function GetRandomShrineInt: Int(isShriner: Bool, banType1: Int, banType2: Int)
        Debug.TraceNotImplemented("Shrine.GetRandomShrineInt()")
    End Function

    Function GetShrineAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Shrine.GetShrineAt()")
    End Function

    Function IsValidShrine: Bool(shrineType: Int)
        Debug.TraceNotImplemented("Shrine.IsValidShrine()")
    End Function

    Function ResetCosts: Void()
        Debug.TraceNotImplemented("Shrine.ResetCosts()")
    End Function

    Function ResetShrines: Void()
        Debug.TraceNotImplemented("Shrine.ResetShrines()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, cType: Int, rng_: RNG, saleShrine: Bool, pending: Bool)
        Debug.TraceNotImplemented("Shrine.New(xVal()")
    End Method

    Field type: Int
    Field isForSale: Bool
    Field cost: Int
    Field digitVal: int[]
    Field digits: Sprite[]
    Field active: Bool
    Field numKills: Int
    Field painItemCount: Int
    Field hintText: TextSprite
    Field contents1: String
    Field contents2: String
    Field contents3: String
    Field contents4: String
    Field contents5: String
    Field contents6: String
    Field rng: RNG
    Field chanceItemNum: Int
    Field image2: Sprite
    Field bounce2: Bouncer

    Method Activate: Bool(player: Object, dir: Int, fromMiniboss: Bool)
        Debug.TraceNotImplemented("Shrine.Activate()")
    End Method

    Method AdjacentKill: Void(wasMiniboss: Bool)
        Debug.TraceNotImplemented("Shrine.AdjacentKill()")
    End Method

    Method AdjacentPain: Void(player: Object, damage: Int)
        Debug.TraceNotImplemented("Shrine.AdjacentPain()")
    End Method

    Method CanSteal: Bool()
        Debug.TraceNotImplemented("Shrine.CanSteal()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Shrine.Die()")
    End Method

    Method GenBossContents: Void()
        Debug.TraceNotImplemented("Shrine.GenBossContents()")
    End Method

    Method GenPainContents: Void()
        Debug.TraceNotImplemented("Shrine.GenPainContents()")
    End Method

    Method GenUncertaintyContents: Void()
        Debug.TraceNotImplemented("Shrine.GenUncertaintyContents()")
    End Method

    Method GetBombItem: Int()
        Debug.TraceNotImplemented("Shrine.GetBombItem()")
    End Method

    Method GiveOutChanceItem: Void(xVal: Int, yVal: Int, forceHere: Bool)
        Debug.TraceNotImplemented("Shrine.GiveOutChanceItem()")
    End Method

    Method GiveOutPainItem: Void(targetX: Int, targetY: Int)
        Debug.TraceNotImplemented("Shrine.GiveOutPainItem()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Shrine.Hit()")
    End Method

    Method LoadBombImage: Void()
        Debug.TraceNotImplemented("Shrine.LoadBombImage()")
    End Method

    Method RandomGlassWeapon: Int()
        Debug.TraceNotImplemented("Shrine.RandomGlassWeapon()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Shrine.Render()")
    End Method

    Method SetCost: Void()
        Debug.TraceNotImplemented("Shrine.SetCost()")
    End Method

    Method SpawnChoiceOfThree: Void(item1: Int, item2: Int, item3: Int)
        Debug.TraceNotImplemented("Shrine.SpawnChoiceOfThree()")
    End Method

    Method TryYourLuck: Bool()
        Debug.TraceNotImplemented("Shrine.TryYourLuck()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Shrine.Update()")
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
