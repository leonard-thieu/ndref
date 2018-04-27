'Strict

Import monkey.list
Import monkey.map
Import monkey.set
Import bouncer
Import camera
Import controller_game
Import controller_input_popup
Import controller_popup
Import enemyclamper
Import entity
Import familiar
Import familiar_fixed
Import gamedata
Import item
Import logger
Import mobileentity
Import player_health
Import point
Import sprite
Import textsprite
Import weapon
Import zap

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
        Debug.TraceNotImplemented("Player.ActuallyPlayVO(Int, Object)")
    End Function

    Function AddCoins: Void(tmpNum: Int)
        Debug.TraceNotImplemented("Player.AddCoins(Int)")
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

    Function DoesAnyPlayerHaveItemOfType: Bool(it: String)
        Return Player.DoesAnyPlayerHaveItemOfType(it, False)
    End Function

    Function DoesAnyPlayerHaveItemOfType: Bool(it: String, overrideBatForm: Bool)
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player.HasItemOfType(it, overrideBatForm) Then Return True
        End For

        Return False
    End Function

    Function DoesPlayer1HaveItemOfType: Bool(i: Int)
        Debug.TraceNotImplemented("Player.DoesPlayer1HaveItemOfType(Int)")
    End Function

    Function GetCharacterName: Int(charNum: Int, tagType: Int)
        Debug.TraceNotImplemented("Player.GetCharacterName(Int, Int)")
    End Function

    Function GetGreedMultiplier: Int()
        Debug.TraceNotImplemented("Player.GetGreedMultiplier()")
    End Function

    Function GetSlotFromNum: Int(num: Int)
        Debug.TraceNotImplemented("Player.GetSlotFromNum(Int)")
    End Function

    Function GetSlotNum: Int(sl: Int)
        Debug.TraceNotImplemented("Player.GetSlotNum(Int)")
    End Function

    Function GetTransplantDisplayTime: Int()
        Debug.TraceNotImplemented("Player.GetTransplantDisplayTime()")
    End Function

    Function IsBloodDamage: Bool(damageSource: Int)
        Debug.TraceNotImplemented("Player.IsBloodDamage(Int)")
    End Function

    Function IsIntentionalDamage: Bool(damageSource: Int)
        Debug.TraceNotImplemented("Player.IsIntentionalDamage(Int)")
    End Function

    Function IsInternalDamage: Bool(damageSource: Int)
        Debug.TraceNotImplemented("Player.IsInternalDamage(Int)")
    End Function

    Function IsLastLevel: Bool()
        Debug.TraceNotImplemented("Player.IsLastLevel()")
    End Function

    Function IsSolo: Bool()
        Debug.TraceNotImplemented("Player.IsSolo()")
    End Function

    Function IsUnpreventableDamage: Bool(damageSource: Int)
        Debug.TraceNotImplemented("Player.IsUnpreventableDamage(Int)")
    End Function

    Function MakeBodyImage: Sprite(characterID: Int, idSuffix: String, altSkin: Int)
        Debug.TraceNotImplemented("Player.MakeBodyImage(Int, String, Int)")
    End Function

    Function MakeHeadImage: Sprite(characterID: Int, idSuffix: String, altSkin: Int)
        Debug.TraceNotImplemented("Player.MakeHeadImage(Int, String, Int)")

        Return New Sprite()
    End Function

    Function NumEnabledCharacters: Int()
        Debug.TraceNotImplemented("Player.NumEnabledCharacters()")
    End Function

    Function OffsetCoins: Void(tmpNum: Int)
        Debug.TraceNotImplemented("Player.OffsetCoins(Int)")
    End Function

    Function PlayersHaveMovedThisBeat: Bool()
        Debug.TraceNotImplemented("Player.PlayersHaveMovedThisBeat()")
    End Function

    Function PlayVOPlayer1: Void(voSound: Int)
        Debug.TraceNotImplemented("Player.PlayVOPlayer1(Int)")
    End Function

    Function SetCoins: Void(tmpNum: Int, allowAchievement: Bool)
        Debug.TraceNotImplemented("Player.SetCoins(Int, Bool)")
    End Function

    Function UpdateAll: Void()
        Debug.TraceNotImplemented("Player.UpdateAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(id: Int, characterID_: Int)
        Super.New()

        Player.coinXOR = Player.numCoins ~ $1D69

        Self.playerTempNum = Player.playerTempCount
        Player.playerTempCount += 1

        If Not Self.hudSlotInitialized
            Self.hudSlotInitialized = True

            If Self.numHudSlots <= 0
                Self.hudSlot = []
            Else
                Local size := math.Max(Self.numHudSlots, Self.hudSlot.Length())
                Self.hudSlot = Self.hudSlot.Resize(Self.numHudSlots)
            End If

            For Local i := 0 Until Self.numHudSlots
                Self.hudSlot[i] = New Sprite("gui/hud_slot_" + (i + 1) + ".png", 1, Image.DefaultFlags)
                Self.hudSlot[i].InWorld(False)
                Self.hudSlot[i].SetZ(9999.0)
            End For

            If Self.numHudSlotsIncludingActionAndSpells <= 0
                Self.hudSlotOff = []
            Else
                Local size := math.Max(Self.numHudSlotsIncludingActionAndSpells, Self.hudSlotOff.Length())
                Self.hudSlotOff = Self.hudSlotOff.Resize(size)
            End If

            If Self.numHudSlotsIncludingActionAndSpells <= 0
                Self.hudSlotOffFlyFromPlayer = []
            Else
                Local size := math.Max(Self.numHudSlotsIncludingActionAndSpells, Self.hudSlotOffFlyFromPlayer.Length())
                Self.hudSlotOffFlyFromPlayer = Self.hudSlotOffFlyFromPlayer.Resize(size)
            End If

            For Local i := 0 Until Self.numHudSlotsIncludingActionAndSpells
                Self.hudSlotOffFlyFromPlayer[i] = False
                Self.hudSlotOff[i] = New Point2()
            End For
        End If

        Self.x = 0
        Self.y = 0
        Self.playerID = id
        Self.isPlayer = True

        If characterID_ = Character.None
            characterID_ = GameData.GetDefaultCharacter()
            If Not GameData.GetDLCPlayed()
                If GameData.GetZone2Unlocked(Character.Cadence)
                    characterID_ = Character.Nocturna
                End If
                GameData.SetDLCPlayed()
            End If
        End If

        Self.SetCharacter(characterID_)

        Camera.x = 24 * Self.x
        Camera.y = 24 * Self.y

        For Local shovel := EachIn Item.GetAllItemsInClass("isShovel")
            Local itemData := New ItemData(shovel)
            Local name := GetString(shovel, "_name", "")
            Local path := GetString(shovel, "_content", "")
            Local image := New Sprite("items/" + path, itemData.imageW, itemData.imageH, itemData.imageFrames, Image.DefaultFlags)
            image.SetZ(10000.0)
            Self.shovelImages.Set(name, image)
        End For

        Self.tempoHeartText.zVal = 10002

        If Player.hudCoins = Null Then Player.hudCoins = New Sprite("gui/hud_coins.png", 1, Image.DefaultFlags)
        Player.hudCoins.InWorld(False)
        Player.hudCoins.SetZ(10000.0)
        If Player.hudDiamonds = Null Then Player.hudDiamonds = New Sprite("gui/diamond.png", 1, Image.DefaultFlags)
        Player.hudDiamonds.InWorld(False)
        Player.hudDiamonds.SetZ(10000.0)

        If Self.hudSlotAction1 = Null Then Self.hudSlotAction1 = New Sprite("gui/hud_slot_action1.png", 1, Image.DefaultFlags)
        Self.hudSlotAction1.InWorld(False)
        Self.hudSlotAction1.SetZ(10001.0)
        If Self.hudSlotAction2 = Null Then Self.hudSlotAction2 = New Sprite("gui/hud_slot_action2.png", 1, Image.DefaultFlags)
        Self.hudSlotAction2.InWorld(False)
        Self.hudSlotAction2.SetZ(10001.0)
        If Self.hudSlotAction2Empty = Null Then Self.hudSlotAction2Empty = New Sprite("gui/hud_slot_action2_empty.png", 1, Image.DefaultFlags)
        Self.hudSlotAction2Empty.InWorld(False)
        Self.hudSlotAction2Empty.SetZ(10001.0)
        If Self.hudSlotWeapon2 = Null Then Self.hudSlotWeapon2 = New Sprite("gui/hud_slot_weapon2.png", 1, Image.DefaultFlags)
        Self.hudSlotWeapon2.InWorld(False)
        Self.hudSlotWeapon2.SetZ(10001.0)
        If Self.hudSlotWeapon2Empty = Null Then Self.hudSlotWeapon2Empty = New Sprite("gui/hud_slot_weapon2_empty.png", 1, Image.DefaultFlags)
        Self.hudSlotWeapon2Empty.InWorld(False)
        Self.hudSlotWeapon2Empty.SetZ(10001.0)
        If Self.hudSlotWeaponReload = Null Then Self.hudSlotWeaponReload = New Sprite("gui/hud_slot_reload.png", 1, Image.DefaultFlags)
        Self.hudSlotWeaponReload.InWorld(False)
        Self.hudSlotWeaponReload.SetZ(10001.0)
        If Self.hudSlotWeaponThrow = Null Then Self.hudSlotWeaponThrow = New Sprite("gui/hud_slot_throw.png", 1, Image.DefaultFlags)
        Self.hudSlotWeaponThrow.InWorld(False)
        Self.hudSlotWeaponThrow.SetZ(10001.0)
        If Self.hudSlotWeaponThrow2 = Null Then Self.hudSlotWeaponThrow2 = New Sprite("gui/hud_slot_throw2.png", 1, Image.DefaultFlags)
        Self.hudSlotWeaponThrow2.InWorld(False)
        Self.hudSlotWeaponThrow2.SetZ(10001.0)
        If Self.hudSlotBoots = Null Then Self.hudSlotBoots = New Sprite("gui/hud_slot_boots.png", 1, Image.DefaultFlags)
        Self.hudSlotBoots.InWorld(False)
        Self.hudSlotBoots.SetZ(10001.0)
        If Self.hudSlotBoots2 = Null Then Self.hudSlotBoots2 = New Sprite("gui/hud_slot_boots2.png", 1, Image.DefaultFlags)
        Self.hudSlotBoots2.InWorld(False)
        Self.hudSlotBoots2.SetZ(10001.0)
        If Self.hudSlotBoots3 = Null Then Self.hudSlotBoots3 = New Sprite("gui/hud_slot_boots3.png", 1, Image.DefaultFlags)
        Self.hudSlotBoots3.InWorld(False)
        Self.hudSlotBoots3.SetZ(10001.0)
        If Self.hudSlotBomb = Null Then Self.hudSlotBomb = New Sprite("gui/hud_slot_bomb.png", 1, Image.DefaultFlags)
        Self.hudSlotBomb.InWorld(False)
        Self.hudSlotBomb.SetZ(10001.0)
        If Self.hudSlotSpell1 = Null Then Self.hudSlotSpell1 = New Sprite("gui/hud_slot_spell1.png", 1, Image.DefaultFlags)
        Self.hudSlotSpell1.InWorld(False)
        Self.hudSlotSpell1.SetZ(10001.0)
        If Self.hudSlotSpell2 = Null Then Self.hudSlotSpell2 = New Sprite("gui/hud_slot_spell2.png", 1, Image.DefaultFlags)
        Self.hudSlotSpell2.InWorld(False)
        Self.hudSlotSpell2.SetZ(10001.0)
        If Self.hudDiamondForFlying = Null Then Self.hudDiamondForFlying = New Sprite("gui/diamond.png", 1, Image.DefaultFlags)
        Self.hudDiamondForFlying.InWorld(False)
        Self.hudDiamondForFlying.SetZ(10001.0)

        If Self.mysteryWeaponImage = Null Then Self.mysteryWeaponImage = New Sprite("items/weapon_uncertainty.png", 24, 25, 2, Image.DefaultFlags)
        If Self.mysteryRingImage = Null Then Self.mysteryRingImage = New Sprite("items/ring_uncertainty.png", 19, 19, 2, Image.DefaultFlags)

        Self.bounce = New Bouncer(-2.5, 0.0, 1.5, 20)
        Self.bounce.Disable()
        Self.wobbler = New Bouncer(-2.5, 0.0, 1.5, 13)

        Self.frozenImage = New Sprite("entities/frozen_feet_medium.png", 31, 24, 2, Image.DefaultFlags)
        Self.frozenStoneImage = New Sprite("entities/stone_feet.png", 17, 9, 1, Image.DefaultFlags)
        Self.shieldImageBack = New Sprite("spells/shield_back.png", 34, 35, 3, Image.DefaultFlags)
        Self.shieldImageFront = New Sprite("spells/shield_front.png", 34, 35, 3, Image.DefaultFlags)

        If Not Level.isReplaying
            Player.numDiamonds = GameData.GetPlayerDiamonds()
        End If

        If Not Player.heartsLoaded
            Player.heart = New Sprite("gui/heart.png", 1, Image.DefaultFlags)
            Player.heart.InWorld(False)
            Player.heart.SetZ(10000.0)
            Player.heartEmpty = New Sprite("gui/heart_empty.png", 1, Image.DefaultFlags)
            Player.heartEmpty.InWorld(False)
            Player.heartEmpty.SetZ(10000.0)
            Player.heartHalf = New Sprite("gui/heart_half.png", 1, Image.DefaultFlags)
            Player.heartHalf.InWorld(False)
            Player.heartHalf.SetZ(10000.0)
            Player.cursedHeart = New Sprite("gui/cursed_heart.png", 1, Image.DefaultFlags)
            Player.cursedHeart.InWorld(False)
            Player.cursedHeart.SetZ(10000.0)
            Player.cursedHeartEmpty = New Sprite("gui/cursed_heart_empty.png", 1, Image.DefaultFlags)
            Player.cursedHeartEmpty.InWorld(False)
            Player.cursedHeartEmpty.SetZ(10000.0)
            Player.cursedHeartHalf = New Sprite("gui/cursed_heart_half.png", 1, Image.DefaultFlags)
            Player.cursedHeartHalf.InWorld(False)
            Player.cursedHeartHalf.SetZ(10000.0)
        End If

        ' `ActivateLight` is inlined in the binary and does not show `constLightSourceMax` being modified although `ActivateLight` does modify it.
        ' `constLightSourceMax` is reset after the call to `ActivateLight` to match the binary.
        Local constLightSourceMax := Self.constLightSourceMax
        Self.ActivateLight(1.25, 1.75)
        Self.constLightSourceMax = constLightSourceMax
    End Method

    Field isHelper: Bool
    Field familiars: List<FamiliarFixed> = New List<FamiliarFixed>()
    Field lambFamiliar: Familiar
    Field characterID: Int = Character.None
    Field playerID: Int = -1
    Field UsingDorianAltSkin: Bool
    Field UsingMelodyAltSkin: Bool
    Field UsingDoveAltSkin: Bool
    Field UsingCodaAltSkin: Bool
    Field UsingEliAltSkin: Bool
    Field UsingAltSkin: Bool
    Field headImage: Sprite
    Field headImageForHUD: Sprite
    Field ownedItems: StringMap<String> = New StringMap<String>()
    Field cursedSlots: StringMap<Bool> = New StringMap<Bool>()
    Field mysterySlots: StringSet = New StringSet()
    Field miscItems: ItemList = New ItemList()
    Field itemQuantity: StringMap<Int> = New StringMap<Int>()
    Field weapon: Weapon
    Field armorAmount: Int
    Field armorType: String = Item.NoItem
    Field torchType: String = Item.NoItem
    Field hasPickedUpWonderThisRun: Bool
    Field hasPickedUpBlastHelmThisRun: Bool
    Field hasPickedUpGrenadeCharmThisRun: Bool
    Field batFormActive: Bool
    Field health: PlayerHealth = New PlayerHealth()
    Field courageShovelBeat: Int = -1
    Field courageRingBeat: Int = -1
    Field cutlassParry: Bool
    Field batWeapon: Weapon
    Field conductorWireActive: Bool
    Field lastMove: Int = -1
    Field moveLastBeat: Int = -1
    Field momentumDir: Int = -1
    Field immobilized: Bool
    Field clampedEnemy: EnemyClamper
    Field lordCrownActiveBeat: Int = -1
    Field lastIceSlideBeat: Int = -1
    Field readyToFamiliar: String
    Field lambDeathBeat: Int = -1
    Field readyToThrow: Bool
    Field killCounter: Int
    Field zap: Zap
    Field bloodDrumBeats: Int
    Field coinPickupBeat: Int = -2
    Field dugRecently: Int
    Field warDrumBeats: Int
    Field temporaryMapSight: Bool
    Field lastKillBeat: Int = -1
    Field bloodCounter: Int = 10
    Field shieldActiveBeat: Int = -1
    Field shieldImageFront: Sprite
    Field shieldImageBack: Sprite
    Field paceBeat: Int = -1
    Field lastPlayerMoveBeatIncludeShoves: Int = -1
    Field lastVocalizedBeat: Int
    Field lastAttackBeat: Int
    Field attackChain: Int
    Field shovelRenderTime: Int
    Field shovelRenderType: String = Item.NoItem
    Field shovelRenderX: Int
    Field shovelRenderY: Int
    Field castingFireball: Bool
    Field lastHitBeat: Int = -1
    Field dontLeap: Bool
    Field didCrownTeleport: Bool
    Field lastBeatX: Int
    Field lastBeatY: Int
    Field wasClamped: Bool
    Field helper: Player
    Field griefVONum: Int = 1
    Field globalIgnoreFlyToSlot: Bool
    Field hudDiamondForFlyingRender: Bool
    Field numBombs: Int
    Field hudSlotOffFlyFromPlayer: Bool[]
    Field hideQuantity: StringMap<Bool> = New StringMap<Bool>()
    Field holdingBagItems: List<String> = New List<String>()
    Field playerTempNum: Int = -1
    Field hudSlotInitialized: Bool
    Field numHudSlots: Int = 8
    Field hudSlot: Sprite[]
    Field numHudSlotsIncludingActionAndSpells: Int = 15
    Field hudSlotOff: Point2[]
    Field shovelImages: StringMap<Sprite> = New StringMap<Sprite>()
    Field tempoHeartText: TextSprite = New TextSprite(2, 2.0)
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
    Field lastMoveOntoPlayerInCoopModeBeat: Int = -1
    Field tempoBeatsLeft: Int = 16
    Field queuedMoveBeat: Int = -1
    Field minVisibilityCachedFrame: Int = -1
    Field minVisibilityCached: Float
    Field lastLOSX: Int = -9999
    Field lastLOSY: Int = -9999
    Field popUpController: ControllerPopUp
    Field warnState: Int
    Field hintsController: ControllerPopUp
    Field seedController: ControllerInputPopup
    Field crownOfGreedBeat: Int = -1
    Field lastWarDrumBeat: Int = -1
    Field lastBloodDrumBeat: Int = -1
    Field queuedMove: Bool
    Field queuedMoveX: Int
    Field queuedMoveY: Int
    Field wasShrunk: Bool
    Field electricityCounter: Int
    Field playedExitErrorSound: Bool
    Field lastClampedEnemy: EnemyClamper
    Field heartTransplantTime: Int = -1
    Field crownText: TextSprite = New TextSprite(2, 1.5)
    Field quantityText: StringMap<TextSprite> = New StringMap<TextSprite>()
    Field hudTextForInput: IntMap<TextSprite> = New IntMap<TextSprite>()
    Field hudText2ForInput: IntMap<TextSprite> = New IntMap<TextSprite>()
    Field hudSpriteForInput: IntMap<Sprite> = New IntMap<Sprite>()
    Field action1Text: TextSprite = New TextSprite(0, 1.5)
    Field action2Text: TextSprite = New TextSprite(0, 1.5)
    Field bombText: TextSprite = New TextSprite(0, 1.5)
    Field coinText: TextSprite = New TextSprite(0, 1.5)
    Field diamondText: TextSprite = New TextSprite(0, 1.5)
    Field hudDiamondForFlyingXOff: Float
    Field hudDiamondForFlyingYOff: Float
    Field spell1CoolText: TextSprite = New TextSprite(2, 1.0, -1, 10002)
    Field spell1CoolText2: TextSprite = New TextSprite(2, 1.0, -1, 10002)
    Field spell1CoolText3: TextSprite = New TextSprite(2, 1.0, -1, 10002)
    Field spell2CoolText: TextSprite = New TextSprite(2, 1.0, -1, 10002)
    Field spell2CoolText2: TextSprite = New TextSprite(2, 1.0, -1, 10002)
    Field spell2CoolText3: TextSprite = New TextSprite(2, 1.0, -1, 10002)
    Field trapSight: Float = 100.0
    Field deadRenderFrames: Int

    Method AddFamiliarAt: Void(offsetX: Int, offsetY: Int, item: Int)
        Debug.TraceNotImplemented("Player.AddFamiliarAt(Int, Int, Int)")
    End Method

    Method AddGeneralMetrics: Void(sendIt: Bool)
        Debug.TraceNotImplemented("Player.AddGeneralMetrics(Bool)")
    End Method

    Method AddItemOfType: Void(item: String, itemObj: Item, ignoreFlyTo: Bool, isInitialEquip: Bool)
        Debug.TraceNotImplemented("Player.AddItemOfType(String, Item, Bool, Bool)")
    End Method

    Method AddItemOfType_PreProcess: Bool(i: String, itemObj: Item)
        Debug.TraceNotImplemented("Player.AddItemOfType_PreProcess(String, Item)")
    End Method

    Method AfterEnemyMovement: Void()
        Debug.TraceNotImplemented("Player.AfterEnemyMovement()")
    End Method

    Method AfterHitHook: Void(nme: Object, hitX: Int, hitY: Int, dir: Int)
        Debug.TraceNotImplemented("Player.AfterHitHook(Object, Int, Int, Int)")
    End Method

    Method AttackDirection: Bool(dir: Int, isThrow: Bool)
        Debug.TraceNotImplemented("Player.AttackDirection(Int, Bool)")
    End Method

    Method AttemptOffbeatMove: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Player.AttemptOffbeatMove(Int, Int)")
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
        Self.floating = Self.HasItemOfType("feet_boots_winged", False) Or
                        Self.batFormActive

        If Self.floating
            Self.moveShadowTween = 3
            Self.moveTween = 3
        Else
            Self.moveShadowTween = 2
            Self.moveTween = 1
        End If

        Self.CheckConductorWire()
    End Method

    Method CheckVowOfPoverty: Void()
        Debug.TraceNotImplemented("Player.CheckVowOfPoverty()")
    End Method

    Method ClearAllFamiliars: Void(includeLamb: Bool)
        For Local familiar := EachIn Self.familiars
            familiar.Die()
        End For

        Self.familiars.Clear()

        If includeLamb
            If Self.lambFamiliar <> Null
                Self.lambFamiliar.Die()
            End If
        End If
    End Method

    Method ClearFamiliarAt: Void(offsetX: Int, offsetY: Int)
        Debug.TraceNotImplemented("Player.ClearFamiliarAt(Int, Int)")
    End Method

    Method CommitZap: Void()
        Debug.TraceNotImplemented("Player.CommitZap()")
    End Method

    Method ConsumeItemSlot: Bool(sl: Int)
        Debug.TraceNotImplemented("Player.ConsumeItemSlot(Int)")
    End Method

    Method ConsumeOne: Bool(item: Int)
        Debug.TraceNotImplemented("Player.ConsumeOne(Int)")
    End Method

    Method Die: Void()
        Self.ClearAllFamiliars(True)

        Super.Die()
    End Method

    Method DoBigDig: Bool(x0: Int, y0: Int, shovelDamage: Int, dir: Int, allowNoShovel: Bool)
        Debug.TraceNotImplemented("Player.DoBigDig(Int, Int, Int, Int, Bool)")
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
        Debug.TraceNotImplemented("Player.DoHitEffects(Int, Object, Int)")
    End Method

    Method DoNeed: Void()
        Debug.TraceNotImplemented("Player.DoNeed()")
    End Method

    Method DropBomb: Object()
        Debug.TraceNotImplemented("Player.DropBomb()")
    End Method

    Method DropItem: Object(i: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Player.DropItem(Int, Int, Int)")
    End Method

    Method EmptyAllSlots: Void(includeLamb: Bool)
        Self.ownedItems.Clear()
        Self.cursedSlots.Clear()
        Self.mysterySlots.Clear()
        Self.ClearAllFamiliars(includeLamb)
        Self.miscItems.Clear()
        Self.itemQuantity.Clear()

        Self.weapon = New Weapon(Item.NoItem)
        Self.armorAmount = 0
        Self.armorType = Item.NoItem
        Self.torchType = Item.NoItem

        Self.hasPickedUpWonderThisRun = False
        Self.hasPickedUpBlastHelmThisRun = False
        Self.hasPickedUpGrenadeCharmThisRun = False

        Self.UpdateBonusHeart()
    End Method

    Method EmptySlot: Void(sl: Int)
        Debug.TraceNotImplemented("Player.EmptySlot(Int)")
    End Method

    Method EnterBatForm: Void()
        Debug.TraceNotImplemented("Player.EnterBatForm()")
    End Method

    Method ExitBatForm: Void()
        Debug.TraceNotImplemented("Player.ExitBatForm()")
    End Method

    Method Fall: Void(keepMultiplier: Bool)
        Debug.TraceNotImplemented("Player.Fall(Bool)")
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
        Debug.TraceNotImplemented("Player.GetBonusDamage(Int)")
    End Method

    Method GetDamage: Int()
        Debug.TraceNotImplemented("Player.GetDamage()")
    End Method

    Method GetElectricStrength: Int()
        Debug.TraceNotImplemented("Player.GetElectricStrength()")
    End Method

    Method GetHUDQuantityText: Object(slot: Int)
        Debug.TraceNotImplemented("Player.GetHUDQuantityText(Int)")
    End Method

    Method GetItemInSlot: String(sl: String, overrideBatForm: Bool)
        If Self.batFormActive Or Not overrideBatForm
            Select sl
                Case "weapon"
                    Return "weapon_fangs"
                Case "head"
                    Return "head_sonar"
            End Select
        Else
            If Self.ownedItems.Contains(sl)
                Return Self.ownedItems.Get(sl)
            End If
        End If

        Return Item.NoItem
    End Method

    Method GetItemQuantity: Int(item: Int)
        Debug.TraceNotImplemented("Player.GetItemQuantity(Int)")
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
        Debug.TraceNotImplemented("Player.GetNewWeapon(Int)")
    End Method

    Method GetPositionLastBeat: Object()
        Debug.TraceNotImplemented("Player.GetPositionLastBeat()")
    End Method

    Method GetShovelDamage: Int(fromMinersCap: Bool)
        Debug.TraceNotImplemented("Player.GetShovelDamage(Bool)")
    End Method

    Method GetShovelDamageHelper: Int()
        Debug.TraceNotImplemented("Player.GetShovelDamageHelper()")
    End Method

    Method GetTorchLevel: Int()
        Debug.TraceNotImplemented("Player.GetTorchLevel()")
    End Method

    Method GetWeapon: Object(overrideBatForm: Bool)
        Debug.TraceNotImplemented("Player.GetWeapon(Bool)")
    End Method

    Method GiveInitialEquipment: Void(resetHealth: Bool)
        Debug.TraceNotImplemented("Player.GiveInitialEquipment(Bool)")
    End Method

    Method GotBlood: Void(amount: Int)
        Debug.TraceNotImplemented("Player.GotBlood(Int)")
    End Method

    Method GotKill: Void()
        Debug.TraceNotImplemented("Player.GotKill()")
    End Method

    Method GrantIBeats: Void(num: Int)
        Debug.TraceNotImplemented("Player.GrantIBeats(Int)")
    End Method

    Method HandleIceAndCoals: Void()
        Debug.TraceNotImplemented("Player.HandleIceAndCoals()")
    End Method

    Method HasCouponLike: Bool()
        Debug.TraceNotImplemented("Player.HasCouponLike()")
    End Method

    Method HasItemOfType: Bool(i: String, overrideBatForm: Bool)
        If Not Self.batFormActive Or overrideBatForm
            If Self.characterID = Character.Tempo
                If i = "head_sonar" Then Return True
            End If

            Local slot := Item.GetSlot(i)

            Select slot
                Case "misc"
                    Return Self.miscItems.Contains(i)
                Case "action"
                    If i = Self.GetItemInSlot("action1", False) Then Return True
                    If i = Self.GetItemInSlot("action2", False) Then Return True
                Case "spell"
                    If i = Self.GetItemInSlot("spell1", False) Then Return True
                    If i = Self.GetItemInSlot("spell2", False) Then Return True
            End Select

            Return i = Self.ownedItems.Get(slot)
        End If

        Select i
            Case "weapon_fangs",
                 "head_sonar"
                Return True
        End Select

        Return False
    End Method

    Method HasShovel: Bool()
        Debug.TraceNotImplemented("Player.HasShovel()")
    End Method

    Method HaveSecondActionSlot: Bool()
        Debug.TraceNotImplemented("Player.HaveSecondActionSlot()")
    End Method

    Method Heal: Void(amt: Int, fromFood: Bool, playVO: Bool, fromMagicFood: Bool)
        Debug.TraceNotImplemented("Player.Heal(Int, Bool, Bool, Bool)")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Player.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImmediatelyMoveTo: Void(xVal: Int, yVal: Int, fromKeyboard: Bool, fromClampedEnemy: Bool, fromBounceTrap: Bool, fromCourage: Bool, overrideStairs: Bool)
        Debug.TraceNotImplemented("Player.ImmediatelyMoveTo(Int, Int, Bool, Bool, Bool, Bool, Bool)")
    End Method

    Method IsAnythingInSlot: Bool(sl: Int)
        Debug.TraceNotImplemented("Player.IsAnythingInSlot(Int)")
    End Method

    Method IsBomblessCharacter: Bool()
        Select Self.characterID
            Case Character.Eli
                Return True
        End Select

        Return False
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
        Debug.TraceNotImplemented("Player.IsShrunk(Int, Int)")
    End Method

    Method IsSlotCursed: Bool(sl: Int)
        Debug.TraceNotImplemented("Player.IsSlotCursed(Int)")
    End Method

    Method IsVisible: Bool()
        Debug.TraceNotImplemented("Player.IsVisible()")
    End Method

    Method IsWeaponlessCharacter: Bool()
        Select Self.characterID
            Case Character.Melody,
                 Character.Aria,
                 Character.Eli,
                 Character.Dove,
                 Character.Coda
                Return True
        End Select

        Return False
    End Method

    Method KnockSelfBack: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Player.KnockSelfBack(Int, Int)")
    End Method

    Method LambDeath: Void()
        Debug.TraceNotImplemented("Player.LambDeath()")
    End Method

    Method LoadImages: Void()
        ' TODO: Determine how `idSuffix` is determined.
        Local idSuffix := ""
        Local alternateSkin := GameData.GetAlternateSkin(Self.characterID)
        If GameData.GetUseChoral()
            ' TODO: ???
        End If

        Self.UsingDorianAltSkin = False
        Self.UsingMelodyAltSkin = False
        Self.UsingDoveAltSkin = False
        Self.UsingCodaAltSkin = False
        Self.UsingEliAltSkin = False
        Self.UsingAltSkin = alternateSkin <> 0

        If alternateSkin = 3
            Self.UsingDorianAltSkin = True
        Else If alternateSkin <> 0
            Select Self.characterID
                Case Character.Melody
                    Self.UsingMelodyAltSkin = True
                Case Character.Dove
                    Self.UsingDoveAltSkin = True
                Case Character.Coda
                    Self.UsingCodaAltSkin = True
                Case Character.Eli
                    Self.UsingEliAltSkin = True
            End Select
        End If

        Self.image = Player.MakeBodyImage(Self.characterID, idSuffix, alternateSkin)
        Self.headImage = Player.MakeHeadImage(Self.characterID, idSuffix, alternateSkin)
        Self.headImageForHUD = Player.MakeHeadImage(Self.characterID, idSuffix, alternateSkin)
        Self.headImageForHUD.InWorld(False)
        Self.headImageForHUD.SetZ(10000.0)
        Self.shadow = New Sprite("entities/TEMP_shadow_standard.png", 1, Image.DefaultFlags)
        Self.xOff = 0.0
        Self.yOff = 3.0
    End Method

    Method MaybeOpenZap: Void(playerX: Int, playerY: Int, electricStrength: Int)
        Debug.TraceNotImplemented("Player.MaybeOpenZap(Int, Int, Int)")
    End Method

    Method MomentumDir: Int()
        Debug.TraceNotImplemented("Player.MomentumDir()")
    End Method

    Method MoveFamiliars: Void(deltaX: Int, deltaY: Int)
        Debug.TraceNotImplemented("Player.MoveFamiliars(Int, Int)")
    End Method

    Method MoveSoulFamiliars: Void(moveDir: Int)
        Debug.TraceNotImplemented("Player.MoveSoulFamiliars(Int)")
    End Method

    Method MoveTo: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Player.MoveTo(Int, Int)")
    End Method

    Method PainFlyaway: Void()
        Debug.TraceNotImplemented("Player.PainFlyaway()")
    End Method

    Method PerformTween: Void(xVal: Int, yVal: Int, oldX: Int, oldY: Int, tweenType: Int, shadowTweenType: Int, bufferTween: Bool)
        Debug.TraceNotImplemented("Player.PerformTween(Int, Int, Int, Int, Int, Int, Bool)")
    End Method

    Method Perished: Bool()
        Debug.TraceNotImplemented("Player.Perished()")
    End Method

    Method PermitMoveFail: Bool()
        Debug.TraceNotImplemented("Player.PermitMoveFail()")
    End Method

    Method PlayVO: Void(voSound: Int)
        Debug.TraceNotImplemented("Player.PlayVO(Int)")
    End Method

    Method ProcessDropMystery: Void(item: Object, slot: Int)
        Debug.TraceNotImplemented("Player.ProcessDropMystery(Object, Int)")
    End Method

    Method ProcessMoveQueue: Void()
        Debug.TraceNotImplemented("Player.ProcessMoveQueue()")
    End Method

    Method ProcessSlotOffsets: Object(tmpSlotNum: Int, tmpX: Int, tmpY: Int)
        Debug.TraceNotImplemented("Player.ProcessSlotOffsets(Int, Int, Int)")
    End Method

    Method ProcessSlotOffsets2: Object(tmpSlot: Int, tmpX: Int, tmpY: Int)
        Debug.TraceNotImplemented("Player.ProcessSlotOffsets2(Int, Int, Int)")
    End Method

    Method ProcessTheResultsOfEquippingItem: Void(item: Int)
        Debug.TraceNotImplemented("Player.ProcessTheResultsOfEquippingItem(Int)")
    End Method

    Method ProcessTheResultsOfLosingItem: Void(i: Int)
        Debug.TraceNotImplemented("Player.ProcessTheResultsOfLosingItem(Int)")
    End Method

    Method PutItemInSlot: Void(sl: Int, i: Int, ignoreFlyTo: Bool)
        Debug.TraceNotImplemented("Player.PutItemInSlot(Int, Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Player.Render()")
    End Method

    Method RenderHUD: Void(position: Int, small: Bool)
        Debug.TraceNotImplemented("Player.RenderHUD(Int, Bool)")
    End Method

    Method RenderHUDSlotHotkey: Void(inputMove: Int, slotX: Int, slotY: Int, slotSize: Int, scale: Float, overrideBatForm: Bool)
        Debug.TraceNotImplemented("Player.RenderHUDSlotHotkey(Int, Int, Int, Int, Float, Bool)")
    End Method

    Method RenderHUDSlotQuantity: Void(textSprite: Object, num: Int, slotX: Int, slotY: Int, slotSize: Int, scale: Float, alpha: Float)
        Debug.TraceNotImplemented("Player.RenderHUDSlotQuantity(Object, Int, Int, Int, Int, Float, Float)")
    End Method

    Method RenderHUDSlotQuantity2: Void(textSprite: Object, item: Int, slotX: Int, slotY: Int, slotSize: Int, scale: Float, alpha: Float)
        Debug.TraceNotImplemented("Player.RenderHUDSlotQuantity2(Object, Int, Int, Int, Int, Float, Float)")
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
           Self.lambFamiliar = Null
            ' Bring Marv back to life.
            Self.lambFamiliar = New Familiar(Self)
        End If

        Self.CheckFloating()
    End Method

    Method ScatterItems: Void()
        Debug.TraceNotImplemented("Player.ScatterItems()")
    End Method

    Method SetCharacter: Void(charNum: Int)
        If charNum > 13 Then charNum = Character.Cadence

        Self.characterID = charNum
        Self.LoadImages()
        Self.EmptyAllSlots(True)
        Self.GiveInitialEquipment(True)
    End Method

    Method SetDugRecently: Void()
        Debug.TraceNotImplemented("Player.SetDugRecently()")
    End Method

    Method SetSlotCursed: Void(sl: Int, b: Bool)
        Debug.TraceNotImplemented("Player.SetSlotCursed(Int, Bool)")
    End Method

    Method SetSlotMystery: Void(sl: Int, b: Bool)
        Debug.TraceNotImplemented("Player.SetSlotMystery(Int, Bool)")
    End Method

    Method SetTotallyBlank: Void()
        Debug.TraceNotImplemented("Player.SetTotallyBlank()")
    End Method

    Method StopFalling: Void()
        If Self.falling
            Self.falling = False

            Self.image.UnsetCutoffY()
            Self.headImage.UnsetCutoffY()
            Self.shadow.UnsetCutoffY()
            Self.shieldImageFront.UnsetCutoffY()
            Self.shieldImageBack.UnsetCutoffY()
        End If
    End Method

    Method SubtractItemOfType: Bool(i: Int)
        Debug.TraceNotImplemented("Player.SubtractItemOfType(Int)")
    End Method

    Method SubtractKey: Bool()
        Debug.TraceNotImplemented("Player.SubtractKey()")
    End Method

    Method SwapWeapons: Bool()
        Debug.TraceNotImplemented("Player.SwapWeapons()")
    End Method

    Method TestCourage: Bool(beat: Int)
        Debug.TraceNotImplemented("Player.TestCourage(Int)")
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
        Debug.TraceNotImplemented("Player.TurnSlotInto(Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Player.Update()")
    End Method

    Method UpdateBonusHeart: Void()
        If Self.HasItemOfType("ring_wonder", False) Or
           Self.HasItemOfType("ring_peace", False)
            Self.health.GainBonusHeart()
        Else
            Self.health.LoseBonusHeart()
        End If
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
        Debug.TraceNotImplemented("Player.WarpTo(Int, Int)")
    End Method

End Class

Class EnchantWeaponPredicate Implements IItemPredicate

    Function _EditorFix: Void() End

    Method New(oldItem_: Int, shapeClass_: Int)
        Debug.TraceNotImplemented("EnchantWeaponPredicate.New(Int, Int)")
    End Method

    Field oldItem: String
    Field shapeClass: String

    Method Call: Bool(n: Object)
        Debug.TraceNotImplemented("EnchantWeaponPredicate.Call(Object)")
    End Method

End Class

Class Character

    Const None: Int = -1
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
    Const Unknown14: Int = 14
    Const Unknown15: Int = 15

End Class
