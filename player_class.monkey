Strict

Import monkey.list
Import monkey.map
Import monkey.set
Import bouncer
Import familiar_fixed
Import item
Import mobileentity
Import player_health
Import point
Import sprite
Import textsprite

Class Player Extends MobileEntity

    Global AltHeadHeights: Int[] = []
    Global AltHeadWidths: Int[] = []
    Global coinXOR: Int
    Global cursedHeart: Sprite
    Global cursedHeartEmpty: Sprite
    Global cursedHeartHalf: Sprite
    Global debugHudForceFixedSpellSlots: Bool
    Global debugHudForceNoAlignSpells: Bool
    Global debugHudForceShowDiamonds: Bool
    Global goldenLuteTowards: Int
    Global heart: Sprite
    Global heartEmpty: Sprite
    Global heartHalf: Sprite
    Global heartsLoaded: Int
    Global hudCoins: Sprite
    Global hudDiamonds: Sprite
    Global lobbySaleItemMinCost: Int = 999999
    Global numCoins: Int
    Global numDiamonds: Int
    Global playerTempCount: Int
    Global sessionMaxCoins: Int

    Function ActuallyPlayVO: Void(voSound: Int, player: Object)
        Throw New Throwable()
    End Function

    Function AddCoins: Void(tmpNum: Int)
        Throw New Throwable()
    End Function

    Function AllPlayersPerished: Bool()
        Throw New Throwable()
    End Function

    Function AnyPlayerInSpecialRoom: Bool()
        Throw New Throwable()
    End Function

    Function AnyPlayerPeace: Bool()
        Throw New Throwable()
    End Function

    Function AnyPlayerTemporaryMapSight: Bool()
        Throw New Throwable()
    End Function

    Function CheckAllModeCompletion: Void()
        Throw New Throwable()
    End Function

    Function ChooseNewPlayer1: Void()
        Throw New Throwable()
    End Function

    Function DoesAnyPlayerHaveItemOfType: Bool(it: Int, overrideBatForm: Bool)
        Throw New Throwable()
    End Function

    Function DoesPlayer1HaveItemOfType: Bool(i: Int)
        Throw New Throwable()
    End Function

    Function GetCharacterName: Int(charNum: Int, tagType: Int)
        Throw New Throwable()
    End Function

    Function GetGreedMultiplier: Int()
        Throw New Throwable()
    End Function

    Function GetSlotFromNum: Int(num: Int)
        Throw New Throwable()
    End Function

    Function GetSlotNum: Int(sl: Int)
        Throw New Throwable()
    End Function

    Function GetTransplantDisplayTime: Int()
        Throw New Throwable()
    End Function

    Function IsBloodDamage: Bool(damageSource: Int)
        Throw New Throwable()
    End Function

    Function IsIntentionalDamage: Bool(damageSource: Int)
        Throw New Throwable()
    End Function

    Function IsInternalDamage: Bool(damageSource: Int)
        Throw New Throwable()
    End Function

    Function IsLastLevel: Bool()
        Throw New Throwable()
    End Function

    Function IsSolo: Bool()
        Throw New Throwable()
    End Function

    Function IsUnpreventableDamage: Bool(damageSource: Int)
        Throw New Throwable()
    End Function

    Function MakeBodyImage: Object(characterID: Int, idSuffix: Int, altSkin: Int)
        Throw New Throwable()
    End Function

    Function MakeHeadImage: Object(characterID: Int, idSuffix: Int, altSkin: Int)
        Throw New Throwable()
    End Function

    Function NumEnabledCharacters: Int()
        Throw New Throwable()
    End Function

    Function OffsetCoins: Void(tmpNum: Int)
        Throw New Throwable()
    End Function

    Function PlayersHaveMovedThisBeat: Bool()
        Throw New Throwable()
    End Function

    Function PlayVOPlayer1: Void(voSound: Int)
        Throw New Throwable()
    End Function

    Function SetCoins: Void(tmpNum: Int, allowAchievement: Bool)
        Throw New Throwable()
    End Function

    Function UpdateAll: Void()
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

    Method New(id: Int, characterID_: Int)
        Super.New()

        Player.coinXOR = Player.numCoins ~ $1D69

        Local playerTempCount := Player.playerTempCount
        Self.playerTempCount_ = playerTempCount
        Player.playerTempCount += 1

        If Not Self.field_228
            Self.field_228 = True
            
            If Self.field_22C <= 0
                
            End If
        End If
    End Method

    Field field_110: Bool
    Field field_114: List<FamiliarFixed>
    Field field_118: Int
    Field characterID: Int
    Field field_120: Int
    Field field_124: Bool
    Field field_125: Bool
    Field field_126: Bool
    Field field_127: Bool
    Field field_128: Bool
    Field field_129: Bool
    Field field_12C: Int
    Field field_130: Int
    Field field_134: StringMap<String>
    Field field_138: StringMap<bool>
    Field field_13C: StringSet
    Field field_140: List<String>
    Field field_144: StringMap<Int>
    Field field_148: Int
    Field field_14C: Int
    Field item: String
    Field item2: String
    Field field_158: Bool
    Field field_159: Bool
    Field field_15A: Bool
    Field field_15B: Bool
    Field health: PlayerHealth
    Field field_160: Int
    Field field_164: Int
    Field field_168: Bool
    Field field_16C: Int
    Field field_170: Bool
    Field field_174: Int
    Field field_178: Int
    Field field_17C: Int
    Field field_180: Bool
    Field field_184: Int
    Field field_188: Int
    Field field_18C: Int
    Field field_190: String
    Field field_194: Int
    Field field_198: Bool
    Field field_19C: Int
    Field field_1A0: Int
    Field field_1A4: Int
    Field field_1A8: Int
    Field field_1AC: Int
    Field field_1B0: Int
    Field field_1B4: Bool
    Field field_1B8: Int
    Field field_1BC: Int
    Field field_1C0: Int
    Field field_1C4: Sprite
    Field field_1C8: Sprite
    Field field_1CC: Int
    Field field_1D0: Int
    Field field_1D4: Int
    Field field_1D8: Int
    Field field_1DC: Int
    Field field_1E0: Int
    Field item3: String
    Field field_1E8: Int
    Field field_1EC: Int
    Field field_1F0: Bool
    Field field_1F4: Int
    Field field_1F8: Bool
    Field field_1F9: Bool
    Field field_1FC: Int
    Field field_200: Int
    Field field_204: Bool
    Field field_208: Int
    Field field_20C: Int
    Field field_210: Bool
    Field field_211: Bool
    Field field_214: Int
    Field field_218: bool[]
    Field field_21C: StringMap<Bool>
    Field field_220: List<String>
    Field playerTempCount_: Int
    Field field_228: bool
    Field field_22C: Int
    Field field_230: Sprite[]
    Field field_234: Int
    Field field_238: Point2[]
    Field field_23C: StringMap<Sprite>
    Field field_240: TextSprite
    Field field_244: Sprite
    Field field_248: Sprite
    Field field_24C: Sprite
    Field field_250: Sprite
    Field field_254: Sprite
    Field field_258: Sprite
    Field field_25C: Sprite
    Field field_260: Sprite
    Field field_264: Sprite
    Field field_268: Sprite
    Field field_26C: Sprite
    Field field_270: Sprite
    Field field_274: Sprite
    Field field_278: Sprite
    Field field_27C: Sprite
    Field field_280: Sprite
    Field field_284: Sprite
    Field field_288: Bouncer
    Field field_28C: Int
    Field field_290: Int
    Field field_294: Int
    Field field_298: Int
    Field field_29C: Int
    Field field_2A0: Int
    Field field_2A4: Int
    Field field_2A8: Int
    Field field_2AC: Int
    Field field_2B0: Int
    Field field_2B4: Int
    Field field_2B8: Int
    Field field_2BC: Int
    Field field_2C0: Int
    Field field_2C4: Bool
    Field field_2C8: Int
    Field field_2CC: Int
    Field field_2D0: Bool
    Field field_2D4: Int
    Field field_2D8: Bool
    Field field_2DC: Int
    Field field_2E0: Int
    Field field_2E4: TextSprite
    Field field_2E8: StringMap<TextSprite>
    Field field_2EC: IntMap<TextSprite>
    Field field_2F0: IntMap<TextSprite>
    Field field_2F4: IntMap<Sprite>
    Field field_2F8: TextSprite
    Field field_2FC: TextSprite
    Field field_300: TextSprite
    Field field_304: TextSprite
    Field field_308: TextSprite
    Field field_30C: Int
    Field field_310: Int
    Field field_314: TextSprite
    Field field_318: TextSprite
    Field field_31C: TextSprite
    Field field_320: TextSprite
    Field field_324: TextSprite
    Field field_328: TextSprite
    Field field_32C: Float
    Field field_330: Int

    Method AddFamiliarAt: Void(offsetX: Int, offsetY: Int, item: Int)
        Throw New Throwable()
    End Method

    Method AddGeneralMetrics: Void(sendIt: Bool)
        Throw New Throwable()
    End Method

    Method AddItemOfType: Void(item: String, itemObj: Item, ignoreFlyTo: Bool, isInitialEquip: Bool)
        Throw New Throwable()
    End Method

    Method AddItemOfType_PreProcess: Bool(i: String, itemObj: Item)
        Throw New Throwable()
    End Method

    Method AfterEnemyMovement: Void()
        Throw New Throwable()
    End Method

    Method AfterHitHook: Void(nme: Object, hitX: Int, hitY: Int, dir: Int)
        Throw New Throwable()
    End Method

    Method AttackDirection: Bool(dir: Int, isThrow: Bool)
        Throw New Throwable()
    End Method

    Method AttemptOffbeatMove: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Method BreakGlassShovel: Void()
        Throw New Throwable()
    End Method

    Method BreakGlassStuff: Void()
        Throw New Throwable()
    End Method

    Method BreakSpikedEars: Void()
        Throw New Throwable()
    End Method

    Method CalcMinVisibility: Int()
        Throw New Throwable()
    End Method

    Method CancelTween: Void()
        Throw New Throwable()
    End Method

    Method CheckConductorWire: Void()
        Throw New Throwable()
    End Method

    Method CheckFloating: Void()
        Throw New Throwable()
    End Method

    Method CheckVowOfPoverty: Void()
        Throw New Throwable()
    End Method

    Method ClearAllFamiliars: Void(includeLamb: Bool)
        Throw New Throwable()
    End Method

    Method ClearFamiliarAt: Void(offsetX: Int, offsetY: Int)
        Throw New Throwable()
    End Method

    Method CommitZap: Void()
        Throw New Throwable()
    End Method

    Method ConsumeItemSlot: Bool(sl: Int)
        Throw New Throwable()
    End Method

    Method ConsumeOne: Bool(item: Int)
        Throw New Throwable()
    End Method

    Method Die: Void()
        Self.ClearAllFamiliars(True)

        If Not Self.dead Then Super.Die()
    End Method

    Method DoBigDig: Bool(x0: Int, y0: Int, shovelDamage: Int, dir: Int, allowNoShovel: Bool)
        Throw New Throwable()
    End Method

    Method DoComboLeftDown: Bool()
        Throw New Throwable()
    End Method

    Method DoComboLeftRight: Bool()
        Throw New Throwable()
    End Method

    Method DoComboLeftUp: Bool()
        Throw New Throwable()
    End Method

    Method DoComboRightDown: Bool()
        Throw New Throwable()
    End Method

    Method DoComboRightUp: Bool()
        Throw New Throwable()
    End Method

    Method DoComboUpDown: Bool()
        Throw New Throwable()
    End Method

    Method DoCrownTeleport: Void()
        Throw New Throwable()
    End Method

    Method DoEnchantWeapon: Void()
        Throw New Throwable()
    End Method

    Method DoHitEffects: Void(dir: Int, hitter: Object, tempDam: Int)
        Throw New Throwable()
    End Method

    Method DoNeed: Void()
        Throw New Throwable()
    End Method

    Method DropBomb: Object()
        Throw New Throwable()
    End Method

    Method DropItem: Object(i: Int, xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Method EmptyAllSlots: Void(includeLamb: Bool)
        Throw New Throwable()
    End Method

    Method EmptySlot: Void(sl: Int)
        Throw New Throwable()
    End Method

    Method EnterBatForm: Void()
        Throw New Throwable()
    End Method

    Method ExitBatForm: Void()
        Throw New Throwable()
    End Method

    Method Fall: Void(keepMultiplier: Bool)
        Throw New Throwable()
    End Method

    Method FeetIgnoreCoals: Bool()
        Throw New Throwable()
    End Method

    Method FeetIgnoreIce: Bool()
        Throw New Throwable()
    End Method

    Method FeetIgnoreOoze: Bool()
        Throw New Throwable()
    End Method

    Method FeetIgnoreWaterAndTar: Bool()
        Throw New Throwable()
    End Method

    Method FrostItemCount: Int()
        Throw New Throwable()
    End Method

    Method GetArmorAmount: Int()
        Throw New Throwable()
    End Method

    Method GetBonusDamage: Int(baseDamage: Int)
        Throw New Throwable()
    End Method

    Method GetDamage: Int()
        Throw New Throwable()
    End Method

    Method GetElectricStrength: Int()
        Throw New Throwable()
    End Method

    Method GetHUDQuantityText: Object(slot: Int)
        Throw New Throwable()
    End Method

    Method GetItemInSlot: Int(sl: Int, overrideBatForm: Bool)
        Throw New Throwable()
    End Method

    Method GetItemQuantity: Int(item: Int)
        Throw New Throwable()
    End Method

    Method GetKillsUntilHealingString: Int()
        Throw New Throwable()
    End Method

    Method GetLightSourceMax: Float()
        Throw New Throwable()
    End Method

    Method GetLightSourceMin: Float()
        Throw New Throwable()
    End Method

    Method GetMinVisibility: Int()
        Throw New Throwable()
    End Method

    Method GetMoveLastBeat: Int()
        Throw New Throwable()
    End Method

    Method GetNewWeapon: Void(w: Int)
        Throw New Throwable()
    End Method

    Method GetPositionLastBeat: Object()
        Throw New Throwable()
    End Method

    Method GetShovelDamage: Int(fromMinersCap: Bool)
        Throw New Throwable()
    End Method

    Method GetShovelDamageHelper: Int()
        Throw New Throwable()
    End Method

    Method GetTorchLevel: Int()
        Throw New Throwable()
    End Method

    Method GetWeapon: Object(overrideBatForm: Bool)
        Throw New Throwable()
    End Method

    Method GiveInitialEquipment: Void(resetHealth: Bool)
        Throw New Throwable()
    End Method

    Method GotBlood: Void(amount: Int)
        Throw New Throwable()
    End Method

    Method GotKill: Void()
        Throw New Throwable()
    End Method

    Method GrantIBeats: Void(num: Int)
        Throw New Throwable()
    End Method

    Method HandleIceAndCoals: Void()
        Throw New Throwable()
    End Method

    Method HasCouponLike: Bool()
        Throw New Throwable()
    End Method

    Method HasItemOfType: Bool(i: String, overrideBatForm: Bool)
        Throw New Throwable()
    End Method

    Method HasShovel: Bool()
        Throw New Throwable()
    End Method

    Method HaveSecondActionSlot: Bool()
        Throw New Throwable()
    End Method

    Method Heal: Void(amt: Int, fromFood: Bool, playVO: Bool, fromMagicFood: Bool)
        Throw New Throwable()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Throw New Throwable()
    End Method

    Method ImmediatelyMoveTo: Void(xVal: Int, yVal: Int, fromKeyboard: Bool, fromClampedEnemy: Bool, fromBounceTrap: Bool, fromCourage: Bool, overrideStairs: Bool)
        Throw New Throwable()
    End Method

    Method IsAnythingInSlot: Bool(sl: Int)
        Throw New Throwable()
    End Method

    Method IsBomblessCharacter: Bool()
        Throw New Throwable()
    End Method

    Method IsHeavy: Bool()
        Throw New Throwable()
    End Method

    Method IsLordCrownActive: Bool()
        Throw New Throwable()
    End Method

    Method IsLordCrownActive_Flicker: Bool()
        Throw New Throwable()
    End Method

    Method IsNecroDancer1Alive: Bool()
        Throw New Throwable()
    End Method

    Method IsPhasing: Bool()
        Throw New Throwable()
    End Method

    Method IsShieldActive: Bool()
        Throw New Throwable()
    End Method

    Method IsShieldActive_Flicker: Bool()
        Throw New Throwable()
    End Method

    Method IsShrunk: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Method IsSlotCursed: Bool(sl: Int)
        Throw New Throwable()
    End Method

    Method IsVisible: Bool()
        Throw New Throwable()
    End Method

    Method IsWeaponlessCharacter: Bool()
        Throw New Throwable()
    End Method

    Method KnockSelfBack: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Method LambDeath: Void()
        Throw New Throwable()
    End Method

    Method LoadImages: Void()
        Throw New Throwable()
    End Method

    Method MaybeOpenZap: Void(playerX: Int, playerY: Int, electricStrength: Int)
        Throw New Throwable()
    End Method

    Method MomentumDir: Int()
        Throw New Throwable()
    End Method

    Method MoveFamiliars: Void(deltaX: Int, deltaY: Int)
        Throw New Throwable()
    End Method

    Method MoveSoulFamiliars: Void(moveDir: Int)
        Throw New Throwable()
    End Method

    Method MoveTo: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Method PainFlyaway: Void()
        Throw New Throwable()
    End Method

    Method PerformTween: Void(xVal: Int, yVal: Int, oldX: Int, oldY: Int, tweenType: Int, shadowTweenType: Int, bufferTween: Bool)
        Throw New Throwable()
    End Method

    Method Perished: Bool()
        Throw New Throwable()
    End Method

    Method PermitMoveFail: Bool()
        Throw New Throwable()
    End Method

    Method PlayVO: Void(voSound: Int)
        Throw New Throwable()
    End Method

    Method ProcessDropMystery: Void(item: Object, slot: Int)
        Throw New Throwable()
    End Method

    Method ProcessMoveQueue: Void()
        Throw New Throwable()
    End Method

    Method ProcessSlotOffsets: Object(tmpSlotNum: Int, tmpX: Int, tmpY: Int)
        Throw New Throwable()
    End Method

    Method ProcessSlotOffsets2: Object(tmpSlot: Int, tmpX: Int, tmpY: Int)
        Throw New Throwable()
    End Method

    Method ProcessTheResultsOfEquippingItem: Void(item: Int)
        Throw New Throwable()
    End Method

    Method ProcessTheResultsOfLosingItem: Void(i: Int)
        Throw New Throwable()
    End Method

    Method PutItemInSlot: Void(sl: Int, i: Int, ignoreFlyTo: Bool)
        Throw New Throwable()
    End Method

    Method Render: Void()
        Throw New Throwable()
    End Method

    Method RenderHUD: Void(position: Int, small: Bool)
        Throw New Throwable()
    End Method

    Method RenderHUDSlotHotkey: Void(inputMove: Int, slotX: Int, slotY: Int, slotSize: Int, scale: Float, overrideBatForm: Bool)
        Throw New Throwable()
    End Method

    Method RenderHUDSlotQuantity: Void(textSprite: Object, num: Int, slotX: Int, slotY: Int, slotSize: Int, scale: Float, alpha: Float)
        Throw New Throwable()
    End Method

    Method RenderHUDSlotQuantity2: Void(textSprite: Object, item: Int, slotX: Int, slotY: Int, slotSize: Int, scale: Float, alpha: Float)
        Throw New Throwable()
    End Method

    Method ResetStateAfterLevel: Void()
        Throw New Throwable()
    End Method

    Method ScatterItems: Void()
        Throw New Throwable()
    End Method

    Method SetCharacter: Void(charNum: Int)
        Throw New Throwable()
    End Method

    Method SetDugRecently: Void()
        Throw New Throwable()
    End Method

    Method SetSlotCursed: Void(sl: Int, b: Bool)
        Throw New Throwable()
    End Method

    Method SetSlotMystery: Void(sl: Int, b: Bool)
        Throw New Throwable()
    End Method

    Method SetTotallyBlank: Void()
        Throw New Throwable()
    End Method

    Method StopFalling: Void()
        Throw New Throwable()
    End Method

    Method SubtractItemOfType: Bool(i: Int)
        Throw New Throwable()
    End Method

    Method SubtractKey: Bool()
        Throw New Throwable()
    End Method

    Method SwapWeapons: Bool()
        Throw New Throwable()
    End Method

    Method TestCourage: Bool(beat: Int)
        Throw New Throwable()
    End Method

    Method ToggleBatForm: Void()
        Throw New Throwable()
    End Method

    Method TurnAllItemsToGlass: Void()
        Throw New Throwable()
    End Method

    Method TurnAllItemsToObsidian: Void()
        Throw New Throwable()
    End Method

    Method TurnSlotInto: Void(slot: Int, newItem: Int)
        Throw New Throwable()
    End Method

    Method Update: Void()
        Throw New Throwable()
    End Method

    Method UpdateBonusHeart: Void()
        Throw New Throwable()
    End Method

    Method UseBomb: Bool()
        Throw New Throwable()
    End Method

    Method VocalizeAttack: Void()
        Throw New Throwable()
    End Method

    Method WarpFamiliars: Void()
        Throw New Throwable()
    End Method

    Method WarpTo: Void(newX: Int, newY: Int)
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        Super.NoTrim()
        ActuallyPlayVO(0, Null)
        AddCoins(0)
        AllPlayersPerished()
        AnyPlayerInSpecialRoom()
        AnyPlayerPeace()
        AnyPlayerTemporaryMapSight()
        CheckAllModeCompletion()
        ChooseNewPlayer1()
        DoesAnyPlayerHaveItemOfType(0, False)
        DoesPlayer1HaveItemOfType(0)
        GetCharacterName(0, 0)
        GetGreedMultiplier()
        GetSlotFromNum(0)
        GetSlotNum(0)
        GetTransplantDisplayTime()
        IsBloodDamage(0)
        IsIntentionalDamage(0)
        IsInternalDamage(0)
        IsLastLevel()
        IsSolo()
        IsUnpreventableDamage(0)
        MakeBodyImage(0, 0, 0)
        MakeHeadImage(0, 0, 0)
        NumEnabledCharacters()
        OffsetCoins(0)
        PlayersHaveMovedThisBeat()
        PlayVOPlayer1(0)
        SetCoins(0, False)
        UpdateAll()
        AddFamiliarAt(0, 0, 0)
        AddGeneralMetrics(False)
        AddItemOfType(0, Null, False, False)
        AddItemOfType_PreProcess(0, Null)
        AfterEnemyMovement()
        AfterHitHook(Null, 0, 0, 0)
        AttackDirection(0, False)
        AttemptOffbeatMove(0, 0)
        BreakGlassShovel()
        BreakGlassStuff()
        BreakSpikedEars()
        CalcMinVisibility()
        CancelTween()
        CheckConductorWire()
        CheckFloating()
        CheckVowOfPoverty()
        ClearAllFamiliars(False)
        ClearFamiliarAt(0, 0)
        CommitZap()
        ConsumeItemSlot(0)
        ConsumeOne(0)
        Die()
        DoBigDig(0, 0, 0, 0, False)
        DoComboLeftDown()
        DoComboLeftRight()
        DoComboLeftUp()
        DoComboRightDown()
        DoComboRightUp()
        DoComboUpDown()
        DoCrownTeleport()
        DoEnchantWeapon()
        DoHitEffects(0, Null, 0)
        DoNeed()
        DropBomb()
        DropItem(0, 0, 0)
        EmptyAllSlots(False)
        EmptySlot(0)
        EnterBatForm()
        ExitBatForm()
        Fall(False)
        FeetIgnoreCoals()
        FeetIgnoreIce()
        FeetIgnoreOoze()
        FeetIgnoreWaterAndTar()
        FrostItemCount()
        GetArmorAmount()
        GetBonusDamage(0)
        GetDamage()
        GetElectricStrength()
        GetHUDQuantityText(0)
        GetItemInSlot(0, False)
        GetItemQuantity(0)
        GetKillsUntilHealingString()
        GetLightSourceMax()
        GetLightSourceMin()
        GetMinVisibility()
        GetMoveLastBeat()
        GetNewWeapon(0)
        GetPositionLastBeat()
        GetShovelDamage(False)
        GetShovelDamageHelper()
        GetTorchLevel()
        GetWeapon(False)
        GiveInitialEquipment(False)
        GotBlood(0)
        GotKill()
        GrantIBeats(0)
        HandleIceAndCoals()
        HasCouponLike()
        HasItemOfType(0, False)
        HasShovel()
        HaveSecondActionSlot()
        Heal(0, False, False, False)
        Hit(0, 0, 0, Null, False, 0)
        ImmediatelyMoveTo(0, 0, False, False, False, False, False)
        IsAnythingInSlot(0)
        IsBomblessCharacter()
        IsHeavy()
        IsLordCrownActive()
        IsLordCrownActive_Flicker()
        IsNecroDancer1Alive()
        IsPhasing()
        IsShieldActive()
        IsShieldActive_Flicker()
        IsShrunk(0, 0)
        IsSlotCursed(0)
        IsVisible()
        IsWeaponlessCharacter()
        KnockSelfBack(0, 0)
        LambDeath()
        LoadImages()
        MaybeOpenZap(0, 0, 0)
        MomentumDir()
        MoveFamiliars(0, 0)
        MoveSoulFamiliars(0)
        MoveTo(0, 0)
        PainFlyaway()
        PerformTween(0, 0, 0, 0, 0, 0, False)
        Perished()
        PermitMoveFail()
        PlayVO(0)
        ProcessDropMystery(Null, 0)
        ProcessMoveQueue()
        ProcessSlotOffsets(0, 0, 0)
        ProcessSlotOffsets2(0, 0, 0)
        ProcessTheResultsOfEquippingItem(0)
        ProcessTheResultsOfLosingItem(0)
        PutItemInSlot(0, 0, False)
        Render()
        RenderHUD(0, False)
        RenderHUDSlotHotkey(0, 0, 0, 0, 0, False)
        RenderHUDSlotQuantity(Null, 0, 0, 0, 0, 0, 0)
        RenderHUDSlotQuantity2(Null, 0, 0, 0, 0, 0, 0)
        ResetStateAfterLevel()
        ScatterItems()
        SetCharacter(0)
        SetDugRecently()
        SetSlotCursed(0, False)
        SetSlotMystery(0, False)
        SetTotallyBlank()
        StopFalling()
        SubtractItemOfType(0)
        SubtractKey()
        SwapWeapons()
        TestCourage(0)
        ToggleBatForm()
        TurnAllItemsToGlass()
        TurnAllItemsToObsidian()
        TurnSlotInto(0, 0)
        Update()
        UpdateBonusHeart()
        UseBomb()
        VocalizeAttack()
        WarpFamiliars()
        WarpTo(0, 0)
    End Method

End Class

Class Character

    Const Cadence: Int = 0
    Const Melody: Int = 1
    Const Aria: Int = 2
    Const Dorian: Int = 3
    Const Eli: Int = 4
    Const Monk: Int = 5
    Const Dove: Int = 6
    Const Coda: Int = 7
    Const Bolt: Int = 8
    Const Bard: Int = 9
    Const Nocturna: Int = 10
    Const Diamond: Int = 11
    Const Mary: Int = 12
    Const Tempo: Int = 13

End Class
