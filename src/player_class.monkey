'Strict

Import monkey.list
Import monkey.map
Import monkey.math
Import monkey.set
Import mojo.app
Import mojo.graphics
Import enemy
Import enemy.enemyclamper
Import gui.controller_game
Import gui.controller_input_popup
Import gui.controller_popup
Import gui.flyaway
Import gui.minimap
Import familiar
Import familiar_fixed.soul_familiar
Import level
Import level.advancelevel_callback
Import audio2
Import bouncer
Import camera
Import chain
Import entity
Import familiar
Import familiar_fixed
Import gamedata
Import item
Import logger
Import mobileentity
Import necrodancer
Import necrodancergame
Import player_health
Import point
Import saleitem
Import salechest
Import shrine
Import spells
Import sprite
Import textlog
Import textsprite
Import tile
Import util
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

    Function ActuallyPlayVO: Void(voSound: String, player: Player)
        Debug.TraceNotImplemented("Player.ActuallyPlayVO(String, Player)")
    End Function

    Function AddCoins: Void(tmpNum: Int)
        Debug.TraceNotImplemented("Player.AddCoins(Int)")
    End Function

    Function AllPlayersPerished: Bool()
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If Not player.perished And
               Not player.isHelper
                If player.helper = Null Or
                   Not player.helper.perished
                    Return False
                End If
            End If
        End For

        Return True
    End Function

    Function AnyPlayerInSpecialRoom: Bool()
        Debug.TraceNotImplemented("Player.AnyPlayerInSpecialRoom()")
    End Function

    Function AnyPlayerPeace: Bool()
        Debug.TraceNotImplemented("Player.AnyPlayerPeace()")
    End Function

    Function AnyPlayerTemporaryMapSight: Bool()
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If Not player.Perished() And
               player.temporaryMapSight
                Return True
            End If
        End For

        Return False
    End Function

    Function ArePrototypesEnabled: Bool()
        Return necrodancer.DEBUG_BUILD And
               controller_game.debugEnablePrototypes
    End Function

    Function CheckAllModeCompletion: Void()
        If GameData.GetStoryModeComplete() And
           GameData.GetPhasingModeComplete() And
           GameData.GetMysteryModeComplete() And
           GameData.GetRandomizerModeComplete() And
           GameData.GetHardModeComplete() And
           GameData.GetNoReturnModeComplete()
            Util.IncrementSteamStat("AllModeCompletion", True, True)
        End If
    End Function

    Function CheckCoinXOR: Bool()
        Return Player.coinXOR = Player.numCoins ~ $1D69
    End Function

    Function ChooseNewPlayer1: Void()
        Debug.TraceNotImplemented("Player.ChooseNewPlayer1()")
    End Function

    Function DoesAnyPlayerHaveItemOfType: Bool(it: String, overrideBatForm: Bool = False)
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player.HasItemOfType(it, overrideBatForm) Then Return True
        End For

        Return False
    End Function

    Function DoesPlayer1HaveItemOfType: Bool(i: String)
        Local player1 := controller_game.players[controller_game.player1]

        Return player1.HasItemOfType(i)
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

    Function GetSlotNum: Int(sl: String)
        Debug.TraceNotImplemented("Player.GetSlotNum(String)")
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
        Select controller_game.currentLevel
            Case LevelType.FinalBossBattle
                Return True
            Case LevelType.BossBattle
                Return Util.IsCharacterActive(Character.Cadence) Or
                       Util.IsCharacterActive(Character.Melody) Or
                       Util.IsCharacterActive(Character.Aria) Or
                       Util.IsCharacterActive(Character.Nocturna)
            Case LevelType.Level3
                Return Util.IsCharacterActive(Character.Dove) And
                       Player.IsSolo()
        End Select

        Return False
    End Function

    Function IsSolo: Bool()
        Select controller_game.numPlayers
            Case 1
                Return True
            Case 2
                Return controller_game.players[1].isHelper
        End Select

        Return False
    End Function

    Function IsUnpreventableDamage: Bool(damageSource: Int)
        Debug.TraceNotImplemented("Player.IsUnpreventableDamage(Int)")
    End Function

    Function MakeBodyImage: Sprite(characterID: Int, idSuffix: String, altSkin: Int)
        Local path: String
        Local frameW: Int
        Local frameH: Int
        Local numFrames: Int

        Select altSkin
            Case 0
                Select characterID
                    Case Character.Cadence
                        path = "entities/player" + idSuffix + "_armor_body.png"
                        frameW = 24
                        frameH = 24
                        numFrames = 224
                    Case Character.Dorian
                        path = "entities/char" + characterID + "_armor_body.png"
                        frameW = 33
                        frameH = 32
                        numFrames = 16
                    Case Character.Eli
                        path = "entities/char" + characterID + "_armor_body.png"
                        frameW = 33
                        frameH = 28
                        numFrames = 224
                    Case Character.Coda
                        path = "entities/char" + characterID + "_armor_body.png"
                        frameW = 33
                        frameH = 30
                        numFrames = 224
                    Case Character.Nocturna
                        path = "entities/char" + characterID + "_armor_body.png"
                        frameW = 25
                        frameH = 27
                        numFrames = 240
                    Default
                        path = "entities/char" + characterID + "_armor_body.png"
                        frameW = 24
                        frameH = 24
                        numFrames = 224
                End Select
            Case 3
                path = "entities/jp" + altSkin + "_armor_body.png"
                frameW = 33
                frameH = 32
                numFrames = 16
            Default
                path = "entities/jp" + altSkin + "_armor_body.png"
                frameW = 24
                frameH = 24
                numFrames = 224
        End Select

        Return New Sprite(path, frameW, frameH, numFrames, Image.MidHandle)
    End Function

    Function MakeHeadImage: Sprite(characterID: Int, idSuffix: String, altSkin: Int)
        Local path: String
        Local frameW: Int
        Local frameH: Int
        Local numFrames: Int

        If altSkin <> 0
            path = "entities/jp" + altSkin + "_heads.png"
            frameW = Player.AltHeadWidths[altSkin]
            frameH = Player.AltHeadHeights[altSkin]
            numFrames = 32
        Else
            Select characterID
                Case Character.Cadence
                    path = "entities/player" + idSuffix + "_heads.png"
                    frameW = 24
                    frameH = 24
                    numFrames = 32
                Case Character.Dove
                    path = "entities/char" + characterID + "_heads.png"
                    frameW = 24
                    frameH = 28
                    numFrames = 32
                Case Character.Dorian
                    path = "entities/char" + characterID + "_heads.png"
                    frameW = 33
                    frameH = 32
                    numFrames = 32
                Case Character.Eli
                    path = "entities/char" + characterID + "_heads.png"
                    frameW = 33
                    frameH = 28
                    numFrames = 32
                Case Character.Coda
                    path = "entities/char" + characterID + "_heads.png"
                    frameW = 33
                    frameH = 30
                    numFrames = 32
                Case Character.Nocturna
                    path = "entities/char" + characterID + "_heads.png"
                    frameW = 25
                    frameH = 27
                    numFrames = 32
                Default
                    path = "entities/char" + characterID + "_heads.png"
                    frameW = 24
                    frameH = 24
                    numFrames = 32
            End Select
        End If

        Return New Sprite(path, frameW, frameH, numFrames, Image.MidHandle)
    End Function

    Function NumEnabledCharacters: Int()
        Return 14
    End Function

    Function OffsetCoins: Void(tmpNum: Int)
        Local coins := math.Max(0, Player.numCoins + tmpNum)
        Player.SetCoins(coins, True)
    End Function

    Function PlayersHaveMovedThisBeat: Bool()
        If Audio.fixedBeatNum = -64
            ' TODO: Double check this.
            For Local i := 0 Until controller_game.numPlayers
                Local player := controller_game.players[i]
                If Not player.Perished() And
                   controller_game.lastPlayerMoveBeat[i] < Audio.GetClosestBeatNum(True) And
                   player.lastIceSlideBeat < Audio.GetClosestBeatNum(True) And
                   player.queuedMoveBeat < Audio.GetClosestBeatNum(True) And
                   Not player.queuedMove
                    Local percentDist := Audio.GetDistanceFromNearestBeat() / Audio.GetNextBeatDuration()

                    Return percentDist > 1.0
                End If
            End For

            Debug.TraceNotImplemented("Player.PlayersHaveMovedThisBeat()")

            Return True
        End If

        Return controller_game.incrementFixedBeatNum
    End Function

    Function PlayVOPlayer1: Void(voSound: String)
        Debug.TraceNotImplemented("Player.PlayVOPlayer1(String)")
    End Function

    Function SetCoins: Void(tmpNum: Int, allowAchievement: Bool)
        Player.numCoins = tmpNum
        Player.SetCoinXOR()

        If tmpNum > Player.sessionMaxCoins
            If allowAchievement
                ' SKIPPED: Steam achievements
            End If

            Player.sessionMaxCoins = tmpNum
        End If
    End Function

    Function SetCoinXOR: Void()
        Player.coinXOR = Player.numCoins ~ $1D69
    End Function

    Function UpdateAll: Void()
        Debug.TraceNotImplemented("Player.UpdateAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(id: Int, characterID_: Int = Character.None)
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
                Self.hudSlot[i] = New Sprite("gui/hud_slot_" + (i + 1) + ".png", 1)
                Self.hudSlot[i].InWorld = False
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
            Local name := shovel.name
            Local path := shovel.value
            Local image := New Sprite("items/" + path, itemData.imageW, itemData.imageH, itemData.imageFrames)
            image.SetZ(10000.0)
            Self.shovelImages.Set(name, image)
        End For

        Self.tempoHeartText.zVal = 10002

        If Player.hudCoins = Null Then Player.hudCoins = New Sprite("gui/hud_coins.png", 1)
        Player.hudCoins.InWorld = False
        Player.hudCoins.SetZ(10000.0)
        If Player.hudDiamonds = Null Then Player.hudDiamonds = New Sprite("gui/diamond.png", 1)
        Player.hudDiamonds.InWorld = False
        Player.hudDiamonds.SetZ(10000.0)

        If Self.hudSlotAction1 = Null Then Self.hudSlotAction1 = New Sprite("gui/hud_slot_action1.png", 1)
        Self.hudSlotAction1.InWorld = False
        Self.hudSlotAction1.SetZ(10001.0)
        If Self.hudSlotAction2 = Null Then Self.hudSlotAction2 = New Sprite("gui/hud_slot_action2.png", 1)
        Self.hudSlotAction2.InWorld = False
        Self.hudSlotAction2.SetZ(10001.0)
        If Self.hudSlotAction2Empty = Null Then Self.hudSlotAction2Empty = New Sprite("gui/hud_slot_action2_empty.png", 1)
        Self.hudSlotAction2Empty.InWorld = False
        Self.hudSlotAction2Empty.SetZ(10001.0)
        If Self.hudSlotWeapon2 = Null Then Self.hudSlotWeapon2 = New Sprite("gui/hud_slot_weapon2.png", 1)
        Self.hudSlotWeapon2.InWorld = False
        Self.hudSlotWeapon2.SetZ(10001.0)
        If Self.hudSlotWeapon2Empty = Null Then Self.hudSlotWeapon2Empty = New Sprite("gui/hud_slot_weapon2_empty.png", 1)
        Self.hudSlotWeapon2Empty.InWorld = False
        Self.hudSlotWeapon2Empty.SetZ(10001.0)
        If Self.hudSlotWeaponReload = Null Then Self.hudSlotWeaponReload = New Sprite("gui/hud_slot_reload.png", 1)
        Self.hudSlotWeaponReload.InWorld = False
        Self.hudSlotWeaponReload.SetZ(10001.0)
        If Self.hudSlotWeaponThrow = Null Then Self.hudSlotWeaponThrow = New Sprite("gui/hud_slot_throw.png", 1)
        Self.hudSlotWeaponThrow.InWorld = False
        Self.hudSlotWeaponThrow.SetZ(10001.0)
        If Self.hudSlotWeaponThrow2 = Null Then Self.hudSlotWeaponThrow2 = New Sprite("gui/hud_slot_throw2.png", 1)
        Self.hudSlotWeaponThrow2.InWorld = False
        Self.hudSlotWeaponThrow2.SetZ(10001.0)
        If Self.hudSlotBoots = Null Then Self.hudSlotBoots = New Sprite("gui/hud_slot_boots.png", 1)
        Self.hudSlotBoots.InWorld = False
        Self.hudSlotBoots.SetZ(10001.0)
        If Self.hudSlotBoots2 = Null Then Self.hudSlotBoots2 = New Sprite("gui/hud_slot_boots2.png", 1)
        Self.hudSlotBoots2.InWorld = False
        Self.hudSlotBoots2.SetZ(10001.0)
        If Self.hudSlotBoots3 = Null Then Self.hudSlotBoots3 = New Sprite("gui/hud_slot_boots3.png", 1)
        Self.hudSlotBoots3.InWorld = False
        Self.hudSlotBoots3.SetZ(10001.0)
        If Self.hudSlotBomb = Null Then Self.hudSlotBomb = New Sprite("gui/hud_slot_bomb.png", 1)
        Self.hudSlotBomb.InWorld = False
        Self.hudSlotBomb.SetZ(10001.0)
        If Self.hudSlotSpell1 = Null Then Self.hudSlotSpell1 = New Sprite("gui/hud_slot_spell1.png", 1)
        Self.hudSlotSpell1.InWorld = False
        Self.hudSlotSpell1.SetZ(10001.0)
        If Self.hudSlotSpell2 = Null Then Self.hudSlotSpell2 = New Sprite("gui/hud_slot_spell2.png", 1)
        Self.hudSlotSpell2.InWorld = False
        Self.hudSlotSpell2.SetZ(10001.0)
        If Self.hudDiamondForFlying = Null Then Self.hudDiamondForFlying = New Sprite("gui/diamond.png", 1)
        Self.hudDiamondForFlying.InWorld = False
        Self.hudDiamondForFlying.SetZ(10001.0)

        If Self.mysteryWeaponImage = Null Then Self.mysteryWeaponImage = New Sprite("items/weapon_uncertainty.png", 24, 25, 2)
        If Self.mysteryRingImage = Null Then Self.mysteryRingImage = New Sprite("items/ring_uncertainty.png", 19, 19, 2)

        Self.bounce = New Bouncer(-2.5, 0.0, 1.5, 20)
        Self.bounce.Disable()
        Self.wobbler = New Bouncer(-2.5, 0.0, 1.5, 13)

        Self.frozenImage = New Sprite("entities/frozen_feet_medium.png", 31, 24, 2)
        Self.frozenStoneImage = New Sprite("entities/stone_feet.png", 17, 9, 1)
        Self.shieldImageBack = New Sprite("spells/shield_back.png", 34, 35, 3)
        Self.shieldImageFront = New Sprite("spells/shield_front.png", 34, 35, 3)

        If Not Level.isReplaying
            Player.numDiamonds = GameData.GetPlayerDiamonds()
        End If

        If Not Player.heartsLoaded
            Player.heart = New Sprite("gui/heart.png", 1)
            Player.heart.InWorld = False
            Player.heart.SetZ(10000.0)
            Player.heartEmpty = New Sprite("gui/heart_empty.png", 1)
            Player.heartEmpty.InWorld = False
            Player.heartEmpty.SetZ(10000.0)
            Player.heartHalf = New Sprite("gui/heart_half.png", 1)
            Player.heartHalf.InWorld = False
            Player.heartHalf.SetZ(10000.0)
            Player.cursedHeart = New Sprite("gui/cursed_heart.png", 1)
            Player.cursedHeart.InWorld = False
            Player.cursedHeart.SetZ(10000.0)
            Player.cursedHeartEmpty = New Sprite("gui/cursed_heart_empty.png", 1)
            Player.cursedHeartEmpty.InWorld = False
            Player.cursedHeartEmpty.SetZ(10000.0)
            Player.cursedHeartHalf = New Sprite("gui/cursed_heart_half.png", 1)
            Player.cursedHeartHalf.InWorld = False
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
    Field armorType: String = ItemType.NoItem
    Field torchType: String = ItemType.NoItem
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
    Field shovelRenderType: String = ItemType.NoItem
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
        Select Self.characterID
            Case Character.Dove,
                 Character.Aria,
                 Character.Eli,
                 Character.Melody,
                 Character.Coda
                If Item.IsItemOfType(item, "isWeapon")
                    Select item
                        Case ItemType.Dagger,
                             ItemType.Flower,
                             ItemType.Eli,
                             ItemType.GoldenLute
                            ' Do nothing
                        Default
                            If controller_game.currentLevel <> LevelType.Lobby
                                Self.Hit("COWARDICE", 99999)
                            End If
                    End Select
                End If
        End Select

        If Not isInitialEquip And
           Not Self.isHelper And
           Not Item.IsItemOfType(item, "isCoin") And
           Not Item.IsItemOfType(item, "isDiamond") And
           Not (item = ItemType.Dagger) And
           Not (item = ItemType.Shovel) And
           Not (item = ItemType.Spear And Self.characterID = Character.Bolt) And
           Not (item = ItemType.BloodDagger And Self.characterID = Character.Tempo) And
           Not (item = ItemType.Spear And Self.characterID = Character.Mary)
            Level.isAllCharsRunNoItemsNoShrines = False
            
            If Level.isRunNoItemsNoShrines
                Level.isRunNoItemsNoShrines = False

                TextLog.Message("No longer low%!  Picked up a non-coin/diamond item.")
            End If
        End If

        Item.AddToSeenItems(item)

        If itemObj <> Null And
           controller_game.currentLevel = LevelType.Lobby And
           Not itemObj.trainingWeapon
            Select item
                Case ItemType.Diamond5,
                     ItemType.Diamond10,
                     ItemType.Diamond15,
                     ItemType.Diamond20,
                     ItemType.Key,
                     ItemType.PermanentHeartContainer2,
                     ItemType.PermanentHeartContainer3,
                     ItemType.PermanentHeartContainer4,
                     ItemType.PermanentHeartContainer5,
                     ItemType.PermanentHeartContainer6
                    ' Do nothing
                Default
                    If itemObj.janitorItem
                        GameData.SetItemCleaned(item, True)
                        GameData.RemovePendingSpawnItem(item)

                        Local flyawayText := itemObj.GetFlyawayText()
                        If flyawayText <> ""
                            flyawayText += "|269| CLEANED!|"
                            Local flyaway := New Flyaway(flyawayText, Self.x, Self.y, 0, -6, True, 0.0, 0.2, True, 120)
                            flyaway.CenterX()
                        End If

                        Return
                    End If

                    If itemObj.diamondDealerItem
                        GameData.AddDiamondDealerItem(item)

                        Local flyawayText := itemObj.GetFlyawayText()
                        If flyawayText <> ""
                            flyawayText += "|270| PURCHASED!|"
                            Local flyaway := New Flyaway(flyawayText, Self.x, Self.y, 0, -6, True, 0.0, 0.2, True, 120)
                            flyaway.CenterX()
                        End If

                        Return
                    End If

                    If Not Level.isReplaying
                        GameData.SetItemUnlocked(item)
                    End If

                    Local includeUnlockedInFlyaway: Bool

                    Select item
                        Case ItemType.AddRedChest,
                             ItemType.AddPurpleChest,
                             ItemType.AddBlackChest,
                             ItemType.CoinMultiplier1,
                             ItemType.CoinMultiplier2
                            ' Do nothing
                        Default
                            GameData.AddPendingSpawnItem(item)

                            includeUnlockedInFlyaway = True
                    End Select

                    Local flyawayText := itemObj.GetFlyawayText()
                    If flyawayText <> ""
                        If includeUnlockedInFlyaway
                            flyawayText += "|271| UNLOCKED!|"
                        End If
                        
                        Local flyaway := New Flyaway(flyawayText, Self.x, Self.y, 0, -6, True, 0.0, 0.2, True, 120)
                        flyaway.CenterX()
                    End If

                    Return
            End Select
        End If

        Self.globalIgnoreFlyToSlot = ignoreFlyTo

        If Not Self.AddItemOfType_PreProcess(item, itemObj)
            Return
        End If

        Self.globalIgnoreFlyToSlot = False

        If itemObj <> Null And
           itemObj.isMystery
            Local slot := itemObj.GetSlot()
            Self.SetSlotMystery(slot, True)
        End If

        If Item.IsItemOfType(item, "isCoin")
            Self.CheckVowOfPoverty()

            If itemObj <> Null
                Local numCoins := itemObj.GetValue()
                Player.AddCoins(numCoins)
                Self.coinPickupBeat = controller_game.lastPlayerMoveBeat[Self.playerID]
            End If
        End If

        If Item.IsItemOfType(item, "isDiamond") And
           Not Level.isReplaying
            Local numDiamonds := itemObj.GetValue()
            Player.numDiamonds += numDiamonds
        End If

        Select item
            Case ItemType.Diamond5,
                 ItemType.Diamond10,
                 ItemType.Diamond15,
                 ItemType.Diamond20
                If Not Level.isReplaying
                    Player.numDiamonds += 5 * controller_game.currentZone
                End If

                GameData.SetZoneHoardCollected(controller_game.currentZone)
            Case ItemType.Coin50
                Self.CheckVowOfPoverty()
                Player.AddCoins(50)
                Self.coinPickupBeat = controller_game.lastPlayerMoveBeat[Self.playerID]
            Case ItemType.Coin100
                Self.CheckVowOfPoverty()
                Player.AddCoins(100)
                Self.coinPickupBeat = controller_game.lastPlayerMoveBeat[Self.playerID]
            Case ItemType.Coin150
                Self.CheckVowOfPoverty()
                Player.AddCoins(150)
                Self.coinPickupBeat = controller_game.lastPlayerMoveBeat[Self.playerID]
            Case ItemType.CrownOfThorns
                Self.Hit("crownOfThorns", 1)
            Case ItemType.BootsOfPain
                Self.Hit("BOOTS OF PAIN", 3)
            Case ItemType.RingOfPain
                Self.Hit("RING OF PAIN", 1)
            Case ItemType.HeartContainer
                Self.health.GainHearts(1, True)
            Case ItemType.DoubleHeartContainer
                Self.health.GainHearts(2, True)
            Case ItemType.CursedHeartContainer
                Self.health.GainCursedHearts(1)
            Case ItemType.CursedDoubleHeartContainer
                Self.health.GainCursedHearts(2)
            Case ItemType.EmptyHeartContainer
                Self.health.GainHearts(1, False)
            Case ItemType.EmptyDoubleHeartContainer
                Self.health.GainHearts(2, False)
            Case ItemType.PermanentHeartContainer2
                GameData.SetPlayerHealthMax(4)

                For Local i := 0 Until controller_game.numPlayers
                    Local player := controller_game.players[i]
                    player.health.Reset()
                End For
            Case ItemType.PermanentHeartContainer3
                GameData.SetPlayerHealthMax(6)

                For Local i := 0 Until controller_game.numPlayers
                    Local player := controller_game.players[i]
                    player.health.Reset()
                End For
            Case ItemType.PermanentHeartContainer4
                GameData.SetPlayerHealthMax(8)

                For Local i := 0 Until controller_game.numPlayers
                    Local player := controller_game.players[i]
                    player.health.Reset()
                End For
            Case ItemType.PermanentHeartContainer5
                GameData.SetPlayerHealthMax(10)

                For Local i := 0 Until controller_game.numPlayers
                    Local player := controller_game.players[i]
                    player.health.Reset()
                End For
            Case ItemType.PermanentHeartContainer6
                GameData.SetPlayerHealthMax(12)

                For Local i := 0 Until controller_game.numPlayers
                    Local player := controller_game.players[i]
                    player.health.Reset()
                End For
            Case ItemType.Bomb
                Self.numBombs += 1
            Case ItemType.Bomb3
                Self.numBombs += 3
            Case ItemType.BlastHelm
                If Not Self.hasPickedUpBlastHelmThisRun
                    Self.numBombs += 3
                    Self.hasPickedUpBlastHelmThisRun = True
                End If
            Case ItemType.GrenadeCharm
                If Not Self.hasPickedUpGrenadeCharmThisRun
                    Self.numBombs += 3
                    Self.hasPickedUpGrenadeCharmThisRun = True
                End If
            Default
                If Item.IsItemOfType(item, "isSpell")
                    Local spellLearned := Spells.LearnSpell(item)
                    If spellLearned <> SpellType.None
                        Self.DropItem(spellLearned)
                    End If

                    If item <> SpellType.Transform
                        Select item
                            Case Spells.spellSlot1
                                Local slotNum := Player.GetSlotNum("spell1")
                                Self.hudSlotOffFlyFromPlayer[slotNum] = True
                            Case Spells.spellSlot2
                                Local slotNum := Player.GetSlotNum("spell2")
                                Self.hudSlotOffFlyFromPlayer[slotNum] = True
                        End Select
                    End If
                End If
        End Select

        Self.ProcessTheResultsOfEquippingItem(item)

        If itemObj <> Null And
           Not itemObj.isMystery
            Local flyawayText := itemObj.GetFlyawayText()
            If flyawayText <> ""
                If Item.IsItemOfType(item, "isCoin")
                    Local flyaway := New Flyaway(flyawayText, itemObj.x, itemObj.y, 0, -6, True, 0.0, 0.2, True, 120)
                    flyaway.CenterX()
                Else
                    Local flyaway := New Flyaway(flyawayText, Self.x, Self.y, 0, -6, True, 0.0, 0.2, True, 120)
                    flyaway.CenterX()
                End If
            End If
        End If
    End Method

    Method AddItemOfType_PreProcess: Bool(i: String, itemObj: Item)
        If Item.IsItemOfType(i, "isDiamond")
            Self.hudDiamondForFlyingRender = True
        End If

        Local itemNode := Item.GetItemXML(i)
        Local consumable := itemNode.GetAttribute("consumable", False)
        If consumable
            Return True
        End If

        Local slot := Item.GetSlot(i)

        Select i
            Case ItemType.NoItem
                Return True
            Case ItemType.Bomb
                Local ignoreFlyTo := Self.numBombs > 0
                Self.PutItemInSlot(slot, i, ignoreFlyTo)
            Default
                If itemObj <> Null
                    If itemObj.IsItemOfType("isStackable")
                        Local itemQuantity := itemObj.stackQuantity
                        Local hasItem := Self.itemQuantity.Contains(i)
                        If hasItem
                            Local currentItemQuantity := Self.itemQuantity.Get(i)
                            itemQuantity += currentItemQuantity
                        End If

                        Self.itemQuantity.Set(i, itemQuantity)

                        Local hideQuantity := itemObj.hideQuantity
                        Self.hideQuantity.Set(i, hideQuantity)

                        If hasItem
                            Return True
                        End If
                    End If
                Else
                    If i = ItemType.Cookies
                        Local itemNode := Item.GetItemXML(i)

                        Local itemQuantity := itemNode.GetAttribute("quantity", 1)
                        Local hasItem := Self.itemQuantity.Contains(i)
                        If hasItem
                            Local currentItemQuantity := Self.itemQuantity.Get(i)
                            itemQuantity += currentItemQuantity
                        End If

                        Self.itemQuantity.Set(i, itemQuantity)

                        Local hideQuantity := itemNode.GetAttribute("hideQuantity", False)
                        Self.hideQuantity.Set(i, hideQuantity)

                        If hasItem
                            Return True
                        End If
                    End If
                End If

                If slot <> "spell"
                    Select i
                        Case ItemType.Potion
                            If Self.HasItemOfType(i, True)
                                Self.DropItem(i)

                                Return False
                            End If
                        Case ItemType.Holster
                            If Self.HasItemOfType(ItemType.Backpack, True) And
                               Self.HasItemOfType(ItemType.PackOfHolding, True)
                                If Self.HasItemOfType(ItemType.Backpack, True)
                                    Self.DropItem(ItemType.Backpack)
                                End If

                                If Self.HasItemOfType(ItemType.PackOfHolding, True)
                                    Self.DropItem(ItemType.PackOfHolding)
                                End If

                                Local action2ItemName := Self.ownedItems.Get("action2")
                                Select action2ItemName
                                    Case "",
                                         ItemType.Backpack,
                                         ItemType.PackOfHolding
                                        ' Do nothing
                                    Default
                                        Self.DropItem(action2ItemName)
                                End Select

                                Self.PutItemInSlot("action2", ItemType.NoItem, False)

                                Return True
                            End If
                        Case ItemType.Backpack,
                             ItemType.PackOfHolding
                            If Self.HasItemOfType(ItemType.Holster, True)
                                Self.DropItem(ItemType.Holster)

                                Local weapon2ItemName := Self.ownedItems.Get("weapon2")
                                Select weapon2ItemName
                                    Case "",
                                         ItemType.Holster
                                        ' Do nothing
                                    Default
                                        Local droppedItem := Item.DropItem(Self.x, Self.y, weapon2ItemName)
                                        Self.PutItemInSlot("weapon2", ItemType.NoItem, False)
                                        Self.ProcessDropMystery(droppedItem, "weapon2")
                                End Select

                                Self.PutItemInSlot(slot, i, False)

                                Return True
                            End If
                        Default
                            Select slot
                                Case "weapon"
                                    If Not Self.IsAnythingInSlot(slot)
                                        Self.PutItemInSlot(slot, i, False)

                                        Return True
                                    End If

                                    If Self.HasItemOfType(ItemType.Holster, True)
                                        Local weapon2ItemName := ItemType.NoItem
                                        If Self.IsAnythingInSlot("weapon2")
                                            weapon2ItemName = Self.ownedItems.Get("weapon2")
                                        End If

                                        Local weaponItemName := Self.ownedItems.Get(slot)
                                        Self.PutItemInSlot("weapon2", weaponItemName, True)

                                        Local flyaway := New Flyaway("|268|(OLD WEAPON HOLSTERED)|", Self.x, Self.y, 0, -13, True, 0.0, 0.2, True, 120)
                                        flyaway.CenterX()

                                        Self.PutItemInSlot(slot, i, False)

                                        If weapon2ItemName <> ItemType.NoItem
                                            Local droppedItem := Self.DropItem(weapon2ItemName)
                                            Self.ProcessDropMystery(droppedItem, "weapon2")
                                        End If

                                        If Self.mysterySlots.Contains(slot)
                                            Self.mysterySlots.Insert("weapon2")
                                            Self.mysterySlots.Remove(slot)
                                        End If
                                    Else
                                        Local weaponItemName := Self.ownedItems.Get(slot)

                                        Self.PutItemInSlot(slot, i, False)

                                        Local droppedItem := Self.DropItem(weaponItemName)
                                        Self.ProcessDropMystery(droppedItem, slot)
                                    End If

                                    Return True
                                Case "misc"
                                    If Not Self.miscItems.Contains(i)
                                        Self.miscItems.AddLast(i)
                                        Self.miscItems.Sort()
                                    End If
                                Case "action"
                                    If Not Self.IsAnythingInSlot("action1")
                                        Self.PutItemInSlot("action1", i, False)

                                        Return True
                                    End If

                                    If Not Self.IsAnythingInSlot("action2") And
                                       Self.HaveSecondActionSlot()
                                        Self.PutItemInSlot("action2", i, False)

                                        Return True
                                    End If

                                    If Self.HaveSecondActionSlot()
                                        Local hudItemName := Self.GetItemInSlot("hud", True)
                                        If hudItemName = ItemType.PackOfHolding
                                            Local action2ItemName := Self.ownedItems.Get("action2")
                                            Self.holdingBagItems.AddLast(action2ItemName)

                                            Local action1ItemName := Self.ownedItems.Get("action1")
                                            Self.PutItemInSlot("action2", action1ItemName, True)

                                            Self.PutItemInSlot("action1", i, False)

                                            Return True
                                        End If

                                        Local action2ItemName := Self.ownedItems.Get("action2")
                                        
                                        Local action1ItemName := Self.ownedItems.Get("action1")
                                        Self.PutItemInSlot("action2", action1ItemName, True)

                                        Self.PutItemInSlot("action1", i, False)

                                        Self.DropItem(action2ItemName)

                                        Return True
                                    End If

                                    Local action1ItemName := Self.ownedItems.Get("action1")

                                    Self.PutItemInSlot("action1", i, False)

                                    Self.DropItem(action1ItemName)

                                    Return True
                                Default
                                    If Not Self.IsAnythingInSlot(slot)
                                        Self.PutItemInSlot(slot, i, False)

                                        Return True
                                    End If

                                    Select slot
                                        Case "body"
                                            Local ownedItem := Self.ownedItems.Get(slot)
                                            If i = ownedItem
                                                Return False
                                            End If

                                            Select i
                                                Case ItemType.KarateGi,
                                                     ItemType.GlassArmor,
                                                     ItemType.HeavyGlassArmor,
                                                     ItemType.ObsidianArmor,
                                                     ItemType.QuartzArmor
                                                    Self.PutItemInSlot(slot, i, False)

                                                    Self.DropItem(ownedItem)

                                                    Return True
                                            End Select

                                            Select ownedItem
                                                Case ItemType.KarateGi,
                                                     ItemType.GlassArmor,
                                                     ItemType.HeavyGlassArmor,
                                                     ItemType.ObsidianArmor,
                                                     ItemType.QuartzArmor
                                                    Self.PutItemInSlot(slot, i, False)

                                                    Self.DropItem(ownedItem)

                                                    Return True
                                                Case ItemType.LeatherArmor
                                                    Self.PutItemInSlot(slot, i, False)

                                                    Return True
                                                Case ItemType.Chainmail
                                                    Select i
                                                        Case ItemType.PlateArmor,
                                                             ItemType.HeavyPlate,
                                                             ItemType.SpikedChainmail,
                                                             ItemType.SpikedPlateArmor,
                                                             ItemType.SpikedHeavyPlate
                                                            Self.PutItemInSlot(slot, i, False)

                                                            Return True
                                                    End Select
                                                Case ItemType.PlateArmor
                                                    Select i
                                                        Case ItemType.HeavyPlate,
                                                             ItemType.SpikedPlateArmor,
                                                             ItemType.SpikedHeavyPlate
                                                            Self.PutItemInSlot(slot, i, False)

                                                            Return True
                                                    End Select
                                                Case ItemType.HeavyPlate
                                                    Select i
                                                        Case ItemType.SpikedHeavyPlate
                                                            Self.PutItemInSlot(slot, i, False)

                                                            Return True
                                                    End Select
                                            End Select

                                            Select i
                                                Case ItemType.LeatherArmor
                                                    Return False
                                                Case ItemType.Chainmail
                                                    Select ownedItem
                                                        Case ItemType.Chainmail,
                                                             ItemType.PlateArmor,
                                                             ItemType.HeavyPlate,
                                                             ItemType.SpikedChainmail,
                                                             ItemType.SpikedPlateArmor,
                                                             ItemType.SpikedHeavyPlate
                                                            Return False
                                                    End Select
                                                Case ItemType.PlateArmor
                                                    Select ownedItem
                                                        Case ItemType.PlateArmor,
                                                             ItemType.HeavyPlate,
                                                             ItemType.SpikedPlateArmor,
                                                             ItemType.SpikedHeavyPlate
                                                            Return False
                                                    End Select
                                                Case ItemType.HeavyPlate
                                                    Select ownedItem
                                                        Case ItemType.HeavyPlate,
                                                             ItemType.SpikedHeavyPlate
                                                            Return False
                                                    End Select
                                            End Select

                                            Select ownedItem
                                                Case ItemType.SpikedLeatherArmor
                                                    Select i
                                                        Case ItemType.SpikedChainmail,
                                                             ItemType.SpikedPlateArmor,
                                                             ItemType.SpikedHeavyPlate
                                                            Self.PutItemInSlot(slot, i, False)

                                                            Return True
                                                    End Select
                                                Case ItemType.SpikedChainmail
                                                    Select i
                                                        Case ItemType.SpikedPlateArmor,
                                                             ItemType.SpikedHeavyPlate
                                                            Self.PutItemInSlot(slot, i, False)

                                                            Return True
                                                    End Select
                                                Case ItemType.SpikedPlateArmor
                                                    Select i
                                                        Case ItemType.SpikedHeavyPlate
                                                            Self.PutItemInSlot(slot, i, False)

                                                            Return True
                                                    End Select
                                            End Select

                                            Select i
                                                Case ItemType.SpikedLeatherArmor
                                                    Select ownedItem
                                                        Case ItemType.SpikedChainmail,
                                                             ItemType.SpikedPlateArmor,
                                                             ItemType.SpikedHeavyPlate
                                                            Return False
                                                    End Select
                                                Case ItemType.SpikedChainmail
                                                    Select ownedItem
                                                        Case ItemType.SpikedPlateArmor,
                                                             ItemType.SpikedHeavyPlate
                                                            Return False
                                                    End Select
                                                Case ItemType.SpikedPlateArmor
                                                    Select ownedItem
                                                        Case ItemType.SpikedHeavyPlate
                                                            Return False
                                                    End Select
                                            End Select

                                            Self.PutItemInSlot(slot, i, False)

                                            Self.DropItem(ownedItem)

                                            Return True
                                        Default
                                            Local ownedItem := Self.ownedItems.Get(slot)
                                            Local ownedItemSlotPriority := Item.GetIntAttribute(ownedItem, "slotPriority", 0)
                                            Local itemSlotPriority := Item.GetIntAttribute(i, "slotPriority", 0)
                                            If ownedItemSlotPriority <> 0 And
                                               itemSlotPriority <> 0 And
                                               ownedItemSlotPriority <> itemSlotPriority
                                                If itemSlotPriority > ownedItemSlotPriority
                                                    Self.PutItemInSlot(slot, i, False)

                                                    Return True
                                                End If

                                                Return False
                                            End If

                                            Self.PutItemInSlot(slot, i, False)

                                            Local droppedItem := Self.DropItem(i)
                                            Self.ProcessDropMystery(droppedItem, i)

                                            Return True
                                    End Select
                            End Select
                    End Select
                End If
        End Select

        Return True
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
        Local minVisibility := 1

        If Not Self.HasItemOfType(ItemType.RingOfShadows)
            Return minVisibility
        End If

        Local torchLevel := Self.GetTorchLevel()
        If torchLevel > 0
            minVisibility = torchLevel + 2
        End If

        If Self.HasItemOfType(ItemType.MinersCap)
            minVisibility = math.Max(3, minVisibility)
        End If

        Return minVisibility
    End Method

    Method CancelTween: Void()
        Debug.TraceNotImplemented("Player.CancelTween()")
    End Method

    Method CheckConductorWire: Void()
        Debug.TraceNotImplemented("Player.CheckConductorWire()")
    End Method

    Method CheckFloating: Void()
        Self.floating = Self.HasItemOfType(ItemType.WingedBoots) Or
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

    Method DropItem: Item(i: String, xVal: Int = -99999, yVal: Int = -99999)
        Debug.TraceNotImplemented("Player.DropItem(String, Int, Int)")
    End Method

    Method EmptyAllSlots: Void(includeLamb: Bool)
        Self.ownedItems.Clear()
        Self.cursedSlots.Clear()
        Self.mysterySlots.Clear()
        Self.ClearAllFamiliars(includeLamb)
        Self.miscItems.Clear()
        Self.itemQuantity.Clear()

        Self.weapon = New Weapon(ItemType.NoItem)
        Self.armorAmount = 0
        Self.armorType = ItemType.NoItem
        Self.torchType = ItemType.NoItem

        Self.hasPickedUpWonderThisRun = False
        Self.hasPickedUpBlastHelmThisRun = False
        Self.hasPickedUpGrenadeCharmThisRun = False

        Self.UpdateBonusHeart()
    End Method

    Method EmptySlot: Void(sl: String)
        Debug.TraceNotImplemented("Player.EmptySlot(String)")
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
        Local electricStrength := 0

        If Self.characterID = Character.Dove
            Return electricStrength
        End If

        If Not Self.floating And
           (Level.GetTileTypeAt(Self.x, Self.y) = TileType.Wire Or
            Level.GetTileTypeAt(Self.x, Self.y) = TileType.WiredDoor)
            electricStrength += 1
        End If

        Local weapon := Self.GetWeapon(False)
        If weapon.type = ItemType.ElectricDagger
            electricStrength += 1
        End If

        If Self.conductorWireActive
            electricStrength += 1
        End If

        Return electricStrength
    End Method

    Method GetHUDQuantityText: Object(slot: Int)
        Debug.TraceNotImplemented("Player.GetHUDQuantityText(Int)")
    End Method

    Method GetItemInSlot: String(sl: String, overrideBatForm: Bool)
        If Self.batFormActive Or Not overrideBatForm
            Select sl
                Case "weapon"
                    Return ItemType.Fangs
                Case "head"
                    Return ItemType.Sonar
            End Select
        Else
            If Self.ownedItems.Contains(sl)
                Return Self.ownedItems.Get(sl)
            End If
        End If

        Return ItemType.NoItem
    End Method

    Method GetItemQuantity: Int(item: Int)
        Debug.TraceNotImplemented("Player.GetItemQuantity(Int)")
    End Method

    Method GetKillsUntilHealingString: Int()
        Debug.TraceNotImplemented("Player.GetKillsUntilHealingString()")
    End Method

    Method GetLightSourceMax: Float()
        If Self.HasItemOfType(ItemType.RingOfShadows)
            Return 1.25
        End If

        If Self.torchType = ItemType.NoItem
            Return 1.75
        End If

        Local torchValue := Item.GetValue(Self.torchType)

        Return (torchValue * 1.25) + 1.75
    End Method

    Method GetLightSourceMin: Float()
        Debug.TraceNotImplemented("Player.GetLightSourceMin()")
    End Method

    Method GetMinVisibility: Float()
        If Self.minVisibilityCachedFrame <> necrodancergame.globalFrameCounter
            Self.minVisibilityCached = Self.CalcMinVisibility()
            Self.minVisibilityCachedFrame = necrodancergame.globalFrameCounter
        End If

        Return Self.minVisibilityCached
    End Method

    Method GetMoveLastBeat: Int()
        Local lastPlayerMoveBeat := controller_game.lastPlayerMoveBeat[Self.playerID]
        Local lastBeatNumber := Audio.GetCurrentBeatNumberIncludingLoops(0, True) - 1

        If lastPlayerMoveBeat >= lastBeatNumber
            Return Self.lastMove
        End If

        Return -1
    End Method

    Method GetNewWeapon: Void(w: String)
        Debug.TraceNotImplemented("Player.GetNewWeapon(String)")
    End Method

    Method GetPositionLastBeat: Point()
        If Self.GetMoveLastBeat() = -1
            Return New Point(Self.x, Self.y)
        End If

        Return New Point(Self.lastX, Self.lastY)
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

    Method GetWeapon: Weapon(overrideBatForm: Bool)
        If Self.batFormActive And
           Not overrideBatForm
            Return Self.batWeapon
        End If

        Return Self.weapon
    End Method

    Method GiveInitialEquipment: Void(resetHealth: Bool)
        If Self.playerID = 0
            Spells.InitLearnedSpells()
        End If

        Local characterNode := necrodancergame.xmlData.GetChildAtPath("characters/character", "id=" + Self.characterID)
        If characterNode = necrodancergame.xmlData.nullNode
            Debug.Log("ERROR: No character found in XML with id " + Self.characterID)
        Else
            Local initialEquipmentsNode := characterNode.GetChild("initial_equipment")
            For Local initialEquipmentNode := EachIn initialEquipmentsNode.GetChildren()
                Select initialEquipmentNode.name
                    Case "item"
                        Local itemType := initialEquipmentNode.GetAttribute("type")
                        
                        If Item.itemImages.Contains(itemType)
                            Self.AddItemOfType(itemType, Null, True, True)
                        Else
                            Debug.Log("ERROR: Unrecognized item type " + itemType)
                        End If
                    Case "cursed"
                        Local cursedSlot := initialEquipmentNode.GetAttribute("slot")
                        
                        Self.SetSlotCursed(cursedSlot, True)
                    Default
                        Debug.Log("ERROR: Unrecognized initial equipment element " + initialEquipmentNode.name)
                End Select
            End for
        End If

        If Level.isSoulMode
            If Not Self.HasItemOfType(ItemType.NazarCharm)
                Self.AddItemOfType(ItemType.NazarCharm, Null, True, True)
            End If

            New SoulFamiliar(Self.x, Self.y, Self)
        End If

        If Self.characterID <> Character.Mary
            Self.lambFamiliar = Null
        Else
            Self.lambFamiliar = New Familiar(Self)
        End If

        If resetHealth
            Select Self.characterID
                Case Character.Melody,
                     Character.Bard,
                     Character.Monk
                    Self.health.Reset(4)
                Case Character.Bolt,
                     Character.Eli
                    Self.health.Reset(6)
                Case Character.Dorian
                    Self.health.Reset(8)
                Case Character.Dove
                    Self.health.Reset(4)
                    Self.UpdateBonusHeart()
                    Self.health.Heal(2, False)
                Case Character.Coda,
                     Character.Aria,
                     Character.Ghost
                    Self.health.ResetFragile()
                Default
                    Self.health.Reset(6)
            End Select
        End If
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

    Method HasItemOfType: Bool(i: String, overrideBatForm: Bool = False)
        If Not Self.batFormActive Or overrideBatForm
            If Self.characterID = Character.Tempo
                If i = ItemType.Sonar Then Return True
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
            Case ItemType.Fangs,
                 ItemType.Sonar
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

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int = Direction.None, hitter: Entity = Null, hitAtLastTile: Bool = False, hitType: Int = 0)
        Debug.TraceNotImplemented("Player.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImmediatelyMoveTo: Void(xVal: Int, yVal: Int, fromKeyboard: Bool, fromClampedEnemy: Bool, fromBounceTrap: Bool, fromCourage: Bool, overrideStairs: Bool)
        Debug.TraceNotImplemented("Player.ImmediatelyMoveTo(Int, Int, Bool, Bool, Bool, Bool, Bool)")
    End Method

    Method IsAnythingInSlot: Bool(sl: String)
        If Not Self.ownedItems.Contains(sl)
            Return False
        End If

        Local ownedItem := Self.ownedItems.Get(sl)

        Return ownedItem <> ItemType.NoItem
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

    Method IsShrunk: Bool(xVal: Int = -9999, yVal: Int = -9999)
        If xVal = -9999
            xVal = Self.x
        End If

        If yVal = -9999
            yVal = Self.y
        End If

        Return Level.GetTileTypeAt(xVal, yVal) = TileType.Ooze And
               Not Self.IsLordCrownActive() And
               Not Self.floating And
               Not Self.FeetIgnoreOoze()
    End Method

    Method IsSlotCursed: Bool(sl: String)
        Debug.TraceNotImplemented("Player.IsSlotCursed(String)")
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
        Self.headImageForHUD.InWorld = False
        Self.headImageForHUD.SetZ(10000.0)
        Self.shadow = New Sprite("entities/TEMP_shadow_standard.png", 1)
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

    Method Perished: Bool() Property
        Return Self.perished
    End Method

    Method PermitMoveFail: Bool()
        Debug.TraceNotImplemented("Player.PermitMoveFail()")
    End Method

    Method PlayVO: Void(voSound: String)
        Debug.TraceNotImplemented("Player.PlayVO(String)")
    End Method

    Method ProcessDropMystery: Void(item: Item, slot: String)
        Debug.TraceNotImplemented("Player.ProcessDropMystery(Item, String)")
    End Method

    Method ProcessMoveQueue: Void()
        If Not Self.queuedMove
            Return
        End If

        If Self.queuedMoveBeat < Audio.GetClosestBeatNum(True)
            Self.queuedMove = False

            Return
        End If

        ' TODO: Double check condition that's supposed to be here.

        Local newX := Self.x + Self.queuedMoveX
        Local newY := Self.y + Self.queuedMoveY

        If Not Util.IsAnyPlayerAt(newX, newY) Or
           Self.clampedEnemy <> Null Or
           Util.GetAnyPlayerAt(newX, newY).clampedEnemy <> Null
            Self.ImmediatelyMoveTo(Self.queuedMoveX, Self.queuedMoveY, True, False, False, False, False)
        End If

        ' TODO: Double check condition that's supposed to be here.

        If Util.IsAnyPlayerAt(newX, newY) And
           Self.lastMoveOntoPlayerInCoopModeBeat < Audio.GetClosestBeatNum(True)
            Local bounceTo := New Point(Self.queuedMoveX, Self.queuedMoveY)
            Self.BounceToward(bounceTo, False)

            Self.lastMoveOntoPlayerInCoopModeBeat = Audio.GetClosestBeatNum(True)
        End If

        Debug.TraceNotImplemented("Player.ProcessMoveQueue()")
    End Method

    Method ProcessSlotOffsets: Object(tmpSlotNum: Int, tmpX: Int, tmpY: Int)
        Debug.TraceNotImplemented("Player.ProcessSlotOffsets(Int, Int, Int)")
    End Method

    Method ProcessSlotOffsets2: Object(tmpSlot: Int, tmpX: Int, tmpY: Int)
        Debug.TraceNotImplemented("Player.ProcessSlotOffsets2(Int, Int, Int)")
    End Method

    Method ProcessTheResultsOfEquippingItem: Void(item: String)
        Select item
            Case ItemType.WingedBoots
                Self.CheckFloating()
            Case ItemType.Map
                Tile.anyPlayerHaveZoneMapCachedFrame = -1
                Level.minimap.UpdateAll()
            Case ItemType.GlassTorch
                Entity.anyPlayerHaveGlassTorchCachedFrame = -1
                Level.minimap.UpdateAll()
            Case ItemType.TorchOfForesight
                Entity.anyPlayerHaveForesightTorchCachedFrame = -1
                Level.minimap.UpdateAll()
            Case ItemType.TorchOfWalls
                Entity.anyPlayerHaveWallsTorchCachedFrame = -1
                Level.minimap.UpdateAll()
            Case ItemType.CircletOfTelepathy,
                 ItemType.Sonar
                Entity.anyPlayerHaveCircletCachedFrame = -1
                Level.minimap.UpdateAll()
            Case ItemType.Compass
                Local exitCoords := Level.GetStandardExitCoords()
                If exitCoords <> Null
                    Minimap.AddDirty(exitCoords)
                End If
            Case ItemType.MonkeysPaw
                Enemy.ApplyMonkeyPawAll()
            Case ItemType.RingOfCharisma,
                 ItemType.RingOfWonder
                Level.ResetCosts()
                SaleItem.ResetCosts()
                SaleChest.ResetCosts()
                Shrine.ResetCosts()
        End Select

        If Item.IsItemOfType(item, "isWeapon")
            Self.GetNewWeapon(item)
        End If

        Select item
            Case ItemType.RingOfPeace,
                 ItemType.RingOfWonder
                Self.UpdateBonusHeart()
        End Select

        Select item
            Case ItemType.RingOfWonder
                If Not Self.hasPickedUpWonderThisRun
                    Self.health.Heal(2, False)
                    Self.hasPickedUpWonderThisRun = True
                End If
        End Select

        If Item.IsItemOfType(item, "isTorch")
            Self.torchType = Self.GetItemInSlot("torch", False)

            Self.lightSourceMin = Self.GetLightSourceMin()
            Self.lightSourceMax = Self.GetLightSourceMax()
        End If

        Select item
            Case ItemType.Hargreaves,
                 ItemType.Helm,
                 ItemType.RingOfProtection,
                 ItemType.RingOfWonder,
                 ItemType.ProtectionCharm
                Self.armorAmount = Self.GetArmorAmount()
        End Select

        If Item.IsItemOfType(item, "isArmor")
            Self.armorType = Self.GetItemInSlot("body", False)
            Self.armorAmount = Self.GetArmorAmount()
        End If
    End Method

    Method ProcessTheResultsOfLosingItem: Void(i: Int)
        Debug.TraceNotImplemented("Player.ProcessTheResultsOfLosingItem(Int)")
    End Method

    Method PutItemInSlot: Void(sl: String, i: String, ignoreFlyTo: Bool)
        Self.ownedItems.Set(sl, i)

        If Not ignoreFlyTo And
           Not Self.globalIgnoreFlyToSlot
            Local slotNum: Int
            Select sl
                Case "shovel"
                    slotNum = 0
                Case "weapon"
                    slotNum = 1
                Default
                    slotNum = Player.GetSlotNum(sl)
            End Select

            If slotNum <> -1
                Self.hudSlotOffFlyFromPlayer[slotNum] = True
            End If
        End If
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

    Method SetSlotCursed: Void(sl: String, b: Bool)
        Self.cursedSlots.Set(sl, b)
    End Method

    Method SetSlotMystery: Void(sl: String, b: Bool)
        Debug.TraceNotImplemented("Player.SetSlotMystery(String, Bool)")
    End Method

    Method SetTotallyBlank: Void()
        Self.weapon = New Weapon(ItemType.NoItem)
        Self.numBombs = 0
        Self.EmptyAllSlots(False)
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

    Method SubtractItemOfType: Bool(i: String)
        Local slot := Item.GetSlot(i)

        If slot = "misc"
            Local numRemoved := Self.miscItems.RemoveEach(i)

            Return numRemoved > 0
        End If

        Local ownedItem := Self.ownedItems.Get(slot)
        If i = ownedItem
            Self.ownedItems.Set(slot, ItemType.NoItem)

            Return True
        End If

        Return False
    End Method

    Method SubtractKey: Bool()
        If Self.HasItemOfType(ItemType.Key)
            Self.SubtractItemOfType(ItemType.Key)

            Return True
        End If

        Return False
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
        If Self.Perished
            Return
        End If

        Local v3: Bool

        If Self.popUpController <> Null
            Select Self.popUpController.retval
                Case -1
                    ' Do nothing
                Case 1
                    Self.warnState = 0
                    Self.ImmediatelyMoveTo(Self.lastX - Self.x, Self.lastY - Self.y, True, False, False, False, True)
                    Self.popUpController = Null
                Default
                    v3 = True
                    Self.popUpController = Null
            End Select
        End If

        If Self.hintsController <> Null
            Select Self.hintsController.retval
                Case -1
                    Self.ImmediatelyMoveTo(Self.lastX - Self.x, Self.lastY - Self.y, False, False, False, False, False)
                Case 1
                    v3 = True
                    GameData.SetShowHints(True)
                Default
                    v3 = True
                    GameData.SetShowHints(False)
            End Select

            Self.hintsController = Null
        End If

        Local hasEnteredSeed: Bool

        If Self.seedController <> Null
            If Self.seedController.result <> ""
                hasEnteredSeed = True
                Level.randSeedString = Self.seedController.result
                Self.seedController = Null
            End If
        End If

        If Not Player.CheckCoinXOR()
            controller_game.gamePaused = True
            Audio.PauseSong(True)
            Self.popUpController = New ControllerPopUp(
                controller_game.controllerGamePointer,
                "|902|SCORE CHEATING DETECTED|",
                "",
                "",
                "",
                "",
                True,
                True,
                "")

            Return
        End If

        If Audio.cheatingDetected
            controller_game.gamePaused = True
            Audio.PauseSong(True)
            Self.popUpController = New ControllerPopUp(
                controller_game.controllerGamePointer,
                "|903|AUDIO CHEATING DETECTED|",
                "",
                "",
                "",
                "",
                True,
                True,
                "")

            Return
        End If

        Local closestBeatNum := Audio.GetClosestBeatNum(True)
        If Self.lastHitBeat > closestBeatNum
            Self.lastHitBeat = -1
        End If
        If Self.lastKillBeat > closestBeatNum
            Self.lastKillBeat = -1
        End If
        If Self.crownOfGreedBeat > closestBeatNum
            Self.crownOfGreedBeat = -1
        End If
        If Self.lastWarDrumBeat > closestBeatNum
            Self.lastWarDrumBeat = -1
        End If
        If Self.lastBloodDrumBeat > closestBeatNum
            Self.lastBloodDrumBeat = -1
        End If
        If Self.coinPickupBeat > closestBeatNum
            Self.coinPickupBeat = -2
        End If
        If Self.courageRingBeat > closestBeatNum
            Self.courageRingBeat = -1
        End If
        If Self.courageShovelBeat > closestBeatNum
            Self.courageShovelBeat = -1
        End If
        If closestBeatNum = 0
            If Self.paceBeat > closestBeatNum
                Self.paceBeat = -1
            End If
        End If

        If Shrine.paceShrineActive And
           closestBeatNum > 64 And
           Self.paceBeat = -1 And
           Not Self.falling
            Self.Hit("SHRINE OF PACE", 1, -1, Null, False, 0)

            Local slothFlyaway := New Flyaway("|255|SLOTH! (SHRINE OF PACE)|", Self.x, Self.y, 0, -22, True, 0.0, 0.2, True, 120)
            slothFlyaway.CenterX()
        End If

        If Chain.waitingForFirstMovement[Self.playerID]
            Self.lastKillBeat = closestBeatNum
        End If

        Self.ProcessMoveQueue()

        If Self.IsSlidingOnIce() And
           Self.IsStandingStill() And
           Audio.GetNonAbsoluteDistanceFromNearestBeat() <= 0 And
           Self.lastIceSlideBeat <> Audio.GetClosestBeatNum(False)
            Local slidingDir := Util.GetPointFromDir(Self.slidingDir)
            Self.slidingDir = Direction.None
            Self.ImmediatelyMoveTo(slidingDir.x, slidingDir.y, False, False, False, False, False)

            Self.lastIceSlideBeat = Audio.GetClosestBeatNum(False)
            controller_game.incrementFixedBeatNum = True
        End If

        Self.moveLastBeat = Self.GetMoveLastBeat()

        Local lastBeatPosition := Self.GetPositionLastBeat()
        Self.lastBeatX = lastBeatPosition.x
        Self.lastBeatY = lastBeatPosition.y

        If Not Self.wasKnockedBack
            If Self.lastX > Self.x
                Self.image.FlipX(True, True)
                Self.headImage.FlipX(True, True)
            Else If Self.lastX < Self.x
                Self.image.FlipX(False, True)
                Self.headImage.FlipX(False, True)
            End If
        End If

        If Not Self.HasItemOfType(ItemType.RingOfShadows)
            Local flicker := 0.0
            If Self.torchType <> ItemType.NoItem
                flicker = Util.RndFloatRange(-0.5, 0.5, False)
            End If

            Self.lightSourceMax = Self.GetLightSourceMax() + flicker
            Self.constLightSourceMax = Self.GetLightSourceMax()
        End If

        If Self.wasShrunk
            If Not Self.IsShrunk()
                Self.PlayVO("Hm2")
            End If
        Else
            If Self.IsShrunk()
                Self.PlayVO("IceSlide")

                Local shrunkFlyaway := New Flyaway("|256|SHRUNK!|", Self.x, Self.y, 0, -8, True, 0.0, 0.2, True, 120)
                shrunkFlyaway.CenterX()
            End If
        End If

        Self.wasShrunk = Self.IsShrunk()

        If Self.GetElectricStrength() > 0
            Self.electricityCounter += 1
        Else
            Self.electricityCounter = 0
        End If

        Local exitValue := Level.GetExitValue(Self.x, Self.y)
        Local exitValueX := exitValue.x

        If exitValueX = LevelType.Unknown_4 Or
           Level.isLevelEnding
            Self.playedExitErrorSound = False

            Self.Update2(closestBeatNum)

            Return
        End If

        If Not Self.IsStandingStill()
            Self.Update2(closestBeatNum)

            Return
        End If

        If Level.IsLockedExit(Self.x, Self.y)
            If Not Self.playedExitErrorSound
                Audio.PlayGameSound("error", 2, 1.0)

                Local exitFlyawayText := Level.GetTileFlyawayAt(Self.x, Self.y)
                If exitFlyawayText = ""
                    exitFlyawayText = "|257|EXIT LOCKED!|"
                End If

                Local exitFlyaway := New Flyaway(exitFlyawayText, Self.x, Self.y, 0, -12, True, 0.0, 0.2, True, 120)
                exitFlyaway.CenterX()

                Self.playedExitErrorSound = True
            End If

            Self.Update2(closestBeatNum)

            Return
        End If

        If controller_game.currentLevel <> LevelType.Lobby And
           (Util.IsCharacterActive(Character.Monk) Or
            Util.IsCharacterActive(Character.Coda)) And
           Not v3
            Local numCoinsRemaining := Item.ConsumeCoinsRemainingOnLevel()
            Player.OffsetCoins(numCoinsRemaining)
        End If

        If GameData.GetShowHints() < 0
            controller_game.gamePaused = True
            Audio.PauseSong(True)
            Self.hintsController = New ControllerPopUp(
                controller_game.controllerGamePointer,
                "|904|This game contains many mysterious items!|",
                "|905|Would you like item hints, or would|",
                "|906|you prefer to figure things out as you go?|",
                "|907|YES, GIVE HINTS|",
                "|908|NO THANKS|",
                True,
                False,
                "")

            Return
        End If

        If controller_game.currentLevel = LevelType.Lobby
            Player.lobbySaleItemMinCost = SaleItem.GetMinCost()
        End If

        Local clearNumDiamonds: Bool
        If (controller_game.currentLevel = LevelType.Lobby And exitValueX >= LevelType.MinLobbyExit) Or
           exitValueX = LevelType.CreateAllCharactersCharacterSelect Or
           exitValueX = LevelType.CreateAllCharactersDLCCharacterSelect Or
           exitValueX = LevelType.StoryMode Or
           (exitValueX = LevelType.DeathlessMode And Not Level.isDeathlessMode)
            If Player.numDiamonds >= Player.lobbySaleItemMinCost And
               GameData.GetShowDiamondReminder() And
               Self.warnState <= 0
                controller_game.gamePaused = True
                Audio.PauseSong(True)
                Self.hintsController = New ControllerPopUp(
                    controller_game.controllerGamePointer,
                    "|909|You'll lose your unspent diamonds|",
                    "|910|when you leaVe the lobby.|",
                    "|911|Would you like To stay And spend them?|",
                    "|912|Stay, spend diamonds|",
                    "|913|LeaVe, lose diamonds|",
                    True,
                    False,
                    "")

                Self.warnState = 1

                Return
            End If

            clearNumDiamonds = True
        End If

        If controller_game.currentLevel = LevelType.CharacterSelect And
           Not v3
            Local popUp := True

            Local pText1: String
            Local pText2: String
            Local pText3: String
            Local bestiaryImagePath: String

            Select exitValueX
                Case LevelType.SelectCharacterSelectCadence
                    pText1 = "|914|CADENCE MODE!|"
                    pText2 = "|915|NORMAL GAMEPLAY.|"
                    bestiaryImagePath = "bestiary/bestiary_cadence.png"
                Case LevelType.SelectCharacterSelectAria
                    pText1 = "|917|ARIA MODE: DAGGER ONLY.|"
                    pText2 = "|918|DIE IN A SINGLE HIT.|"
                    pText3 = "|919|DIE ON MISSED BEAT!|"
                    bestiaryImagePath = "bestiary/bestiary_aria.png"
                Case LevelType.SelectCharacterSelectBolt
                    pText1 = "|920|BOLT MODE!|"
                    pText2 = "|921|DOUBLE SPEED GAMEPLAY.|"
                    bestiaryImagePath = "bestiary/bestiary_bolt.png"
                Case LevelType.SelectCharacterSelectBard
                    pText1 = "|922|BARD MODE: NO BEATS!|"
                    pText2 = "|923|MOVE AT ANY TIME.|"
                    pText3 = "|924|ENEMIES MOVE AFTER YOU.|"
                    bestiaryImagePath = "bestiary/bestiary_bard.png"
                Case LevelType.SelectCharacterSelectMonk
                    pText1 = "|925|MONK MODE: GOLD KILLS.|"
                    pText2 = "|926|(VOW OF POVERTY!)|"
                    pText3 = "|927|SHOPS GIVE FREE ITEMS.|"
                    bestiaryImagePath = "bestiary/bestiary_monk.png"
                Case LevelType.SelectCharacterSelectDove
                    pText1 = "|928|DOVE MODE: PACIFISM!|"
                    pText2 = "|929|YOU DO NO DAMAGE BUT|"
                    pText3 = "|930|EXITS ARE UNLOCKED.|"
                    bestiaryImagePath = "bestiary/bestiary_dove.png"
                Case LevelType.SelectCharacterSelectEli
                    pText1 = "|931|ELI MODE!|"
                    pText2 = "|932|INFINITE BOMBS.|"
                    pText3 = "|933|KICK BOMBS AT ENEMIES!|"
                    bestiaryImagePath = "bestiary/bestiary_eli.png"
                Case LevelType.SelectCharacterSelectDorian
                    pText1 = "|934|DORIAN MODE!|"
                    pText2 = "|935|CURSED BOOTS OF LEAPING.|"
                    pText3 = "|936|MOVE SLOW: TAKE DAMAGE.|"
                    bestiaryImagePath = "bestiary/bestiary_dorian.png"
                Case LevelType.SelectCharacterSelectMelody
                    pText1 = "|937|MELODY MODE!|"
                    pText2 = "|938|MOVE NEXT TO ENEMIES|"
                    pText3 = "|939|TO USE THE GOLDEN LUTE!|"
                    bestiaryImagePath = "bestiary/bestiary_melody.png"
                Case LevelType.SelectCharacterSelectCoda
                    pText1 = "|940|CODA MODE!|"
                    pText2 = "|941|ARIA + BOLT + MONK.|"
                    pText3 = "|942|PROBABLY IMPOSSIBLE.|"
                    bestiaryImagePath = "bestiary/bestiary_coda.png"
                Case LevelType.SelectCharacterSelectNocturna
                    pText1 = "|15500|NOCTURNA MODE!|"
                    pText2 = "|15501|BECOME A BAT.|"
                    pText3 = "|15502|ZONE 5 INVADES OTHER ZONES.|"
                    bestiaryImagePath = "bestiary/bestiary_nocturna.png"
                Case LevelType.SelectCharacterSelectDiamond
                    pText1 = "|15503|DIAMOND MODE!|"
                    pText2 = "|15504|USE KEY COMBOS|"
                    pText3 = "|15505|TO MOVE DIAGONALLY.|"
                    bestiaryImagePath = "bestiary/bestiary_diamond.png"
                Case LevelType.SelectCharacterSelectReaper
                    pText1 = "|15506|REAPER MODE!|"
                    pText2 = "|15507|ACCUMULATE SOULS|"
                    pText3 = "|15508|BY DEFEATING ENEMIES.|"
                    bestiaryImagePath = "bestiary/bestiary_reaper.png"
                Case LevelType.SelectCharacterSelectTempo
                    pText1 = "|15509|TEMPO MODE!|"
                    pText2 = "|15510|1 HIT KILLS!|"
                    pText3 = "|15511|DEFEAT ENEMIES TO SURVIVE.|"
                    bestiaryImagePath = "bestiary/bestiary_tempo.png"
                Case LevelType.SelectCharacterSelectMary
                    pText1 = "|15512|MARY MODE!|"
                    pText2 = "|15513|PROTECT YOUR LAMB|"
                    pText3 = "|15514|AT ALL COSTS!|"
                    bestiaryImagePath = "bestiary/bestiary_mary.png"
                Default
                    popUp = False
            End Select

            If popUp
                controller_game.gamePaused = True
                Audio.PauseSong(True)
                Self.popUpController = New ControllerPopUp(
                    controller_game.controllerGamePointer,
                    pText1,
                    pText2,
                    pText3,
                    "|1004|No|",
                    "|1003|Yes|",
                    True,
                    False,
                    "|916|CONTINUE?|")
                Self.popUpController.bestiaryImage = New Sprite(bestiaryImagePath, 1)

                Return
            End If
        End If

        If Self.warnState <= 1
            Local popUp := True

            Local pText1: String
            Local pText2: String
            Local pText3: String

            If (exitValueX = LevelType.CreateAllCharactersCharacterSelect Or
                exitValueX = LevelType.CreateAllCharactersDLCCharacterSelect)
                pText1 = "|943|ALL CHARACTERS MODE:|"
                pText2 = "|944|PLAY ALL CHARACTERS IN A ROW,|"
                pText3 = "|945|IN ALL ZONES MODE.|"
            Else If exitValueX = LevelType.StoryMode
                pText1 = "|946|STORY MODE!|"
                pText2 = "|947|PLAY AS NOCTURNA, CADENCE, MELODY, THEN ARIA.|"
                pText3 = "|948|COMPLETE THE WHOLE STORY IN ONE GO!|"
            Else If exitValueX = LevelType.DeathlessMode And
                    Not Level.isDeathlessMode
                pText1 = "|949|DEATHLESS MODE:|"
                pText2 = "|950|BEAT ALL ZONES REPEATEDLY WITHOUT DYING.|"
            Else If exitValueX = LevelType.AllZonesMode And
                    Not GameData.GetHavePlayedHardcore()
                pText1 = "|951|ALL ZONES MODE: COMPLETE ALL ZONES IN ONE RUN!|"
                pText2 = "|952|ALL LOBBY UPGRADES ARE UNLOCKED AND AVAILABLE,|"
                pText3 = "|953|BUT YOU START WITH LOWER HEALTH.|"
            Else If exitValueX = LevelType.DailyChallenge
                pText1 = "|954|DAILY CHALLENGE: COMPLETE ALL ZONES IN ONE RUN!|"
                pText2 = "|955|ALL PLAYERS GET THE SAME DUNGEON.|"
                pText3 = "|956|RESETS DAILY AT MIDNIGHT GMT.|"
            Else
                popUp = False
            End If

            If popUp
                controller_game.gamePaused = True
                Audio.PauseSong(True)
                Self.popUpController = New ControllerPopUp(
                    controller_game.controllerGamePointer,
                    pText1,
                    pText2,
                    pText3,
                    "|1004|No|",
                    "|1003|Yes|",
                    True,
                    False,
                    "|916|CONTINUE?|")

                Self.warnState = 2

                Return
            End If
        End If

        If Level.IsSeededMode(exitValueX) And
           Not hasEnteredSeed
            controller_game.gamePaused = True
            Audio.PauseSong(True)
            Self.seedController = New ControllerInputPopup(
                controller_game.controllerGamePointer,
                "|900|ENTER A TEXT SEED!|",
                "|901|YOU CAN USE NUMBERS, LETTERS AND SPACES:|",
                False)

            Return
        End If

        If (LevelType.MinTrainingMinibossLevel <= exitValueX And exitValueX <= LevelType.MaxTrainingLevel) And
           Not v3
            Select Level.GetTileTypeAt(Self.x, Self.y)
                Case TileType.LockedStairs,
                     TileType.LockedStairs3Diamonds,
                     TileType.LockedStairs9Diamonds
                    controller_game.gamePaused = True
                    Audio.PauseSong(True)

                    Local pText1: String
                    Local enemyID := exitValueX + 1000
                    Local enemyName := Enemy.GetEnemyName(enemyID)

                    If exitValueX <= LevelType.MaxTrainingMinibossLevel
                        pText1 = "|960|MINIBOSS TRAINING!|"
                    Else
                        pText1 = "|957|BOSS TRAINING!|"
                    End If

                    Self.popUpController = New ControllerPopUp(
                        controller_game.controllerGamePointer,
                        pText1,
                        "|961|Spend 3 diamonds to|",
                        "|962|unlock |" + enemyName + "|969|?|",
                        "|1004|No|",
                        "|1003|Yes|",
                        True,
                        False,
                        "")
                    Self.popUpController.bestiaryImage = Enemy.LoadBestiarySprite(enemyID)

                    Return
            End Select
        End If

        If Not Level.isTrainingMode And
           (LevelType.MinTrainingLevel <= exitValueX And exitValueX <= LevelType.MaxTrainingLevel) And
           Not v3
            Local pText1: String
            Local pText2: String

            If LevelType.MinTrainingBossLevel <= exitValueX And exitValueX <= LevelType.MaxTrainingBossLevel
                pText1 = "|963|BOSS TRAINING!|"
                pText2 = "|964|Practice against|"
            Else If LevelType.MinTrainingAvailableMinibossLevel <= exitValueX And exitValueX <= LevelType.MaxTrainingAvailableMinibossLevel
                pText1 = "|965|MINIBOSS TRAINING!|"
                pText2 = "|966|Practice against|"
            Else
                pText1 = "|967|TRAINING!|"
                pText2 = "|968|Practice against|"
            End If

            Local enemyID := exitValueX + 1000
            Local enemyName := Enemy.GetEnemyName(enemyID)

            controller_game.gamePaused = True
            Audio.PauseSong(True)
            Self.popUpController = New ControllerPopUp(
                controller_game.controllerGamePointer,
                pText1,
                pText2,
                enemyName + "|969|?|",
                "|1004|No|",
                "|1003|Yes|",
                True,
                False,
                "")
            Self.popUpController.bestiaryImage = Enemy.LoadBestiarySprite(enemyID)

            Return
        End If

        Select controller_game.currentLevel
            Case LevelType.Level1
                If controller_game.currentDepth = 1 And
                   Level.isHardcoreMode And
                   Player.numCoins >= 9000 And
                   Not Util.IsCharacterActive(Character.Aria)
                    controller_game.gamePaused = True
                    Audio.PauseSong(True)
                    Self.popUpController = New ControllerPopUp(
                        controller_game.controllerGamePointer,
                        "|902|SCORE CHEATING DETECTED|",
                        "",
                        "",
                        "",
                        "",
                        True,
                        True,
                        "")

                    Return
                End If
            Case LevelType.BossBattle
                Select controller_game.currentZone
                    Case 1
                        If Util.IsCharacterActive(Character.Cadence)
                            Util.IncrementSteamStat("NumZone1Completions")
                        End If
                    Case 2
                        If Util.IsCharacterActive(Character.Cadence)
                            Util.IncrementSteamStat("NumZone2Completions")
                        End If
                    Case 3
                        If Util.IsCharacterActive(Character.Cadence)
                            Util.IncrementSteamStat("NumZone3Completions")
                        End If
                    Case 4
                        If Util.IsCharacterActive(Character.Cadence)
                            Util.IncrementSteamStat("NumZone4Completions")
                        End If
                    Case 5
                        Util.IncrementSteamStat("NumZone5Completions")
                End Select
        End Select

        If Level.isHardcoreMode And
           controller_game.currentDepth = 5
            If Player.IsSolo()
                Select controller_game.currentLevel
                    Case LevelType.Level3
                        If Util.IsCharacterActive(Character.Dove)
                            Util.IncrementSteamStat("NumHardcoreCompletionsDove")
                        End If
                    Case LevelType.BossBattle
                        If Util.IsCharacterActive(Character.Bard)
                            Util.IncrementSteamStat("NumHardcoreCompletionsBard")
                        Else If Util.IsCharacterActive(Character.Bolt)
                            Util.IncrementSteamStat("NumHardcoreCompletionBolt")
                        Else If Util.IsCharacterActive(Character.Monk)
                            Util.IncrementSteamStat("NumHardcoreCompletionMonk")
                        Else If Util.IsCharacterActive(Character.Eli)
                            Util.IncrementSteamStat("NumHardcoreCompletionEli")
                        Else If Util.IsCharacterActive(Character.Dorian)
                            Util.IncrementSteamStat("NumHardcoreCompletionDorian")
                        Else If Util.IsCharacterActive(Character.Diamond)
                            Util.IncrementSteamStat("NumHardcoreCompletionCoda")
                        Else If Util.IsCharacterActive(Character.Coda)
                            Util.IncrementSteamStat("NumHardcoreCompletionsDiagonal")
                        Else If Util.IsCharacterActive(Character.Mary)
                            Util.IncrementSteamStat("NumHardcoreCompletionsReaper")
                        Else If Util.IsCharacterActive(Character.Tempo)
                            Util.IncrementSteamStat("NumHardcoreCompletionTempo")
                        End If
                    Case LevelType.FinalBossBattle
                        If Util.IsCharacterActive(Character.Cadence)
                            Util.IncrementSteamStat("NumHardcoreCompletionsCadence")
                        Else If Util.IsCharacterActive(Character.Aria)
                            Util.IncrementSteamStat("NumHardcoreCompletionsAria")
                        Else If Util.IsCharacterActive(Character.Melody)
                            Util.IncrementSteamStat("NumHardcoreCompletionsMelody")
                        Else If Util.IsCharacterActive(Character.Nocturna)
                            Util.IncrementSteamStat("NumHardcoreCompletionsNocturna")
                        End If
                End Select
            End If
        End If

        If controller_game.numPlayers > 1 And
           Not controller_game.players[1].isHelper And
           Level.isHardcoreMode And
           controller_game.currentDepth = 5
            If Util.IsCharacterActive(Character.Aria) Or
               Util.IsCharacterActive(Character.Melody) Or
               Util.IsCharacterActive(Character.Cadence)
                If controller_game.currentLevel = LevelType.FinalBossBattle
                    Util.IncrementSteamStat("NumHardcoreCompletionsCoop", True, True)
                End If
            Else
                If controller_game.currentLevel = LevelType.BossBattle
                    Util.IncrementSteamStat("NumHardcoreCompletionsCoop", True, True)
                End If
            End If
        End If

        If controller_game.currentLevel = LevelType.FinalBossBattle And
           controller_game.currentDepth = 5 And
           Level.isHardcoreMode
            If Level.isDailyChallenge
                Util.IncrementSteamStat("NumDailyChallengeCompletions", True, True, True)
            Else
                If Player.IsSolo() And
                   Not Level.isPhasingMode
                    If Util.IsCharacterActive(Character.Cadence)
                        If app.Millisecs() + controller_game.runPlaytimeMilliseconds - controller_game.runPlaytimeLastAdded <= 900000
                            Util.IncrementSteamStat("NumSub8CadenceSpeedruns")
                        End If
                    Else If Util.IsCharacterActive(Character.Nocturna)
                        If app.Millisecs() + controller_game.runPlaytimeMilliseconds - controller_game.runPlaytimeLastAdded <= 900000
                            Util.IncrementSteamStat("NumSub10NocturnaSpeedruns")
                        End If
                    Else If Util.IsCharacterActive(Character.Aria)
                        If Level.isRunNoItemsNoShrines
                            Util.IncrementSteamStat("NumAriaLowPercentCompletions")
                        End If
                    End If
                End If
            End If
        End If

        If Player.IsLastLevel() And
           controller_game.currentDepth = 5 And
           Player.IsSolo()
            If Level.isHardMode
                If Util.IsCharacterActive(Character.Nocturna)
                    Util.IncrementSteamStat("NumHardModeCompletionsNocturna", True, True, True)
                End If

                GameData.SetHardModeComplete()
                Player.CheckAllModeCompletion()
            Else If Level.isNoReturnMode
                If Util.IsCharacterActive(Character.Cadence)
                    Util.IncrementSteamStat("NumNoReturnCompletionsCadence", True, True, True)
                End If

                GameData.SetNoReturnModeComplete()
                Player.CheckAllModeCompletion()
            Else If Level.isPhasingMode
                Util.IncrementSteamStat("NumPhasingModeCompletions", True, True, True)

                GameData.SetPhasingModeComplete()
                Player.CheckAllModeCompletion()
            Else If Level.isRandomizerMode
                Util.IncrementSteamStat("NumRandomizerModeCompletions", True, True, True)

                GameData.SetRandomizerModeComplete()
                Player.CheckAllModeCompletion()
            Else If Level.isMysteryMode
                Util.IncrementSteamStat("NumMysteryModeCompletions", True, True, True)

                GameData.SetMysteryModeComplete()
                Player.CheckAllModeCompletion()
            Else If Level.isStoryMode
                If Util.IsCharacterActive(Character.Aria) And
                   Player.IsSolo()
                    Util.IncrementSteamStat("NumStoryModeCompletions", True, True, True)

                    GameData.SetStoryModeComplete()
                    Player.CheckAllModeCompletion()
                End If
            End If
        End If

        Self.warnState = 0

        If clearNumDiamonds
            Player.numDiamonds = 0
        End If

        If controller_game.currentLevel = LevelType.Tutorial
            GameData.SetTutorialComplete()
            Self.SubtractKey()
        End If

        If exitValueX = LevelType.Lobby Or
           (LevelType.MinLobbyArea <= exitValueX And exitValueX <= LevelType.MaxLobbyArea) Or
           (exitValueX <= -1900 And exitValueX <> LevelType.DeathlessMode) Or
           exitValueX = LevelType.CreateAllCharactersDLCCharacterSelect
            Level.NewLevel(exitValueX, exitValue.y, Self.playerID)

            Self.Update2(closestBeatNum)

            Return
        End If

        advancelevel_callback.Stairs_callback.levelVal = exitValue.x
        advancelevel_callback.Stairs_callback.zoneVal = exitValue.y
        advancelevel_callback.Stairs_callback.playerVal = Self.playerID
        advancelevel_callback.Stairs_callback.continuedRun = False

        Local fadeFrames := necrodancergame.FRAMES_PER_SEC / 4
        Local stairsCallback := New Stairs_callback()
        Camera.FadeOutThenExecute(fadeFrames, stairsCallback)
        Level.isLevelEnding = True
        Audio.fadeFrames = fadeFrames
        Audio.startFadeFrames = fadeFrames
    End Method

    Method Update2: Void(closestBeatNum: Int)
        Local pickup := Item.GetPickupAt(Self.x, Self.y)
        If pickup <> Null And
           Not Self.Perished And
           Not Level.isLevelEditor
            Local pickupSlot := pickup.GetSlot()
            If Not Self.IsSlotCursed(pickupSlot)
                Local pickupName := pickup.Pickup(Self)
                If pickupName <> ItemType.NoItem
                    Self.AddItemOfType(pickupSlot, pickup, False, False)
                End If
            End If
        End If

        If Self.floating
            Self.bounce.Enable()
            Self.yOff = -4.0
        Else
            Self.bounce.Disable()
            Self.yOff = 3.0
        End If

        If Self.clampedEnemy <> Null And
           Self.clampedEnemy <> Self.lastClampedEnemy
            Self.PlayVO("Grabbed")
        End If

        Self.lastClampedEnemy = Self.clampedEnemy

        If Self.HasItemOfType(ItemType.CrownOfGreed) And
           Self.crownOfGreedBeat < closestBeatNum
            If Player.numCoins > 0
                Player.OffsetCoins(-1)
            End If

            Self.crownOfGreedBeat = closestBeatNum
        End If

        If Self.lastWarDrumBeat + 1 < closestBeatNum
            Self.lastWarDrumBeat = -1
            Self.warDrumBeats = 0
        End If

        If Self.lastBloodDrumBeat + 1 < closestBeatNum
            Self.lastBloodDrumBeat = -1
            Self.bloodDrumBeats = 0
        End If

        If Self.heartTransplantTime <> -1 And
           Audio.fixedBeatNum <> -64 And
           Self.heartTransplantTime + 20000 < app.Millisecs()
            If Not Level.isReplaying And
               Level.replay <> Null
                Level.replay.beatOffset += Audio.fixedBeatNum - Audio.GetClosestBeatNum(False) - 1
            End If

            Self.heartTransplantTime = -1
            Audio.fixedBeatNum = -64
            controller_game.lastEnemyMoveBeat = Audio.GetCurrentBeatNumberIncludingLoops(0, True)

            If Not Self.IsSlidingOnIce()
                Self.lastIceSlideBeat = -1
            End If

            For Local i := 0 Until controller_game.numPlayers
                controller_game.lastPlayerMoveBeat[i] = closestBeatNum - 1
            End For

            Chain.waitingForFirstMovement[0] = True
            Chain.waitingForFirstMovement[1] = True
        End If

        If Self.readyToThrow
            Local weapon := Self.GetWeapon(False)
            If weapon = Null Or
               Not weapon.IsThrowable()
                Self.readyToThrow = False
            End If
        End If

        Self.wasClamped = Self.clampedEnemy <> Null

        ' Anti-cheat (Coin) check again?
        If Not Player.CheckCoinXOR()
            controller_game.gamePaused = True
            Audio.PauseSong(True)
            ' No text?
            Self.popUpController = New ControllerPopUp(
                controller_game.controllerGamePointer,
                "",
                "",
                "",
                "",
                "",
                True,
                True,
                "")

            Return
        End If

        Super.Update()
    End Method

    Method UpdateBonusHeart: Void()
        If Self.HasItemOfType(ItemType.RingOfWonder) Or
           Self.HasItemOfType(ItemType.RingOfPeace)
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
        Local location := Self.GetLocation()

        For Local familiar := EachIn Self.familiars
            familiar.WarpTo(location.x + familiar.offsetX, location.y + familiar.offsetY)
        End For

        Local marv := Self.lambFamiliar
        If marv <> Null
            marv.Recall()
        End If
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

    Const AllCharacters: Int = -1900
    Const AllCharactersDLC: Int = -1700
    Const StoryMode: Int = -50
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
    Const Reaper: Int = 14
    Const Ghost: Int = 15
    Const Thief: Int = 16

End Class
