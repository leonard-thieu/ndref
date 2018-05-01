'Strict

Import monkey.list
Import monkey.set
Import bouncer
Import entity
Import item
Import level
Import logger
Import rng
Import sprite
Import textsprite
Import weighted_picker

Class Shrine Extends Entity

    Const SHRINE_BLOOD: Int = 0
    Const SHRINE_DARKNESS: Int = 1
    Const SHRINE_GLASS: Int = 2
    Const SHRINE_PEACE: Int = 3
    Const SHRINE_RHYTHM: Int = 4
    Const SHRINE_RISK: Int = 5
    Const SHRINE_SACRIFICE: Int = 6
    Const SHRINE_SPACE: Int = 7
    Const SHRINE_WAR: Int = 8
    Const SHRINE_NO_RETURN: Int = 9
    Const SHRINE_PHASING: Int = 10
    Const SHRINE_PACE: Int = 11
    Const SHRINE_CHANCE: Int = 12
    Const SHRINE_BOSS: Int = 13
    Const SHRINE_PAIN: Int = 14
    Const SHRINE_UNCERTAINTY: Int = 15

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
    Global usedShrines: IntSet = New IntSet()
    Global warShrineActive: Bool

    Function AddPendingShrinesToUsedList: Void()
        For Local shrine := EachIn Shrine.shrineList
            Shrine.usedShrines.Insert(shrine.type)
        End For
    End Function

    Function GetAdjacentShrine: Object(x: Int, y: Int)
        Debug.TraceNotImplemented("Shrine.GetAdjacentShrine(Int, Int)")
    End Function

    Function GetHintText: Int(shrineType: Int)
        Debug.TraceNotImplemented("Shrine.GetHintText(Int)")
    End Function

    Function GetRandomShrineInt: Int(isShriner: Bool, banType1: Int, banType2: Int)
        Local weights := New WeightedPicker()

        If Not Level.isHardcoreMode
            weights.Push(12)
            weights.Push(9)
            weights.Push(13)
            weights.Push(11)
            weights.Push(0)
            weights.Push(9)
            weights.Push(13)
            weights.Push(11)
            weights.Push(9)
            weights.Push(0)
            weights.Push(0)
            weights.Push(0)
            weights.Push(14)
            weights.Push(11)
            weights.Push(11)
            weights.Push(11)
        Else
            weights.Push(10)
            weights.Push(9)
            weights.Push(11)
            weights.Push(9)
            weights.Push(9)
            weights.Push(7)
            weights.Push(8)
            weights.Push(9)
            weights.Push(6)
            weights.Push(5)
            weights.Push(5)
            weights.Push(5)
            weights.Push(8)
            weights.Push(9)
            weights.Push(9)
            weights.Push(9)
        End If

        Local shrineInt := -1

        If isShriner
            For Local i := 201 Until 0 Step -1
                If Not Shrine.IsValidShrine(shrineInt)
                    shrineInt = weights.PickRandom(True)

                    Continue
                End If

                Select shrineInt
                    Case banType1,
                         banType2,
                         Shrine.SHRINE_PAIN,
                         Shrine.SHRINE_SACRIFICE,
                         Shrine.SHRINE_CHANCE
                        Continue
                    Default
                        Return shrineInt
                End Select
            End For
        Else
            For Local i := 201 Until 0 Step -1
                If Not Shrine.IsValidShrine(shrineInt)
                    shrineInt = weights.PickRandom(True)

                    Continue
                End If

                Select shrineInt
                    Case banType1,
                         banType2
                        Continue
                    Default
                        Return shrineInt
                End Select
            End For
        End If

        Return Shrine.SHRINE_GLASS
    End Function

    Function GetShrineAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Shrine.GetShrineAt(Int, Int)")
    End Function

    Function IsValidShrine: Bool(shrineType: Int)
        If shrineType = -1 Then Return False
        If Shrine.usedShrines.Contains(shrineType) Then Return False

        Select shrineType
            Case Shrine.SHRINE_BLOOD
                Return Not Util.IsWeaponlessCharacterActive()
            Case Shrine.SHRINE_PEACE
                Return Not Util.IsWeaponlessCharacterActive()
            Case Shrine.SHRINE_UNCERTAINTY
                Return Not Util.IsWeaponlessCharacterActive() Or
                       Not Util.IsCharacterActive(Character.Tempo)
            Case Shrine.SHRINE_RHYTHM
                Return Not Util.IsCharacterActive(Character.Bard)
            Case Shrine.SHRINE_RISK
                Return Not Util.AreAriaOrCodaActive() Or
                       Not Util.IsCharacterActive(Character.Diamond)
            Case Shrine.SHRINE_PAIN
                Return Not Util.AreAriaOrCodaActive()
            Case Shrine.SHRINE_SACRIFICE
                Return Not Util.IsCharacterActive(Character.Dove)
            Case Shrine.SHRINE_NO_RETURN
                'Return Not Util.IsWeaponlessCharacterActive()
                Return False
            Case Shrine.SHRINE_PHASING
                'Return Not Util.IsCharacterActive(Character.Dove)
                Return False
            Case Shrine.SHRINE_PACE
                'Return Not Util.IsCharacterActive(Character.Bard)
                Return False
        End Select

        Return True
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
