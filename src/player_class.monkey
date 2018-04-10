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

    Global AltHeadHeights: Int[] = [24, 24, 24, 33, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24]
    Global AltHeadWidths:  Int[] = [24, 24, 24, 32, 24, 28, 28, 28, 28, 28, 24, 28, 28, 28]
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
        Self.playerTempNum = playerTempCount
        Player.playerTempCount += 1

        If Not Self.hudSlotInitialized
            Self.hudSlotInitialized = True
            
            If Self.numHudSlots <= 0
                
            End If
        End If
    End Method

    Field isHelper: Bool
    Field familiars: List<FamiliarFixed>
    Field lambFamiliar: Familiar
    Field characterID: Int
    Field playerID: Int
    Field UsingDorianAltSkin: Bool
    Field UsingMelodyAltSkin: Bool
    Field UsingDoveAltSkin: Bool
    Field UsingCodaAltSkin: Bool
    Field UsingEliAltSkin: Bool
    Field UsingAltSkin: Bool
    Field headImage: Sprite
    Field headImageForHUD: Sprite
    Field ownedItems: StringMap<String>
    Field cursedSlots: StringMap<Bool>
    Field mysterySlots: StringSet
    Field miscItems: ItemList
    Field itemQuantity: StringMap<Int>
    Field weapon: Weapon
    Field armorAmount: Int
    Field armorType: String
    Field torchType: String
    Field hasPickedUpWonderThisRun: Bool
    Field hasPickedUpBlastHelmThisRun: Bool
    Field hasPickedUpGrenadeCharmThisRun: Bool
    Field batFormActive: Bool
    Field health: PlayerHealth
    Field courageShovelBeat: Int
    Field courageRingBeat: Int
    Field cutlassParry: Bool
    Field batWeapon: Weapon
    Field conductorWireActive: Bool
    Field lastMove: Int
    Field moveLastBeat: Int
    Field momentumDir: Int
    Field immobilized: Bool
    Field clampedEnemy: EnemyClamper
    Field lordCrownActiveBeat: Int
    Field lastIceSlideBeat: Int
    Field readyToFamiliar: String
    Field lambDeathBeat: Int
    Field readyToThrow: Bool
    Field killCounter: Int
    Field zap: Zap
    Field bloodDrumBeats: Int
    Field coinPickupBeat: Int
    Field dugRecently: Int
    Field warDrumBeats: Int
    Field temporaryMapSight: Bool
    Field lastKillBeat: Int
    Field bloodCounter: Int
    Field shieldActiveBeat: Int
    Field shieldImageFront: Sprite
    Field shieldImageBack: Sprite
    Field paceBeat: Int
    Field lastPlayerMoveBeatIncludeShoves: Int
    Field lastVocalizedBeat: Int
    Field lastAttackBeat: Int
    Field attackChain: Int
    Field shovelRenderTime: Int
    Field shovelRenderType: String
    Field shovelRenderX: Int
    Field shovelRenderY: Int
    Field castingFireball: Bool
    Field lastHitBeat: Int
    Field dontLeap: Bool
    Field didCrownTeleport: Bool
    Field lastBeatX: Int
    Field lastBeatY: Int
    Field wasClamped: Bool
    Field helper: Player
    Field griefVONum: Int
    Field globalIgnoreFlyToSlot: Bool
    Field hudDiamondForFlyingRender: Bool
    Field numBombs: Int
    Field hudSlotOffFlyFromPlayer: bool[]
    Field hideQuantity: StringMap<Bool>
    Field holdingBagItems: List<String>
    Field playerTempNum: Int
    Field hudSlotInitialized: Bool
    Field numHudSlots: Int
    Field hudSlot: Sprite[]
    Field numHudSlotsIncludingActionAndSpells: Int
    Field hudSlotOff: Point2[]
    Field shovelImages: StringMap<Sprite>
    Field tempoHeartText: TextSprite
    Field hudSlotAction1: Sprite
    Field hudSlotAction2: Sprite
    Field hudSlotAction2Empty: Sprite
    Field hudSlotWeapon2: Sprite
    Field hudSlotWeapon2Empty: Sprite
    Field hudSlotWeaponReload: Sprite
    Field hudSlotWeaponThrow: Sprite
    Field hudSlotWeaponThrow2: Sprite
    Field hudSlotBoots: Sprite
    Field hudSlotBoots2: Sprite
    Field hudSlotBoots3: Sprite
    Field hudSlotBomb: Sprite
    Field hudSlotSpell1: Sprite
    Field hudSlotSpell2: Sprite
    Field hudDiamondForFlying: Sprite
    Field mysteryWeaponImage: Sprite
    Field mysteryRingImage: Sprite
    Field wobbler: Bouncer
    Field lastMoveOntoPlayerInCoopModeBeat: Int
    Field tempoBeatsLeft: Int
    Field queuedMoveBeat: Int
    Field minVisibilityCachedFrame: Int
    Field minVisibilityCached: Float
    Field lastLOSX: Int
    Field lastLOSY: Int
    Field popUpController: ControllerPopUp
    Field warnState: Int
    Field hintsController: ControllerPopUp
    Field seedController: ControllerInputPopup
    Field crownOfGreedBeat: Int
    Field lastWarDrumBeat: Int
    Field lastBloodDrumBeat: Int
    Field queuedMove: Bool
    Field queuedMoveX: Int
    Field queuedMoveY: Int
    Field wasShrunk: Bool
    Field electricityCounter: Int
    Field playedExitErrorSound: Bool
    Field lastClampedEnemy: EnemyClamper
    Field heartTransplantTime: Int
    Field crownText: TextSprite
    Field quantityText: StringMap<TextSprite>
    Field hudTextForInput: IntMap<TextSprite>
    Field hudText2ForInput: IntMap<TextSprite>
    Field hudSpriteForInput: IntMap<Sprite>
    Field action1Text: TextSprite
    Field action2Text: TextSprite
    Field bombText: TextSprite
    Field coinText: TextSprite
    Field diamondText: TextSprite
    Field hudDiamondForFlyingXOff: Float
    Field hudDiamondForFlyingYOff: Float
    Field spell1CoolText: TextSprite
    Field spell1CoolText2: TextSprite
    Field spell1CoolText3: TextSprite
    Field spell2CoolText: TextSprite
    Field spell2CoolText2: TextSprite
    Field spell2CoolText3: TextSprite
    Field trapSight: Float
    Field deadRenderFrames: Int

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
