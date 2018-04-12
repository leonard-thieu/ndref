'Strict

Import monkey.list
Import monkey.map
Import monkey.set
Import bouncer
Import familiar
Import familiar_fixed
Import item
Import logger
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
        Debug.TraceNotImplemented("Player.ActuallyPlayVO()")
    End Function

    Function AddCoins: Void(tmpNum: Int)
        Debug.TraceNotImplemented("Player.AddCoins()")
    End Function

    Function AllPlayersPerished: Bool()
        Debug.TraceNotImplemented("Player.AllPlayersPerished()")
    End Function

    Function AnyPlayerInSpecialRoom: Bool()
        Debug.TraceNotImplemented("Player.AnyPlayerInSpecialRoom()")
    End Function

    Function AnyPlayerPeace: Bool()
        Debug.TraceNotImplemented("Player.AnyPlayerPeace()")
    End Function

    Function AnyPlayerTemporaryMapSight: Bool()
        Debug.TraceNotImplemented("Player.AnyPlayerTemporaryMapSight()")
    End Function

    Function CheckAllModeCompletion: Void()
        Debug.TraceNotImplemented("Player.CheckAllModeCompletion()")
    End Function

    Function ChooseNewPlayer1: Void()
        Debug.TraceNotImplemented("Player.ChooseNewPlayer1()")
    End Function

    Function DoesAnyPlayerHaveItemOfType: Bool(it: Int, overrideBatForm: Bool)
        Debug.TraceNotImplemented("Player.DoesAnyPlayerHaveItemOfType()")
    End Function

    Function DoesPlayer1HaveItemOfType: Bool(i: Int)
        Debug.TraceNotImplemented("Player.DoesPlayer1HaveItemOfType()")
    End Function

    Function GetCharacterName: Int(charNum: Int, tagType: Int)
        Debug.TraceNotImplemented("Player.GetCharacterName()")
    End Function

    Function GetGreedMultiplier: Int()
        Debug.TraceNotImplemented("Player.GetGreedMultiplier()")
    End Function

    Function GetSlotFromNum: Int(num: Int)
        Debug.TraceNotImplemented("Player.GetSlotFromNum()")
    End Function

    Function GetSlotNum: Int(sl: Int)
        Debug.TraceNotImplemented("Player.GetSlotNum()")
    End Function

    Function GetTransplantDisplayTime: Int()
        Debug.TraceNotImplemented("Player.GetTransplantDisplayTime()")
    End Function

    Function IsBloodDamage: Bool(damageSource: Int)
        Debug.TraceNotImplemented("Player.IsBloodDamage()")
    End Function

    Function IsIntentionalDamage: Bool(damageSource: Int)
        Debug.TraceNotImplemented("Player.IsIntentionalDamage()")
    End Function

    Function IsInternalDamage: Bool(damageSource: Int)
        Debug.TraceNotImplemented("Player.IsInternalDamage()")
    End Function

    Function IsLastLevel: Bool()
        Debug.TraceNotImplemented("Player.IsLastLevel()")
    End Function

    Function IsSolo: Bool()
        Debug.TraceNotImplemented("Player.IsSolo()")
    End Function

    Function IsUnpreventableDamage: Bool(damageSource: Int)
        Debug.TraceNotImplemented("Player.IsUnpreventableDamage()")
    End Function

    Function MakeBodyImage: Object(characterID: Int, idSuffix: Int, altSkin: Int)
        Debug.TraceNotImplemented("Player.MakeBodyImage()")
    End Function

    Function MakeHeadImage: Object(characterID: Int, idSuffix: Int, altSkin: Int)
        Debug.TraceNotImplemented("Player.MakeHeadImage()")
    End Function

    Function NumEnabledCharacters: Int()
        Debug.TraceNotImplemented("Player.NumEnabledCharacters()")
    End Function

    Function OffsetCoins: Void(tmpNum: Int)
        Debug.TraceNotImplemented("Player.OffsetCoins()")
    End Function

    Function PlayersHaveMovedThisBeat: Bool()
        Debug.TraceNotImplemented("Player.PlayersHaveMovedThisBeat()")
    End Function

    Function PlayVOPlayer1: Void(voSound: Int)
        Debug.TraceNotImplemented("Player.PlayVOPlayer1()")
    End Function

    Function SetCoins: Void(tmpNum: Int, allowAchievement: Bool)
        Debug.TraceNotImplemented("Player.SetCoins()")
    End Function

    Function UpdateAll: Void()
        Debug.TraceNotImplemented("Player.UpdateAll()")
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
        Debug.TraceNotImplemented("Player.AddFamiliarAt()")
    End Method

    Method AddGeneralMetrics: Void(sendIt: Bool)
        Debug.TraceNotImplemented("Player.AddGeneralMetrics()")
    End Method

    Method AddItemOfType: Void(item: String, itemObj: Item, ignoreFlyTo: Bool, isInitialEquip: Bool)
        Debug.TraceNotImplemented("Player.AddItemOfType()")
    End Method

    Method AddItemOfType_PreProcess: Bool(i: String, itemObj: Item)
        Debug.TraceNotImplemented("Player.AddItemOfType_PreProcess()")
    End Method

    Method AfterEnemyMovement: Void()
        Debug.TraceNotImplemented("Player.AfterEnemyMovement()")
    End Method

    Method AfterHitHook: Void(nme: Object, hitX: Int, hitY: Int, dir: Int)
        Debug.TraceNotImplemented("Player.AfterHitHook()")
    End Method

    Method AttackDirection: Bool(dir: Int, isThrow: Bool)
        Debug.TraceNotImplemented("Player.AttackDirection()")
    End Method

    Method AttemptOffbeatMove: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Player.AttemptOffbeatMove()")
    End Method

    Method BreakGlassShovel: Void()
        Debug.TraceNotImplemented("Player.BreakGlassShovel()")
    End Method

    Method BreakGlassStuff: Void()
        Debug.TraceNotImplemented("Player.BreakGlassStuff()")
    End Method

    Method BreakSpikedEars: Void()
        Debug.TraceNotImplemented("Player.BreakSpikedEars()")
    End Method

    Method CalcMinVisibility: Int()
        Debug.TraceNotImplemented("Player.CalcMinVisibility()")
    End Method

    Method CancelTween: Void()
        Debug.TraceNotImplemented("Player.CancelTween()")
    End Method

    Method CheckConductorWire: Void()
        Debug.TraceNotImplemented("Player.CheckConductorWire()")
    End Method

    Method CheckFloating: Void()
        Debug.TraceNotImplemented("Player.CheckFloating()")
    End Method

    Method CheckVowOfPoverty: Void()
        Debug.TraceNotImplemented("Player.CheckVowOfPoverty()")
    End Method

    Method ClearAllFamiliars: Void(includeLamb: Bool)
        Debug.TraceNotImplemented("Player.ClearAllFamiliars()")
    End Method

    Method ClearFamiliarAt: Void(offsetX: Int, offsetY: Int)
        Debug.TraceNotImplemented("Player.ClearFamiliarAt()")
    End Method

    Method CommitZap: Void()
        Debug.TraceNotImplemented("Player.CommitZap()")
    End Method

    Method ConsumeItemSlot: Bool(sl: Int)
        Debug.TraceNotImplemented("Player.ConsumeItemSlot()")
    End Method

    Method ConsumeOne: Bool(item: Int)
        Debug.TraceNotImplemented("Player.ConsumeOne()")
    End Method

    Method Die: Void()
        Self.ClearAllFamiliars(True)

        If Not Self.dead Then Super.Die()
    End Method

    Method DoBigDig: Bool(x0: Int, y0: Int, shovelDamage: Int, dir: Int, allowNoShovel: Bool)
        Debug.TraceNotImplemented("Player.DoBigDig()")
    End Method

    Method DoComboLeftDown: Bool()
        Debug.TraceNotImplemented("Player.DoComboLeftDown()")
    End Method

    Method DoComboLeftRight: Bool()
        Debug.TraceNotImplemented("Player.DoComboLeftRight()")
    End Method

    Method DoComboLeftUp: Bool()
        Debug.TraceNotImplemented("Player.DoComboLeftUp()")
    End Method

    Method DoComboRightDown: Bool()
        Debug.TraceNotImplemented("Player.DoComboRightDown()")
    End Method

    Method DoComboRightUp: Bool()
        Debug.TraceNotImplemented("Player.DoComboRightUp()")
    End Method

    Method DoComboUpDown: Bool()
        Debug.TraceNotImplemented("Player.DoComboUpDown()")
    End Method

    Method DoCrownTeleport: Void()
        Debug.TraceNotImplemented("Player.DoCrownTeleport()")
    End Method

    Method DoEnchantWeapon: Void()
        Debug.TraceNotImplemented("Player.DoEnchantWeapon()")
    End Method

    Method DoHitEffects: Void(dir: Int, hitter: Object, tempDam: Int)
        Debug.TraceNotImplemented("Player.DoHitEffects()")
    End Method

    Method DoNeed: Void()
        Debug.TraceNotImplemented("Player.DoNeed()")
    End Method

    Method DropBomb: Object()
        Debug.TraceNotImplemented("Player.DropBomb()")
    End Method

    Method DropItem: Object(i: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Player.DropItem()")
    End Method

    Method EmptyAllSlots: Void(includeLamb: Bool)
        Debug.TraceNotImplemented("Player.EmptyAllSlots()")
    End Method

    Method EmptySlot: Void(sl: Int)
        Debug.TraceNotImplemented("Player.EmptySlot()")
    End Method

    Method EnterBatForm: Void()
        Debug.TraceNotImplemented("Player.EnterBatForm()")
    End Method

    Method ExitBatForm: Void()
        Debug.TraceNotImplemented("Player.ExitBatForm()")
    End Method

    Method Fall: Void(keepMultiplier: Bool)
        Debug.TraceNotImplemented("Player.Fall()")
    End Method

    Method FeetIgnoreCoals: Bool()
        Debug.TraceNotImplemented("Player.FeetIgnoreCoals()")
    End Method

    Method FeetIgnoreIce: Bool()
        Debug.TraceNotImplemented("Player.FeetIgnoreIce()")
    End Method

    Method FeetIgnoreOoze: Bool()
        Debug.TraceNotImplemented("Player.FeetIgnoreOoze()")
    End Method

    Method FeetIgnoreWaterAndTar: Bool()
        Debug.TraceNotImplemented("Player.FeetIgnoreWaterAndTar()")
    End Method

    Method FrostItemCount: Int()
        Debug.TraceNotImplemented("Player.FrostItemCount()")
    End Method

    Method GetArmorAmount: Int()
        Debug.TraceNotImplemented("Player.GetArmorAmount()")
    End Method

    Method GetBonusDamage: Int(baseDamage: Int)
        Debug.TraceNotImplemented("Player.GetBonusDamage()")
    End Method

    Method GetDamage: Int()
        Debug.TraceNotImplemented("Player.GetDamage()")
    End Method

    Method GetElectricStrength: Int()
        Debug.TraceNotImplemented("Player.GetElectricStrength()")
    End Method

    Method GetHUDQuantityText: Object(slot: Int)
        Debug.TraceNotImplemented("Player.GetHUDQuantityText()")
    End Method

    Method GetItemInSlot: Int(sl: Int, overrideBatForm: Bool)
        Debug.TraceNotImplemented("Player.GetItemInSlot()")
    End Method

    Method GetItemQuantity: Int(item: Int)
        Debug.TraceNotImplemented("Player.GetItemQuantity()")
    End Method

    Method GetKillsUntilHealingString: Int()
        Debug.TraceNotImplemented("Player.GetKillsUntilHealingString()")
    End Method

    Method GetLightSourceMax: Float()
        Debug.TraceNotImplemented("Player.GetLightSourceMax()")
    End Method

    Method GetLightSourceMin: Float()
        Debug.TraceNotImplemented("Player.GetLightSourceMin()")
    End Method

    Method GetMinVisibility: Int()
        Debug.TraceNotImplemented("Player.GetMinVisibility()")
    End Method

    Method GetMoveLastBeat: Int()
        Debug.TraceNotImplemented("Player.GetMoveLastBeat()")
    End Method

    Method GetNewWeapon: Void(w: Int)
        Debug.TraceNotImplemented("Player.GetNewWeapon()")
    End Method

    Method GetPositionLastBeat: Object()
        Debug.TraceNotImplemented("Player.GetPositionLastBeat()")
    End Method

    Method GetShovelDamage: Int(fromMinersCap: Bool)
        Debug.TraceNotImplemented("Player.GetShovelDamage()")
    End Method

    Method GetShovelDamageHelper: Int()
        Debug.TraceNotImplemented("Player.GetShovelDamageHelper()")
    End Method

    Method GetTorchLevel: Int()
        Debug.TraceNotImplemented("Player.GetTorchLevel()")
    End Method

    Method GetWeapon: Object(overrideBatForm: Bool)
        Debug.TraceNotImplemented("Player.GetWeapon()")
    End Method

    Method GiveInitialEquipment: Void(resetHealth: Bool)
        Debug.TraceNotImplemented("Player.GiveInitialEquipment()")
    End Method

    Method GotBlood: Void(amount: Int)
        Debug.TraceNotImplemented("Player.GotBlood()")
    End Method

    Method GotKill: Void()
        Debug.TraceNotImplemented("Player.GotKill()")
    End Method

    Method GrantIBeats: Void(num: Int)
        Debug.TraceNotImplemented("Player.GrantIBeats()")
    End Method

    Method HandleIceAndCoals: Void()
        Debug.TraceNotImplemented("Player.HandleIceAndCoals()")
    End Method

    Method HasCouponLike: Bool()
        Debug.TraceNotImplemented("Player.HasCouponLike()")
    End Method

    Method HasItemOfType: Bool(i: String, overrideBatForm: Bool)
        Debug.TraceNotImplemented("Player.HasItemOfType()")
    End Method

    Method HasShovel: Bool()
        Debug.TraceNotImplemented("Player.HasShovel()")
    End Method

    Method HaveSecondActionSlot: Bool()
        Debug.TraceNotImplemented("Player.HaveSecondActionSlot()")
    End Method

    Method Heal: Void(amt: Int, fromFood: Bool, playVO: Bool, fromMagicFood: Bool)
        Debug.TraceNotImplemented("Player.Heal()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Player.Hit()")
    End Method

    Method ImmediatelyMoveTo: Void(xVal: Int, yVal: Int, fromKeyboard: Bool, fromClampedEnemy: Bool, fromBounceTrap: Bool, fromCourage: Bool, overrideStairs: Bool)
        Debug.TraceNotImplemented("Player.ImmediatelyMoveTo()")
    End Method

    Method IsAnythingInSlot: Bool(sl: Int)
        Debug.TraceNotImplemented("Player.IsAnythingInSlot()")
    End Method

    Method IsBomblessCharacter: Bool()
        Debug.TraceNotImplemented("Player.IsBomblessCharacter()")
    End Method

    Method IsHeavy: Bool()
        Debug.TraceNotImplemented("Player.IsHeavy()")
    End Method

    Method IsLordCrownActive: Bool()
        Debug.TraceNotImplemented("Player.IsLordCrownActive()")
    End Method

    Method IsLordCrownActive_Flicker: Bool()
        Debug.TraceNotImplemented("Player.IsLordCrownActive_Flicker()")
    End Method

    Method IsNecroDancer1Alive: Bool()
        Debug.TraceNotImplemented("Player.IsNecroDancer1Alive()")
    End Method

    Method IsPhasing: Bool()
        Debug.TraceNotImplemented("Player.IsPhasing()")
    End Method

    Method IsShieldActive: Bool()
        Debug.TraceNotImplemented("Player.IsShieldActive()")
    End Method

    Method IsShieldActive_Flicker: Bool()
        Debug.TraceNotImplemented("Player.IsShieldActive_Flicker()")
    End Method

    Method IsShrunk: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Player.IsShrunk()")
    End Method

    Method IsSlotCursed: Bool(sl: Int)
        Debug.TraceNotImplemented("Player.IsSlotCursed()")
    End Method

    Method IsVisible: Bool()
        Debug.TraceNotImplemented("Player.IsVisible()")
    End Method

    Method IsWeaponlessCharacter: Bool()
        Debug.TraceNotImplemented("Player.IsWeaponlessCharacter()")
    End Method

    Method KnockSelfBack: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Player.KnockSelfBack()")
    End Method

    Method LambDeath: Void()
        Debug.TraceNotImplemented("Player.LambDeath()")
    End Method

    Method LoadImages: Void()
        Debug.TraceNotImplemented("Player.LoadImages()")
    End Method

    Method MaybeOpenZap: Void(playerX: Int, playerY: Int, electricStrength: Int)
        Debug.TraceNotImplemented("Player.MaybeOpenZap()")
    End Method

    Method MomentumDir: Int()
        Debug.TraceNotImplemented("Player.MomentumDir()")
    End Method

    Method MoveFamiliars: Void(deltaX: Int, deltaY: Int)
        Debug.TraceNotImplemented("Player.MoveFamiliars()")
    End Method

    Method MoveSoulFamiliars: Void(moveDir: Int)
        Debug.TraceNotImplemented("Player.MoveSoulFamiliars()")
    End Method

    Method MoveTo: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Player.MoveTo()")
    End Method

    Method PainFlyaway: Void()
        Debug.TraceNotImplemented("Player.PainFlyaway()")
    End Method

    Method PerformTween: Void(xVal: Int, yVal: Int, oldX: Int, oldY: Int, tweenType: Int, shadowTweenType: Int, bufferTween: Bool)
        Debug.TraceNotImplemented("Player.PerformTween()")
    End Method

    Method Perished: Bool()
        Debug.TraceNotImplemented("Player.Perished()")
    End Method

    Method PermitMoveFail: Bool()
        Debug.TraceNotImplemented("Player.PermitMoveFail()")
    End Method

    Method PlayVO: Void(voSound: Int)
        Debug.TraceNotImplemented("Player.PlayVO()")
    End Method

    Method ProcessDropMystery: Void(item: Object, slot: Int)
        Debug.TraceNotImplemented("Player.ProcessDropMystery()")
    End Method

    Method ProcessMoveQueue: Void()
        Debug.TraceNotImplemented("Player.ProcessMoveQueue()")
    End Method

    Method ProcessSlotOffsets: Object(tmpSlotNum: Int, tmpX: Int, tmpY: Int)
        Debug.TraceNotImplemented("Player.ProcessSlotOffsets()")
    End Method

    Method ProcessSlotOffsets2: Object(tmpSlot: Int, tmpX: Int, tmpY: Int)
        Debug.TraceNotImplemented("Player.ProcessSlotOffsets2()")
    End Method

    Method ProcessTheResultsOfEquippingItem: Void(item: Int)
        Debug.TraceNotImplemented("Player.ProcessTheResultsOfEquippingItem()")
    End Method

    Method ProcessTheResultsOfLosingItem: Void(i: Int)
        Debug.TraceNotImplemented("Player.ProcessTheResultsOfLosingItem()")
    End Method

    Method PutItemInSlot: Void(sl: Int, i: Int, ignoreFlyTo: Bool)
        Debug.TraceNotImplemented("Player.PutItemInSlot()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Player.Render()")
    End Method

    Method RenderHUD: Void(position: Int, small: Bool)
        Debug.TraceNotImplemented("Player.RenderHUD()")
    End Method

    Method RenderHUDSlotHotkey: Void(inputMove: Int, slotX: Int, slotY: Int, slotSize: Int, scale: Float, overrideBatForm: Bool)
        Debug.TraceNotImplemented("Player.RenderHUDSlotHotkey()")
    End Method

    Method RenderHUDSlotQuantity: Void(textSprite: Object, num: Int, slotX: Int, slotY: Int, slotSize: Int, scale: Float, alpha: Float)
        Debug.TraceNotImplemented("Player.RenderHUDSlotQuantity()")
    End Method

    Method RenderHUDSlotQuantity2: Void(textSprite: Object, item: Int, slotX: Int, slotY: Int, slotSize: Int, scale: Float, alpha: Float)
        Debug.TraceNotImplemented("Player.RenderHUDSlotQuantity2()")
    End Method

    Method ResetStateAfterLevel: Void()
        Self.lastMoveOntoPlayerInCoopModeBeat = -1
        Self.StopFalling()
        Self.immobilized = False
        Self.lastIceSlideBeat = -1
        Self.lambDeathBeat = -1
        Self.tempoBeatsLeft = 16
        Self.confusedUntil = -1

        If Self.characterID = Character.Mary And
           Not Self.lambFamiliar
            ' TODO Implement respawning Marv.
        End If

        Self.CheckFloating()
    End Method

    Method ScatterItems: Void()
        Debug.TraceNotImplemented("Player.ScatterItems()")
    End Method

    Method SetCharacter: Void(charNum: Int)
        Debug.TraceNotImplemented("Player.SetCharacter()")
    End Method

    Method SetDugRecently: Void()
        Debug.TraceNotImplemented("Player.SetDugRecently()")
    End Method

    Method SetSlotCursed: Void(sl: Int, b: Bool)
        Debug.TraceNotImplemented("Player.SetSlotCursed()")
    End Method

    Method SetSlotMystery: Void(sl: Int, b: Bool)
        Debug.TraceNotImplemented("Player.SetSlotMystery()")
    End Method

    Method SetTotallyBlank: Void()
        Debug.TraceNotImplemented("Player.SetTotallyBlank()")
    End Method

    Method StopFalling: Void()
        Debug.TraceNotImplemented("Player.StopFalling()")
    End Method

    Method SubtractItemOfType: Bool(i: Int)
        Debug.TraceNotImplemented("Player.SubtractItemOfType()")
    End Method

    Method SubtractKey: Bool()
        Debug.TraceNotImplemented("Player.SubtractKey()")
    End Method

    Method SwapWeapons: Bool()
        Debug.TraceNotImplemented("Player.SwapWeapons()")
    End Method

    Method TestCourage: Bool(beat: Int)
        Debug.TraceNotImplemented("Player.TestCourage()")
    End Method

    Method ToggleBatForm: Void()
        Debug.TraceNotImplemented("Player.ToggleBatForm()")
    End Method

    Method TurnAllItemsToGlass: Void()
        Debug.TraceNotImplemented("Player.TurnAllItemsToGlass()")
    End Method

    Method TurnAllItemsToObsidian: Void()
        Debug.TraceNotImplemented("Player.TurnAllItemsToObsidian()")
    End Method

    Method TurnSlotInto: Void(slot: Int, newItem: Int)
        Debug.TraceNotImplemented("Player.TurnSlotInto()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Player.Update()")
    End Method

    Method UpdateBonusHeart: Void()
        Debug.TraceNotImplemented("Player.UpdateBonusHeart()")
    End Method

    Method UseBomb: Bool()
        Debug.TraceNotImplemented("Player.UseBomb()")
    End Method

    Method VocalizeAttack: Void()
        Debug.TraceNotImplemented("Player.VocalizeAttack()")
    End Method

    Method WarpFamiliars: Void()
        Debug.TraceNotImplemented("Player.WarpFamiliars()")
    End Method

    Method WarpTo: Void(newX: Int, newY: Int)
        Debug.TraceNotImplemented("Player.WarpTo()")
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
    Const Unknown15: Int = 15

End Class
