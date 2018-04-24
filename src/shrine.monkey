'Strict

Import monkey.list
Import bouncer
Import entity
Import item
Import logger
Import rng
Import sprite
Import textsprite

Class Shrine Extends Entity

    Global SHRINE_BLOOD: Int
    Global SHRINE_CHANCE: Int
    Global SHRINE_NO_RETURN: Int
    Global SHRINE_PACE: Int
    Global SHRINE_PAIN: Int
    Global SHRINE_PEACE: Int
    Global SHRINE_PHASING: Int
    Global SHRINE_RHYTHM: Int
    Global SHRINE_RISK: Int
    Global SHRINE_SACRIFICE: Int
    Global SHRINE_UNCERTAINTY: Int

    Global bossShrineActive: Bool
    Global darknessShrineActive: Bool
    Global noReturnShrineActive: Bool
    Global noReturnShrinePlayer: Object
    Global paceShrineActive: Bool
    Global rhythmShrineActive: Bool
    Global riskShrineActive: Bool
    Global riskShrinePlayer: Object
    Global shrineList: List<Shrine> = New List<Shrine>()
    Global spaceShrineActive: Bool
    Global usedShrinerInZone: Int
    Global usedShrines: Object
    Global warShrineActive: Bool

    Function AddPendingShrinesToUsedList: Void()
        Debug.TraceNotImplemented("Shrine.AddPendingShrinesToUsedList()")
    End Function

    Function GetAdjacentShrine: Object(x: Int, y: Int)
        Debug.TraceNotImplemented("Shrine.GetAdjacentShrine(Int, Int)")
    End Function

    Function GetHintText: Int(shrineType: Int)
        Debug.TraceNotImplemented("Shrine.GetHintText(Int)")
    End Function

    Function GetRandomShrineInt: Int(isShriner: Bool, banType1: Int, banType2: Int)
        Debug.TraceNotImplemented("Shrine.GetRandomShrineInt(Bool, Int, Int)")
    End Function

    Function GetShrineAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Shrine.GetShrineAt(Int, Int)")
    End Function

    Function IsValidShrine: Bool(shrineType: Int)
        Debug.TraceNotImplemented("Shrine.IsValidShrine(Int)")
    End Function

    Function ResetCosts: Void()
        Debug.TraceNotImplemented("Shrine.ResetCosts()")
    End Function

    Function ResetShrines: Void()
        Debug.TraceNotImplemented("Shrine.ResetShrines()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, cType: Int, rng_: RNG, saleShrine: Bool, pending: Bool)
        Debug.TraceNotImplemented("Shrine.New(Int, Int, Int, RNG, Bool, Bool)")
    End Method

    Field type: Int
    Field isForSale: Bool
    Field cost: Int
    Field digitVal: Int[]
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
        Debug.TraceNotImplemented("Shrine.Activate(Object, Int, Bool)")
    End Method

    Method AdjacentKill: Void(wasMiniboss: Bool)
        Debug.TraceNotImplemented("Shrine.AdjacentKill(Bool)")
    End Method

    Method AdjacentPain: Void(player: Object, damage: Int)
        Debug.TraceNotImplemented("Shrine.AdjacentPain(Object, Int)")
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
        Debug.TraceNotImplemented("Shrine.GiveOutChanceItem(Int, Int, Bool)")
    End Method

    Method GiveOutPainItem: Void(targetX: Int, targetY: Int)
        Debug.TraceNotImplemented("Shrine.GiveOutPainItem(Int, Int)")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Shrine.Hit(String, Int, Int, Entity, Bool, Int)")
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
        Debug.TraceNotImplemented("Shrine.SpawnChoiceOfThree(Int, Int, Int)")
    End Method

    Method TryYourLuck: Bool()
        Debug.TraceNotImplemented("Shrine.TryYourLuck()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Shrine.Update()")
    End Method

End Class

Class UncertaintyWeaponPredicate Implements IItemPredicate

    Function _EditorFix: Void() End

    Method Call: Bool(n: Object)
        Debug.TraceNotImplemented("UncertaintyWeaponPredicate.Call(Object)")
    End Method

End Class

Class UncertaintyRingPredicate Implements IItemPredicate

    Function _EditorFix: Void() End

    Method Call: Bool(n: Object)
        Debug.TraceNotImplemented("UncertaintyRingPredicate.Call(Object)")
    End Method

End Class
