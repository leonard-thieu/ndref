'Strict

Import monkey.map
Import monkey.math
Import monkey.random
Import monkey.set
Import mojo.app
Import enemy
Import enemy.banshee
Import enemy.bat
Import enemy.bat_miniboss
Import enemy.bell
Import enemy.bishop
Import enemy.crate
Import enemy.dead_ringer
Import enemy.death_metal
Import enemy.devil
Import enemy.dragon
Import enemy.electric_mage
Import enemy.evileye
Import enemy.fakewall
Import enemy.gargoyle
Import enemy.ghast
Import enemy.ghost
Import enemy.gorgon
Import enemy.hellhound
Import enemy.king
Import enemy.king_conga
Import enemy.knight
Import enemy.metrognome
Import enemy.minotaur
Import enemy.mommy
Import enemy.monkey_enemy
Import enemy.mummy
Import enemy.necrodancer_enemy
Import enemy.nightmare
Import enemy.octoboss
Import enemy.ogre
Import enemy.orc
Import enemy.pawn
Import enemy.poltergeist
Import enemy.queen
Import enemy.rook
Import enemy.sarcophagus
Import enemy.sarcophagus_tough
Import enemy.shopkeeper_ghost
Import enemy.skeleton
Import enemy.skull
Import enemy.slime
Import enemy.swarm_sarcophagus
Import enemy.trapchest
Import enemy.water_ball
Import enemy.wraith
Import enemy.zombie
Import enemy.zombie_electric
Import enemy.zombiesnake
Import enemy.npc
Import enemy.npc.beastmaster
Import enemy.npc.bossmaster
Import enemy.npc.conjurer
Import enemy.npc.diamonddealer
Import enemy.npc.medic
Import enemy.npc.merlin
Import enemy.npc.pawnbroker
Import enemy.npc.shopkeeper
Import enemy.npc.shriner
Import enemy.npc.transmogrifier
Import enemy.npc.weaponmaster
Import gui.controller
Import gui.controller_boss_intro
Import gui.controller_cutscene
Import gui.controller_game
Import gui.controller_level_editor
Import gui.controller_popup
Import gui.controller_postgame
Import level.advancelevel_callback
Import level.blob_room
Import level.level_object
Import level.portal_seg
Import level.rect_room
Import level.room_with_door
Import level.room_base
Import level.roomdata
Import trap
Import trap.abteleporttrap
Import trap.bombtrap
Import trap.bouncetrap
Import trap.confusetrap
Import trap.decorative_firetrap
Import trap.scattertrap
Import trap.slowdowntrap
Import trap.speeduptrap
Import trap.spiketrap
Import trap.switch
Import trap.teleporttrap
Import trap.trapdoor
Import trap.travelrune
Import audio2
Import camera
Import chain
Import chest
Import data
Import entity
Import exitmap
import gamedata
Import input2
Import intpointlist
Import intpointset
Import intpointstack
Import logger
Import minimap
Import necrodancer
Import necrodancergame
Import particles
Import player_class
Import rect
Import renderableobject
Import replay
Import rng
Import saleitem
Import shrine
Import spells
Import sprite
Import stack_ex
Import tile
Import tiledata
Import util
Import weighted_picker
Import xml

Class Level

    Global addKeyInSecretChest: Bool
    Global allCharsCompletion: Bool[9]
    Global allCharsCompletionDLC: Bool[13]
    Global arenaNum: Int = -1
    Global bossNumber: Int = 1
    Global carveX: Int
    Global carveY: Int
    Global charactersJustUnlocked: List<Int> = New List<Int>()
    Global chestsStillToPlace: Int
    Global conjurer: Conjurer
    Global constMapLightValues: Float[]
    Global continuedRunCoinScore: Int
    Global creatingMap: Bool
    Global currentFloorRNG: RNG
    Global dailyChallengeX: Int
    Global dailyChallengeY: Int
    Global deathlessWinCount: Int
    Global debugForceMonstrousShop: Bool
    Global enemiesDropSingleCoinForThisLevel: Bool
    Global exitArrow: Sprite
    Global exitArrowX: Float
    Global exitArrowY: Float
    Global exits: ExitMap = New ExitMap()
    Global firstRoom: RoomData
    Global flawlessVictory: Bool = True
    Global forceBoss: Int = BossBattleType.None
    Global hallwayZone5: BlobRoom
    Global isAllCharactersDLCMode: Bool
    Global isAllCharactersMode: Bool
    Global isAllCharsRunNoItemsNoShrines: Bool = True
    Global isAnyTar: Bool
    Global isBeastmaster: Bool
    Global isConductorLevel: Bool
    Global isDDRMode: Bool
    Global isDailyChallenge: Bool
    Global isDeathlessMode: Bool
    Global isFloorIsLavaMode: Bool
    Global isHardMode: Bool
    Global isHardcoreMode: Bool
    Global isLevelEditor: Bool
    Global isLevelEnding: Bool
    Global isMysteryMode: Bool
    Global isNoReturnMode: Bool
    Global isPhasingMode: Bool
    Global isRandomizerMode: Bool
    Global isReplaying: Bool
    Global isRunNoItemsNoShrines: Bool = True
    Global isSeededMode: Bool
    Global isSoulMode: Bool
    Global isStoryMode: Bool
    Global isSwarmMode: Bool
    Global isTrainingMode: Bool
    Global justUnlocked: String
    Global lastCreatedRoomType: Int = RoomType.None
    Global lastTileCount: Int = -1
    Global levelConstraintH: Int
    Global levelConstraintNum: Int
    Global levelConstraintW: Int
    Global levelConstraintX: Int
    Global levelConstraintY: Int
    Global levelJustStarted: Bool
    Global lockedShopPlaced: Bool
    Global mapLightValues: Float[]
    Global mapLightValuesCachedFrame: Int = -1
    Global mapLightValuesInitialized: Bool
    Global maxLevelMinimapX: Int
    Global maxLevelMinimapY: Int
    Global maxLevelX: Int
    Global maxLevelY: Int
    Global mentorLevel: Int = -1
    Global minLevelMinimapX: Int
    Global minLevelMinimapY: Int
    Global minLevelX: Int
    Global minLevelY: Int
    Global minibossFormerWall: List<MinibossTileData> = New List<MinibossTileData>()
    Global minimap: Minimap
    Global nonDeterministicMSStart: Int = -1
    Global outsideBossChamber: Bool
    Global pacifismModeOn: Bool
    Global pawnbroker: Pawnbroker
    Global pendingTiles: IntMap<IntMap<Tile>> = New IntMap<IntMap<Tile>>()
    Global placeArenaOnDepth: Int = -1
    Global placeArenaOnLevel: Int = -1
    Global placeBloodShopOnDepth: Int = -1
    Global placeBloodShopOnLevel: Int = -1
    Global placeConjurerOnDepth: Int = -1
    Global placeConjurerOnLevel: Int = -1
    Global placeFoodShopOnDepth: Int = -1
    Global placeFoodShopOnLevel: Int = -1
    Global placeGlassShopOnDepth: Int = -1
    Global placeGlassShopOnLevel: Int = -1
    Global placeLordOnLevel: Int = -1
    Global placePawnbrokerOnDepth: Int = -1
    Global placePawnbrokerOnLevel: Int = -1
    Global placeShrineOnLevel: IntMap<Int> = New IntMap<Int>()
    Global placeShrinerOnDepth: Int = -1
    Global placeShrinerOnLevel: Int = -1
    Global placeTransmogrifierOnDepth: Int = -1
    Global placeTransmogrifierOnLevel: Int = -1
    Global placedAdditionalBlackChest: Bool
    Global placedAdditionalRedChest: Bool
    Global placedAdditionalWhiteChest: Bool
    Global placedArena: Bool
    Global placedUrnThisRun: Bool
    Global playedVictoryCutscene: Bool
    Global popUpController: ControllerPopUp
    Global popUpType: Int = -1
    Global practiceEnemyNum: Int = -1
    Global previousLevelMinibosses: StackEx<Int> = New StackEx<Int>()
    Global previousLevelUnkilledStairLockingMinibosses: StackEx<Int> = New StackEx<Int>()
    Global quickRestart: Bool
    Global randSeed: Int = -1
    Global randSeedString: String
    Global replay: Replay
    Global rooms: List<RoomData> = New List<RoomData>()
    Global secretAtX: Int
    Global secretAtY: Int
    Global secretRockRoomPlaced: Bool
    Global shopH: Int
    Global shopW: Int
    Global shopX: Int
    Global shopY: Int
    Global shopkeeperDead: Bool
    Global shopkeeperFell: Bool
    Global shopkeeperGhostDepth: Int = -1
    Global shopkeeperGhostLevel: Int = -1
    Global shriner: Shriner
    Global skipNextPenaltyBox: Bool
    Global specialRoomEntranceX: Int
    Global specialRoomEntranceY: Int
    Global startedShrinerFight: Bool
    Global tempTileWalk: List<Point> = New List<Point>()
    Global tileObstructionList: IntPointList  = New IntPointList()
    Global tiles: IntMap<IntMap<Tile>> = New IntMap<IntMap<Tile>>()
    Global todaysRandSeedString: String
    Global transmogrifier: Transmogrifier
    Global triggerList: IntList = New IntList()
    Global usedBosses: IntSet = New IntSet()
    Global usedCustomMusic: Bool
    Global wasMinibossLockedInBattle: Bool
    Global wholeRunRNG: RNG
    Global zone3DividingLineX: Float
    Global zone3DividingLineY: Float
    Global zoneOrder: Stack<Int>

    Function ActivateTrigger: Int(triggerNum: Int, ent: Entity, target: RenderableObject)
        Debug.TraceNotImplemented("Level.ActivateTrigger(Int, Entity, RenderableObject)")
    End Function

    Function ActuallyGetMapTileLightValue: Float(xVal: Int, yVal: Int, forVision: Bool)
        Debug.TraceNotImplemented("Level.ActuallyGetMapTileLightValue(Int, Int, Bool)")
    End Function

    Function AddCrackedWall: Void(roomType: Int)
        Debug.Log("Adding cracked wall...")

        Local lowHealthWallLocations := New IntPointList()

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()

                If tile.IsWall(False, True, False, False)
                    If tile.health <= 1
                        lowHealthWallLocations.AddLast(New Point(tile.x, tile.y))
                    End If
                End If
            End For
        End For

        Local lowHealthWallLocationsArray := lowHealthWallLocations.ToArray()
        Local lowHealthWallLocationsCount := lowHealthWallLocations.Count()
        Local lowHealthWallLocation: Point

        ' WARN: Potential infinite loop.
        While True
            Local i := Util.RndIntRangeFromZero(lowHealthWallLocationsCount - 1, True)
            lowHealthWallLocation = lowHealthWallLocationsArray[i]

            If Level.IsFloorAdjacent(lowHealthWallLocation.x, lowHealthWallLocation.y)
                Exit
            End If
        End While

        Local lowHealthWall := Level.GetTileAt(lowHealthWallLocation.x, lowHealthWallLocation.y)

        Select roomType
            Case RoomType.Pillar
                lowHealthWall.SetDigTrigger(10)
                lowHealthWall.BecomeStone()
            Case RoomType.OutsideCorners
                lowHealthWall.SetDigTrigger(19)
            Case RoomType.Shop
                lowHealthWall.SetDigTrigger(21)
                lowHealthWall.BecomeStone()
            Case RoomType.Start
                lowHealthWall.SetDigTrigger(22)
                lowHealthWall.BecomeStone()
            Case RoomType.Secret
                lowHealthWall.SetDigTrigger(23)
                lowHealthWall.BecomeHarderStone()
            Case RoomType.Boss
                lowHealthWall.SetDigTrigger(35)
            Case RoomType.Vault
                lowHealthWall.SetDigTrigger(36)
            Case RoomType.Notched
                lowHealthWall.SetDigTrigger(37)
                lowHealthWall.BecomeHarderStone()
        End Select

        lowHealthWall.BecomeCracked()

        Level.secretAtX = lowHealthWallLocation.x
        Level.secretAtY = lowHealthWallLocation.y

        Debug.Log("Finished adding cracked wall")
    End Function

    Function AddExit: Void(xVal: Int, yVal: Int, levelPointer: Int, zonePointer: Int)
        Local location := New Point(xVal, yVal)
        Local floor := New Point(levelPointer, zonePointer)
        Level.exits.Set(location, floor)
    End Function

    Function AddHarderStone: Void()
        Debug.Log("Adding harder stone")

        Local percentToConvert := 0.01
        Select controller_game.currentLevel
            Case 2 percentToConvert = 0.02
            Case 3 percentToConvert = 0.03
            Case 4 percentToConvert = 0.04
            Default
                If controller_game.currentDepth > 4
                    percentToConvert = math.Min(0.1, controller_game.currentLevel * 0.01)
                End If
        End Select

        If controller_game.currentZone = 4
            percentToConvert = math.Min(0.01, percentToConvert)
        End If

        Local conversionCandidates := New IntPointList()

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsWall(False, True, False, False) And
                   tile.health <= 1 And
                   Not tile.isCracked
                    conversionCandidates.AddLast(New Point(tile.x, tile.y))
                End If
            End For
        End For

        Local i := 5000
        Local numWallsToConvert := Int(conversionCandidates.Count() * percentToConvert)

        For i = i - 1 Until 0 Step -1
            If numWallsToConvert <= 0 Then Exit

            numWallsToConvert -= 1

            Local conversionCandidatesIndex := Util.RndIntRangeFromZero(conversionCandidates.Count() - 1, True)
            Local conversionCandidatesArray := conversionCandidates.ToArray()
            Local wallToConvert := conversionCandidatesArray[conversionCandidatesIndex]

            Level.GetTileAt(wallToConvert.x, wallToConvert.y).BecomeHarderStone()

            conversionCandidates.RemoveEach(wallToConvert)
        End For

        If i <= 0
            Debug.Log("****************** ADDSTONE: Unable to place the desired amount of stone! ******************")
        End If
    End Function

    Function AddMinibossWall: Void(xVal: Int, yVal: Int, wallType: Int)
        Local tile := Level.GetTileAt(xVal, yVal)
        If tile
            If tile.triggerDig Then Return

            Local tileData := New MinibossTileData()
            tileData.x = xVal
            tileData.y = yVal
            tileData.type = tile.type
            tileData.wireMask = tile.wireMask

            Level.minibossFormerWall.AddLast(tileData)
        End If

        Level.PlaceTileRemovingExistingTiles(xVal, yVal, wallType, False, -1, False)
        Level.wasMinibossLockedInBattle = True
    End Function

    Function AddSomePillarsInOpenSpace: Void()
        Local pillarCandidates := New IntPointList()

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()

                If tile.GetType() <> TileType.Floor Then Continue
                If Level.IsTrapOrExitAbove(tile.x, tile.y) Then Continue
                If Level.IsWallAdjacent8(tile.x, tile.y) Then Continue

                Local player1Location := controller_game.players[controller_game.player1].GetLocation()
                Local distFromPlayer := Util.GetDist(player1Location.x, player1Location.y, tile.x, tile.y)
                If distFromPlayer <= 6.0 Then Continue

                Local distFromClosestNPC := NPC.GetDistFromClosestNPC(tile.x, tile.y)
                If distFromClosestNPC <= 6.0 Then Continue

                pillarCandidates.AddLast(New Point(tile.x, tile.y))
            End For
        End For

        Local i := 500
        Local numPillars := 6

        For i = i - 1 Until 0 Step -1
            If pillarCandidates.IsEmpty() Then Exit
            If numPillars <= 0 Then Exit

            Local pillarCandidatesIndex := Util.RndIntRangeFromZero(pillarCandidates.Count() - 1, True)
            Local pillarCandidatesArray := pillarCandidates.ToArray()
            Local pillarCandidate := pillarCandidatesArray[pillarCandidatesIndex]

            If Level.IsFloorAdjacent(pillarCandidate.x, pillarCandidate.y)
                If Not Level.IsCorridorFloorOrDoorAdjacent(pillarCandidate.x, pillarCandidate.y)
                    Level.PlaceTileRemovingExistingTiles(pillarCandidate.x, pillarCandidate.y, TileType.DirtWall)
                    numPillars -= 1
                End If
            End If

            pillarCandidates.RemoveEach(pillarCandidate)
        End For

        If i <= 0
            Debug.Log("****************** AddSomePillarsInOpenSpace: Unable to add the desired number of pillars! ******************")
        End If
    End Function

    Function AddSpecialRoom: Void(roomType: Int, addCrack: Bool)
        Debug.Log("Adding special room")

        If addCrack
            Level.AddCrackedWall(roomType)
        End If

        Level.DisableLevelConstraints()

        Select roomType
            Case SpecialRoomType.FoodShop
                Level.CreateRoom(-200, -200, 8, 10, False, RoomType.Special, -1, -1, -1, -1, False, TileType.DirtWall, False, True)

                Level.GetTileAt(-198, -200).AddTorch()
                Level.GetTileAt(-194, -200).AddTorch()
                Level.GetTileAt(-198, -190).AddTorch()
                Level.GetTileAt(-194, -190).AddTorch()
                Level.GetTileAt(-200, -197).AddTorch()
                Level.GetTileAt(-192, -197).AddTorch()
                Level.GetTileAt(-200, -193).AddTorch()
                Level.GetTileAt(-192, -193).AddTorch()

                Local entranceX := -196
                Local entranceY := -193

                Level.specialRoomEntranceX = entranceX
                Level.specialRoomEntranceY = entranceY

                New TravelRune(entranceX, entranceY, Level.secretAtX, Level.secretAtY, TravelRuneType.FoodShop)

                Local shopkeeper := New Shopkeeper(entranceX, entranceY - 4, 4, False)

                Local food := Level.RandomFood()
                New SaleItem(entranceX - 1, entranceY - 2, food, False, shopkeeper, -1.0, Null)

                Local heartContainerRoll := Util.RndIntRangeFromZero(100, True)
                Local heartContainer: String
                If heartContainerRoll <= 20
                    heartContainer = "misc_heart_container"
                Else If heartContainerRoll <= 25
                    heartContainer = "misc_heart_container2"
                Else If heartContainerRoll <= 50
                    heartContainer = "misc_heart_container_empty2"
                Else
                    heartContainer = "misc_heart_container_empty"
                End If
                New SaleItem(entranceX + 1, entranceY - 2, heartContainer, False, shopkeeper, -1.0, Null)

                If Not Util.RndIntRangeFromZero(9, True)
                    Level.PlaceSecondarySpecialShop(False, True)
                End If
            Case SpecialRoomType.BloodShop
                Level.CreateRoom(-200, -200, 6, 8, False, RoomType.Special, -1, -1, -1, -1, False, TileType.DirtWall, False, True)

                Level.GetTileAt(-199, -200).AddTorch()
                Level.GetTileAt(-195, -200).AddTorch()
                Level.GetTileAt(-199, -192).AddTorch()
                Level.GetTileAt(-195, -192).AddTorch()
                Level.GetTileAt(-200, -198).AddTorch()
                Level.GetTileAt(-194, -198).AddTorch()
                Level.GetTileAt(-200, -194).AddTorch()
                Level.GetTileAt(-194, -194).AddTorch()

                Local entranceX := -197
                Local entranceY := -194

                Level.specialRoomEntranceX = entranceX
                Level.specialRoomEntranceY = entranceY

                New TravelRune(entranceX, entranceY, Level.secretAtX, Level.secretAtY, TravelRuneType.BloodShop)

                Local shopkeeper := New Shopkeeper(entranceX, entranceY - 4, 2, False)

                Local requestedLevel := controller_game.currentLevel + 2

                Local saleItemXOff := -1
                If Not Util.IsWeaponlessCharacterActive()
                    saleItemXOff = 0

                    Local itemClass: String
                    If Level.isDailyChallenge
                        itemClass = ""
                    Else
                        itemClass = "isGold"
                    End If

                    ' Left item
                    Local randomItem1 := Item.GetRandomItemInClass(itemClass, requestedLevel, "anyChest", Chest.CHEST_COLOR_NONE, True, "", False)
                    If Item.IsValidRandomItem(randomItem1)
                        New SaleItem(entranceX - 1, entranceY - 2, randomItem1, True, Null, -1.0, Null)
                    End If
                End If

                ' Center item (left item if a weaponless character is active)
                Local randomItem2 := Item.GetRandomItemInClass("", requestedLevel, "anyChest", Chest.CHEST_COLOR_NONE, True, "", False)
                If Item.IsValidRandomItem(randomItem2)
                    New SaleItem(entranceX + saleItemXOff, entranceY - 2, randomItem2, True, Null, -1.0, Null)
                End If

                ' Right item
                Local randomItem3 := Item.GetRandomItemInClass("", requestedLevel, "anyChest", Chest.CHEST_COLOR_NONE, True, "", False)
                If Item.IsValidRandomItem(randomItem3)
                    New SaleItem(entranceX + 1, entranceY - 2, randomItem3, True, Null, -1.0, Null)
                End If

                If Not Util.RndIntRangeFromZero(9, True)
                    Level.PlaceSecondarySpecialShop(True, False)
                End If
            Case SpecialRoomType.GlassShop
                Level.CreateRoom(-200, -200, 6, 8, False, RoomType.Special, -1, -1, -1, -1, False, TileType.DirtWall, False, True)

                Level.GetTileAt(-199, -200).AddTorch()
                Level.GetTileAt(-195, -200).AddTorch()
                Level.GetTileAt(-199, -192).AddTorch()
                Level.GetTileAt(-195, -192).AddTorch()
                Level.GetTileAt(-200, -198).AddTorch()
                Level.GetTileAt(-194, -198).AddTorch()
                Level.GetTileAt(-200, -194).AddTorch()
                Level.GetTileAt(-194, -194).AddTorch()

                Local entranceX := -197
                Local entranceY := -194

                Level.specialRoomEntranceX = entranceX
                Level.specialRoomEntranceY = entranceY

                New TravelRune(entranceX, entranceY, Level.secretAtX, Level.secretAtY, TravelRuneType.GlassShop)

                Local shopkeeper := New Shopkeeper(-197, -198, 3, False)

                Local glassItems := New Stack<String>()
                glassItems.Push("armor_glass")
                glassItems.Push("shovel_glass")
                glassItems.Push("torch_glass")
                glassItems.Push("feet_glass_slippers")

                ' Decompilation is a little awkward in this section. Absolutely zero clue what's going on.
                Local validGlassItems := New Stack<String>()
                For Local glassItem := EachIn glassItems
                    Local glassItemNode := Item.GetItemXML(glassItem)
                    If Item.IsValidItemForCurrentChars(glassItemNode)
                        validGlassItems.Push(glassItem)
                    End If
                End For

                Local anotherItems := New Stack<String>()
                Local newItems := New StringSet()
                For Local validGlassItem := EachIn validGlassItems
                    If Not Item.seenItems.Contains(validGlassItem)
                        anotherItems.Push(validGlassItem)
                        newItems.Insert(validGlassItem)
                    End If
                End For

                For Local validGlassItem := EachIn validGlassItems
                    If Not newItems.Contains(validGlassItem)
                        anotherItems.Push(validGlassItem)
                    End If
                End For

                While anotherItems.Length() > 2
                    anotherItems.Pop()
                End While

                While anotherItems.Length() <= 2
                    Local glassWeapon := Item.GetRandomItemInClass("isGlass", controller_game.currentLevel, "anyChest", Chest.CHEST_COLOR_NONE, True, "weapon", False)
                    anotherItems.Push(glassWeapon)
                End While

                Local glassItemXOff := -1
                For Local i := 0 Until 3
                    Local anotherItem := anotherItems.Get(i)
                    If Item.IsValidRandomItem(anotherItem)
                        Local glassItem := New SaleItem(entranceX + glassItemXOff, entranceY - 2, anotherItem, False, shopkeeper, -1.0, Null)
                        glassItem.ApplyDiscount(0.5)
                    End If

                    If Util.IsWeaponlessCharacterActive()
                        glassItemXOff += 2
                    Else
                        glassItemXOff += 1
                    End If

                    If glassItemXOff > 1 Then Exit
                End For

                If Not Util.RndIntRangeFromZero(9, True)
                    Level.PlaceSecondarySpecialShop(False, False)
                End If
            Case SpecialRoomType.Arena
                Level.CreateRoom(-200, -200, 6, 8, False, RoomType.Special, -1, -1, -1, -1, False, TileType.DirtWall, False, True)

                Level.GetTileAt(-199, -200).AddTorch()
                Level.GetTileAt(-195, -200).AddTorch()
                Level.GetTileAt(-199, -192).AddTorch()
                Level.GetTileAt(-195, -192).AddTorch()
                Level.GetTileAt(-200, -198).AddTorch()
                Level.GetTileAt(-194, -198).AddTorch()
                Level.GetTileAt(-200, -194).AddTorch()
                Level.GetTileAt(-194, -194).AddTorch()

                Local entranceX := -197
                Local entranceY := -195

                Level.specialRoomEntranceX = entranceX
                Level.specialRoomEntranceY = entranceY

                New TravelRune(entranceX, entranceY + 1, Level.secretAtX, Level.secretAtY, TravelRuneType.Arena)

                Local requestedLevel := controller_game.currentLevel + 2

                Local randomRedChestItemType := Item.GetRandomItemInClass("", requestedLevel, "chestChance", Chest.CHEST_COLOR_RED, False, "", False)
                Local randomRedChestItem := New Item(-198, -197, randomRedChestItemType, False, -1, False)
                randomRedChestItem.singleChoiceItem = True

                Local randomWhiteChestItemType := Item.GetRandomItemInClass("", requestedLevel, "chestChance", Chest.CHEST_COLOR_WHITE, False, "", False)
                Local randomWhiteChestItem := New Item(-197, -197, randomWhiteChestItemType, False, -1, False)
                randomWhiteChestItem.singleChoiceItem = True

                Local randomBlackChestItemType := Item.GetRandomItemInClass("", requestedLevel, "chestChance", Chest.CHEST_COLOR_BLACK, False, "", False)
                Local randomBlackChestItem := New Item(-196, -197, randomBlackChestItemType, False, -1, False)
                randomBlackChestItem.singleChoiceItem = True

                Level.GetTileAt(-198, -197).SetTrigger(18)
                Level.GetTileAt(-197, -197).SetTrigger(18)
                Level.GetTileAt(-196, -197).SetTrigger(18)
            Case SpecialRoomType.Transmogrifier
                Level.CreateRoom(-200, -200, 6, 9, False, RoomType.Special, -1, -1, -1, -1, False, TileType.DirtWall, False, True)

                Level.GetTileAt(-199, -200).AddTorch()
                Level.GetTileAt(-195, -200).AddTorch()
                Level.GetTileAt(-199, -191).AddTorch()
                Level.GetTileAt(-195, -191).AddTorch()
                Level.GetTileAt(-200, -198).AddTorch()
                Level.GetTileAt(-194, -198).AddTorch()
                Level.GetTileAt(-200, -194).AddTorch()
                Level.GetTileAt(-194, -194).AddTorch()

                Local entranceX := -197
                Local entranceY := -193

                Level.specialRoomEntranceX = entranceX
                Level.specialRoomEntranceY = entranceY

                New TravelRune(entranceX, entranceY + 1, Level.secretAtX, Level.secretAtY, TravelRuneType.Transmogrifier)

                Level.transmogrifier = New Transmogrifier(entranceX, entranceY - 3, 1, False)

                Local headTile := Level.GetTileAt(entranceX - 1, entranceY - 4)
                headTile.AddFloorOverlayImage("level/tile_transmogrify_head.png")
                headTile.SetTrigger(11)
                Local bodyTile := Level.GetTileAt(entranceX - 1, entranceY - 3)
                bodyTile.AddFloorOverlayImage("level/tile_transmogrify_body.png")
                bodyTile.SetTrigger(12)
                Local feetTile := Level.GetTileAt(entranceX - 1, entranceY - 3)
                feetTile.AddFloorOverlayImage("level/tile_transmogrify_feet.png")
                feetTile.SetTrigger(13)
                Local torchTile := Level.GetTileAt(entranceX - 1, entranceY - 2)
                torchTile.AddFloorOverlayImage("level/tile_transmogrify_torch.png")
                torchTile.SetTrigger(14)
                Local weaponTile := Level.GetTileAt(entranceX + 1, entranceY - 2)
                weaponTile.AddFloorOverlayImage("level/tile_transmogrify_weapon.png")
                weaponTile.SetTrigger(15)
                Local shovelTile := Level.GetTileAt(entranceX + 1, entranceY - 3)
                shovelTile.AddFloorOverlayImage("level/tile_transmogrify_shovel.png")
                shovelTile.SetTrigger(17)
                Local ringTile := Level.GetTileAt(entranceX + 1, entranceY - 4)
                ringTile.AddFloorOverlayImage("level/tile_transmogrify_ring.png")
                ringTile.SetTrigger(16)
            Case SpecialRoomType.Conjurer
                Level.CreateRoom(-200, -200, 6, 9, False, RoomType.Special, -1, -1, -1, -1, False, TileType.DirtWall, False, True)

                Level.GetTileAt(-199, -200).AddTorch()
                Level.GetTileAt(-195, -200).AddTorch()
                Level.GetTileAt(-199, -191).AddTorch()
                Level.GetTileAt(-195, -191).AddTorch()
                Level.GetTileAt(-200, -198).AddTorch()
                Level.GetTileAt(-194, -198).AddTorch()
                Level.GetTileAt(-200, -194).AddTorch()
                Level.GetTileAt(-194, -194).AddTorch()

                Local entranceX := -197
                Local entranceY := -193

                Level.specialRoomEntranceX = entranceX
                Level.specialRoomEntranceY = entranceY

                New TravelRune(entranceX, entranceY, Level.secretAtX, Level.secretAtY, TravelRuneType.Conjurer)

                Level.conjurer = New Conjurer(entranceX - 1, entranceY - 6, 1, False)

                Local headTile := Level.GetTileAt(entranceX - 1, entranceY - 4)
                headTile.AddFloorOverlayImage("level/tile_transmogrify_head.png")
                headTile.SetTrigger(38)
                Local bodyTile := Level.GetTileAt(entranceX - 1, entranceY - 3)
                bodyTile.AddFloorOverlayImage("level/tile_transmogrify_body.png")
                bodyTile.SetTrigger(39)
                Local feetTile := Level.GetTileAt(entranceX - 1, entranceY - 3)
                feetTile.AddFloorOverlayImage("level/tile_transmogrify_feet.png")
                feetTile.SetTrigger(40)
                Local torchTile := Level.GetTileAt(entranceX - 1, entranceY - 2)
                torchTile.AddFloorOverlayImage("level/tile_transmogrify_torch.png")
                torchTile.SetTrigger(41)
                Local weaponTile := Level.GetTileAt(entranceX + 1, entranceY - 2)
                weaponTile.AddFloorOverlayImage("level/tile_transmogrify_weapon.png")
                weaponTile.SetTrigger(42)
                Local shovelTile := Level.GetTileAt(entranceX + 1, entranceY - 3)
                shovelTile.AddFloorOverlayImage("level/tile_transmogrify_shovel.png")
                shovelTile.SetTrigger(44)
                Local ringTile := Level.GetTileAt(entranceX + 1, entranceY - 4)
                ringTile.AddFloorOverlayImage("level/tile_transmogrify_ring.png")
                ringTile.SetTrigger(43)
            Case SpecialRoomType.Shriner
                Level.CreateRoom(-200, -200, 6, 9, False, RoomType.Special, -1, -1, -1, -1, False, TileType.DirtWall, False, True)

                Level.GetTileAt(-199, -200).AddTorch()
                Level.GetTileAt(-195, -200).AddTorch()
                Level.GetTileAt(-199, -191).AddTorch()
                Level.GetTileAt(-195, -191).AddTorch()
                Level.GetTileAt(-200, -198).AddTorch()
                Level.GetTileAt(-194, -198).AddTorch()
                Level.GetTileAt(-200, -194).AddTorch()
                Level.GetTileAt(-194, -194).AddTorch()

                Local entranceX := -197
                Local entranceY := -193

                Level.specialRoomEntranceX = entranceX
                Level.specialRoomEntranceY = entranceY

                New TravelRune(entranceX, entranceY, Level.secretAtX, Level.secretAtY, TravelRuneType.Shriner)

                Local shriner := New Shriner(entranceX, entranceY - 4, 1, False)
                Level.shriner = shriner

                Local shrineType1 := Shrine.GetRandomShrineInt(True, -1, -2)
                Local shrineType2 := Shrine.GetRandomShrineInt(True, shrineType1, -2)
                Local shrineType3 := Shrine.GetRandomShrineInt(True, shrineType1, shrineType2)

                shriner.shrine1 = New Shrine(entranceX - 1, entranceY - 2, shrineType1, Null, True, True)
                shriner.shrine2 = New Shrine(entranceX, entranceY - 2, shrineType2, Null, True, True)
                shriner.shrine3 = New Shrine(entranceX + 1, entranceY - 2, shrineType3, Null, True, True)
            Case SpecialRoomType.Pawnbroker
                Level.CreateRoom(-200, -200, 6, 9, False, RoomType.Special, -1, -1, -1, -1, False, TileType.DirtWall, False, True)

                Level.GetTileAt(-199, -200).AddTorch()
                Level.GetTileAt(-195, -200).AddTorch()
                Level.GetTileAt(-199, -191).AddTorch()
                Level.GetTileAt(-195, -191).AddTorch()
                Level.GetTileAt(-200, -198).AddTorch()
                Level.GetTileAt(-194, -198).AddTorch()
                Level.GetTileAt(-200, -194).AddTorch()
                Level.GetTileAt(-194, -194).AddTorch()

                Local entranceX := -197
                Local entranceY := -193

                Level.specialRoomEntranceX = entranceX
                Level.specialRoomEntranceY = entranceY

                New TravelRune(entranceX, entranceY, Level.secretAtX, Level.secretAtY, TravelRuneType.Pawnbroker)

                Level.pawnbroker = New Pawnbroker(entranceX, entranceY - 6, 1, False)

                Local headTile := Level.GetTileAt(entranceX - 1, entranceY - 4)
                headTile.AddFloorOverlayImage("level/tile_transmogrify_head.png")
                headTile.SetTrigger(45)
                Local bodyTile := Level.GetTileAt(entranceX - 1, entranceY - 3)
                bodyTile.AddFloorOverlayImage("level/tile_transmogrify_body.png")
                bodyTile.SetTrigger(46)
                Local feetTile := Level.GetTileAt(entranceX - 1, entranceY - 3)
                feetTile.AddFloorOverlayImage("level/tile_transmogrify_feet.png")
                feetTile.SetTrigger(47)
                Local torchTile := Level.GetTileAt(entranceX - 1, entranceY - 2)
                torchTile.AddFloorOverlayImage("level/tile_transmogrify_torch.png")
                torchTile.SetTrigger(48)
                Local weaponTile := Level.GetTileAt(entranceX + 1, entranceY - 2)
                weaponTile.AddFloorOverlayImage("level/tile_transmogrify_weapon.png")
                weaponTile.SetTrigger(49)
                Local shovelTile := Level.GetTileAt(entranceX + 1, entranceY - 3)
                shovelTile.AddFloorOverlayImage("level/tile_transmogrify_shovel.png")
                shovelTile.SetTrigger(51)
                Local ringTile := Level.GetTileAt(entranceX + 1, entranceY - 4)
                ringTile.AddFloorOverlayImage("level/tile_transmogrify_ring.png")
                ringTile.SetTrigger(50)

                ' Not in the constructor unlike the other NPCs.
                Local tile := Level.GetTileAt(entranceX, entranceY - 5)
                tile.AddTextLabel("|124|SELL ONE OF YOUR ITEMS?|", 0, 20, 0.0, False, True)
        End Select

        Debug.Log("Finished adding special room")
    End Function

    Function AddStone: Void()
        Debug.Log("Adding stone")

        Local stoneCountMultiplier: Float

        Select controller_game.currentLevel
            Case 1 stoneCountMultiplier = 0.08
            Case 2 stoneCountMultiplier = 0.14
            Default stoneCountMultiplier = 0.20
        End Select

        If Level.isHardcoreMode Then stoneCountMultiplier += 0.13

        Local stoneCandidateLocations := New List<Point>()

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsWall(False, True, False, False) And
                   tile.health <= 1 And
                   Not tile.isCracked
                    stoneCandidateLocations.AddLast(New Point(tile.x, tile.y))
                End If
            End For
        End For

        Local i := 5000
        Local numTilesToConvert: Int = stoneCandidateLocations.Count() * stoneCountMultiplier

        For i = i - 1 Until 0 Step -1
            If numTilesToConvert = 0 Then Exit

            Local randomIndex := Util.RndIntRangeFromZero(stoneCandidateLocations.Count() - 1, True)
            Local stoneCandidateLocationsArray := stoneCandidateLocations.ToArray()
            Local randomPoint := stoneCandidateLocationsArray[randomIndex]
            Level.GetTileAt(randomPoint.x, randomPoint.y).BecomeStone()
            stoneCandidateLocations.RemoveEach(randomPoint)

            numTilesToConvert -= 1
        End For

        If i = 0
            Debug.Log("****************** ADDSTONE: Unable to place the desired amount of stone! ******************")
        End If
    End Function

    Function AdvanceLevel: Void()
        Debug.TraceNotImplemented("Level.AdvanceLevel()")
    End Function

    Function AllCharsAllComplete: Bool()
        Debug.TraceNotImplemented("Level.AllCharsAllComplete()")
    End Function

    Function AllCharsAnyComplete: Bool()
        Debug.TraceNotImplemented("Level.AllCharsAnyComplete()")
    End Function

    Function AllCharsDLCAllComplete: Bool()
        Debug.TraceNotImplemented("Level.AllCharsDLCAllComplete()")
    End Function

    Function AllCharsDLCAnyComplete: Bool()
        Debug.TraceNotImplemented("Level.AllCharsDLCAnyComplete()")
    End Function

    Function AllowSpirit: Bool()
        Return Poltergeist.theGhoul = Null And
               Wraith.theCursedWraith = Null
    End Function

    Function BossMaybeMinibossesAt: Void(x1: Int, y1: Int, x2: Int, y2: Int)
        Debug.TraceNotImplemented("Level.BossMaybeMinibossesAt(Int, Int, Int, Int)")
    End Function

    Function BreakIce: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.BreakIce(Int, Int)")
    End Function

    Function CarveCorridorTile: Void(xVal: Int, yVal: Int, horizontal: Bool, pending: Bool, skipWalls: Bool, roomType: Int, wideCorridor: Bool)
        If Level.IsSecretRoom(roomType)
            New Tile(xVal, yVal, TileType.CorridorDirtWall, pending, -1)
        Else
            New Tile(xVal, yVal, TileType.CorridorFloor, pending, -1)

            If wideCorridor
                If horizontal
                    New Tile(xVal, yVal + 1, TileType.CorridorFloor, pending, -1)
                Else
                    New Tile(xVal + 1, yVal, TileType.CorridorFloor, pending, -1)
                End If
            End If
        End If

        If Not skipWalls
            ' TODO: Probably bad practice to mutate `xVal` and `yVal`. Consider alternative way of writing it.
            If horizontal
                If Not Level.IsFloorAt(xVal, yVal - 1)
                    New Tile(xVal, yVal - 1, TileType.CorridorDirtWall, pending, -1)
                End If

                If wideCorridor
                    yVal += 2
                Else
                    yVal += 1
                End If
            Else
                If Not Level.IsFloorAt(xVal - 1, yVal)
                    New Tile(xVal - 1, yVal, TileType.CorridorDirtWall, pending, -1)
                End If

                If wideCorridor
                    xVal += 2
                Else
                    xVal += 1
                End If
            End If

            If Not Level.IsFloorAt(xVal, yVal)
                New Tile(xVal, yVal, TileType.CorridorDirtWall, pending, -1)
            End If
        End If
    End Function

    Function CarveNewCorridor: Bool(moveX: Int, moveY: Int, horizontal: Bool, pending: Bool, secondaryCarve: Bool, roomType: Int, wideCorridor: Bool)
        Local numCarves := 2
        If Level.IsSecretRoom(roomType)
            numCarves = 1
        End If

        Local carveAgain := True
        For Local i := 0 Until numCarves
            If Not carveAgain
                Local x := Level.carveX
                Local y := Level.carveY

                If Level.GetTileTypeAt(x, y) <> TileType.Empty
                    Debug.WriteLine("Failed to carve new corridor. Tile at " + (New Point(x, y)).ToString() + " is not empty.")
                    Return False
                End If

                If wideCorridor
                    If horizontal
                        If Level.GetTileTypeAt(Level.carveX, Level.carveY + 1) <> TileType.Empty
                            Debug.WriteLine("Failed to carve new corridor. Tile at " + (New Point(x, y + 1)).ToString() + " is not empty.")
                            Return False
                        End If
                    Else
                        If Level.GetTileTypeAt(Level.carveX + 1, Level.carveY) <> TileType.Empty
                            Debug.WriteLine("Failed to carve new corridor. Tile at " + (New Point(x + 1, y)).ToString() + " is not empty.")
                            Return False
                        End If
                    End If
                End If
            End If

            Local skipWalls := secondaryCarve
            Level.CarveCorridorTile(Level.carveX, Level.carveY, horizontal, pending, skipWalls, roomType, wideCorridor)

            Level.carveX += moveX
            Level.carveY += moveY

            If Not secondaryCarve Then carveAgain = False
            secondaryCarve = False
        End For

        Return True
    End Function

    Function CheckLOS: Bool(x1: Int, y1: Int, x2: Int, y2: Int, includeOffscreen: Bool)
        Debug.TraceNotImplemented("Level.CheckLOS(Int, Int, Int, Int, Bool)")
    End Function

    Function CheckMapConsistency: Void()
        Debug.Log("Checking map consistency for seed " + Level.randSeed + " z " + controller_game.currentZone + " l " + controller_game.currentLevel)

        For Local trap := EachIn Trap.trapList
            Select trap.trapType
                Case TrapType.BounceTrap,
                     TrapType.SpikeTrap,
                     TrapType.TrapDoor,
                     TrapType.ConfuseTrap,
                     TrapType.TeleportTrap,
                     TrapType.SlowDownTrap,
                     TrapType.SpeedUpTrap,
                     TrapType.BombTrap
                    If Level.IsWallAt(trap.x, trap.y, False, False)
                        Debug.Log("MAP INCONSISTENCY: Trap type " + trap.trapType + " inside wall at " + trap.GetLocation.ToString())
                    End If
            End Select
        End For

        For Local pickup := EachIn Item.pickupList
            If Level.IsWallAt(pickup.x, pickup.y, False, False)
                Debug.Log("MAP INCONSISTENCY: Item " + pickup.itemType + " inside wall at " + pickup.GetLocation().ToString())
            End If
        End For

        For Local enemy := EachIn Enemy.enemyList
            If Level.IsWallAt(enemy.x, enemy.y, False, False)
                If enemy.xmlName <> "spider"
                    Debug.Log("MAP INCONSISTENCY: Enemy " + enemy.xmlName + " inside wall at " + enemy.GetLocation().ToString())
                End If
            End If
        End For
    End Function

    Function ClearMinibossWall: Void()
        For Local tileData := EachIn Level.minibossFormerWall
            Local tile := Level.GetTileAt(tileData.x, tileData.y)
            If tile <> Null And
               Not tile.IsFloor()
                Local newTile := Level.PlaceTileRemovingExistingTiles(tileData.x, tileData.y, tileData.type, False, -1, False)
                newTile.wireMask = tileData.wireMask
            End If
        End For
    End Function

    Function ClearTextLabelAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.ClearTextLabelAt(Int, Int)")
    End Function

    Function CloseInOuterWalls: Void()
        Debug.TraceNotImplemented("Level.CloseInOuterWalls()")
    End Function

    Function ConjureSlot: Void(slotName: String, ent: Entity)
        Debug.TraceNotImplemented("Level.ConjureSlot(String, Entity)")
    End Function

    Function CreateAllCharsDLCSelect: Void()
        Debug.TraceNotImplemented("Level.CreateAllCharsDLCSelect()")
    End Function

    Function CreateAllCharsSelect: Void()
        Debug.TraceNotImplemented("Level.CreateAllCharsSelect()")
    End Function

    Function CreateBeastmaster: Void()
        Debug.TraceNotImplemented("Level.CreateBeastmaster()")
    End Function

    Function CreateBeastmasterZone1: Void()
        Debug.TraceNotImplemented("Level.CreateBeastmasterZone1()")
    End Function

    Function CreateBeastmasterZone2: Void()
        Debug.TraceNotImplemented("Level.CreateBeastmasterZone2()")
    End Function

    Function CreateBeastmasterZone3: Void()
        Debug.TraceNotImplemented("Level.CreateBeastmasterZone3()")
    End Function

    Function CreateBeastmasterZone4: Void()
        Debug.TraceNotImplemented("Level.CreateBeastmasterZone4()")
    End Function

    Function CreateBeastmasterZone5: Void()
        Debug.TraceNotImplemented("Level.CreateBeastmasterZone5()")
    End Function

    Function CreateBossBattle: Void()
        If Level.IsFinalBossZone()
            ' TODO: Verify boss numbers.
            If Util.IsCharacterActive(Character.Aria)
                Level.bossNumber = 7
            Else If Util.IsCharacterActive(Character.Nocturna)
                Level.bossNumber = 10
            Else If Util.IsCharacterActive(Character.Cadence)
                Level.bossNumber = 5
            End If
        Else
            Local bossNumbers := New IntStack()
            bossNumbers.Push(1)
            bossNumbers.Push(2)
            bossNumbers.Push(3)
            bossNumbers.Push(4)

            If Level.isHardcoreMode Or
               controller_game.currentZone > 4
                bossNumbers.Push(9)
            End If

            Debug.Log("CREATEBOSSBATTLE Selecting randomly from eligible bosses:")

            Local eligibleBossNumbers := New StackEx<Int>()

            For Local bossNumber := EachIn bossNumbers
                If Level.usedBosses.Contains(bossNumber) Then Continue

                Debug.Log("  Eligible boss :  " + bossNumber)
                eligibleBossNumbers.Push(bossNumber)
            End For

            Level.bossNumber = 1
            If eligibleBossNumbers.Length() > 0
                Level.bossNumber = eligibleBossNumbers.ChooseRandom(True)
            End If

            Debug.Log("Selected boss :  " + Level.bossNumber)
        End If

        If Level.forceBoss <> -1
            Level.bossNumber = Level.forceBoss
            Level.forceBoss = -1
        End If

        Level.usedBosses.Insert(Level.bossNumber)

        Select Level.bossNumber
            Case  1 Level.CreateBossBattle1()
            Case  2 Level.CreateBossBattle2()
            Case  3 Level.CreateBossBattle3()
            Case  4 Level.CreateBossBattle4()
            Case  5 Level.CreateBossBattle5()
            Case  9 Level.CreateBossBattle9()
            Case 10 Level.CreateBossBattleFrankensteinway()
        End Select

        Level.outsideBossChamber = True

        If Level.WantPenaltyBox()
            Level.PlacePenaltyBoxEnemies()

            Level.minibossFormerWall = New List<MinibossTileData>()

            Level.AddMinibossWall(-1, -3, TileType.BossWall)
            Level.AddMinibossWall(0, -3, TileType.BossWall)
            Level.AddMinibossWall(1, -3, TileType.BossWall)

            Level.PlaceTileRemovingExistingTiles(-1, -1, TileType.BossFloor, False, -1, False)
            Level.PlaceTileRemovingExistingTiles(1, -1, TileType.BossFloor, False, -1, False)
            Level.PlaceTileRemovingExistingTiles(-1, 1, TileType.BossFloor, False, -1, False)
            Level.PlaceTileRemovingExistingTiles(1, 1, TileType.BossFloor, False, -1, False)

            Level.GetTileAt(-3, 0).AddTorch()
            Level.GetTileAt(3, 0).AddTorch()
            Level.GetTileAt(0, -3).AddTorch()
            Level.GetTileAt(0, 3).AddTorch()
        End If
    End Function

    Function PlaceFirstBossRoom: Void()
        Level.PlaceFirstBossRoom("")
    End Function

    Function PlaceFirstBossRoom: Void(bossTrainingName: String)
        Level.PlaceFirstBossRoom(bossTrainingName, TilesetType.None)
    End Function

    Function PlaceFirstBossRoom: Void(bossTrainingName: String, tilesetOverride: Int)
        Level.CreateRoom(-3, -3, 6, 6, False, RoomType.Boss)

        If bossTrainingName <> ""
            Level.EnsureBossTraining(bossTrainingName)
        End If

        If Level.isTrainingMode
            Level.AddExit(2, 0, LevelType.Lobby, 1)
            Level.PlaceTileRemovingExistingTiles(2, 0, TileType.Stairs)
        End If

        If Util.IsCharacterActive(Character.Tempo)
            If Level.WantPenaltyBox()
                Local sarcophagus := New Sarcophagus(-2, 2, 1)
                sarcophagus.exemptFromPause = True
                sarcophagus.hasBeenVisible = True
                sarcophagus.coinsToDrop = 0
            End If
        End If

        Level.PlaceTileRemovingExistingTiles(-1, -1, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(1, -1, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(-1, 1, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(1, 1, TileType.BossWall)

        Level.GetTileAt(-1, -1).AddTorch()
        Level.GetTileAt(1, -1).AddTorch()
        Level.GetTileAt(-1, 1).AddTorch()
        Level.GetTileAt(1, 1).AddTorch()

        For Local y := -3 To -5 Step -1
            For Local x := -1 To 1
                If y = -3
                    Level.PlaceTileRemovingExistingTiles(x, y, TileType.BossFloor, False, tilesetOverride, False)
                Else
                    Level.PlaceTileRemovingExistingTiles(x, y, TileType.BossFloor)
                End If
            End For
        End For

        Level.PlaceTileRemovingExistingTiles(-2, -4, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(2, -4, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(-2, -5, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(2, -5, TileType.BossWall)
    End Function

    Function CreateBossBattle1: Void()
        Debug.Log("CREATEBOSSBATTLE1: Creating conga line boss battle.")

        Level.InitNewMap(True)
        Level.DisableLevelConstraints()

        Level.PlaceFirstBossRoom("conga")

        Level.CreateRoom(-8, -18, 16, 12, False, RoomType.Boss)

        For Local x := -1 To 1
            Level.PlaceTileRemovingExistingTiles(x, -6, TileType.Door)
        End For

        Level.GetTileAt(-2, -6).AddTorch()
        Level.GetTileAt(2, -6).AddTorch()

        Level.GetTileAt(0, -5).AddTextLabel("text/TEMP_conga_line.png", -1, 4, 2.0, True, False)

        For Local x := -1 To 1
            Level.GetTileAt(x, -6).SetDoorTrigger(2)
        End For

        Level.SetMagicBarrier(True)
        Level.PaintTriggerInterior(-8, -18, 16, 12, 1)

        Local kingConga := New KingConga(0, -17, 1)
        kingConga.ActivateLight(0.01, 0.02)

        Local throneTile := Level.PlaceTileRemovingExistingTiles(0, -17, TileType.CatacombWall)
        throneTile.SetDigTrigger(24)
        throneTile.AddTorch()

        Local zombieBasePoint := Level.GetRandomOffsetPoint()
        If zombieBasePoint.x < 0 Then zombieBasePoint.x = 1
        If zombieBasePoint.y > 0 Then zombieBasePoint.y = -1

        Local zombieLeftBottom1 := New ZombieSnake(zombieBasePoint.x - 3, zombieBasePoint.y - 15, 1)
        Local zombieLeftBottom2 := New ZombieSnake(zombieBasePoint.x - 4, zombieBasePoint.y - 15, 1)
        Local zombieLeftBottom3 := New ZombieSnake(zombieBasePoint.x - 5, zombieBasePoint.y - 15, 1)
        Local zombieLeftBottom4 := New ZombieSnake(zombieBasePoint.x - 6, zombieBasePoint.y - 15, 1)

        Local zombieLeftTop1 := New ZombieSnake(zombieBasePoint.x - 6, zombieBasePoint.y - 16, 1)
        Local zombieLeftTop2 := New ZombieSnake(zombieBasePoint.x - 5, zombieBasePoint.y - 16, 1)
        Local zombieLeftTop3 := New ZombieSnake(zombieBasePoint.x - 4, zombieBasePoint.y - 16, 1)
        Local zombieLeftTop4 := New ZombieSnake(zombieBasePoint.x - 3, zombieBasePoint.y - 16, 1)

        zombieLeftBottom1.movePriority = 99200000

        zombieLeftBottom1.SetChild(zombieLeftBottom2)
        zombieLeftBottom2.SetParent(zombieLeftBottom1)
        zombieLeftBottom2.SetChild(zombieLeftBottom3)
        zombieLeftBottom3.SetParent(zombieLeftBottom2)
        zombieLeftBottom3.SetChild(zombieLeftBottom4)
        zombieLeftBottom4.SetParent(zombieLeftBottom3)
        zombieLeftBottom4.SetChild(zombieLeftTop1)

        zombieLeftTop1.SetParent(zombieLeftBottom4)
        zombieLeftTop1.SetChild(zombieLeftTop2)
        zombieLeftTop2.SetParent(zombieLeftTop1)
        zombieLeftTop2.SetChild(zombieLeftTop3)
        zombieLeftTop3.SetParent(zombieLeftTop2)
        zombieLeftTop3.SetChild(zombieLeftTop4)
        zombieLeftTop4.SetParent(zombieLeftTop3)

        kingConga.AddZombieFriend(zombieLeftBottom1)
        kingConga.AddZombieFriend(zombieLeftBottom2)
        kingConga.AddZombieFriend(zombieLeftBottom3)
        kingConga.AddZombieFriend(zombieLeftBottom4)

        kingConga.AddZombieFriend(zombieLeftTop1)
        kingConga.AddZombieFriend(zombieLeftTop2)
        kingConga.AddZombieFriend(zombieLeftTop3)
        kingConga.AddZombieFriend(zombieLeftTop4)

        Local zombieRightBottom1 := New ZombieSnake(zombieBasePoint.x + 3, zombieBasePoint.y - 15, 1)
        Local zombieRightBottom2 := New ZombieSnake(zombieBasePoint.x + 4, zombieBasePoint.y - 15, 1)
        Local zombieRightBottom3 := New ZombieSnake(zombieBasePoint.x + 5, zombieBasePoint.y - 15, 1)
        Local zombieRightBottom4 := New ZombieSnake(zombieBasePoint.x + 6, zombieBasePoint.y - 15, 1)

        Local zombieRightTop1 := New ZombieSnake(zombieBasePoint.x + 6, zombieBasePoint.y - 16, 1)
        Local zombieRightTop2 := New ZombieSnake(zombieBasePoint.x + 5, zombieBasePoint.y - 16, 1)
        Local zombieRightTop3 := New ZombieSnake(zombieBasePoint.x + 4, zombieBasePoint.y - 16, 1)
        Local zombieRightTop4 := New ZombieSnake(zombieBasePoint.x + 3, zombieBasePoint.y - 16, 1)

        zombieRightBottom1.movePriority = 99200000

        zombieRightBottom1.SetChild(zombieRightBottom2)
        zombieRightBottom2.SetParent(zombieRightBottom1)
        zombieRightBottom2.SetChild(zombieRightBottom3)
        zombieRightBottom3.SetParent(zombieRightBottom2)
        zombieRightBottom3.SetChild(zombieRightBottom4)
        zombieRightBottom4.SetParent(zombieRightBottom3)
        zombieRightBottom4.SetChild(zombieRightTop1)

        zombieRightTop1.SetParent(zombieRightBottom4)
        zombieRightTop1.SetChild(zombieRightTop2)
        zombieRightTop2.SetParent(zombieRightTop1)
        zombieRightTop2.SetChild(zombieRightTop3)
        zombieRightTop3.SetParent(zombieRightTop2)
        zombieRightTop3.SetChild(zombieRightTop4)
        zombieRightTop4.SetParent(zombieRightTop3)

        kingConga.AddZombieFriend(zombieRightBottom1)
        kingConga.AddZombieFriend(zombieRightBottom2)
        kingConga.AddZombieFriend(zombieRightBottom3)
        kingConga.AddZombieFriend(zombieRightBottom4)

        kingConga.AddZombieFriend(zombieRightTop1)
        kingConga.AddZombieFriend(zombieRightTop2)
        kingConga.AddZombieFriend(zombieRightTop3)
        kingConga.AddZombieFriend(zombieRightTop4)

        Local point: Point
        Select controller_game.currentZone
            Case 1
                point = Level.GetRandomOffsetPoint()
                If point.y < 0 Then point.y = 1
                Local leftGhost := New Ghost(-7, point.y - 17, 1)
                leftGhost.ActivateLight(0.01, 0.02)

                point = Level.GetRandomOffsetPoint()
                If point.y < 0 Then point.y = 1
                Local rightGhost := New Ghost(7, point.y - 17, 1)
                rightGhost.ActivateLight(0.01, 0.02)

                Local leftBat := New Bat(-5, -11, 1)
                leftBat.ActivateLight(0.01, 1.5)

                Local rightBat := New Bat(5, -11, 1)
                rightBat.ActivateLight(0.01, 1.5)

                Local redBat := New Bat(0, -17, 2)
                redBat.ActivateLight(0.01, 1.5)
            Case 2
                Local leftSkeletonMage := New SkeletonMage(-7, 16, 1)
                leftSkeletonMage.ActivateLight(0.01, 1.5)

                Local rightSkeletonMage := New SkeletonMage(7, 15, 3)
                rightSkeletonMage.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y < 0 Then point.y = 0
                Local leftArmadillo := New Armadillo(point.x - 5, point.y - 10, 1)
                leftArmadillo.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y > 0 Then point.y = 0
                Local rightArmadillo := New Armadillo(point.x + 5, point.y - 12, 1)
                rightArmadillo.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                Local centerArmadillo := New Armadillo(point.x, point.y - 13, 2)
                centerArmadillo.ActivateLight(0.01, 1.5)

                Local leftBat := New Bat(-6, -8, 1)
                leftBat.ActivateLight(0.01, 1.5)

                Local rightBat := New Bat(6, -8, 2)
                rightBat.ActivateLight(0.01, 1.5)
            Case 3
                Local hellhound := New Hellhound(-7, -16, 1)
                hellhound.ActivateLight(0.01, 1.5)

                Local yeti := New Yeti(7, -15, 1)
                yeti.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y > 0 Then point.y = -1
                Local leftGoblin := New Goblin(-5, point.y - 8, 2)
                leftGoblin.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y > 0 Then point.y = -1
                Local rightGoblin := New Goblin(5, point.y - 8, 1)
                rightGoblin.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y < 0 Then point.y = 1
                Local iceElemental := New IceElemental(point.x - 1, point.y - 13, 1)
                iceElemental.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y < 0 Then point.y = 1
                Local fireElemental := New FireElemental(point.x + 1, point.y - 13, 1)
                fireElemental.ActivateLight(0.01, 1.5)

                Local leftBat := New Bat(-6, -8, 1)
                leftBat.ActivateLight(0.01, 1.5)

                Local rightBat := New Bat(6, -8, 2)
                rightBat.ActivateLight(0.01, 1.5)
            Case 4
                If Not Util.IsCharacterActive(Character.Dorian)
                    Local blademaster := New Blademaster(-7, -16, 2)
                    blademaster.ActivateLight(0.01, 1.5)
                Else
                    Local harpy := New Harpy(-7, -16, 1)
                    harpy.ActivateLight(0.01, 1.5)
                End If

                Local warlock := New Warlock(7, -15, 2)
                warlock.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y > 0 Then point.y = -1
                Local leftGoblinBomber := New GoblinBomber(-5, point.y - 7, 1)
                leftGoblinBomber.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y > 0 Then point.y = -1
                Local rightGoblinBomber := New GoblinBomber(5, point.y - 8, 1)
                rightGoblinBomber.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y < 0 Then point.y = 1
                If Not Util.IsCharacterActive(Character.Dorian)
                    Local blademaster2 := New Blademaster(point.x - 1, point.y - 13, 1)
                    blademaster2.ActivateLight(0.01, 1.5)
                Else
                    Local harpy2 := New Harpy(point.x - 1, point.y - 13, 1)
                    harpy2.ActivateLight(0.01, 1.5)
                End If

                point = Level.GetRandomOffsetPoint()
                If point.y < 0 Then point.y = 1
                Local warlock2 := New Warlock(point.x + 1, point.y - 13, 1)

                Local leftBat := New Bat(-6, -8, 1)
                leftBat.ActivateLight(0.01, 1.5)

                Local rightBat := New Bat(6, -8, 4)
                rightBat.ActivateLight(0.01, 1.5)
            Default
                Local leftElectricMage := New ElectricMage(-7, 16, 1)
                leftElectricMage.ActivateLight(0.01, 1.5)

                If Not Util.IsCharacterActive(Character.Aria)
                    Local rightElectricMage := New ElectricMage(7, -15, 3)
                    rightElectricMage.ActivateLight(0.01, 1.5)
                End If

                point = Level.GetRandomOffsetPoint()
                If point.y > 0 Then point.y = -1
                If Not Util.IsCharacterActive(Character.Aria)
                    Local leftDevil := New Devil(-5, point.y - 7, 2)
                    leftDevil.ActivateLight(0.01, 1.5)
                End If

                point = Level.GetRandomOffsetPoint()
                If point.y > 0 Then point.y = -1
                Local rightDevil := New Devil(5, point.y - 8, 1)
                rightDevil.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y < 0 Then point.y = 1
                If point.x > 0 Then point.x = -1
                Local leftEvilEye := New EvilEye(point.x - 1, point.y - 13, 1)
                leftEvilEye.ActivateLight(0.01, 1.5)

                point = Level.GetRandomOffsetPoint()
                If point.y < 0 Then point.y = 1
                If Not Util.IsCharacterActive(Character.Aria)
                    Local rightEvilEye := New EvilEye(point.x + 1, point.y - 13, 2)
                    rightEvilEye.ActivateLight(0.01, 1.5)
                End If

                Local leftBat := New Bat(-6, -8, 1)
                leftBat.ActivateLight(0.01, 1.5)

                Local rightBat := New Bat(6, -8, 2)
                rightBat.ActivateLight(0.01, 1.5)
        End Select

        Level.BossMaybeMinibossesAt(-6, 0, 5, 0)

        Select controller_game.currentZone
            Case 1
                New SpikeTrap(-5, -11)
                New SpikeTrap(5, -11)

                New SpeedUpTrap(0, -14)
                New SpikeTrap(-5, -14)
                New SpikeTrap(5, -14)

                New SpikeTrap(-5, -8)
                New SpikeTrap(5, -8)
            Default
                New ConfuseTrap(-5, -11)
                New ConfuseTrap(5, -11)

                New SpeedUpTrap(0, -14)
                New SpeedUpTrap(-5, -14)
                New SpeedUpTrap(5, -14)

                New ConfuseTrap(-5, -8)
                New ConfuseTrap(5, -8)
        End Select

        Enemy.enemiesPaused = True
    End Function

    Function CreateBossBattle2: Void()
        Debug.Log("CREATEBOSSBATTLE2: Creating death metal boss battle.")

        Level.InitNewMap(True)
        Level.DisableLevelConstraints()

        Level.PlaceFirstBossRoom("deathmetal")

        Level.CreateRoom(-6, -16, 12, 10, False, RoomType.Boss)

        For Local x := -1 To 1
            Level.PlaceTileRemovingExistingTiles(x, -6, TileType.Door)
        End For

        Level.GetTileAt(-2, -6).AddTorch()
        Level.GetTileAt(2, -6).AddTorch()

        For Local x := -1 To 1
            Level.GetTileAt(x, -6).SetDoorTrigger(2)
        End For

        Level.SetMagicBarrier(True)
        Level.PaintTriggerInterior(-6, -16, 12, 10, 1)

        Local point := Level.GetRandomOffsetPoint()
        Local deathMetal := New DeathMetal(point.x, -11, 1)
        deathMetal.ActivateLight(0.01, 1.5)

        Local enemyType1: Int
        Local enemyType2: Int

        Select controller_game.currentZone
            Case 1
                enemyType1 = EnemyType.Ghost
                enemyType2 = EnemyType.Ghost
            Case 2
                enemyType1 = EnemyType.Clone
                enemyType2 = EnemyType.Clone
            Case 3
                enemyType1 = EnemyType.IceBeetle
                enemyType2 = EnemyType.FireBeetle
            Case 4
                enemyType1 = EnemyType.Warlock
                enemyType2 = EnemyType.NeonWarlock
            Default
                enemyType1 = EnemyType.GreenEvilEye
                enemyType2 = EnemyType.PinkEvilEye
        End Select

        point = Level.GetRandomOffsetPoint()
        Local enemy11 := Enemy.MakeEnemy(point.x - 3, math.Abs(point.y) - 15, enemyType1)
        enemy11.ActivateLight(0.01, 1.5)
        point = Level.GetRandomOffsetPoint()
        Local enemy21 := Enemy.MakeEnemy(point.x + 3, math.Abs(point.y) - 15, enemyType2)
        enemy21.ActivateLight(0.01, 1.5)
        point = Level.GetRandomOffsetPoint()
        Local enemy22 := Enemy.MakeEnemy(point.x - 3, point.y - 9, enemyType2)
        enemy22.ActivateLight(0.01, 1.5)
        point = Level.GetRandomOffsetPoint()
        Local enemy12 := Enemy.MakeEnemy(point.x + 3, point.y - 9, enemyType1)
        enemy12.ActivateLight(0.01, 1.5)

        Level.BossMaybeMinibossesAt(-5, 0, 4, 0)

        New BounceTrap(-4, -11, BounceTrapDirection.Omni)
        New BounceTrap(4, -11, BounceTrapDirection.Omni)

        New BounceTrap(0, -14, BounceTrapDirection.Omni)
        New BounceTrap(-4, -14, BounceTrapDirection.Omni)
        New BounceTrap(4, -14, BounceTrapDirection.Omni)

        New BounceTrap(-4, -8, BounceTrapDirection.Omni)
        New BounceTrap(4, -8, BounceTrapDirection.Omni)

        Enemy.enemiesPaused = True
    End Function

    Function CreateBossBattle3: Void()
        Debug.Log("CREATEBOSSBATTLE3: Creating deep blues boss battle.")

        Level.InitNewMap(True)
        Level.DisableLevelConstraints()

        Level.PlaceFirstBossRoom("deepblues")

        Level.CreateRoom(-4, -15, 9, 9, False, RoomType.Boss)

        For Local x := -1 To 1
            Level.PlaceTileRemovingExistingTiles(x, -6, TileType.Door)
        End For

        For Local x := -1 To 1
            Level.GetTileAt(x, -6).SetDoorTrigger(2)
        End For

        Level.SetMagicBarrier(True)
        Level.PaintTriggerInterior(-4, -15, 9, 9, 1)

        Level.GetTileAt(-2, -6).AddTorch()
        Level.GetTileAt(2, -6).AddTorch()
        Level.GetTileAt(-1, -15).AddTorch()
        Level.GetTileAt(3, -15).AddTorch()
        Level.GetTileAt(-4, -13).AddTorch()
        Level.GetTileAt(-4, -9).AddTorch()
        Level.GetTileAt(5, -12).AddTorch()
        Level.GetTileAt(5, -8).AddTorch()

        Local pawnMoveDelayBase: Int
        Local leftKnightMoveDelay: Int
        Local rightKnightMoveDelay: Int

        Local moveDelayRoll := Util.RndIntRangeFromZero(8, True)
        If moveDelayRoll <> 0
            pawnMoveDelayBase = 1
            leftKnightMoveDelay = 4
            rightKnightMoveDelay = 6
        Else
            pawnMoveDelayBase = 2

            Local knightMoveDelayRoll := Util.RndIntRangeFromZero(1, True)
            If knightMoveDelayRoll = 0
                leftKnightMoveDelay = 1
                rightKnightMoveDelay = 6
            Else
                leftKnightMoveDelay = 6
                rightKnightMoveDelay = 1
            End If
        End If

        Local pawnMoveDelayDirectionRoll := Util.RndIntRangeFromZero(1, True)
        Local pawnMoveDelayDirection := 0
        If pawnMoveDelayDirectionRoll = 1
            pawnMoveDelayDirection = 7
        End If

        Local rookLevel: Int
        Local leftKnightLevel: Int
        Local bishopLevel: Int
        Local kingLevel: Int
        Local queenLevel: Int
        Local rightKnightLevel: Int

        Select controller_game.currentDepth
            Case 2
                Select Util.RndIntRangeFromZero(2, True)
                    Case 0
                        rookLevel = 2
                        leftKnightLevel = 2
                        bishopLevel = 1
                        rightKnightLevel = 1
                    Case 1
                        rookLevel = 1
                        leftKnightLevel = 1
                        bishopLevel = 2
                        rightKnightLevel = 2
                    Default
                        rookLevel = 1
                        leftKnightLevel = 2
                        bishopLevel = 1
                        rightKnightLevel = 2
                End Select

                kingLevel = 1
                queenLevel = 2
            Case 3
                rookLevel = 1
                leftKnightLevel = 1
                bishopLevel = 1
                kingLevel = 2
                queenLevel = 1
                rightKnightLevel = 1
            Case 4
                rookLevel = 1
                leftKnightLevel = 2
                bishopLevel = 1
                kingLevel = 2
                queenLevel = 2
                rightKnightLevel = 2
            Default
                If controller_game.currentDepth <= 1
                    rookLevel = 1
                    leftKnightLevel = 1
                    bishopLevel = 1
                    kingLevel = 1
                    queenLevel = 1
                    rightKnightLevel = 1
                Else
                    rookLevel = 2
                    leftKnightLevel = 2
                    bishopLevel = 2
                    kingLevel = 2
                    queenLevel = 2
                    rightKnightLevel = 2
                End If
        End Select

        Local leftRook := New Rook(-3, -14, rookLevel)
        leftRook.currentMoveDelay = 8
        leftRook.castleNextMove = True

        Local leftKnight := New Knight(-2, -14, leftKnightLevel)
        leftKnight.currentMoveDelay = leftKnightMoveDelay

        Local leftBishop := New Bishop(-1, -14, bishopLevel)
        leftBishop.currentMoveDelay = 4

        Local king := New King(0, -14, kingLevel)
        king.currentMoveDelay = 8

        Local queen := New Queen(1, -14, queenLevel)
        queen.currentMoveDelay = 6

        Local rightBishop := New Bishop(2, -14, bishopLevel)
        rightBishop.currentMoveDelay = 6

        Local rightKnight := New Knight(3, -14, rightKnightLevel)
        rightKnight.currentMoveDelay = rightKnightMoveDelay

        Local rightRook := New Rook(4, -14, rookLevel)
        rightRook.currentMoveDelay = 8

        Local pawnMoveDelayOffset := Util.RndIntRangeFromZero(7, True)

        Local pawnLevel := 1
        If controller_game.currentDepth >= 3
            pawnLevel = 2
        End If

        For Local i := 0 Until 8
            Local pawn := New Pawn(i - 3, -13, pawnLevel)
            pawn.currentMoveDelay = pawnMoveDelayBase + math.Abs(pawnMoveDelayDirection - ((pawnMoveDelayOffset + i) Mod 8))
        End For

        Level.BossMaybeMinibossesAt(-3, 0, 3, 0)

        Enemy.enemiesPaused = True
    End Function

    Function CreateBossBattle4: Void()
        Debug.Log("CREATEBOSSBATTLE4: Creating octoboss battle.")

        Level.InitNewMap(True)
        Level.DisableLevelConstraints()

        Level.PlaceFirstBossRoom("octoboss")

        Level.CreateRoom(-6, -15, 12, 9, False, RoomType.Boss)

        For Local x := -1 To 1
            Level.PlaceTileRemovingExistingTiles(x, -6, TileType.Door)
        End For

        Level.GetTileAt(-2, -6).AddTorch()
        Level.GetTileAt(2, -6).AddTorch()
        Level.GetTileAt(-2, -15).AddTorch()
        Level.GetTileAt(2, -15).AddTorch()
        Level.GetTileAt(-6, -10).AddTorch()
        Level.GetTileAt(6, -10).AddTorch()

        For Local x := -1 To 1
            Level.GetTileAt(x, -6).SetDoorTrigger(2)
        End For

        Level.SetMagicBarrier(True)
        Level.PaintTriggerInterior(-6, -15, 12, 9, 1)

        For Local x := -5 To 5
            For Local y := -14 To -11
                Level.PlaceTileRemovingExistingTiles(x, y, TileType.Water)
            End For
        End For

        Local coralRiff := New Octoboss(0, -14, 1)
        coralRiff.ActivateLight(0.01, 1.5)

        Level.BossMaybeMinibossesAt(-5, 0, 4, 0)

        Enemy.enemiesPaused = True
    End Function

    Function CreateBossBattle5: Void()
        Debug.Log("CREATEBOSSBATTLE5: Creating dead ringer boss battle.")

        Level.InitNewMap(True)
        Level.DisableLevelConstraints()

        Level.PlaceFirstBossRoom()

        Level.CreateRoom(-6, -17, 12, 11, False, RoomType.Boss)

        For Local x := -1 To 1
            Level.PlaceTileRemovingExistingTiles(x, -6, TileType.Door)
        End For

        Level.GetTileAt(-2, -6).AddTorch()
        Level.GetTileAt(2, -6).AddTorch()
        Level.GetTileAt(-2, -17).AddTorch()
        Level.GetTileAt(2, -17).AddTorch()
        Level.GetTileAt(-6, -10).AddTorch()
        Level.GetTileAt(6, -10).AddTorch()

        For Local x := -1 To 1
            Level.GetTileAt(x, -6).SetDoorTrigger(2)
        End For

        Level.SetMagicBarrier(True)
        Level.PaintTriggerInterior(-6, -17, 12, 11, 1)

        Local bell1 := New Bell(-3, 13, 1)
        Local bell2 := New Bell(3, 13, 2)
        Local bell3 := New Bell(3, -8, 3)
        Local bell4 := New Bell(-3, -8, 4)

        bell1.ActivateLight(0.01, 1.5)
        bell2.ActivateLight(0.01, 1.5)
        bell3.ActivateLight(0.01, 1.5)
        bell4.ActivateLight(0.01, 1.5)

        Local deadRingerX := -2
        Local deadRingerXRoll := Util.RndIntRangeFromZero(1, True)
        If deadRingerXRoll = 0
            deadRingerX = 2
        End If

        Local deadRinger := New DeadRinger(deadRingerX, -12, 1, bell1, bell2, bell3, bell4)
        deadRinger.ActivateLight(0.01, 1.5)

        Local sarcophagusLeft := New Sarcophagus(-5, -16, 1)
        sarcophagusLeft.ActivateLight(0.01, 1.5)
        Local sarcophagusRight := New Sarcophagus(5, -16, 1)
        sarcophagusRight.ActivateLight(0.01, 1.5)

        If GameData.GetNPCUnlock("bossmaster") And
           Not GameData.HasFoughtDeadRinger() And
           Not Level.isReplaying
            Level.charactersJustUnlocked.AddLast(505)
        End If

        GameData.SetFoughtDeadRinger()
    End Function

    Function CreateBossBattle9: Void()
        Debug.Log("CREATEBOSSBATTLE9: Creating fortissimole boss battle.")

        Level.InitNewMap(True)
        Level.DisableLevelConstraints()

        Local bossRoom := New Rect(-8, -17, 16, 11)
        Level.FillTiles(bossRoom, TileType.DirtWall, TileType.BossWall)

        Level.PlaceFirstBossRoom("fortissimole", TilesetType.Boss)

        Level.CreateRoom(-7, -16, 14, 9, False, RoomType.Start)

        For Local x := -1 To 1
            Level.PlaceTileRemovingExistingTiles(x, -6, TileType.Door, False, TilesetType.Boss, False)
        End For

        For Local x := -2 To 2
            Level.PlaceTileRemovingExistingTiles(x, -7, TileType.Floor)
        End For

        Level.GetTileAt(-3, -7).AddTorch()
        Level.GetTileAt(3, -7).AddTorch()
        Level.GetTileAt(-7, -10).AddTorch()
        Level.GetTileAt(7, -10).AddTorch()
        Level.GetTileAt(-2, -16).AddTorch()
        Level.GetTileAt(2, -16).AddTorch()

        For Local x := -1 To 1
            Level.GetTileAt(x, -6).SetDoorTrigger(2)
        End For

        Level.SetMagicBarrier(True)
        Level.PaintTriggerInterior(-7, -15, 14, 9, 1)

        Level.PlaceTileRemovingExistingTiles(-5, -15, TileType.NecroDancerSpeaker1)
        Level.PlaceTileRemovingExistingTiles(-4, -15, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(-3, -15, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(-2, -15, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(-1, -15, TileType.NecroDancerStageGreen)
        Level.PlaceTileRemovingExistingTiles(0, -15, TileType.NecroDancerStageGreen)
        Level.PlaceTileRemovingExistingTiles(1, -15, TileType.NecroDancerStageGreen)
        Level.PlaceTileRemovingExistingTiles(2, -15, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(3, -15, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(4, -15, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(5, -15, TileType.NecroDancerSpeaker1)

        Local fortissimoleX := Util.RndIntRange(-2, 2, True, -1)
        New Fortissimole(fortissimoleX, -15, 1)

        Fortissimole.SpawnFans()

        Local enemyType1 := EnemyType.GreenSlime
        Local enemyType2 := EnemyType.GreenSlime

        Select controller_game.currentZone
            Case 1
                enemyType1 = EnemyType.Ghost
                enemyType2 = EnemyType.Ghost
            Case 2
                enemyType1 = EnemyType.WhiteSkeletonMage
                enemyType2 = EnemyType.WhiteSkeletonMage
            Case 3
                enemyType1 = EnemyType.FireElemental
                enemyType2 = EnemyType.IceElemental
            Case 4
                If Util.IsCharacterActive(Character.Dorian)
                    enemyType1 = EnemyType.Harpy
                    enemyType2 = EnemyType.Harpy
                Else
                    enemyType1 = EnemyType.ApprenticeBlademaster
                    enemyType2 = EnemyType.ApprenticeBlademaster
                End If
            Default
                If controller_game.currentZone >= 5
                    enemyType1 = EnemyType.GreenEvilEye
                    enemyType2 = EnemyType.GreenEvilEye
                End If
        End Select

        Local point: Point

        point = Level.GetRandomOffsetPoint()
        Local enemy1 := Enemy.MakeEnemy(point.x, point.y, enemyType1)
        enemy1.ActivateLight(0.01, 1.5)
        point = Level.GetRandomOffsetPoint()
        Local enemy2 := Enemy.MakeEnemy(point.x, point.y, enemyType2)
        enemy2.ActivateLight(0.01, 1.5)

        Local enemyType3 := EnemyType.GreenSlime
        Local enemyType4 := EnemyType.GreenSlime

        Select controller_game.currentZone
            Case 1
                enemyType3 = EnemyType.Ghost
                enemyType4 = EnemyType.Ghost
            Case 2
                enemyType3 = EnemyType.LightGolem
                enemyType4 = EnemyType.LightGolem
            Case 3
                enemyType3 = EnemyType.Hellhound
                enemyType4 = EnemyType.Yeti
            Case 4
                enemyType3 = EnemyType.OozeGolem
                enemyType4 = EnemyType.OozeGolem
            Default
                If controller_game.currentZone >= 5
                    enemyType3 = EnemyType.PurpleElectricMage
                    enemyType4 = EnemyType.PurpleElectricMage
                End If
        End Select

        point = Level.GetRandomOffsetPoint()
        Local enemy3 := Enemy.MakeEnemy(point.x, point.y, enemyType3)
        enemy3.ActivateLight(0.01, 1.5)
        point = Level.GetRandomOffsetPoint()
        Local enemy4 := Enemy.MakeEnemy(point.x, point.y, enemyType4)
        enemy4.ActivateLight(0.01, 1.5)

        Level.BossMaybeMinibossesAt(-5, 0, 4, 0)

        Enemy.enemiesPaused = True
    End Function

    Function CreateBossBattleFrankensteinway: Void()
        Debug.TraceNotImplemented("Level.CreateBossBattleFrankensteinway()")
    End Function

    Function CreateBossmaster: Void()
        Debug.TraceNotImplemented("Level.CreateBossmaster()")
    End Function

    Function CreateBossmasterBosses: Void()
        Debug.TraceNotImplemented("Level.CreateBossmasterBosses()")
    End Function

    Function CreateBossmasterMinibosses: Void()
        Debug.TraceNotImplemented("Level.CreateBossmasterMinibosses()")
    End Function

    Function CreateCharSelect: Void()
        Debug.TraceNotImplemented("Level.CreateCharSelect()")
    End Function

    Function CreateDiamondDealer: Void()
        Debug.TraceNotImplemented("Level.CreateDiamondDealer()")
    End Function

    Function CreateDungeonMaster: Void()
        Debug.TraceNotImplemented("Level.CreateDungeonMaster()")
    End Function

    Function CreateExit: Void(exitX: Int, exitY: Int)
        Level.GetTileAt(exitX, exitY).Die()

        Local exitTile := New Tile(exitX, exitY, TileType.LockedStairsMiniboss, False, -1)
        exitTile.flyawayText = "|198|DEFEAT THE MINIBOSS!|"

        Level.exits.Set(New Point(exitX, exitY), New Point(-6, -6))
    End Function

    Function CreateExtraModesSelect: Void()
        Debug.TraceNotImplemented("Level.CreateExtraModesSelect()")
    End Function

    Function CreateFinalBossBattle: Void()
        Debug.Log("CREATEFINALBOSSBATTLE: Creating Necrodancer battle.")

        Level.InitNewMap(True)
        Level.outsideBossChamber = True
        Level.DisableLevelConstraints()

        Level.CreateRoom(-2, -3, 6, 7, False, RoomType.Boss)

        If Level.isTrainingMode
            Level.AddExit(2, 0, LevelType.Lobby, 1)
            Level.PlaceTileRemovingExistingTiles(2, 0, TileType.Stairs)

            If controller_game.numPlayers = 1
                Level.MakeHelper()
            End If
        End If

        Level.GetTileAt(-2, 0).AddTorch()
        Level.GetTileAt(4, 0).AddTorch()
        Level.GetTileAt(1, 4).AddTorch()

        For Local y := -3 To -5 Step -1
            For Local x := 0 To 2
                Level.PlaceTileRemovingExistingTiles(x, y, TileType.BossFloor)
            End For
        End For

        Level.PlaceTileRemovingExistingTiles(-1, -4, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(3, -4, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(-1, -5, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(3, -5, TileType.BossWall)

        Level.CreateRoom(-7, -17, 16, 11, False, RoomType.Boss)

        For Local x := 0 To 2
            Level.GetTileAt(x, -6).SetDoorTrigger(2)
        End For

        Level.GetTileAt(-5, -6).AddTorch2()
        Level.GetTileAt(-1, -6).AddTorch2()
        Level.GetTileAt(3, -6).AddTorch2()
        Level.GetTileAt(7, -6).AddTorch2()
        Level.GetTileAt(-5, -17).AddTorch2()
        Level.GetTileAt(-1, -17).AddTorch2()
        Level.GetTileAt(3, -17).AddTorch2()
        Level.GetTileAt(7, -17).AddTorch2()
        Level.GetTileAt(-7, -14).AddTorch2()
        Level.GetTileAt(-7, -10).AddTorch2()
        Level.GetTileAt(9, -14).AddTorch2()
        Level.GetTileAt(9, -10).AddTorch2()

        Level.PlaceTileRemovingExistingTiles(-2, -17, TileType.NecroDancerSpeaker1)
        Level.PlaceTileRemovingExistingTiles(-1, -17, TileType.NecroDancerSpeaker2)
        Level.PlaceTileRemovingExistingTiles(0, -17, TileType.NecroDancerSpeaker3)
        Level.PlaceTileRemovingExistingTiles(1, -17, TileType.NecroDancerSpeaker2)
        Level.PlaceTileRemovingExistingTiles(2, -17, TileType.NecroDancerSpeaker3)
        Level.PlaceTileRemovingExistingTiles(3, -17, TileType.NecroDancerSpeaker2)
        Level.PlaceTileRemovingExistingTiles(4, -17, TileType.NecroDancerSpeaker1)
        Level.PlaceTileRemovingExistingTiles(-2, -16, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(-1, -16, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(0, -16, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(1, -16, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(2, -16, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(3, -16, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(4, -16, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(-2, -15, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(-1, -15, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(0, -15, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(1, -15, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(2, -15, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(3, -15, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(4, -15, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(-2, -14, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(-1, -14, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(0, -14, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(1, -14, TileType.NecroDancerStageGreen)
        Level.PlaceTileRemovingExistingTiles(2, -14, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(3, -14, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(4, -14, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(-2, -13, TileType.NecroDancerStageCyan)
        Level.PlaceTileRemovingExistingTiles(-1, -13, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(0, -13, TileType.NecroDancerStageGreen)
        Level.PlaceTileRemovingExistingTiles(1, -13, TileType.NecroDancerStageGreen)
        Level.PlaceTileRemovingExistingTiles(2, -13, TileType.NecroDancerStageGreen)
        Level.PlaceTileRemovingExistingTiles(3, -13, TileType.NecroDancerStageTurquoise)
        Level.PlaceTileRemovingExistingTiles(4, -13, TileType.NecroDancerStageCyan)

        For Local x := -3 To 5
            Level.PlaceTileRemovingExistingTiles(x, -18, TileType.BossWall)
        End For

        New DecorativeFireTrap(-1, -16)
        New DecorativeFireTrap(3, -16)

        Level.SetMagicBarrier(True)
        Level.PaintTriggerInterior(-7, -17, 16, 11, 1)

        Local necrodancer := New Necrodancer(0, -15, 1)
        necrodancer.ActivateLight(0.01, 1.5)

        New Gargoyle(-2, -13, 5)
        New Gargoyle(4, -13, 5)

        Local leftMummy := New Mummy(0, -13, 1)
        leftMummy.MakeDancer()
        Local centerMummy := New Mummy(1, -13, 1)
        centerMummy.MakeDancer()
        Local rightMummy := New Mummy(2, -13, 1)
        rightMummy.MakeDancer()

        Local leftBlackSkeleton := New Skeleton(-2, -16, 3)
        leftBlackSkeleton.MakeDancer()
        Local rightBlackSkeleton := New Skeleton(4, -16, 3)
        rightBlackSkeleton.MakeDancer()
        Local leftWhiteSkeleton := New Skeleton(-2, -15, 1)
        leftWhiteSkeleton.MakeDancer()
        Local rightWhiteSkeleton := New Skeleton(4, -15, 1)
        rightWhiteSkeleton.MakeDancer()

        Level.PlaceTileRemovingExistingTiles(1, -9, TileType.BossWall)

        Local hintTile := Level.PlaceTileRemovingExistingTiles(1, 2, TileType.BossWall)
        hintTile.AddTextLabel("|49|USE ALL WALLS TO YOUR ADVANTAGE!|", 0, -12.0, 2.0, False, True)

        Local switch11 := New Switch(2, -5, 33, Null)
        Local switch12 := New Switch(0, -5, 33, switch11)
        switch11.pairedSwitch = switch12

        Local switch21X := 3
        Local switch22X := -1
        Local switchRoll := Util.RndIntRangeFromZero(1, True)
        If switchRoll = 0
            switch21X = -1
            switch22X = 3
        End If

        Local switch21 := New Switch(switch21X, -11, 34, Null)
        Local switch22 := New Switch(switch22X, -12, 34, switch21)
        switch21.pairedSwitch = switch22

        Necrodancer.necrodancer.theLute = New Item(2, -15, "weapon_golden_lute", False, -1, False)

        Local weaponName: String
        Select Util.RndIntRangeFromZero(2, True)
            Case 0  weaponName = "weapon_broadsword"
            Case 1  weaponName = "weapon_flail"
            Default weaponName = "weapon_longsword"
        End Select

        New Item(3, -7, weaponName, False, -1, False)

        Enemy.enemiesPaused = True

        Level.UnlockChar(Character.Dorian)

        If GameData.GetNPCUnlock("bossmaster") And
           Not GameData.HasFoughtNecrodancer() And
           Not Level.isReplaying
            Level.charactersJustUnlocked.AddLast(506)
        End If

        GameData.SetFoughtNecrodancer()
    End Function

    Function CreateFinalBossBattle2: Void()
        Debug.TraceNotImplemented("Level.CreateFinalBossBattle2()")
    End Function

    Function CreateFinalBossBattle3: Void()
        Debug.TraceNotImplemented("Level.CreateFinalBossBattle3()")
    End Function

    Function CreateFinalBossBattleConductor: Void()
        Debug.TraceNotImplemented("Level.CreateFinalBossBattleConductor()")
    End Function

    Function CreateHephaestus: Void()
        Debug.TraceNotImplemented("Level.CreateHephaestus()")
    End Function

    Function CreateIndestructibleBorder: Void()
        Debug.Log("CREATEINDESTRUCTIBLEBORDER: Creating indestructible outer wall")

        Local borderTiles := New List<TileData>()

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local x0 := tilesOnXNode.Key()
                Local y0 := tileNode.Key()

                For Local y := y0 - 1 To y0 + 1
                    For Local x := x0 - 1 To x0 + 1
                        If x = x0 And
                           y = y0
                            Continue
                        End If

                        If Level.GetTileAt(x, y) = Null
                            borderTiles.AddLast(New TileData(x, y, TileType.IndestructibleBorder))
                        End If
                    End For
                End For
            End For
        End For

        For Local borderTile := EachIn borderTiles
            New Tile(borderTile.x, borderTile.y, borderTile.type, False, -1)
        End For

        Debug.Log("CREATEINDESTRUCTIBLEBORDER: Replacing indestructible orphans")

        While Not Level._ReplaceIndestructibleOrphans()
        End While
    End Function

    Function _ReplaceIndestructibleOrphans: Bool()
        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local x0 := tilesOnXNode.Key()
                Local y0 := tileNode.Key()

                If Level.GetTileTypeAt(x0, y0) = TileType.IndestructibleBorder
                    Local i := 0

                    For Local y := y0 - 1 To y0 + 1
                        For Local x := x0 - 1 To x0 + 1
                            If x = x0 And
                               y = y0
                                Continue
                            End If

                            If Level.GetTileAt(x, y)
                                i += 1
                            End If
                        End For
                    End For

                    If i = 8
                        Level.PlaceTileRemovingExistingTiles(x0, y0, TileType.DirtWall, False, -1, False)

                        Return False
                    End If
                End If
            End For
        End For

        Return True
    End Function

    Function CreateJanitor: Void()
        Debug.TraceNotImplemented("Level.CreateJanitor()")
    End Function

    Function CreateLobby: Void()
        Debug.TraceNotImplemented("Level.CreateLobby()")
    End Function

    Function CreateMap: Bool(levelObj: LevelObject = Null)
        If controller_game.currentLevel = 1
            Level.previousLevelMinibosses.Clear()
            Level.previousLevelUnkilledStairLockingMinibosses.Clear()
            Level.skipNextPenaltyBox = False

            If controller_game.currentDepth = 1
                SaleItem.lastSaleItemClass1 = ""
                SaleItem.lastSaleItemClass2 = ""
                Item.lastChestItemClass1 = ""
                Item.lastChestItemClass2 = ""
                Chest.lastChestColor = Chest.CHEST_COLOR_NONE
                Chest.lastChestColor2 = Chest.CHEST_COLOR_NONE
                Crate.fallenCrates = New List<Crate>()
                Crate.fallenGargoyles = New List<Gargoyle>()
                SaleItem.randomSaleItemList = New List<String>()
                Spells.spellCoolKills = New StringMap<Int>()
            End If
        End If

        If Level.placeShrinerOnLevel = -1
            Local level: Int = -1
            Local depth: Int = -1

            While Not Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeShrinerOnLevel = level
            Level.placeShrinerOnDepth = depth

            Debug.WriteLine("Placed Shriner on " + depth + "-" + level)
        End If

        If Level.placeBloodShopOnLevel = -1 And Not Util.AreAriaOrCodaActive()
            Local level: Int = -1
            Local depth: Int = -1

            While Not Level.IsFreeLevelForSpecialRoom(level, depth)
                If Level.isHardcoreMode
                    level = Util.RndIntRange(1, 2, True, -1)
                    depth = 1
                Else
                    level = Util.RndIntRange(1, 3, True, -1)
                    depth = Util.RndIntRange(1, 5, True, -1)
                End If
            End While

            Level.placeBloodShopOnLevel = level
            Level.placeBloodShopOnDepth = depth

            Debug.WriteLine("Placed Blood Shop on " + depth + "-" + level)
        End If

        If Level.placeGlassShopOnLevel = -1
            Local level: Int = -1
            Local depth: Int = -1

            While Not Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeGlassShopOnLevel = level
            Level.placeGlassShopOnDepth = depth

            Debug.WriteLine("Placed Glass Shop on " + depth + "-" + level)
        End If

        If Level.placeFoodShopOnLevel = -1 And Not Util.AreAriaOrCodaActive()
            Local level: Int = -1
            Local depth: Int = -1

            While Not Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeFoodShopOnLevel = level
            Level.placeFoodShopOnDepth = depth

            Debug.WriteLine("Placed Food Shop on " + depth + "-" + level)
        End If

        If Level.placeArenaOnLevel = -1 And Not Util.IsCharacterActive(Character.Dove)
            Local level: Int = -1
            Local depth: Int = -1

            While Not Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeArenaOnLevel = level
            Level.placeArenaOnDepth = depth
            Level.arenaNum = Util.RndIntRangeFromZero(2, True)

            Debug.WriteLine("Placed Arena on " + depth + "-" + level)
        End If

        If Level.placeTransmogrifierOnLevel = -1 And Level.isHardcoreMode
            Local level: Int = -1
            Local depth: Int = -1

            While Not Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeTransmogrifierOnLevel = level
            Level.placeTransmogrifierOnDepth = depth

            Debug.WriteLine("Placed Transmogrifier on " + depth + "-" + level)
        End If

        If Level.placeConjurerOnLevel = -1
            Local level: Int = -1
            Local depth: Int = -1

            While Not Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeConjurerOnLevel = level
            Level.placeConjurerOnDepth = depth

            Debug.WriteLine("Placed Conjurer on " + depth + "-" + level)
        End If

        If Level.placePawnbrokerOnLevel = -1 And Not Util.IsCharacterActive(Character.Monk)
            Local level: Int = -1
            Local depth: Int = -1

            While Not Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placePawnbrokerOnLevel = level
            Level.placePawnbrokerOnDepth = depth

            Debug.WriteLine("Placed Pawnbroker on " + depth + "-" + level)
        End If

        If levelObj
            Level.InitNewMap(True)
            levelObj.CreateMap()
            Level.CreateIndestructibleBorder()

            Return True
        End If

        If Level.isSwarmMode
            Level.CreateSwarmMap()

            Return True
        End If

        Select controller_game.currentZone
            Case 5 If Not Level.CreateMapZone5(False) Then Return False
            Case 4 If Not Level.CreateMapZone4(False) Return False
            Case 3 If Not Level.CreateMapZone3() Then Return False
            Case 2 If Not Level.CreateMapZone2() Then Return False
            Default If Not Level.CreateMapZone1() Then Return False
        End Select

        If controller_game.currentZone = 4
            For Local trap := EachIn Trap.trapList
                If trap.trapType = TrapType.TrapDoor
                    New SpikeTrap(trap.x, trap.y)
                    trap.Die()
                End If
            End For
        End If

        If Not Level.IsPassable()
            Debug.Log("CREATEMAP: Rejected impassable layout")

            Return Level._FailMap()
        End If

        If Level.pacifismModeOn Or (Level.isHardMode And item.GetBool(Level.GetHardModeXML(), "disableTrapdoors", False))
            For Local trap := EachIn Trap.trapList
                If trap.trapType = TrapType.TrapDoor
                    New SpikeTrap(trap.x, trap.y)
                    trap.Die()
                End If
            End For
        End If

        If Level.previousLevelUnkilledStairLockingMinibosses.Length > 0 And Not Level.skipNextPenaltyBox
            Level.PlacePenaltyBoxEnemies()

            Level.minibossFormerWall = New List<MinibossTileData>()

            Local wallType: Int = TileType.StoneWall
            If currentDepth > 2
                wallType = TileType.CatacombWall
            End If

            ' Left wall
            Level.AddMinibossWall(-3, -3, wallType)
            Level.AddMinibossWall(-3, -2, wallType)
            Level.AddMinibossWall(-3, -1, wallType)
            Level.AddMinibossWall(-3, 0, wallType)
            Level.AddMinibossWall(-3, 1, wallType)
            Level.AddMinibossWall(-3, 2, wallType)
            Level.AddMinibossWall(-3, 3, wallType)

            ' Right wall
            Level.AddMinibossWall(3, -3, wallType)
            Level.AddMinibossWall(3, -2, wallType)
            Level.AddMinibossWall(3, -1, wallType)
            Level.AddMinibossWall(3, 0, wallType)
            Level.AddMinibossWall(3, 1, wallType)
            Level.AddMinibossWall(3, 2, wallType)
            Level.AddMinibossWall(3, 3, wallType)

            ' Top wall
            Level.AddMinibossWall(-2, -3, wallType)
            Level.AddMinibossWall(-1, -3, wallType)
            Level.AddMinibossWall(0, -3, wallType)
            Level.AddMinibossWall(1, -3, wallType)
            Level.AddMinibossWall(2, -3, wallType)

            ' Bottom wall
            Level.AddMinibossWall(-2, 3, wallType)
            Level.AddMinibossWall(-1, 3, wallType)
            Level.AddMinibossWall(0, 3, wallType)
            Level.AddMinibossWall(1, 3, wallType)
            Level.AddMinibossWall(2, 3, wallType)
        End If

        Level.previousLevelMinibosses.Clear()

        For Local enemy := EachIn Enemy.enemyList
            If enemy.isMiniboss
                Level.previousLevelMinibosses.Push(enemy.enemyType)
            End If
        End For

        Return True
    End Function

    Function CreateMapZone1: Bool()
        Local room1: RoomData
        Local room2: RoomData
        Local room3: RoomData
        Local room4: RoomData
        Local room5: RoomData
        Local room6: RoomData
        Local room7: RoomData

        Level.InitNewMap(True)
        room1 = Level.PlaceFirstRoom()

        Local limit := 5000

        Debug.Log("CREATEMAP ZONE1: Trying to place room 2")
        For limit = limit - 1 Until 0 Step -1
            room2 = Level.PlaceRoomZone1(room1)
            If room2 Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE1: Trying to place room 3")
        For limit = limit - 1 Until 0 Step -1
            room3 = Level.PlaceRoomZone1(room2)
            If room3 Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE1: Trying to place room 4")
        For limit = limit - 1 Until 0 Step -1
            room4 = Level.PlaceRoomZone1(room3)
            If room4 Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Local lastRoomIndex: Int

        Debug.Log("CREATEMAP ZONE1: Trying to place room 5")
        For limit = limit - 1 Until 0 Step -1
            For limit = limit Until 0 Step -1
                If Util.RndIntRangeFromZero(50, True) = 0 Then Exit

                room5 = Level.PlaceRoomZone1(room4)
                If room5 <> Null
                    lastRoomIndex = 4

                    Exit
                End If
            End For

            If room5 <> Null Then Exit

            If limit <= 0 Then Return Level._FailMap()

            If Util.RndBool(True)
                room5 = Level.PlaceRoomZone1(room3)
            Else
                room5 = Level.PlaceRoomZone1(room1)
            End If

            If room5 <> Null
                lastRoomIndex = 3

                Exit
            End If
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE1: Trying to place room 6")
        For limit = limit - 1 Until 0 Step -1
            If Util.RndIntRangeFromZero(50, True) <> 0
                room6 = Level.PlaceRoomZone1(room1)
            Else If Util.RndIntRangeFromZero(10, True) <> 0
                room6 = Level.PlaceRoomZone1(room4)

                If room6 <> Null And lastRoomIndex = 3
                    lastRoomIndex = 5
                End If
            Else
                room6 = Level.PlaceRoomZone1(room5)

                If room6 <> Null And lastRoomIndex = 4
                    lastRoomIndex = 5
                End If
            End If

            If room6 <> Null Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE1: Trying to place room 7")
        If Shrine.spaceShrineActive
            For limit = limit - 1 Until 0 Step -1
                If Util.RndBool(True)
                    If Util.RndBool(True)
                        room7 = Level.PlaceRoomZone1(room1)
                    Else
                        room7 = Level.PlaceRoomZone1(room3)
                    End If
                Else
                    If Util.RndBool(True)
                        room7 = Level.PlaceRoomZone1(room2)
                    Else
                        room7 = Level.PlaceRoomZone1(room4)

                        If room7 And lastRoomIndex = 3
                            lastRoomIndex = 6
                        End If
                    End If
                End If

                If room7 Then Exit
            End For
        End If

        If limit <= 0 Then Return Level._FailMap()

        Local lastRoom: RoomData = room4
        Select lastRoomIndex
            Case 4 lastRoom = room5
            Case 5 lastRoom = room6
            Case 6 lastRoom = room7
        End Select
        lastRoom.hasExit = True

        ' `PlaceExit` performs the retry on its own.
        If Not Level.PlaceExit(lastRoom) Then Return False

        Debug.Log("CREATEMAP ZONE1: Deploying NPCs if necessary")
        Local deployNPC: Bool = False
        Select controller_game.currentLevel
            Case 1 If Not GameData.GetNPCUnlock("beastmaster") Then deployNPC = True
            Case 2 If Not GameData.GetNPCUnlock("merlin") Then deployNPC = True
            Case 3 If Not GameData.GetNPCUnlock("bossmaster") Then deployNPC = True
        End Select

        If Not Level.isHardcoreMode And
           Not Level.isDDRMode And
           Not Level.isLevelEditor And
           deployNPC
            Local x: Int
            Local y: Int

            For limit = limit - 1 Until 0 Step -1
                x = room3.x + Util.RndIntRangeFromZero(room3.w - 1, False)
                y = room3.y + Util.RndIntRangeFromZero(room3.h - 1, False)

                Local tile := Level.GetTileAt(x, y)
                If tile
                    If tile.GetType() <> TileType.Floor And
                       Not Level.IsCorridorFloorOrDoorAdjacent(x, y)
                        tile = GetTileAt(x, y + 1)
                        If tile And Not tile.IsWall(False, False, False, False) Then Exit
                    End If
                End If
            End For

            If limit <= 0 Then Return Level._FailMap()

            Local npc: NPC
            Select controller_game.currentLevel
                Case 1 npc = New Beastmaster(x, y, 1, True)
                Case 2 npc = New Merlin(x, y, 1, True)
                Case 3 npc = New Bossmaster(x, y, 1, True)
            End Select

            If npc
                Debug.Log("CREATEMAP: NPC placed at " + npc.x + ", " + npc.y)
            End If
        End If

        Debug.Log("CREATEMAP ZONE1: Placing shop")
        For limit = limit - 1 Until 0 Step -1
            Local shop := Level.PlaceRoomZone1(RoomType.Shop, Null)
            If shop <> Null Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE1: Filling out walls surrounding all floor")
        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsFloor()
                    For Local y := tile.y - 1 To tile.y + 1
                        For Local x := tile.x - 1 To tile.x + 1
                            If Not Level.GetTileAt(x, y)
                                New Tile(x, y, TileType.CorridorDirtWall, False, -1)
                            End If
                        End For
                    End For
                End If
            End For
        End For

        Level.PadWalls()
        Level.ProcessSpecialRoom()

        If Not Level.isLevelEditor Then Level.CreateIndestructibleBorder()

        If Level.isHardcoreMode
            Level.chestsStillToPlace = 1
        Else
            Level.chestsStillToPlace = Util.RndIntRange(1, 2, True, -1)
        End If

        Debug.Log("CREATEMAP ZONE1: Placing secret rooms")
        ' TODO: Decompiler shows -1 for t_numRooms. However, hardcoding 4 creates the correct number of secret rooms and
        '       sets RNG state to expected values (for seed "1", floor 1-1).
        '       It's possible that 4 is the correct hardcoded value but why doesn't the decompiler show this?
        Level.PlaceSecretRooms(4)

        Debug.Log("CREATEMAP ZONE1: Filling secret rooms.  Chests remaining: " + Level.chestsStillToPlace)
        If Not Level.FillSecretRooms() Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE1: Finished filling secret rooms!  Chests remaining: " + Level.chestsStillToPlace)
        If Not Level.isHardcoreMode
            Level.chestsStillToPlace = 1

            If controller_game.currentLevel <= 2
                Level.chestsStillToPlace = 2
            End If
        End If

        Level.AddStone()
        Level.PlaceTraps()
        Level.PlaceEnemies()

        Debug.Log("CREATEMAP ZONE1: Placing one speedup or slowdown trap")
        Local trap: Trap
        For Local i := 500 Until 0 Step -1
            trap = Trap.FindRandomTrap()
            If trap <> Null
                If trap.canBeReplacedByTempoTrap And
                   trap.trapType = TrapType.BounceTrap
                    Exit
                End If
            End If
        End For

        If trap <> Null
            trap.Die()

            If Util.RndBool(True)
                New SpeedUpTrap(trap.x, trap.y)
                Debug.Log("CREATEMAP ZONE1: Speedup trap placed at " + trap.x + ", " + trap.y)
            Else
                New SlowDownTrap(trap.x, trap.y)
                Debug.Log("CREATEMAP ZONE1: Slowdown trap placed at " + trap.x + ", " + trap.y)
            End If
        End If

        Debug.Log("CREATEMAP ZONE1: Placing torches")
        Local minTorch := 4
        Select controller_game.currentLevel
            Case 2 minTorch = 3
            Case 3 minTorch = 2
            Case 4 minTorch = 1
            Default
                If controller_game.currentLevel > 4
                    minTorch = 0
                End If
        End Select
        Local maxTorch := minTorch + 1

        Local rooms := New List<RoomData>()
        For Local room := EachIn Level.rooms
            rooms.AddLast(room)
        End For
        rooms.AddLast(room1)

        For Local room := EachIn rooms
            Local numTorch := Util.RndIntRange(minTorch, maxTorch, True, -1)
            Local i: Int
            Local minTorchDistance: Float
            If room.type = RoomType.Shop
                numTorch = 20

                i = 200
                minTorchDistance = 2.0
            Else
                If numTorch <= 0 Then Continue

                i = 50
                minTorchDistance = 3.5
            End If

            For i = i - 1 Until 0 Step -1
                Local wall := Level.GetRandomWallInRoom(room.x, room.y, room.w, room.h)
                Local wallTile := Level.GetTileAt(wall.x, wall.y)
                If wallTile And
                   Not wallTile.IsDoor() And
                   minTorchDistance <= Level.GetDistanceToNearestTorch(wallTile)
                    wallTile.AddTorch()
                    numTorch -= 1
                End If

                If numTorch <= 0 Then Exit
            End For
        End For

        Level.PlaceCrateOrBarrel()

        Local freeBroadSword := controller_game.currentLevel = 1
        Level.PlaceChests(freeBroadSword)

        Level.PlaceResourceWall()
        Level.PlaceLockedChests()
        Level.PlaceShrine()

        Debug.Log("CREATEMAP ZONE1: Cleaning up pending tiles")
        Tile.CleanUpPendingTiles()

        Level.PlaceNocturnaArea()

        Debug.Log("CREATEMAP ZONE1: Finished!")

        Return True
    End Function

    Function CreateMapZone2: Bool()
        Local room1: RoomData
        Local room2: RoomData
        Local room3: RoomData
        Local room4: RoomData
        Local room5: RoomData
        Local room6: RoomData
        Local room7: RoomData

        Level.InitNewMap(True)
        room1 = Level.PlaceFirstRoom()

        Local limit := 5000

        Debug.Log("CREATEMAP ZONE2: Trying to place room 2")
        For limit = limit - 1 Until 0 Step -1
            room2 = Level.PlaceRoomZone2(room1)
            If room2 Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE2: Trying to place room 3")
        For limit = limit - 1 Until 0 Step -1
            room3 = Level.PlaceRoomZone2(room2)
            If room3 Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE2: Trying to place room 4")
        For limit = limit - 1 Until 0 Step -1
            room4 = Level.PlaceRoomZone2(room3)
            If room4 Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Local lastRoomIndex: Int

        Debug.Log("CREATEMAP ZONE2: Trying to place room 5")
        For limit = limit - 1 Until 0 Step -1
            For limit = limit Until 0 Step -1
                If Util.RndIntRangeFromZero(50, True) = 0 Then Exit

                room5 = Level.PlaceRoomZone2(room4)
                If room5 <> Null
                    lastRoomIndex = 4

                    Exit
                End If
            End For

            If room5 <> Null Then Exit

            If limit <= 0 Then Return Level._FailMap()

            If Util.RndBool(True)
                room5 = Level.PlaceRoomZone2(room3)
            Else
                room5 = Level.PlaceRoomZone2(room1)
            End If

            If room5 <> Null
                lastRoomIndex = 3

                Exit
            End If
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE2: Trying to place room 6")
        For limit = limit - 1 Until 0 Step -1
            If Util.RndIntRangeFromZero(50, True) <> 0
                room6 = Level.PlaceRoomZone2(room1)
            Else If Util.RndIntRangeFromZero(10, True) <> 0
                room6 = Level.PlaceRoomZone2(room4)

                If room6 <> Null And lastRoomIndex = 3
                    lastRoomIndex = 5
                End If
            Else
                room6 = Level.PlaceRoomZone2(room5)

                If room6 <> Null And lastRoomIndex = 4
                    lastRoomIndex = 5
                End If
            End If

            If room6 <> Null Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE2: Trying to place room 7")
        If Shrine.spaceShrineActive
            For limit = limit - 1 Until 0 Step -1
                If Util.RndBool(True)
                    If Util.RndBool(True)
                        room7 = Level.PlaceRoomZone2(room1)
                    Else
                        room7 = Level.PlaceRoomZone2(room3)
                    End If
                Else
                    If Util.RndBool(True)
                        room7 = Level.PlaceRoomZone2(room2)
                    Else
                        room7 = Level.PlaceRoomZone2(room4)

                        If room7 And lastRoomIndex = 3
                            lastRoomIndex = 6
                        End If
                    End If
                End If

                If room7 Then Exit
            End For
        End If

        If limit <= 0 Then Return Level._FailMap()

        Local lastRoom: RoomData = room4
        Select lastRoomIndex
            Case 4 lastRoom = room5
            Case 5 lastRoom = room6
            Case 6 lastRoom = room7
        End Select
        lastRoom.hasExit = True

        ' `PlaceExit` performs the retry on its own.
        If Not Level.PlaceExit(lastRoom) Then Return False

        Debug.Log("CREATEMAP ZONE2: Deploying NPCs if necessary")
        Local deployNPC: Bool = False
        Select controller_game.currentLevel
            Case 2 If Not GameData.GetNPCUnlock("weaponmaster") Then deployNPC = True
            Case 3 If Not GameData.GetNPCUnlock("diamonddealer") Then deployNPC = True
        End Select

        If Not Level.isHardcoreMode And
           Not Level.isDDRMode And
           Not Level.isLevelEditor And
           deployNPC
            Local x: Int
            Local y: Int

            For limit = limit - 1 Until 0 Step -1
                x = room3.x + Util.RndIntRangeFromZero(room3.w - 1, False)
                y = room3.y + Util.RndIntRangeFromZero(room3.h - 1, False)

                Local tile := Level.GetTileAt(x, y)
                If tile <> Null
                    If tile.GetType() = TileType.Floor And
                       Not Level.IsCorridorFloorOrDoorAdjacent(x, y)
                        tile = GetTileAt(x, y + 1)
                        If tile <> Null And
                           Not tile.IsWall()
                            Exit
                        End If
                    End If
                End If
            End For

            Local npc: NPC
            Select controller_game.currentLevel
                Case 2 npc = New Weaponmaster(x, y, 1, True)
                Case 3 npc = New DiamondDealer(x, y, 1, True)
            End Select

            If npc <> Null
                Debug.Log("CREATEMAP: NPC placed at " + npc.x + ", " + npc.y)
            End If
        End If

        Debug.Log("CREATEMAP ZONE2: Placing shop")
        For limit = limit - 1 Until 0 Step -1
            Local shop := Level.PlaceRoomZone2(RoomType.Shop, Null)
            If shop <> Null Then Exit
        End For

        Debug.Log("CREATEMAP ZONE2: Removing some wall tiles")
        Level.RemoveSomeWallsAwayFromCorridors(0.025, False, 1)

        Debug.Log("CREATEMAP ZONE2: Filling out walls surrounding all floor")
        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsFloor()
                    For Local y := tile.y - 1 To tile.y + 1
                        For Local x := tile.x + 1 To tile.x - 1 Step -1
                            If x = tile.x And
                               y = tile.y
                                Continue
                            End If

                            If Level.GetTileAt(x, y) = Null
                                New Tile(x, y, TileType.CorridorDirtWall, False, -1)
                            End If
                        End For
                    End For
                End If
            End For
        End For

        Level.PadWalls()
        Level.ProcessSpecialRoom()

        If Not Level.isLevelEditor Then Level.CreateIndestructibleBorder()

        If Level.isHardcoreMode
            Level.chestsStillToPlace = 1
        Else
            Level.chestsStillToPlace = 2

            Local threeChestsRoll := Util.RndIntRangeFromZero(100, True)
            If threeChestsRoll <= 19
                Level.chestsStillToPlace = 3
            End If
        End If

        Debug.Log("CREATEMAP ZONE2: Placing secret rooms")
        Level.PlaceSecretRooms(4)

        Debug.Log("CREATEMAP ZONE2: Filling secret rooms")
        If Not Level.FillSecretRooms() Then Return Level._FailMap()
        If Not Level.isHardcoreMode
            Level.chestsStillToPlace = math.Max(Level.chestsStillToPlace, 1)
        End If

        Level.AddStone()
        Level.PlaceTraps()
        Level.PlaceEnemies()
        Enemy.SetAllEnemiesMinimumMoveDistance(5)

        Debug.Log("CREATEMAP ZONE2: Placing one speedup or slowdown trap")
        Local trap: Trap
        For Local i := 500 Until 0 Step -1
            trap = Trap.FindRandomTrap()
            If trap <> Null
                If trap.canBeReplacedByTempoTrap And
                   trap.trapType = TrapType.BounceTrap
                    Exit
                End If
            End If
        End For

        If trap <> Null
            Local trapX := trap.x
            Local trapY := trap.y

            trap.Die()

            If Util.RndBool(True)
                New SpeedUpTrap(trapX, trapY)
                Debug.Log("CREATEMAP ZONE2: Speedup trap placed at " + trapX + "/" + trap.y)
            Else
                New SlowDownTrap(trapX, trapY)
                Debug.Log("CREATEMAP ZONE2: Slowdown trap placed at " + trapX + "/" + trap.y)
            End If
        End If

        Debug.Log("CREATEMAP ZONE2: Placing glowing mushrooms")
        Local anotherRooms := New List<RoomData>()
        For Local room := EachIn Level.rooms
            anotherRooms.AddLast(room)
        End For

        If Util.RndBool(True)
            New MushroomLight(room1.x + 2, room1.y + 2, 1, True)
            New MushroomLight(room1.x + room1.w - 2, room1.y + room1.h - 2, 1, True)
        Else
            New MushroomLight(room1.x + room1.w - 2, room1.y + 2, 1, True)
            New MushroomLight(room1.x + 2, room1.y + room1.h - 2, 1, True)
        End If

        For Local room := EachIn anotherRooms
            If room.type = RoomType.Shop
                If Not Level.IsCorridorFloorOrDoorAdjacent(room.x + 1, room.y + 1)
                    New MushroomLight(room.x + 1, room.y + 1, 1, False, False)
                End If
                If Not Level.IsCorridorFloorOrDoorAdjacent(room.x + room.w - 1, room.y + 1)
                    New MushroomLight(room.x + room.w - 1, room.y + 1, 1, False, False)
                End If
                If Not Level.IsCorridorFloorOrDoorAdjacent(room.x + room.w - 1, room.y + room.h - 1)
                    New MushroomLight(room.x + room.w - 1, room.y + room.h - 1, 1, False, False)
                End If
                If Not Level.IsCorridorFloorOrDoorAdjacent(room.x + 1, room.y + room.h - 1)
                    New MushroomLight(room.x + 1, room.y + room.h - 1, 1, False, False)
                End If
            End If
        End For

        Debug.Log("CREATEMAP ZONE2: Placing torches")
        Local minTorch: Int
        Local maxTorch: Int
        Select controller_game.currentLevel
            Case 2
                minTorch = 1
                maxTorch = 2
            Default
                If controller_game.currentLevel < 2
                    minTorch = 1
                Else
                    minTorch = 0
                End If

                maxTorch = (2 * minTorch) + 1
        End Select

        anotherRooms = New List<RoomData>()
        For Local room := EachIn Level.rooms
            anotherRooms.AddLast(room)
        End For
        anotherRooms.AddLast(room1)

        For Local room := EachIn anotherRooms
            Local numTorch := Util.RndIntRange(minTorch, maxTorch, True, -1)
            Local i: Int
            Local minTorchDistance: Float
            If room.type <> RoomType.Shop
                If numTorch <= 0 Then Continue

                i = 50
            End If

            For i = i - 1 Until 0 Step -1
                Local wallLocation := Level.GetRandomWallInRoom(room.x, room.y, room.w, room.h)
                Local wall := Level.GetTileAt(wallLocation.x, wallLocation.y)
                If wall <> Null And
                   Not wall.IsDoor() And
                   Level.GetDistanceToNearestTorch(wall) >= 3.5
                    wall.AddTorch()
                    numTorch -= 1
                End If

                If numTorch <= 0 Then Exit
            End For
        End For

        Level.PlaceCrateOrBarrel()
        Level.PlaceChests(False)
        Level.PlaceResourceWall()

        Debug.Log("CREATEMAP ZONE2: Adding fake walls (if any)")
        Local i := 50
        Local numFakeWall := Util.RndIntRangeFromZero(3, True)

        For Local i = i - 1 Until 0 Step -1
            If numFakeWall <= 0 Then Exit

            Local dirtWallLocation := Level.FindTileOfType(TileType.DirtWall)
            If dirtWallLocation = Null Then Continue

            Local dirtWall := Level.GetTileAt(dirtWallLocation.x, dirtWallLocation.y)
            If dirtWall = Null Then Continue

            If dirtWallLocation.x > 3 Or
               dirtWallLocation.y > 3
                Level.PlaceTileRemovingExistingTiles(dirtWall.x, dirtWall.y, TileType.Floor, False, -1, False)
                New FakeWall(dirtWall.x, dirtWall.y, 1)

                Debug.Log("CREATEMAP ZONE2: Added fake wall at " + dirtWall.x + ", " + dirtWall.y)

                numFakeWall -= 1
            End If
        End For

        Debug.Log("CREATEMAP ZONE2: Adding tar monsters (if any)")
        If Level.isAnyTar
            Local tarLocation := Level.FindTileOfType(TileType.Tar)
            If tarLocation <> Null
                If Level.GetTileAt(tarLocation.x, tarLocation.y) <> Null And
                   Not Util.IsGlobalCollisionAt(tarLocation.x, tarLocation.y, False, False, False, False, False)
                    If Util.RndBool(True)
                        New TarMonster(tarLocation.x, tarLocation.y, 1)

                        Debug.Log("CREATEMAP ZONE2: Added tar monster at " + tarLocation.x + ", " + tarLocation.y)
                    End If
                End If
            End If
        End If

        Level.PlaceLockedChests()
        Level.PlaceShrine()

        Debug.Log("CREATEMAP ZONE2: Cleaning up pending tiles")
        Tile.CleanUpPendingTiles()

        Level.PlaceNocturnaArea()

        Debug.Log("CREATEMAP ZONE2: Finished!")

        Return True
    End Function

    Function CreateMapZone3: Bool()
        Local room1: RoomData
        Local room2: RoomData
        Local room3: RoomData
        Local room4: RoomData
        Local room5: RoomData
        Local room6: RoomData
        Local room7: RoomData

        Level.InitNewMap(True)

        Level.zone3DividingLineX = Util.RndFloatRange(-1.0, 1.0, True)
        Level.zone3DividingLineY = Util.RndFloatRange(-1.0, 1.0, True)

        room1 = Level.PlaceFirstRoom()

        Local limit := 5000

        Debug.Log("CREATEMAP ZONE3: Trying to place room 2")
        For limit = limit - 1 Until 0 Step -1
            room2 = Level.PlaceRoomZone3(room1)
            If room2 Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE3: Trying to place room 3")
        For limit = limit - 1 Until 0 Step -1
            room3 = Level.PlaceRoomZone3(room2)
            If room3 Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE3: Trying to place room 4")
        For limit = limit - 1 Until 0 Step -1
            room4 = Level.PlaceRoomZone3(room3)
            If room4 Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Local lastRoomIndex: Int

        Debug.Log("CREATEMAP ZONE3: Trying to place room 5")
        For limit = limit - 1 Until 0 Step -1
            For limit = limit Until 0 Step -1
                If Util.RndIntRangeFromZero(50, True) = 0 Then Exit

                room5 = Level.PlaceRoomZone3(room4)
                If room5 <> Null
                    lastRoomIndex = 4

                    Exit
                End If
            End For

            If room5 <> Null Then Exit

            If limit <= 0 Then Return Level._FailMap()

            If Util.RndBool(True)
                room5 = Level.PlaceRoomZone3(room3)
            Else
                room5 = Level.PlaceRoomZone3(room1)
            End If

            If room5 <> Null
                lastRoomIndex = 3

                Exit
            End If
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE3: Trying to place room 6")
        For limit = limit - 1 Until 0 Step -1
            If Util.RndIntRangeFromZero(50, True) <> 0
                room6 = Level.PlaceRoomZone3(room1)
            Else If Util.RndIntRangeFromZero(10, True) <> 0
                room6 = Level.PlaceRoomZone3(room4)

                If room6 <> Null And lastRoomIndex = 3
                    lastRoomIndex = 5
                End If
            Else
                room6 = Level.PlaceRoomZone3(room5)

                If room6 <> Null And lastRoomIndex = 4
                    lastRoomIndex = 5
                End If
            End If

            If room6 <> Null Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE3: Trying to place room 7")
        If Shrine.spaceShrineActive
            For limit = limit - 1 Until 0 Step -1
                If Util.RndBool(True)
                    If Util.RndBool(True)
                        room7 = Level.PlaceRoomZone3(room1)
                    Else
                        room7 = Level.PlaceRoomZone3(room3)
                    End If
                Else
                    If Util.RndBool(True)
                        room7 = Level.PlaceRoomZone3(room2)
                    Else
                        room7 = Level.PlaceRoomZone3(room4)

                        If room7 And lastRoomIndex = 3
                            lastRoomIndex = 6
                        End If
                    End If
                End If

                If room7 Then Exit
            End For
        End If

        If limit <= 0 Then Return Level._FailMap()

        Local lastRoom: RoomData = room4
        Select lastRoomIndex
            Case 4 lastRoom = room5
            Case 5 lastRoom = room6
            Case 6 lastRoom = room7
        End Select
        lastRoom.hasExit = True

        ' `PlaceExit` performs the retry on its own.
        If Not Level.PlaceExit(lastRoom) Then Return False

        Local exitCoords := Level.GetStandardExitCoords()
        If Camera.IsOnScreenStandardizedRelativeToPoint(exitCoords.x, exitCoords.y, 0, 0)
            Return Level._FailMap()
        End If

        Debug.Log("CREATEMAP ZONE3: Placing shop")
        For limit = limit - 1 Until 0 Step -1
            Local shop := Level.PlaceRoomZone3(RoomType.Shop, Null)
            If shop <> Null Then Exit
        End For

        Debug.Log("CREATEMAP ZONE3: Removing some wall tiles")
        Level.RemoveSomeWallsAwayFromCorridors(0.45, True, 3)

        Level.WidenCorridors()
        Level.AddSomePillarsInOpenSpace()

        Debug.Log("CREATEMAP ZONE3: Filling out walls surrounding all floor")
        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsFloor()
                    For Local y := tile.y - 1 To tile.y + 1
                        For Local x := tile.x + 1 To tile.x - 1 Step -1
                            If x = tile.x And
                               y = tile.y
                                Continue
                            End If

                            If Level.GetTileAt(x, y) = Null
                                New Tile(x, y, TileType.CorridorDirtWall, False, -1)
                            End If
                        End For
                    End For
                End If
            End For
        End For

        Level.PadWalls()
        Level.ProcessSpecialRoom()

        If Not Level.isLevelEditor Then Level.CreateIndestructibleBorder()

        If Level.isHardcoreMode
            Level.chestsStillToPlace = 1
        Else
            Local extraChestRoll := Util.RndIntRangeFromZero(100, True)
            If extraChestRoll <= 9
                Level.chestsStillToPlace = 2
            End If
        End If

        Debug.Log("CREATEMAP ZONE3: Placing secret rooms")
        Level.PlaceSecretRooms(4)

        Debug.Log("CREATEMAP ZONE3: Filling secret rooms")
        If Not Level.FillSecretRooms() Then Return Level._FailMap()

        If Not Level.isHardcoreMode
            If controller_game.currentLevel <= 2
                Level.chestsStillToPlace = math.Max(Level.chestsStillToPlace, 1)
            End If
        End If

        Level.AddStone()
        Level.AddHarderStone()
        Level.PlaceTraps()
        Level.PlaceEnemies()

        Debug.Log("CREATEMAP ZONE3: Move swarm enemies further from start location")
        Enemy.MoveSwarmEnemiesAwayFromStartLocation()
        Debug.Log("CREATEMAP ZONE3: Finished moving swarm enemies further from start location")

        Enemy.SetAllEnemiesMinimumMoveDistance(7)

        Debug.Log("CREATEMAP ZONE3: Placing one speedup or slowdown trap")
        Local trap: Trap
        For Local i := 500 Until 0 Step -1
            trap = Trap.FindRandomTrap()
            If trap <> Null
                If trap.canBeReplacedByTempoTrap And
                   trap.trapType = TrapType.BounceTrap
                    Exit
                End If
            End If
        End For

        If trap <> Null
            Local trapX := trap.x
            Local trapY := trap.y

            trap.Die()

            If Util.RndBool(True)
                New SpeedUpTrap(trapX, trapY)
                Debug.Log("CREATEMAP ZONE3: Speedup trap placed at " + trapX + "/" + trap.y)
            Else
                New SlowDownTrap(trapX, trapY)
                Debug.Log("CREATEMAP ZONE3: Slowdown trap placed at " + trapX + "/" + trap.y)
            End If
        End If

        Debug.Log("CREATEMAP ZONE3: Placing torches")
        Local minTorch := 3
        Local maxTorch := 4
        Select controller_game.currentLevel
            Case 2
                minTorch = 2
                maxTorch = 3
            Case 3
                minTorch = 1
                maxTorch = 2
            Case 4
                minTorch = 1
                maxTorch = 1
            Default
                If controller_game.currentLevel >= 5
                    minTorch = 0
                    maxTorch = 1
                End If
        End Select

        Local anotherRooms := New List<RoomData>()
        For Local room := EachIn Level.rooms
            anotherRooms.AddLast(room)
        End For
        anotherRooms.AddLast(room1)

        For Local room := EachIn anotherRooms
            Local numTorch := Util.RndIntRange(minTorch, maxTorch, True, -1)
            Local i: Int
            Local minTorchDistance: Float
            If room.type <> RoomType.Shop
                If numTorch <= 0 Then Continue

                i = 50
                minTorchDistance = 3.5
            Else
                numTorch = 20
                i = 200
                minTorchDistance = 2.0
            End If

            For i = i - 1 Until 0 Step -1
                Local wallLocation := Level.GetRandomWallInRoom(room.x, room.y, room.w, room.h)
                Local wall := Level.GetTileAt(wallLocation.x, wallLocation.y)
                If wall <> Null And
                   Not wall.IsDoor() And
                   Level.GetDistanceToNearestTorch(wall) >= minTorchDistance
                    wall.AddTorch()
                    numTorch -= 1
                End If

                If numTorch <= 0 Then Exit
            End For
        End For

        Level.PlaceCrateOrBarrel()
        Level.PlaceChests(False)
        Level.PlaceResourceWall()
        Level.PlaceLockedChests()
        Level.PlaceShrine()

        Debug.Log("CREATEMAP ZONE3: Cleaning up pending tiles")
        Tile.CleanUpPendingTiles()

        Level.PlaceNocturnaArea()

        Debug.Log("CREATEMAP ZONE3: Finished!")

        Return True
    End Function

    Function CreateMapZone4: Bool(recursive: Bool)
        Local saveGameData := Not recursive
        Level.InitNewMap(saveGameData)

        Debug.Log("CREATEMAP ZONE4: Creating room stubs")

        Local roomPositionRoll := Util.RndIntRangeFromZero(3, True)

        Level.rooms = New List<RoomData>()

        Local room1 := Level.PlaceFirstRoom()
        Level.rooms.AddLast(room1)

        Local exitRoom: RoomData
        Local xLow: Int
        Local xHigh: Int
        Local yLow: Int
        Local yHigh: Int
        Select roomPositionRoll
            ' Down Right
            Case 0
                xLow = -2
                xHigh = 12
                yLow = -2
                yHigh = 12
                exitRoom = New RoomData(xHigh, yHigh, 5, 5, RoomType.Basic, False)
            ' Up Right
            Case 1
                xLow = -2
                xHigh = 12
                yLow = -17
                yHigh = -3
                exitRoom = New RoomData(xHigh, yLow, 5, 5, RoomType.Basic, False)
            ' Down Left
            Case 2
                xLow = -17
                xHigh = -3
                yLow = -2
                yHigh = 12
                exitRoom = New RoomData(xLow, yHigh, 5, 5, RoomType.Basic, False)
            ' Up Left
            Default
                xLow = -17
                xHigh = -3
                yLow = -17
                yHigh = -3
                exitRoom = New RoomData(xLow, yLow, 5, 5, RoomType.Basic, False)
        End Select

        Debug.Log("CREATEMAP ZONE4: Creating exit room stub at " + exitRoom.GetLocation().ToString() + " of size " + exitRoom.GetSize().ToString())

        Level.rooms.AddLast(exitRoom)

        If Not Level.CreateRoom(exitRoom.x, exitRoom.y, exitRoom.w, exitRoom.h, False, RoomType.Basic, False) Then Return Level.CreateMapZone4(True)

        Local limit := 500
        For Local i := 1 To 6
            Local x := Util.RndIntRange(xLow, xHigh, True, -1)
            Local y := Util.RndIntRange(yLow, yHigh, True, -1)

            Local createRoom := True
            Local j: Int
            For j = 0 To i
                Local roomsArray := Level.rooms.ToArray()
                Local room := roomsArray[j]

                If math.Abs(room.x - x) <= 5 And
                   math.Abs(room.y - y) <= 5
                    limit -= 1
                    i -= 1
                    createRoom = False

                    Exit
                End If
            End For

            If createRoom
                Local room := New RoomData(x, y, 5, 5, RoomType.Basic, False)
                Debug.Log("CREATEMAP ZONE4: Creating room stub at " + room.GetLocation().ToString() + " of size " + room.GetSize().ToString())
                Level.rooms.AddLast(room)

                If Not Level.CreateRoom(room.x, room.y, room.w, room.h, False, RoomType.Basic) Then Return Level.CreateMapZone4(True)
            End If

            If limit <= 0 Then Return Level.CreateMapZone4(True)
        End For

        Local xMax := xHigh + 5
        Local yMax := yHigh + 5

        For Local x := xLow To xMax
            For Local y := yLow To yMax
                If Not Level.IsTileEmpty(x, y) Then Continue

                Level.PlaceTileRemovingExistingTiles(x, y, TileType.DirtWall)
            End For
        End For

        ' TODO: Is this conditionally logged?
        Debug.Log("CREATEMAP ZONE4: Placing secret rooms 1")
        Level.PlaceSecretRooms(3)

        Local i: Int
        Local j := 0
        For i = 500 Until 0 Step -1
            Local roomsIndex := Util.RndIntRange(1, 7, True, -1)
            Local roomsArray := Level.rooms.ToArray()
            Local room := roomsArray[roomsIndex]

            Local direction := Util.RndIntRangeFromZero(3, True)
            Select direction
                Case Direction.Right
                    If room.x + room.w >= xMax Then Continue
                    If room.w > 8 Then Continue

                    If room.h >= 0
                        Local yOff: Int
                        For yOff = 0 To room.h
                            If Level.IsFloorAt(room.x + room.w + 1, room.y + yOff) Then Exit
                        End For

                        If yOff <= room.h Then Continue
                    End If
                Case Direction.Down
                    If room.y + room.h >= yMax Then Continue
                    If room.h > 8 Then Continue

                    If room.w >= 0
                        Local xOff: Int
                        For xOff = 0 To room.w
                            If Level.IsFloorAt(room.x + xOff, room.y + room.h + 1) Then Exit
                        End For

                        If xOff <= room.w Then Continue
                    End If
                Case Direction.Left
                    If xLow >= room.x Then Continue
                    If room.w > 8 Then Continue

                    If room.h >= 0
                        Local yOff: Int
                        For yOff = 0 To room.h
                            If Level.IsFloorAt(room.x - 1, room.y + yOff) Then Exit
                        End For

                        If yOff <= room.h Then Continue
                    End If
                Case Direction.Up
                    If yLow >= room.y Then Continue
                    If room.h > 8 Then Continue

                    If room.w >= 0
                        Local xOff: Int
                        For xOff = 0 To room.w
                            If Level.IsFloorAt(room.x + xOff, room.y - 1) Then Exit
                        End For

                        If xOff <= room.w Then Continue
                    End If
            End Select

            Debug.Log("CREATEMAP ZONE4: Expanding room at " + room.GetLocation().ToString() + " of size " + room.GetSize().ToString() + " in direction " + Util.DirToString(direction))

            Select direction
                Case Direction.Right
                    room.w += 1
                Case Direction.Down
                    room.h += 1
                Case Direction.Left
                    room.x -= 1
                    room.w += 1
                Case Direction.Up
                    room.y -= 1
                    room.h += 1
            End Select

            Local allowWaterTarOoze := roomsIndex <> 1
            If Not Level.CreateRoom(room.x, room.y, room.w, room.h, False, RoomType.Basic, allowWaterTarOoze) Then Return Level.CreateMapZone4(True)

            i += 1
            j += 1
            If j > 40 Then Exit
        End For

        If i < 0 Then Return Level.CreateMapZone4(True)

        Local roomsIndex := Util.RndIntRange(2, 7, True, -1)
        Local roomsArray := Level.rooms.ToArray()
        Local room := roomsArray[roomsIndex]

        Local roomType := RoomType.OutsideCorners
        If Util.RndBool(True)'
            roomType = RoomType.Pillar
        End If

        If Not Level.CreateRoom(room.x, room.y, room.w, room.h, False, roomType) Then Return Level.CreateMapZone4(True)

        Level.rooms.RemoveFirst()

        roomsArray = Level.rooms.ToArray()
        exitRoom = roomsArray[0]
        exitRoom.hasExit = True

        limit = 500

        Debug.Log("CREATEMAP ZONE4: Placing exit in room 1")
        For limit = limit - 1 Until 0 Step -1
            Local stairsXOff := Util.RndIntRangeFromZero(exitRoom.w - 1, True)
            Local stairsX := exitRoom.x + stairsXOff
            Local stairsYOff := Util.RndIntRangeFromZero(exitRoom.h - 1, True)
            Local stairsY := exitRoom.y + stairsYOff

            If Not Level.IsFloorAt(stairsX, stairsY) Then Continue

            Local tileBelow := Level.GetTileAt(stairsX, stairsY + 1)
            If tileBelow = Null Then Continue
            If tileBelow.IsWall() Then Continue

            Level.GetTileAt(stairsX, stairsY).Die()

            Local stairs := New Tile(stairsX, stairsY, TileType.LockedStairsMiniboss, False, -1)
            stairs.flyawayText = "|198|DEFEAT THE MINIBOSS!|"

            Local exitKey := New Point(stairsX, stairsY)
            Local exitValue := New Point(LevelType.LockedExit1, -6)
            Level.exits.Set(exitKey, exitValue)

            Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE4: Placing shop")
        For limit = limit - 1 Until 0 Step -1
            Local shop := Level.PlaceRoomZone4(RoomType.Shop)
            If shop <> Null Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Level.ProcessSpecialRoom()

        If Not Level.isLevelEditor
            Level.CreateIndestructibleBorder()
        End If

        Level.chestsStillToPlace = 1
        If Not Level.isHardcoreMode
            Local extraChestRoll := Util.RndIntRangeFromZero(100, True)
            If extraChestRoll <= 9
                Level.chestsStillToPlace = 2
            End If
        End If

        Debug.Log("CREATEMAP ZONE4: Placing secret rooms 2")
        ' TODO: Decompiler shows -1 for t_numRooms. However, hardcoding 4 creates the correct number of secret rooms and
        '       sets RNG state to expected values (for seed "1", floor 1-1).
        '       It's possible that 4 is the correct hardcoded value but why doesn't the decompiler show this?
        Level.PlaceSecretRooms(4)

        Debug.Log("CREATEMAP ZONE4: Filling secret rooms")
        If Not Level.FillSecretRooms() Then Return Level._FailMap()

        If Not Level.isHardcoreMode
            If controller_game.currentLevel <= 2
                Level.chestsStillToPlace = math.Max(Level.chestsStillToPlace, 1)
            End If
        End If

        Level.AddStone()
        Level.AddHarderStone()
        Level.PlaceTraps()
        Level.PlaceEnemies()

        Debug.Log("CREATEMAP ZONE4: Placing one speedup or slowdown trap")
        For Local i := 500 Until 0 Step -1
            Local trap := Trap.FindRandomTrap()
            If trap <> Null
                If trap.canBeReplacedByTempoTrap And
                   trap.trapType = TrapType.BounceTrap
                    Local trapX := trap.x
                    Local trapY := trap.y

                    trap.Die()

                    If Util.RndBool(True)
                        New SpeedUpTrap(trapX, trapY)
                        Debug.Log("CREATEMAP ZONE4: Speedup trap placed at " + trapX + "/" + trapY)
                    Else
                        New SlowDownTrap(trapX, trapY)
                        Debug.Log("CREATEMAP ZONE4: Slowdown trap placed at " + trapX + "/" + trapY)
                    End If

                    Exit
                End If
            End If
        End For

        Level.PlaceTorchesAnywhere()

        ' TODO: Temporary bypass until `PlaceTorchesAnywhere` is fixed.
        If Level.randSeed = 1
            Select controller_game.currentLevel
                Case 1 Util.SeedRnd($E15869CC)
                Case 2 Util.SeedRnd($EEA1C47C)
                Case 3 Util.SeedRnd($2CBF91E4)
            End Select
        End If

        Level.PlaceCrateOrBarrel()
        Level.PlaceChests(False)
        Level.PlaceResourceWall()
        Level.PlaceLockedChests()
        Level.PlaceShrine()

        Debug.Log("CREATEMAP ZONE4: Cleaning up pending tiles")
        Tile.CleanUpPendingTiles()

        Level.CheckMapConsistency()
        Level.PlaceNocturnaArea()

        Debug.Log("CREATEMAP ZONE4: Finished!")

        Return True
    End Function

    Function CreateMapZone5: Bool(recursive: Bool)
        Local saveGameData := Not recursive
        Level.InitNewMap(saveGameData)

        Local room1Data := Level.PlaceFirstRoom()

        Local hallway := New BlobRoom()
        hallway.FillRect(room1Data.x, room1Data.y - 10, 4, 10)
        hallway.FillRect(room1Data.x, room1Data.y - 14, 14, 4)

        If Util.RndBool(True)
            hallway.ReflectHorizontallyAbout(room1Data.x + 2)
        End If

        Local rotationPoint: Point
        Local numRotations: Int

        rotationPoint = New Point(room1Data.x + 2, room1Data.y - 2)
        numRotations = Util.RndIntRangeFromZero(2, True)
        If numRotations = 2
            numRotations = 3
        End If
        For numRotations = numRotations Until 0 Step -1
            hallway.RotateCWAbout(rotationPoint)
        End For

        Local translateX := Util.RndIntRangeFromZero(2, True)
        hallway.TranslateBy(New Point(translateX, 0))

        rotationPoint = New Point(0, 0)
        numRotations = Util.RndIntRangeFromZero(3, True)
        For numRotations = numRotations Until 0 Step -1
            hallway.RotateCWAbout(rotationPoint)
        End For

        Local hallwayTiles := hallway.MakeTiles()
        For Local hallwayTile := EachIn hallwayTiles
            Level.PlaceTileRemovingExistingTiles(hallwayTile.x, hallwayTile.y, hallwayTile.type)
        End For

        Debug.Log("CREATEMAP ZONE5: Placed hallway at " + hallway.GetBounds().ToString())

        Level.DumpMap()

        Local isEntryDoorPlaced := False
        Local room1 := New RectRoom(room1Data.GetBounds())
        For Local room1PortalSeg := EachIn room1.GetPortalSegs()
            For Local hallwayPortalSeg := EachIn hallway.GetPortalSegs()
                Local intersection := room1PortalSeg.Intersect(hallwayPortalSeg)
                If intersection = Null Then Continue

                Debug.Assert(intersection.length + 1 >= 3)

                Local scalar := Util.RndIntRangeFromZero(intersection.length - 2, False)
                Local origin := intersection.GetOrigin()

                Local faceVector := intersection.GetFaceVector().Scale(scalar)
                Local offsetOrigin := origin.Add(faceVector)

                Local faceVector2 := intersection.GetFaceVector().Scale(2)
                Local offsetOrigin2 := offsetOrigin.Add(faceVector2)

                Local x := math.Min(offsetOrigin.x, offsetOrigin2.x)
                Local y := math.Min(offsetOrigin.y, offsetOrigin2.y)
                Local w := math.Max(offsetOrigin.x, offsetOrigin2.x)
                Local h := math.Max(offsetOrigin.y, offsetOrigin2.y)
                Local doorBounds := Rect.MakeBounds(x, y, w, h)

                Level.FillTiles(doorBounds, TileType.Door, TileType.Empty)
                Level.PlaceConnectedWireDoor(doorBounds.GetCenter())

                Debug.Log("CREATEMAP ZONE5: Placed entry door at " + doorBounds.ToString())

                isEntryDoorPlaced = True

                Exit
            End For

            If isEntryDoorPlaced Then Exit
        End For

        Debug.Assert(isEntryDoorPlaced)

        Level.DumpMap()

        Local hallwayPortalSegs := hallway.GetPortalSegs()

        Debug.Log("CREATEMAPZONE5: Place miniboss room connected to central hallway")

        Local minibossRoom := Level.CreateRoomZone5(hallwayPortalSegs, 9, 9, 5)
        If minibossRoom = Null
            Debug.Log("Retrying: could not place miniboss room")

            Return Level.CreateMapZone5(True)
        End If

        Local lastRoom := Level.rooms.Last()
        lastRoom.hasExit = True

        Level.DumpMap()

        Debug.Log("CREATEMAPZONE5: Place two small rooms connected to central hallway")

        Local smallRoom1 := Level.CreateRoomZone5(hallwayPortalSegs, 6, 5, 0)
        If smallRoom1 = Null
            Debug.Log("Retrying: could not place first two misc rooms")

            Return Level.CreateMapZone5(True)
        End If

        Local smallRoom2 := Level.CreateRoomZone5(hallwayPortalSegs, 6, 5, 0)
        If smallRoom2 = Null
            Debug.Log("Retrying: could not place first two misc rooms")

            Return Level.CreateMapZone5(True)
        End If

        Level.DumpMap()

        Debug.Log("CREATEMAPZONE5: Place two small rooms connected to central hallway or another small room")

        hallwayPortalSegs.Extend(smallRoom1.GetPortalSegs())
        hallwayPortalSegs.Extend(smallRoom2.GetPortalSegs())

        Local smallRoom3 := Level.CreateRoomZone5(hallwayPortalSegs, 6, 5, 0)
        If smallRoom3 = Null
            Debug.Log("Retrying: could not place last two misc rooms")

            Return Level.CreateMapZone5(True)
        End If

        Local smallRoom4 := Level.CreateRoomZone5(hallwayPortalSegs, 6, 5, 0)
        If smallRoom4 = Null
            Debug.Log("Retrying: could not place last two misc rooms")

            Return Level.CreateMapZone5(True)
        End If

        Level.DumpMap()

        Debug.Log("CREATEMAPZONE5: Place exit")

        Local points := New IntPointStack()

        Local rect: Rect
        Local point: Point

        rect = New Rect(minibossRoom.body.x + 2, minibossRoom.body.y + 2, 2, 1)
        point = rect.RandomPoint()
        points.Push(point)
        rect = New Rect(minibossRoom.body.x + 6, minibossRoom.body.y + 2, 1, 2)
        point = rect.RandomPoint()
        points.Push(point)
        rect = New Rect(minibossRoom.body.x + 2, minibossRoom.body.y + 5, 1, 2)
        point = rect.RandomPoint()
        points.Push(point)
        rect = New Rect(minibossRoom.body.x + 5, minibossRoom.body.y + 6, 2, 1)
        point = rect.RandomPoint()
        points.Push(point)

        points.Shuffle(True)
        Local pointsIndex := 0
        For Local i := 1 Until points.Length()
            Local point := points.Get(pointsIndex)
            Local pointL1Dist := Util.GetL1Dist(0, 0, point.x, point.y)

            Local nextPoint := points.Get(i)
            Local nextPointL1Dist := Util.GetL1Dist(0, 0, nextPoint.x, nextPoint.y)

            If pointL1Dist < nextPointL1Dist
                pointsIndex = i
            End If
        End For

        Local exitPoint := points.Get(pointsIndex)
        points.Remove(pointsIndex)
        Level.CreateExit(exitPoint.x, exitPoint.y)

        points.Shuffle(True)

        Debug.Log("CREATEMAPZONE5: Place wire")

        points.Pop()
        For Local point := EachIn points
            Level.PlaceWire(exitPoint, point)
        End For

        Local rooms := New Stack<RoomBase>()
        rooms.Push(room1)
        rooms.Push(hallway)
        rooms.Push(minibossRoom)
        rooms.Push(smallRoom1)
        rooms.Push(smallRoom2)
        rooms.Push(smallRoom3)
        rooms.Push(smallRoom4)

        For Local room := EachIn rooms
            Local internalNodePoints := New IntPointStack()
            Local wirePoints := New IntPointStack()

            Local hasExit := False
            Local exitCoords := Level.GetStandardExitCoords()
            If room.IsFloor(exitCoords.x, exitCoords.y)
                wirePoints.Push(exitCoords)
                hasExit = True
            End If

            Local hasStart := room.IsFloor(0, 0)

            For Local roomFloorPoint := EachIn room.GetFloor()
                If Level.IsTileTypeAdjacent(roomFloorPoint.x, roomFloorPoint.y, TileType.WiredDoor)
                    wirePoints.Push(roomFloorPoint)

                    Local wire := Level.PlaceTileRemovingExistingTiles(roomFloorPoint.x, roomFloorPoint.y, TileType.Wire)

                    For Local dir := 0 Until 3
                        Local offset := Util.GetPointFromDir(dir)
                        Local connectionPoint := roomFloorPoint.Add(offset)

                        If Level.GetTileTypeAt(connectionPoint.x, connectionPoint.y) = TileType.WiredDoor
                            wire.AddWireConnection(dir)
                        End If
                    End For
                Else If Not Level.IsWallAdjacent8(roomFloorPoint.x, roomFloorPoint.y)
                    internalNodePoints.Push(roomFloorPoint)
                End If
            End For

            If hasStart
                wirePoints.Push(New Point(0, 0))
            Else If Not hasExit And
                    wirePoints.Length() = 1
                Local internalNodePoint := internalNodePoints.ChooseRandom(True)

                Debug.Log("CREATEMAPZONE5: Creating internal node in leaf room at " + internalNodePoint.ToString())

                wirePoints.Push(internalNodePoint)
            End If

            For Local i := 1 Until wirePoints.Length()
                Local src := wirePoints.Get(0)
                Local dst := wirePoints.Get(i)
                Level.PlaceWire(src, dst)
            End For
        End For

        Level.DumpMap()

        Debug.Log("Place shop connected to hallway")

        hallwayPortalSegs = hallway.GetPortalSegs()

        Local shop := Level.CreateRoomZone5(hallwayPortalSegs, 6, 8, 0, RoomType.Shop)
        If shop = Null
            Debug.Log("Retrying: could not place shop")

            Return Level.CreateMapZone5(True)
        End If

        Level.DumpMap()

        Level.PadWalls()

        Level.DumpMap()

        Level.ProcessSpecialRoom()

        If Not Level.isLevelEditor
            Level.CreateIndestructibleBorder()
        End If

        Debug.Log("CREATEMAP ZONE5: Placing secret rooms")

        Level.chestsStillToPlace = 1
        If Not Level.isHardcoreMode
            Local extraChestRoll := Util.RndIntRangeFromZero(100, True)
            If extraChestRoll <= 9
                Level.chestsStillToPlace += 1
            End If
        End If

        Level.PlaceSecretRooms(4)

        Debug.Log("CREATEMAP ZONE5: Filling secret rooms")
        If Not Level.FillSecretRooms() Then Return Level._FailMap()

        If Not Level.isHardcoreMode
            If Level.chestsStillToPlace <= 1
                Level.chestsStillToPlace = 1
            End If

            If controller_game.currentLevel <= 2
                Level.chestsStillToPlace = 2
            End If
        End If

        Level.AddStone()
        Level.PlaceTraps()
        Level.hallwayZone5 = hallway
        Level.PlaceEnemies()

        Level.PlaceTorchesAnywhere()

        ' TODO: Temporary bypass until `PlaceTorchesAnywhere` is fixed.
        If Level.randSeed = 1
            Select controller_game.currentLevel
                Case 1 Util.SeedRnd($70721534)
                Case 2 Util.SeedRnd($B553431E)
                Case 3 Util.SeedRnd($A6660B28)
            End Select
        End If

        Level.PlaceCrateOrBarrel()
        Level.PlaceChests(False)
        Level.PlaceResourceWall()
        Level.PlaceLockedChests()
        Level.PlaceShrine()

        Debug.Log("CREATEMAP ZONE5: Cleaning up pending tiles")
        Tile.CleanUpPendingTiles()

        Debug.Log("CREATEMAP ZONE5: Finished!")

        Return True
    End Function

    Function _FailMap: Bool()
        Level.CreateMap(Null)

        Return False
    End Function

    Function CreateMerlin: Void()
        Debug.TraceNotImplemented("Level.CreateMerlin()")
    End Function

    Function CreateRoom: Bool(xVal: Int, yVal: Int, wVal: Int, hVal: Int, pending: Bool, roomType: Int)
        Return Level.CreateRoom(xVal, yVal, wVal, hVal, pending, roomType, True)
    End Function

    Function CreateRoom: Bool(xVal: Int, yVal: Int, wVal: Int, hVal: Int, pending: Bool, roomType: Int, allowWaterTarOoze: Bool)
        Return Level.CreateRoom(xVal, yVal, wVal, hVal, pending, roomType, -1, -1, -1, -1, False, TileType.DirtWall, False, allowWaterTarOoze)
    End Function

    Function CreateRoom: Bool(xVal: Int, yVal: Int, wVal: Int, hVal: Int, pending: Bool, roomType: Int, originX: Int, originY: Int, originX2: Int, originY2: Int, wideCorridor: Bool, wallType: Int, allowWallOverlap: Bool, allowWaterTarOoze: Bool)
        If controller_game.currentZone <= 3
            If Level.levelConstraintX > xVal Or
               Level.levelConstraintY > yVal Or
               xVal + wVal > Level.levelConstraintX + Level.levelConstraintW Or
               yVal + hVal > Level.levelConstraintY + Level.levelConstraintH
                If controller_game.currentLevel
                    Level.levelConstraintNum += 1
                    If Level.levelConstraintNum > 100
                        Level.levelConstraintNum = 0
                        Level.levelConstraintX -= 1
                        Level.levelConstraintY -= 1
                        Level.levelConstraintW += 2
                        Level.levelConstraintH += 2
                    End If

                    Return False
                End If
            End If
        End If

        Local catacombWallChance: Float
        Select controller_game.currentLevel
            Case 1 catacombWallChance = 0.00
            Case 2 catacombWallChance = 0.10
            Case 3 catacombWallChance = 0.13
            Case 4 catacombWallChance = 0.16
            Default
                If currentLevel > 4
                    catacombWallChance = math.Max(controller_game.currentLevel * 0.04, 0.40)
                End If
        End Select

        Local catacombWallRoll := Util.RndFloatRange(0.0, 1.0, True)
        If catacombWallChance > catacombWallRoll And
           roomType = RoomType.None And
           controller_game.currentZone = 1
            wallType = TileType.CatacombWall
        End If

        Local lastCreatedRoomType := roomType
        Local tiles: List<TileData> = New List<TileData>()
        Select roomType
            Case RoomType.None
                If controller_game.currentZone = 1
                    If controller_game.currentLevel = 1
                        If Not Util.RndBool(True)
                            lastCreatedRoomType = RoomType.Basic
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Basic, originX, originY, originX2, originY2, wideCorridor, wallType)
                        Else
                            lastCreatedRoomType = RoomType.OutsideCorners
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.OutsideCorners, originX, originY, originX2, originY2, wideCorridor, wallType)
                        End If
                    Else
                        Select Util.RndIntRangeFromZero(2, True)
                            Case 0
                                lastCreatedRoomType = RoomType.Basic
                                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Basic, originX, originY, originX2, originY2, wideCorridor, wallType)
                            Case 1
                                lastCreatedRoomType = RoomType.OutsideCorners
                                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.OutsideCorners, originX, originY, originX2, originY2, wideCorridor, wallType)
                            Case 2
                                lastCreatedRoomType = RoomType.Pillar
                                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Pillar, originX, originY, originX2, originY2, wideCorridor, wallType)
                        End Select
                    End If
                Else
                    If controller_game.currentZone = 4
                        If Not Util.RndIntRangeFromZero(1, True)
                            lastCreatedRoomType = RoomType.None
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Basic, originX, originY, originX2, originY2, wideCorridor, wallType)
                        Else
                            lastCreatedRoomType = RoomType.Basic
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Basic, originX, originY, originX2, originY2, wideCorridor, wallType)
                        End If
                    Else
                        Select Util.RndIntRangeFromZero(3, True)
                            Case 0
                                lastCreatedRoomType = RoomType.Basic
                                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Basic, originX, originY, originX2, originY2, wideCorridor, wallType)
                            Case 1
                                lastCreatedRoomType = RoomType.OutsideCorners
                                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.OutsideCorners, originX, originY, originX2, originY2, wideCorridor, wallType)
                            Case 2
                                lastCreatedRoomType = RoomType.Pillar
                                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Pillar, originX, originY, originX2, originY2, wideCorridor, wallType)
                            Case 3
                                lastCreatedRoomType = RoomType.Basic
                                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Notched, originX, originY, originX2, originY2, wideCorridor, wallType)
                        End Select
                    End If
                End If
            Case RoomType.Pillar,
                 RoomType.OutsideCorners,
                 RoomType.Shop,
                 RoomType.Secret,
                 RoomType.Boss,
                 RoomType.Vault,
                 RoomType.Notched,
                 RoomType.Special
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, roomType, originX, originY, originX2, originY2, wideCorridor, wallType)
            Default
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Basic, originX, originY, originX2, originY2, wideCorridor, wallType)
        End Select

        If allowWaterTarOoze
            Local liquidRoll := Util.RndIntRangeFromZero(100, True)

            Local numLiquidMaxPart1 := math.Min(controller_game.currentLevel - 1, 5)
            Local numLiquidMaxPart2 := Util.RndIntRange(2, 7, True, -1)
            Local numLiquidMaxPart3 := Util.RndIntRangeFromZero(numLiquidMaxPart1, True)
            Local numLiquidMax := numLiquidMaxPart2 + numLiquidMaxPart3

            Local liquidTileType: Int
            Select controller_game.currentZone
                Case 2
                    numLiquidMaxPart2 = Util.RndIntRange(2, 7, True, -1)
                    numLiquidMaxPart3 = Util.RndIntRangeFromZero(numLiquidMaxPart1, True)
                    numLiquidMax = numLiquidMaxPart2 + numLiquidMaxPart3

                    liquidTileType = TileType.Tar
                Case 4
                    liquidTileType = TileType.Ooze
                Default
                    liquidTileType = TileType.Water
            End Select

            Local placeLiquid := False

            Select controller_game.currentZone
                Case 1,
                     2,
                     4
                    Select controller_game.currentLevel
                        Case 1 If liquidRoll <=  5 Then placeLiquid = True
                        Case 2 If liquidRoll <= 25 Then placeLiquid = True
                        Case 3 If liquidRoll <= 45 Then placeLiquid = True
                        Default
                            If controller_game.currentLevel > 3
                                If liquidRoll <= 65 Then placeLiquid = True
                            End If
                    End Select
            End Select

            Select lastCreatedRoomType
                Case RoomType.Basic,
                     RoomType.Pillar,
                     RoomType.OutsideCorners
                    ' Do nothing
                Default
                    placeLiquid = False
            End Select

            If placeLiquid
                Local numLiquid := 0

                For Local tile := EachIn tiles
                    If tile.type = TileType.Floor Then numLiquid += 1
                End For

                Local numFloorToConvert = math.Min(numLiquid, numLiquidMax)
                Local numFloorToSkip := Util.RndIntRangeFromZero(numLiquid - 1, True)

                Local createdFirstLiquid := False
                Local lastLiquidX := 0
                Local lastLiquidY := 0
                Local i := 1000
                For i = i - 1 Until 0 Step -1
                    For Local tile := EachIn tiles
                        If tile.type = TileType.Floor
                            If Not createdFirstLiquid
                                numFloorToSkip -= 1
                                If numFloorToSkip < 0
                                    lastLiquidX = tile.x
                                    lastLiquidY = tile.y
                                    tile.type = liquidTileType
                                    numFloorToConvert -= 1

                                    createdFirstLiquid = True

                                    Exit
                                End If
                            Else
                                Local distanceToLastLiquid := Util.GetDist(lastLiquidX, lastLiquidY, tile.x, tile.y)
                                If distanceToLastLiquid <= 1.01
                                    Local convertToLiquidRoll := Util.RndIntRangeFromZero(3, True)
                                    If convertToLiquidRoll = 0
                                        lastLiquidX = tile.x
                                        lastLiquidY = tile.y
                                        tile.type = liquidTileType
                                        numFloorToConvert -= 1

                                        Exit
                                    End If
                                End If
                            End If
                        End If
                    End For

                    If numFloorToConvert <= 0 Then Exit
                End For

                If i = 0
                    Debug.Log("CREATEROOM abort: failed to place liquid")

                    Return False
                End If
            End If
        End If

        For Local tile := EachIn tiles
            Local tileX := tile.x
            Local tileY := tile.y
            Local tileType := tile.type

            If pending And Level.GetTileTypeAt(tileX, tileY) <> TileType.Empty
                If Not allowWallOverlap Then Return False
                If Not Level.IsWallAt(tileX, tileY, False, False) Then Return False

                New Tile(tileX, tileY, tileType, True, -1)
            Else
                Level.PlaceTileRemovingExistingTiles(tileX, tileY, tileType, pending, -1, False)
            End If
        End For

        Level.lastCreatedRoomType = lastCreatedRoomType

        Debug.WriteLine("Placed room (" + xVal + ", " +  yVal + ", " +  wVal + ", " +  hVal + ", " +  originX + ", " +  originY + ")")

        If necrodancer.DUMPMAP_ITERATIVE
            Level.DumpMap()
        End If

        Return True
    End Function

    Function _CreateRoom: List<TileData>(xVal: Int, yVal: Int, wVal: Int, hVal: Int, roomType: Int, originX: Int, originY: Int, originX2: Int, originY2: Int, wideCorridor: Bool, wallType: Int)
        Local tiles := New List<TileData>()

        Local xMax := xVal + wVal
        Local yMax := yVal + hVal

        Select roomType
            Case RoomType.Basic
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, wallType)
                Level._CreateFloor(tiles, xVal, yVal, xMax, yMax, TileType.Floor)
            Case RoomType.Pillar
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, wallType)

                Local leftPillarX := xVal + 2
                Local rightPillarX := xVal + wVal - 2
                Local topPillarY := yVal + 2
                Local bottomPillarY := yVal + hVal - 2
                Local catacombWallRoll := Util.RndIntRangeFromZero(6, True)

                For Local x := xVal + 1 Until xMax
                    For Local y := yVal + 1 Until yMax
                        ' If 2 units away (horizontally and veritcally) from the walls
                        If (x = leftPillarX Or x = rightPillarX) And
                           (y = topPillarY Or y = bottomPillarY)
                            If catacombWallRoll = 0
                                tiles.AddLast(New TileData(x, y, TileType.CatacombWall))
                            Else
                                tiles.AddLast(New TileData(x, y, wallType))
                            End If
                        Else
                            tiles.AddLast(New TileData(x, y, TileType.Floor))
                        End If
                    End For
                End For
            Case RoomType.OutsideCorners
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, wallType)

                ' Min and max values within the walls of the room
                Local xInsideMin := xVal + 1
                Local xInsideMax := xMax - 1
                Local yInsideMin := yVal + 1
                Local yInsideMax := yMax - 1

                For Local x := xInsideMin To xInsideMax
                    For Local y := yInsideMin To yInsideMax
                        ' If at a corner
                        If (x = xInsideMin And y = yInsideMin) Or
                           (x = xInsideMin And y = yInsideMax) Or
                           (x = xInsideMax And y = yInsideMin) Or
                           (x = xInsideMax And y = yInsideMax)
                            Local xRem := originX - x
                            Local yRem := originY - y
                            If Not wideCorridor Or
                               (Util.GetDist(originX, originY, originX2 + xRem, originY2 + yRem) > 1.0)
                                Local remDist := Util.GetDist(0, 0, xRem, yRem)
                                If remDist > 1.0
                                    tiles.AddLast(New TileData(x, y, wallType))

                                    Continue
                                End If
                            End If
                        End If

                        tiles.AddLast(New TileData(x, y, TileType.Floor))
                    End For
                End For
            Case RoomType.Shop
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, TileType.ShopWall)

                ' Floor
                Local xMid := (wVal / 2) + xVal
                Local xMidLeft := xMid - 1
                Local xMidRight := xMid + 1

                Local yMid := (hVal / 2) + yVal
                Local yMidAbove := yMid - 1

                For Local x := xVal + 1 Until xMax
                    For Local y := yVal + 1 Until yMax
                        If y = yMidAbove
                            If x = xMidLeft Or
                               x = xMidRight
                                tiles.AddLast(New TileData(x, y, TileType.ShopFloor))
                                Continue
                            End If
                        End If

                        tiles.AddLast(New TileData(x, y, TileType.Floor))
                    End For
                End For

                Level.shopX = xVal
                Level.shopY = yVal
                Level.shopW = wVal
                Level.shopH = hVal
            Case RoomType.Secret
                Level._CreateFloor(tiles, xVal, yVal, xMax, yMax, TileType.SecretFloor)
            Case RoomType.Boss
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, TileType.BossWall)
                Level._CreateFloor(tiles, xVal, yVal, xMax, yMax, TileType.BossFloor)
            Case RoomType.Vault
                Local tileType := TileType.StoneWall
                If controller_game.currentLevel = 3
                    tileType = TileType.CatacombWall
                End If

                ' Horizontal walls and corners
                For Local x := xVal To xMax
                    If Level.GetTileTypeAt(x, yVal) <> TileType.CatacombWall
                        Level.PlaceTileRemovingExistingTiles(x, yVal, tileType, False, -1, False) ' Top wall
                    End If
                    If Level.GetTileTypeAt(x, yMax) <> TileType.CatacombWall
                        Level.PlaceTileRemovingExistingTiles(x, yMax, tileType, False, -1, False) ' Bottom wall
                    End If
                End For

                ' Vertical walls
                For Local y := yVal + 1 Until yMax
                    If Level.GetTileTypeAt(xVal, y) <> TileType.CatacombWall
                        Level.PlaceTileRemovingExistingTiles(xVal, y, tileType, False, -1, False) ' Left wall
                    End If
                    If Level.GetTileTypeAt(xVal, y) <> TileType.CatacombWall
                        Level.PlaceTileRemovingExistingTiles(xVal, y, tileType, False, -1, False) ' Right wall
                    End If
                End For

                Level._CreateFloor(tiles, xVal, yVal, xMax, yMax, TileType.SecretFloor)
            Case RoomType.Notched
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, wallType)

                Local xDiffMin := 2
                If originX <> xVal Then xDiffMin = (originX = xMax) + 1
                Local yDiffMin := 2
                If originY <> yVal Then yDiffMin = (originY = yMax) + 1

                For Local x := xVal + 1 Until xMax
                    For Local y := yVal + 1 Until yMax
                        If xDiffMin < math.Abs(x - originX) And
                           yDiffMin < math.Abs(y - originY)
                            tiles.AddLast(New TileData(x, y, wallType))
                        Else
                            tiles.AddLast(New TileData(x, y, TileType.Floor))
                        End If
                    End For
                End For
            Case RoomType.Special
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, TileType.ShopWall)
                Level._CreateFloor(tiles, xVal, yVal, xMax, yMax, TileType.Floor)
        End Select

        Return tiles
    End Function

    Function _CreateWalls: Void(tiles: List<TileData>, xVal: Int, yVal: Int, xMax: Int, yMax: Int, tileType: Int)
        ' Horizontal walls and corners
        For Local x := xVal To xMax
            tiles.AddLast(New TileData(x, yVal, tileType)) ' Top wall
            tiles.AddLast(New TileData(x, yMax, tileType)) ' Bottom wall
        End For

        ' Vertical walls
        For Local y:= yVal + 1 Until yMax
            tiles.AddLast(New TileData(xVal, y, tileType)) ' Left wall
            tiles.AddLast(New TileData(xMax, y, tileType)) ' Right wall
        End For
    End Function

    Function _CreateFloor: Void(tiles: List<TileData>, xVal: Int, yVal: Int, xMax: Int, yMax: Int, tileType: Int)
        For Local x := xVal + 1 Until xMax
            For Local y := yVal + 1 Until yMax
                tiles.AddLast(New TileData(x, y, tileType))
            End For
        End For
    End Function

    Function CreateRoomZone5: Void(rm: RoomWithDoor, roomType: Int)
        Debug.Log("CREATEROOMZONE5: Placing room " + rm.body.ToString() + " with door " + rm.door.ToString() + " of type " + roomType)

        Select roomType
            Case RoomType.Shop
                Level.CreateRoom(rm.body.x, rm.body.y, rm.body.w, rm.body.h, False, roomType)
                Level.PlaceShopItemsAt(rm.body.x, rm.body.y, rm.door)
            Default
                Level.FillTiles(rm.body, TileType.Floor, TileType.DirtWall)
                Level.FillTiles(rm.door, TileType.Door, TileType.Empty)

                Local doorCenter := rm.door.GetCenter()
                Level.PlaceConnectedWireDoor(doorCenter)
        End Select

        Level.rooms.AddLast(rm.ToRoomData(roomType))
    End Function

    Function CreateRoomZone5: RoomWithDoor(portalSegs: StackEx<PortalSeg>, width: Int, height: Int, minEntryDist: Int)
        Return Level.CreateRoomZone5(portalSegs, width, height, minEntryDist, RoomType.Basic)
    End Function

    Function CreateRoomZone5: RoomWithDoor(portalSegs: StackEx<PortalSeg>, width: Int, height: Int, minEntryDist: Int, roomType: Int)
        portalSegs.Shuffle(True)

        For Local portalSeg := EachIn portalSegs
            Local room := Level.PlaceRoomZone5(portalSeg, width, height, minEntryDist)
            If room <> Null
                Level.CreateRoomZone5(room, roomType)

                Return room
            End If
        End For

        Return Null
    End Function

    Function CreateSwarmMap: Void()
        Level.InitNewMap(True)
        Level.DisableLevelConstraints()

        Level.CreateRoom(-9, -5, 18, 10, False, RoomType.Start, -1, -1, -1, -1, False, TileType.DirtWall, False, True)
        New SwarmSarcophagus(-7, -3)
        New SwarmSarcophagus(-7, -1)
        New SwarmSarcophagus(-7, 1)
        New SwarmSarcophagus(-7, 3)
        New SwarmSarcophagus(7, -3)
        New SwarmSarcophagus(7, -1)
        New SwarmSarcophagus(7, 1)
        New SwarmSarcophagus(7, 3)

        Level.CreateIndestructibleBorder()
    End Function

    Function CreateTestMap: Void()
        Debug.TraceNotImplemented("Level.CreateTestMap()")
    End Function

    Function CreateTrainer: Void()
        Debug.TraceNotImplemented("Level.CreateTrainer()")
    End Function

    Function CreateTrainingMap: Void()
        Debug.TraceNotImplemented("Level.CreateTrainingMap()")
    End Function

    Function CreateTutorialMap: Void()
        Debug.TraceNotImplemented("Level.CreateTutorialMap()")
    End Function

    Function CreateWeaponmaster: Void()
        Debug.TraceNotImplemented("Level.CreateWeaponmaster()")
    End Function

    Function DeleteMap: Void()
        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                tileNode.Value().Die()
            End For
        End For

        Level.minibossFormerWall.Clear()
        Level.tiles.Clear()
        Level.rooms.Clear()
        Trap.trapList.Clear()
        Level.addKeyInSecretChest = False
        Level.startedShrinerFight = False

        For Local i := 0 Until numPlayers
            Local player := players[i]
            If player.characterID <> Character.Melody
                If player.HasItemOfType("weapon_golden_lute", False)
                    player.AddItemOfType("weapon_dagger", Null, True, True)
                End If
            End If

            If player.isHelper
                player.AddItemOfType("weapon_dagger", Null, True, True)
            End If
        End For

        RenderableObject.DeleteAll(True)
        ParticleSystem.systems.Clear()

        For Local i := 0 Until numPlayers
            Local player := players[i]
            player.confusedParticles = Null
        End For

        Level.triggerList.Clear()
        Enemy.enemiesPaused = False
        Enemy.enemiesFearfulDuration = 0
        Level.mapLightValuesInitialized = False
        Level.mapLightValuesCachedFrame = -1
        Level.carveX = -10000
        Level.carveY = -10000
        Level.placedAdditionalRedChest = False
        Level.placedAdditionalWhiteChest = False
        Level.placedAdditionalBlackChest = False
        Level.outsideBossChamber = False
        Level.flawlessVictory = True
        Level.wasMinibossLockedInBattle = False
        Level.transmogrifier = Null
        Level.conjurer = Null
        Level.shriner = Null
        Level.pawnbroker = Null
        Level.shopkeeperFell = False
        Level.enemiesDropSingleCoinForThisLevel = False
        Level.firstRoom = Null
        Level.levelConstraintX = -15
        Level.levelConstraintY = -15
        Level.levelConstraintW = 30
        Level.levelConstraintH = 30
        Level.levelConstraintNum = 0
        Level.exits.Clear()
    End Function

    Function DisableLevelConstraints: Void()
        Level.levelConstraintX = -1000
        Level.levelConstraintY = -1000
        Level.levelConstraintW = 2000
        Level.levelConstraintH = 2000
        Level.levelConstraintNum = 0
    End Function

    Function DistanceFromZone3DividingLine: Float(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.DistanceFromZone3DividingLine(Int, Int)")
    End Function

    Function DoQuickRestart: Void(continuedRun: Bool, showPopups: Bool, playIntroCutscene: Bool)
        Debug.TraceNotImplemented("Level.DoQuickRestart(Bool, Bool, Bool)")
    End Function

    Function DoRestart: Void()
        Debug.TraceNotImplemented("Level.DoRestart()")
    End Function

    Function DoRestart_Common: Void(continuedRun: Bool, cancelFade: Bool)
        Debug.TraceNotImplemented("Level.DoRestart_Common(Bool, Bool)")
    End Function

    Function DoWePlaceAdditionalChestThisLevel: Bool()
        If Level.isHardcoreMode Then Return False

        Select controller_game.currentLevel
            Case 1 Return GameData.GetItemUnlocked("addchest_red",   True) And Not Level.placedAdditionalRedChest
            Case 2 Return GameData.GetItemUnlocked("addchest_white", True) And Not Level.placedAdditionalWhiteChest
            Case 3 Return GameData.GetItemUnlocked("addchest_black", True) And Not Level.placedAdditionalBlackChest
        End Select

        Return False
    End Function

    Function DryUpAllWater: Void(replacementFloor: Int)
        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()

                Local tileType := Level.GetTileTypeAt(tile.x, tile.y)
                Select tileType
                    Case TileType.Water,
                         TileType.DeepWater
                        Level.PlaceTileRemovingExistingTiles(tile.x, tile.y, replacementFloor)
                End Select
            End For
        End For
    End Function

    Function DumpMap: Void()
        Local xMin := 100
        Local yMin := 100
        Local xMax := -100
        Local yMax := -100

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If (-100 <= tile.x And tile.x <= 100) And
                   (-100 <= tile.y And tile.y <= 100)
                    If tile.x <= xMin Then xMin = tile.x
                    If tile.y <= yMin Then yMin = tile.y
                    If tile.x >= xMax Then xMax = tile.x
                    If tile.y >= yMax Then yMax = tile.y
               End If
            End For
        End For

        Debug.WriteLine("DUMPMAP:  ****** Start ******")

        For Local y := yMin To yMax
            Local line := New StringStack()
            For Local x := xMin To xMax
                Local tile: Tile

                If Level.tiles.Contains(x)
                    Local tilesOnX := Level.tiles.Get(x)
                    If tilesOnX.Contains(y)
                        tile = tilesOnX.Get(y)
                    End If
                End If

                Local value := " "
                If tile
                    If tile.GetType() = TileType.Wire
                        value = "w"
                    Else If x = 0 And y = 0
                        value = "s"
                    Else If Level.IsExit(x, y)
                        value = "e"
                    Else If tile.IsFloor()
                        value = "."
                    Else If tile.IsDoor()
                        value = "\"
                    Else If tile.IsWall()
                        If tile.GetType() <> TileType.IndestructibleBorder
                            value = "#"
                        Else
                            value = "X"
                        End If
                    Else
                        value = "?"
                    End If
                End If

                line.Push(value)
            End For

            Debug.WriteLine("DUMPMAP:  " + "".Join(line.ToArray()))
        End For

        Debug.WriteLine("DUMPMAP:  ******* End *******")
    End Function

    Function Earthquake: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.Earthquake(Int, Int)")
    End Function

    Function EnsureBossTraining: Void(name: String)
        Debug.TraceNotImplemented("Level.EnsureBossTraining(String)")
    End Function

    Function FillSecretRooms: Bool()
        Select controller_game.currentZone
            Case 4 Return Level.FillSecretRoomsZone4()
            Case 2 Return Level.FillSecretRoomsZone2()
        End Select

        Return Level.FillSecretRoomsZone1()
    End Function

    Function FillSecretRoomsZone1: Bool()
        Local placeGoldenKey: Bool

        If controller_game.currentZone = 1 And
           controller_game.currentLevel = 2
            If Not GameData.GetNPCUnlock("merlin")
                placeGoldenKey = Not Level.isLevelEditor
            End If
        End If

        If Level.isHardcoreMode Or
           Level.isDDRMode
            placeGoldenKey = False
        End If

        For Local room := EachIn Level.rooms
            If Not Level.IsSecretRoom(room.type) Then Continue

            Local secretRoomVariantRoll := Util.RndIntRangeFromZero(100, True)

            If room.type = RoomType.Vault
                If controller_game.currentLevel = 3
                    Local vaultRoll := Util.RndIntRangeFromZero(5, True)
                    ' TODO: Does the `Continue` only belong to `FillVault`?
                    If vaultRoll = 0
                        Level.FillVault(room)
                    End If

                    Continue
                End If

                New Item(room.x + 2, room.y + 2, "misc_potion", False, -1, False)

                Continue
            End If

            If Level.addKeyInSecretChest
                Local point := Level.GetRandPointInRoomWithOptions(room)
                If point <> Null
                    If Util.IsBomblessCharacterActive()
                        Local numCoinBonusFactor := math.Min(controller_game.currentDepth, 3)
                        Local numCoins := (numCoinBonusFactor * 10) + 15
                        New Item(point.x, point.y, "resource_coin0", False, numCoins, False)

                        Level.addKeyInSecretChest = False
                    Else
                        Local bombRoll := Util.RndIntRangeFromZero(100, True)
                        If bombRoll < 45
                            New Item(point.x, point.y, "bomb_3", False, -1, False)
                        Else
                            New Item(point.x, point.y, "bomb", False, -1, False)
                        End If
                    End If

                    Level.addKeyInSecretChest = False
                End If

                Continue
            End If

            If placeGoldenKey
                If Not Level.isHardcoreMode And
                   Not Level.isDDRMode
                    New Item(room.x + 1, room.y + 1, "misc_golden_key", False, -1, False)
                End If

                placeGoldenKey = False

                Continue
            End If

            If secretRoomVariantRoll <= 4 And
               room.w <= 3 And
               room.h <= 3
                Level.PutCrateOrBarrel(room.x + 1, room.y + 1)
                Level.PutCrateOrBarrel(room.x + 2, room.y + 1)
                Level.PutCrateOrBarrel(room.x + 1, room.y + 2)
                Level.PutCrateOrBarrel(room.x + 2, room.y + 2)

                Continue
            End If

            If secretRoomVariantRoll <= 5 And
               room.w >= 4 And
               room.h >= 4
                Local trapTypeLimitRoll := 2
                If Level.MaybeForbidTrapdoor()
                    trapTypeLimitRoll = 1
                End If

                Local trapTypeRoll := Util.RndIntRangeFromZero(trapTypeLimitRoll, True)
                Select trapTypeRoll
                    Case 0
                        Local bounceTrap1 := New BounceTrap(room.x + 1, room.y + 2, BounceTrapDirection.Right)
                        Local bounceTrap2 := New BounceTrap(room.x + 3, room.y + 2, BounceTrapDirection.Left)
                        Local bounceTrap3 := New BounceTrap(room.x + 2, room.y + 1, BounceTrapDirection.Down)
                        Local bounceTrap4 := New BounceTrap(room.x + 2, room.y + 3, BounceTrapDirection.Up)
                        bounceTrap1.canBeReplacedByTempoTrap = False
                        bounceTrap2.canBeReplacedByTempoTrap = False
                        bounceTrap3.canBeReplacedByTempoTrap = False
                        bounceTrap4.canBeReplacedByTempoTrap = False
                    Case 1
                        New SpikeTrap(room.x + 1, room.y + 2)
                        New SpikeTrap(room.x + 3, room.y + 2)
                        New SpikeTrap(room.x + 2, room.y + 1)
                        New SpikeTrap(room.x + 2, room.y + 3)
                    Default
                        New TrapDoor(room.x + 1, room.y + 2)
                        New TrapDoor(room.x + 3, room.y + 2)
                        New TrapDoor(room.x + 2, room.y + 1)
                        New TrapDoor(room.x + 2, room.y + 3)
                End Select

                Local itemName: String
                If Util.RndIntRangeFromZero(1, True) <> 0
                    Local requestedLevel := controller_game.currentLevel + 1
                    itemName = Item.GetRandomItemInClass("", requestedLevel, "chestChance", Chest.CHEST_COLOR_NONE, False, "", False)
                Else
                    itemName = Level.RandomFood()
                End If

                New Item(room.x + 2, room.y + 2, itemName, False, -1, False)

                Continue
            End If

            If (secretRoomVariantRoll > 50 Or Level.isHardcoreMode) And
               secretRoomVariantRoll > 25
                If (secretRoomVariantRoll <= 60 And Not Level.isHardcoreMode) Or
                   secretRoomVariantRoll <= 45
                    ' TODO: Give a more appropriate name to `i`.
                    Local i := (room.w - 1) * (room.h - 1) - 2

                    ' Place Bounce Traps in 2 corners.
                    If Util.RndBool(True)
                        ' Top left
                        New BounceTrap(room.x + 1, room.y + 1, BounceTrapDirection.None)
                        ' Bottom right
                        New BounceTrap(room.x + room.w - 1, room.y + room.h - 1, BounceTrapDirection.None)
                    Else
                        ' Top right
                        New BounceTrap(room.x + room.w - 1, room.y + 1, BounceTrapDirection.None)
                        ' Bottom left
                        New BounceTrap(room.x + 1, room.y + room.h - 1, BounceTrapDirection.None)
                    End If

                    ' Fill the rest of the room with a variety of Spike Traps, Trap Doors, or Bomb Traps.
                    For i = i - 1 Until 0 Step -1
                        Local point := Level.GetRandPointInRoomWithOptions(room)
                        If point <> Null
                            Local bombTrapRoll := Util.RndIntRangeFromZero(10, True)
                            If bombTrapRoll <> 0
                                If Util.RndBool(True)
                                    New SpikeTrap(point.x, point.y)
                                Else
                                    If Util.RndBool(True) Or
                                       Level.MaybeForbidTrapdoor()
                                        New SpikeTrap(point.x, point.y)
                                    Else
                                        New TrapDoor(point.x, point.y)
                                    End If
                                End If
                            Else
                                New BombTrap(point.x, point.y)
                            End If
                        End If
                    End For

                    Continue
                End If

                If secretRoomVariantRoll <= 80 And
                   controller_game.currentLevel > 2 And
                   Level.AllowSpirit()
                    Local point := Level.GetRandPointInRoomWithOptions(room)
                    If point <> Null
                        Local wraith: Enemy

                        Select controller_game.currentZone
                            Case 5 wraith = New Wraith(point.x, point.y, 2)
                            Case 3 wraith = New Ghast(point.x, point.y, 1)
                            Default wraith = New Wraith(point.x, point.y, 1)
                        End Select

                        wraith.inSecretRoom = True
                    End If

                    Continue
                End If

                Local secretRoomVariantVariantRoll := Util.RndIntRangeFromZero(100, True)
                If secretRoomVariantVariantRoll <= 30
                    Local batLevel := 1

                    Local redBatCaveRoll := Util.RndIntRangeFromZero(4, True)
                    If redBatCaveRoll = 0
                        batLevel = 2

                        Local point := Level.GetRandPointInRoomWithOptions(room)
                        If point <> Null
                            If Not Level.isHardcoreMode Or
                               Level.chestsStillToPlace > 0
                                Level.MakeInvisibleChestAt(point.x, point.y)
                                Level.chestsStillToPlace -= 1
                            End If
                        End If
                    End If

                    Local roomInnerArea := (room.w - 1) * (room.h - 1)
                    For Local i := roomInnerArea Until 0 Step -1
                        Local point := Level.GetRandPointInRoomWithOptions(room)
                        If point <> Null
                            Local bat := New Bat(point.x, point.y, batLevel)
                            bat.inSecretRoom = True
                        End If
                    End For

                    Continue
                End If

                If secretRoomVariantVariantRoll <= 35
                    Local skeletonLevel := 1
                    Local skeletonLevel2Roll := Util.RndIntRangeFromZero(2, True)
                    If skeletonLevel2Roll = 0 Then skeletonLevel = 2
                    Local skeletonLevel3Roll := Util.RndIntRangeFromZero(3, True)
                    If skeletonLevel3Roll = 0 Then skeletonLevel = 3

                    Local roomInnerArea := (room.w - 1) * (room.h - 1)
                    For Local i := roomInnerArea Until 0 Step -1
                        Local point := Level.GetRandPointInRoomWithOptions(room)
                        If point <> Null
                            Local skeleton := New Skeleton(point.x, point.y, skeletonLevel)
                            skeleton.inSecretRoom = True
                        End If
                    End For

                    Continue
                End If

                If secretRoomVariantVariantRoll <= 75
                    Local point := Level.GetRandPointInRoomWithOptions(room)
                    If point <> Null
                        Local secretRoomVariantVariantVariantRoll := Util.RndIntRangeFromZero(100, True)
                        If secretRoomVariantVariantVariantRoll <= 34
                            If Not Util.IsBomblessCharacterActive()
                                New Item(point.x, point.y, "bomb_3", False, -1, False)

                                Continue
                            End If
                        End If

                        If secretRoomVariantVariantVariantRoll >= 80 Or
                           Util.IsBomblessCharacterActive()
                            Local coinBonusFactor := math.Min(controller_game.currentDepth, 3)
                            Local numCoins := (10 * coinBonusFactor) + 15
                            New Item(point.x, point.y, "resource_coin0", False, numCoins, False)

                            Continue
                        End If

                        New Item(point.x, point.y, "bomb", False, -1, False)
                    End If
                End If
            Else
                Local point := Level.GetRandPointInRoomWithOptions(room)
                If point <> Null
                    Local urnRoll := Util.RndIntRangeFromZero(40, True)
                    If urnRoll = 0 And
                       Not Level.placedUrnThisRun
                        New Crate(point.x, point.y, Crate.TYPE_URN, Item.NoItem)
                        Level.placedUrnThisRun = True

                        Continue
                    End If

                    Local chestRoll := Util.RndIntRangeFromZero(4, True)
                    If chestRoll = 0
                        If Level.chestsStillToPlace > 0
                            Level.MakeInvisibleChestAt(point.x, point.y)
                            Level.chestsStillToPlace -= 1
                        End If

                        Continue
                    End If

                    Local placeTrapChestRoll := Util.RndIntRangeFromZero(99, True)
                    Local placeTrapChest := False

                    If (controller_game.currentLevel = 1) And (placeTrapChestRoll <=  3) Then placeTrapChest = True
                    If (controller_game.currentLevel = 2) And (placeTrapChestRoll <=  9) Then placeTrapChest = True
                    If (controller_game.currentLevel = 3) And (placeTrapChestRoll <= 12) Then placeTrapChest = True
                    If (controller_game.currentLevel = 4) And (placeTrapChestRoll <= 15) Then placeTrapChest = True
                    If (controller_game.currentLevel > 4) And (placeTrapChestRoll <= 18) Then placeTrapChest = True

                    If Level.chestsStillToPlace > 0
                        If placeTrapChest
                            Local trapChestLevelRoll := Util.RndIntRangeFromZero(9, True)
                            Local trapChestLevel: Int

                            Select trapChestLevelRoll
                                Case 0  trapChestLevel = 3
                                Case 1  trapChestLevel = 2
                                Default trapChestLevel = 1
                            End Select

                            New TrapChest(point.x, point.y, trapChestLevel)
                        Else
                            New Chest(point.x, point.y, Item.NoItem, False, False, True, Chest.CHEST_COLOR_NONE)
                        End If

                        Level.chestsStillToPlace -= 1
                    End If
                End If
            End If
        End For

        If Level.addKeyInSecretChest
            Debug.Log("FILLSECRETROOMS: Utterly failed to place bomb for locked shop!")
            Return False
        End If

        If placeGoldenKey
            Debug.Log("FILLSECRETROOMS: Failed to place golden key!")
            Return False
        End If

        Return True
    End Function

    Function FillSecretRoomsZone2: Bool()
        Local placeGlassKey: Bool

        If controller_game.currentLevel = 2
            If Not GameData.GetNPCUnlock("diamonddealer")
                placeGlassKey = True
            End If
        End If

        If Level.isHardcoreMode Or
           Level.isDDRMode Or
           Level.isLevelEditor
            placeGlassKey = False
        End If

        For Local room := EachIn Level.rooms
            If Not Level.IsSecretRoom(room.type) Then Continue

            Local secretRoomVariantRoll := Util.RndIntRangeFromZero(100, True)
            If room.type = RoomType.Vault
                If controller_game.currentLevel = 3
                    Local vaultRoll := Util.RndIntRangeFromZero(5, True)
                    If vaultRoll = 0
                        Level.FillVault(room)

                        Continue
                    End If
                End If

                New Item(room.x + 2, room.y + 2, "misc_potion", False, -1, False)

                Continue
            End If

            If Level.addKeyInSecretChest
                Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                If point = Null Then Continue

                If Util.IsBomblessCharacterActive()
                        Local numCoins := Level.GetAppropriateCoins()
                    New Item(point.x, point.y, "resource_coin0", False, numCoins, False)
                Else
                    Local bombRoll := Util.RndIntRangeFromZero(100, True)
                    If bombRoll >= 45
                        New Item(point.x, point.y, "bomb", False, -1, False)
                    Else
                        New Item(point.x, point.y, "bomb_3", False, -1, False)
                    End If
                End If

                Level.addKeyInSecretChest = False

                Continue
            End If

            If placeGlassKey
                ' TODO: Is this check actually needed?
                If Level.isHardcoreMode Or
                   Level.isDDRMode
                    Continue
                End If

                New Item(room.x + 1, room.y + 1, "misc_glass_key", False, -1, False)

                placeGlassKey = False

                Continue
            End If

            If secretRoomVariantRoll <= 4
                If room.w <= 3 And
                   room.h <= 3
                    Level.PutCrateOrBarrel(room.x + 1, room.y + 1)
                    Level.PutCrateOrBarrel(room.x + 2, room.y + 1)
                    Level.PutCrateOrBarrel(room.x + 1, room.y + 2)
                    Level.PutCrateOrBarrel(room.x + 2, room.y + 2)

                    Continue
                End If

                If room.w >= 4 And
                   room.h >= 4
                    Local trapTypeRoll := Util.RndIntRangeFromZero(2, True)
                    Select trapTypeRoll
                        Case 0
                            Local bounceTrapDown := New BounceTrap(room.x + 1, room.y + 2, BounceTrapDirection.Right)
                            bounceTrapDown.canBeReplacedByTempoTrap = False
                            Local bounceTrapLeft := New BounceTrap(room.x + 3, room.y + 2, BounceTrapDirection.Left)
                            bounceTrapLeft.canBeReplacedByTempoTrap = False
                            Local bounceTrapRight := New BounceTrap(room.x + 2, room.y + 1, BounceTrapDirection.Down)
                            bounceTrapRight.canBeReplacedByTempoTrap = False
                            Local bounceTrapUp := New BounceTrap(room.x + 2, room.y + 3, BounceTrapDirection.Up)
                            bounceTrapUp.canBeReplacedByTempoTrap = False
                        Case 1
                            New SpikeTrap(room.x + 1, room.y + 2)
                            New SpikeTrap(room.x + 3, room.y + 2)
                            New SpikeTrap(room.x + 2, room.y + 1)
                            New SpikeTrap(room.x + 2, room.y + 3)
                        Default
                            New TrapDoor(room.x + 1, room.y + 2)
                            New TrapDoor(room.x + 3, room.y + 2)
                            New TrapDoor(room.x + 2, room.y + 1)
                            New TrapDoor(room.x + 2, room.y + 3)
                    End Select

                    Local itemRoll := Util.RndIntRangeFromZero(1, True)
                    If itemRoll = 0
                        Local foodName := Level.RandomFood()
                        New Item(room.x + 2, room.y + 2, foodName, False, -1, False)
                    Else
                        Local requestedLevel := controller_game.currentLevel + 1
                        Local itemName := Item.GetRandomItemInClass("", requestedLevel, "chestChance", Chest.CHEST_COLOR_NONE, False, "", False)
                        New Item(room.x + 2, room.y + 2, itemName, False, -1, False)
                    End If

                    Continue
                End If
            End If

            If (secretRoomVariantRoll > 50 Or Level.isHardcoreMode) And
               secretRoomVariantRoll > 25
                If (secretRoomVariantRoll <= 65 And Not Level.isHardcoreMode) Or
                   secretRoomVariantRoll <= 45
                    Local numTraps := (room.w - 1) * (room.h - 1)
                    numTraps -= 2

                    If Util.RndBool(True)
                        New BounceTrap(room.x + 1, room.y + 1, BounceTrapDirection.None)
                        New BounceTrap(room.x + room.w - 1, room.y + room.h - 1, BounceTrapDirection.None)
                    Else
                        New BounceTrap(room.x + room.w - 1, room.y + 1, BounceTrapDirection.None)
                        New BounceTrap(room.x + 1, room.y + room.h - 1, BounceTrapDirection.None)
                    End If

                    For Local i := numTraps Until 0 Step -1
                        Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                        If point = Null Then Continue

                        Local bombTrapRoll := Util.RndIntRangeFromZero(10, True)
                        If bombTrapRoll = 0
                            New BombTrap(point.x, point.y)
                        Else
                            If Util.RndBool(True)
                                New SpikeTrap(point.x, point.y)
                            Else
                                New TrapDoor(point.x, point.y)
                            End If
                        End If
                    End For

                    Continue
                End If

                If secretRoomVariantRoll <= 80 And
                   controller_game.currentLevel > 2
                   Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                   If point = Null Then Continue

                   Local wight := New Wight(point.x, point.y, 1)
                   wight.inSecretRoom = True

                   Continue
                End If

                If secretRoomVariantRoll <= 95
                    Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                    If point = Null Then Continue

                    Local bombRoll := Util.RndIntRangeFromZero(100, True)
                    If Util.IsBomblessCharacterActive()
                        Local numCoins := Level.GetAppropriateCoins()
                        New Item(point.x, point.y, "resource_coin0", False, numCoins, False)

                        Continue
                    End If

                    If bombRoll < 45
                        New Item(point.x, point.y, "bomb_3", False, -1, False)
                    Else If bombRoll < 80
                        New Item(point.x, point.y, "bomb", False, -1, False)
                    Else
                        Local numCoins := Level.GetAppropriateCoins()
                        New Item(point.x, point.y, "resource_coin0", False, numCoins, False)
                    End If

                    Continue
                End If
            Else
                Local point := Level.GetRandPointInRoomWithOptions(room)
                If point = Null Then Continue

                Local urnRoll := Util.RndIntRangeFromZero(40, True)
                If urnRoll = 0 And
                   Not Level.placedUrnThisRun
                    New Crate(point.x, point.y, Crate.TYPE_URN, Item.NoItem)
                    Level.placedUrnThisRun = True

                    Continue
                End If

                Local invisibleChestRoll := Util.RndIntRangeFromZero(4, True)
                If invisibleChestRoll = 0
                    If Level.chestsStillToPlace > 0
                        Level.MakeInvisibleChestAt(point.x, point.y)
                        Level.chestsStillToPlace -= 1
                    End If

                    Continue
                End If

                Local trapChestRoll := Util.RndIntRangeFromZero(99, True)
                Local placeTrapChest := False
                Select controller_game.currentLevel
                    Case 1 If trapChestRoll <= 3 Then placeTrapChest = True
                    Case 2 If trapChestRoll <= 9 Then placeTrapChest = True
                    Case 3 If trapChestRoll <= 12 Then placeTrapChest = True
                    Case 4 If trapChestRoll <= 15 Then placeTrapChest = True
                    Default
                        If controller_game.currentLevel > 4
                            If trapChestRoll <= 18 Then placeTrapChest = True
                        End If
                End Select

                If Level.chestsStillToPlace <= 0 Then Continue

                If placeTrapChest
                    Local trapChestLevelRoll := Util.RndIntRangeFromZero(9, True)
                    Local trapChestLevel: Int
                    Select trapChestLevelRoll
                        Case 0 trapChestLevel = 3
                        Case 0 trapChestLevel = 2
                        Default trapChestLevel = 1
                    End Select

                    Local trapChest := New TrapChest(point.x, point.y, trapChestLevel)
                    trapChest.inSecretRoom = True
                Else
                    New Chest(point.x, point.y, Item.NoItem, False, False, True, Chest.CHEST_COLOR_NONE)
                End If

                Level.chestsStillToPlace -= 1
            End If
        End For

        If Level.addKeyInSecretChest
            Debug.Log("FILLSECRETROOMS: Utterly failed to place bomb for 'locked' shop!")
        End If

        If placeGlassKey
            Debug.Log("FILLSECRETROOMS: Failed to place NPC!")
        End If

        Return Not Level.addKeyInSecretChest And
               Not placeGlassKey
    End Function

    Function FillSecretRoomsZone4: Bool()
        For Local room := EachIn Level.rooms
            If Not Level.IsSecretRoom(room.type) Then Continue

            Local secretRoomVariantRoll := Util.RndIntRangeFromZero(100, True)
            If room.type = RoomType.Vault
                Level.CreateRoom(room.x, room.y, room.w, room.h, False, RoomType.Vault, -1, -1, -1, -1, False, TileType.StoneWall, True, True)

                Select controller_game.currentLevel
                    Case 2,
                         3
                        Local vaultRoll := Util.RndIntRangeFromZero(5, True)
                        If vaultRoll = 0
                            Level.FillVault(room)

                            Continue
                        End If
                End Select

                New Item(room.x + 2, room.y + 2, "misc_potion", False, -1, False)

                Continue
            End If

            If Level.addKeyInSecretChest
                Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                If point = Null Then Continue

                If Util.IsBomblessCharacterActive()
                    Local numCoins := Level.GetAppropriateCoins()
                    New Item(point.x, point.y, "resource_coin0", False, numCoins, False)
                Else
                    Local bombRoll := Util.RndIntRangeFromZero(100, True)
                    If bombRoll >= 45
                        New Item(point.x, point.y, "bomb", False, -1, False)
                    Else
                        New Item(point.x, point.y, "bomb_3", False, -1, False)
                    End If
                End If

                Level.addKeyInSecretChest = False

                Continue
            End If

            If secretRoomVariantRoll <= 4
                If room.w <= 3 And
                   room.h <= 3
                    Level.PutCrateOrBarrel(room.x + 1, room.y + 1)
                    Level.PutCrateOrBarrel(room.x + 2, room.y + 1)
                    Level.PutCrateOrBarrel(room.x + 1, room.y + 2)
                    Level.PutCrateOrBarrel(room.x + 2, room.y + 2)

                    Continue
                End If
            End If

            If secretRoomVariantRoll <= 5
                If room.w >= 4 And
                   room.h >= 4
                    Local trapTypeRoll := Util.RndIntRangeFromZero(2, True)
                    Select trapTypeRoll
                        Case 0
                            Local bounceTrapDown := New BounceTrap(room.x + 1, room.y + 2, BounceTrapDirection.Right)
                            bounceTrapDown.canBeReplacedByTempoTrap = False
                            Local bounceTrapLeft := New BounceTrap(room.x + 3, room.y + 2, BounceTrapDirection.Left)
                            bounceTrapLeft.canBeReplacedByTempoTrap = False
                            Local bounceTrapRight := New BounceTrap(room.x + 2, room.y + 1, BounceTrapDirection.Down)
                            bounceTrapRight.canBeReplacedByTempoTrap = False
                            Local bounceTrapUp := New BounceTrap(room.x + 2, room.y + 3, BounceTrapDirection.Up)
                            bounceTrapUp.canBeReplacedByTempoTrap = False
                        Case 1
                            New SpikeTrap(room.x + 1, room.y + 2)
                            New SpikeTrap(room.x + 3, room.y + 2)
                            New SpikeTrap(room.x + 2, room.y + 1)
                            New SpikeTrap(room.x + 2, room.y + 3)
                        Default
                            New TrapDoor(room.x + 1, room.y + 2)
                            New TrapDoor(room.x + 3, room.y + 2)
                            New TrapDoor(room.x + 2, room.y + 1)
                            New TrapDoor(room.x + 2, room.y + 3)
                    End Select

                    Local itemRoll := Util.RndIntRangeFromZero(1, True)
                    If itemRoll = 0
                        Local foodName := Level.RandomFood()
                        New Item(room.x + 2, room.y + 2, foodName, False, -1, False)
                    Else
                        Local requestedLevel := controller_game.currentLevel + 1
                        Local itemName := Item.GetRandomItemInClass("", requestedLevel, "chestChance", Chest.CHEST_COLOR_NONE, False, "", False)
                        New Item(room.x + 2, room.y + 2, itemName, False, -1, False)
                    End If

                    Continue
                End If
            End If

            If (secretRoomVariantRoll > 50 Or Level.isHardcoreMode) And
               secretRoomVariantRoll > 25
                If (secretRoomVariantRoll <= 65 And Not Level.isHardcoreMode) Or
                   secretRoomVariantRoll <= 45
                    Local numTraps := (room.w - 1) * (room.h - 1)
                    numTraps -= 2

                    If Util.RndBool(True)
                        New BounceTrap(room.x + 1, room.y + 1, BounceTrapDirection.None)
                        New BounceTrap(room.x + room.w - 1, room.y + room.h - 1, BounceTrapDirection.None)
                    Else
                        New BounceTrap(room.x + room.w - 1, room.y + 1, BounceTrapDirection.None)
                        New BounceTrap(room.x + 1, room.y + room.h - 1, BounceTrapDirection.None)
                    End If

                    For Local i := numTraps Until 0 Step -1
                        Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                        If point = Null Then Continue

                        Local bombTrapRoll := Util.RndIntRangeFromZero(10, True)
                        If bombTrapRoll = 0
                            New BombTrap(point.x, point.y)
                        Else
                            If Util.RndBool(True)
                                New SpikeTrap(point.x, point.y)
                            Else
                                New TrapDoor(point.x, point.y)
                            End If
                        End If
                    End For

                    Continue
                End If

                If secretRoomVariantRoll <= 80 And
                   controller_game.currentLevel > 2 And
                   Level.AllowSpirit()
                    Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                    If point = Null Then Continue

                    Local poltergeist := New Poltergeist(point.x, point.y, 1)
                    poltergeist.inSecretRoom = True

                    Continue
                End If

                Local secretRoomVariantVariantRoll := Util.RndIntRangeFromZero(100, True)
                If secretRoomVariantVariantRoll <= 30
                    Local batLevel := 1
                    Local invisibleChestRoll := Util.RndIntRangeFromZero(4, True)
                    If invisibleChestRoll = 0
                        batLevel = 4

                        Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                        If point <> Null
                            If Not Level.isHardcoreMode Or
                               Level.chestsStillToPlace > 0
                                Level.MakeInvisibleChestAt(point.x, point.y)
                                Level.chestsStillToPlace -= 1
                            End If
                        End If
                    End If

                    Local numBats := (room.w - 1) * (room.h - 1)
                    For numBats = numBats Until 0 Step -1
                        Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                        If point = Null Then Continue

                        Local bat := New Bat(point.x, point.y, batLevel)
                        bat.inSecretRoom = True
                    End For

                    Continue
                End If

                If secretRoomVariantVariantRoll <= 35
                    Local skeletonLevel := 1
                    Local skeletonLevel2Roll := Util.RndIntRangeFromZero(2, True)
                    If skeletonLevel2Roll = 0 Then skeletonLevel = 2
                    Local skeletonLevel3Roll := Util.RndIntRangeFromZero(3, True)
                    If skeletonLevel3Roll = 0 Then skeletonLevel = 3

                    Local numSkeletons := (room.w - 1) * (room.h - 1)
                    For numSkeletons = numSkeletons Until 0 Step -1
                        Local point := Level.GetRandPointInRoomWithOptions(room)
                        If point = Null Then Continue

                        Local skeleton := New Skeleton(point.x, point.y, skeletonLevel)
                        skeleton.inSecretRoom = True
                    End For

                    Continue
                End If

                If secretRoomVariantVariantRoll <= 75
                    Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                    If point = Null Then Continue

                    Local secretRoomVariantVariantVariantRoll := Util.RndIntRangeFromZero(100, True)
                    If secretRoomVariantVariantVariantRoll <= 34
                        If Not Util.IsBomblessCharacterActive()
                            New Item(point.x, point.y, "bomb_3", False, -1, False)

                            Continue
                        End If
                    End If

                    If secretRoomVariantVariantVariantRoll >= 80 Or
                       Util.IsBomblessCharacterActive()
                        Local numCoins := Level.GetAppropriateCoins()
                        New Item(point.x, point.y, "resource_coin0", False, numCoins, False)

                        Continue
                    End If

                    New Item(point.x, point.y, "bomb", False, -1, False)
                End If
            Else
                Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True)
                If point = Null Then Continue

                Local urnRoll := Util.RndIntRangeFromZero(40, True)
                If urnRoll = 0 And
                   Not Level.placedUrnThisRun
                    New Crate(point.x, point.y, Crate.TYPE_URN, Item.NoItem)
                    Level.placedUrnThisRun = True

                    Continue
                End If

                Local chestRoll := Util.RndIntRangeFromZero(4, True)
                If chestRoll = 0
                    If Level.chestsStillToPlace > 0
                        Level.MakeInvisibleChestAt(point.x, point.y)
                        Level.chestsStillToPlace -= 1
                    End If

                    Continue
                End If

                Local placeTrapChestRoll := Util.RndIntRangeFromZero(99, True)
                Local placeTrapChest := False

                Select controller_game.currentLevel
                    Case 1 If placeTrapChestRoll <=  3 Then placeTrapChest = True
                    Case 2 If placeTrapChestRoll <=  9 Then placeTrapChest = True
                    Case 3 If placeTrapChestRoll <= 12 Then placeTrapChest = True
                    Case 4 If placeTrapChestRoll <= 15 Then placeTrapChest = True
                    Default
                        If controller_game.currentLevel > 4
                            If placeTrapChestRoll <= 18 Then placeTrapChest = True
                        End If
                End Select

                If Level.chestsStillToPlace > 0
                    If placeTrapChest
                        Local trapChestLevelRoll := Util.RndIntRangeFromZero(9, True)
                        Local trapChestLevel: Int

                        Select trapChestLevelRoll
                            Case 0  trapChestLevel = 3
                            Case 1  trapChestLevel = 2
                            Default trapChestLevel = 1
                        End Select

                        Local trapChest := New TrapChest(point.x, point.y, trapChestLevel)
                        trapChest.inSecretRoom = True
                    Else
                        New Chest(point.x, point.y, Item.NoItem, False, False, True, Chest.CHEST_COLOR_NONE)
                    End If

                    Level.chestsStillToPlace -= 1
                End If
            End If
        End For

        Return True
    End Function

    Function FillTiles: Void(rect: Rect, tileType: Int, tileTypeEdge: Int)
        If tileTypeEdge = TileType.Empty
            tileTypeEdge = tileType
        End If

        Local xMin := rect.x
        Local xMax := rect.GetRight()
        Local yMin := rect.y
        Local yMax := rect.GetBottom()

        For Local x := xMin To xMax
            For Local y := yMin To yMax
                If x = xMin Or
                   x = xMax Or
                   y = yMin Or
                   y = yMax
                    Level.PlaceTileRemovingExistingTiles(x, y, tileTypeEdge)
                Else
                    Level.PlaceTileRemovingExistingTiles(x, y, tileType)
                End If
            End For
        End For
    End Function

    Function FillVault: Void(tmpRoom: RoomData)
        Debug.TraceNotImplemented("Level.FillVault(RoomData)")
    End Function

    Function FindTileOfType: Point(tileType: Int)
        Return Level.FindTileOfType(tileType, True)
    End Function

    Function FindTileOfType: Point(tileType: Int, ignoreCrackedWalls: Bool)
        While True
            Local tilesOnXNode: map.Node<Int, IntMap<Tile>>
            Local i := Util.RndIntRangeFromZero(Level.tiles.Count() - 1, True)
            For tilesOnXNode = EachIn Level.tiles
                If i = 0 Then Exit

                i -= 1
            End For
            Local tilesOnX := tilesOnXNode.Value()

            Local tileNode: map.Node<Int, Tile>
            Local j := Util.RndIntRangeFromZero(tilesOnX.Count() - 1, True)
            For tileNode = EachIn tilesOnX
                If j = 0 Then Exit

                j -= 1
            End For
            Local tile := tileNode.Value()

            If Not ignoreCrackedWalls Or
               Not tile.isCracked
                If (tileType = TileType.Unknown98 And tile.IsWall(True, False, False, False)) Or
                   (tileType = tile.GetType())
                    Local x := tilesOnXNode.Key()
                    Local y := tileNode.Key()

                    Return New Point(x, y)
                End If
            End If
        End While
    End Function

    Function FreezeTilesNear: Void(xVal: Int, yVal: Int, allTiles: Bool)
        Debug.TraceNotImplemented("Level.FreezeTilesNear(Int, Int, Bool)")
    End Function

    Function GenerateHardcoreZoneOrder: Void()
        Local randomZones := New StackEx<Int>()
        randomZones.Push(1)
        randomZones.Push(2)
        randomZones.Push(3)
        randomZones.Push(4)
        randomZones.Push(5)
        randomZones.Shuffle(True)
        While randomZones.Length() > 5
            randomZones.Pop()
        End While

        Local zones := New Stack<Int>()
        zones.Push(1)
        zones.Push(2)
        zones.Push(3)
        zones.Push(4)
        zones.Push(5)

        Level.zoneOrder = New Stack<Int>()

        For Local zone := EachIn zones
            If randomZones.Contains(zone)
                Level.zoneOrder.Push(zone)
            End If
        End For

        If Util.IsCharacterActive(Character.Aria)
            Local ariaZoneOrder := New Stack<Int>()

            For Local zone := EachIn Level.zoneOrder.Backwards()
                ariaZoneOrder.Push(zone)
            End For

            Level.zoneOrder = ariaZoneOrder
        End If
    End Function

    Function GenerateJanitorItems: Void()
        Debug.TraceNotImplemented("Level.GenerateJanitorItems()")
    End Function

    Function GetAdjustedZoneForAllChars: Int()
        Debug.TraceNotImplemented("Level.GetAdjustedZoneForAllChars()")
    End Function

    Function GetAdjustedZoneForAllCharsDLC: Int()
        Debug.TraceNotImplemented("Level.GetAdjustedZoneForAllCharsDLC()")
    End Function

    Function GetAdjustedZoneForStoryMode: Int()
        Debug.TraceNotImplemented("Level.GetAdjustedZoneForStoryMode()")
    End Function

    Function GetAppropriateCoins: Int()
        Local numCoinBonusFactor := math.Min(3, controller_game.currentDepth)

        Return (numCoinBonusFactor * 10) + 15
    End Function

    Function GetDistanceToNearestTorch: Float(r: RenderableObject)
        Local distance := 10000000.0
        Local from := r.GetLocation()

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.HasTorch()
                    Local tileX := tilesOnXNode.Key()
                    Local tileY := tileNode.Key()

                    distance = math.Min(distance, Util.GetDist(from.x, from.y, tileX, tileY))
                End If
            End For
        End For

        Return distance
    End Function

    Function GetExitValue: Point(xVal: Int, yVal: Int)
        For Local node := EachIn Level.exits
            Local ex := node.Key
            If ex.x = xVal And
               ex.y = yVal
                Return node.Value
            End If
        End For

        Return New Point(-4, -4)
    End Function

    Function GetExtraEnemiesBase: Int()
        Local extraEnemies := 0

        If Player.DoesAnyPlayerHaveItemOfType("ring_war", False) And Level.randSeed = -1
            extraEnemies = 1
        End If

        If Level.isHardcoreMode
            extraEnemies += 1
        End If

        Return extraEnemies + Level.GetHardModeExtraEnemies()
    End Function

    Function GetHardModeExtraEnemies: Int()
        If Level.isHardMode Or
           Util.IsCharacterActive(Character.Tempo)
            Local hardModeXML := Level.GetHardModeXML()

            Return item.GetInt(hardModeXML, "extraEnemiesPerRoom", 0)
        End If

        Return
    End Function

    Function GetHardModeXML: JsonObject()
        Debug.TraceNotImplemented("Level.GetHardModeXML()")
    End Function

    Function GetInitialZone: Int()
        Debug.TraceNotImplemented("Level.GetInitialZone()")
    End Function

    Function GetMapTileLightValue: Float(xVal: Int, yVal: Int, forVision: Bool)
        Debug.TraceNotImplemented("Level.GetMapTileLightValue(Int, Int, Bool)")
    End Function

    Function GetMaxDepth: Int()
        Return 5
    End Function

    Function GetNPCSaleItem: Int(npcNum: Int, slotNum: Int, exclude1: String, exclude2: String)
        Debug.TraceNotImplemented("Level.GetNPCSaleItem(Int, Int, String, String)")
    End Function

    Function GetRandomOffsetPoint: Point()
        Local x := 0
        Local y := 0

        If Util.RndIntRangeFromZero(1, True) <> 0
            If Util.RndIntRangeFromZero(1, True) <> 0
                x = 1
            Else
                x = -1
            End If
        Else
            If Util.RndIntRangeFromZero(1, True) <> 0
                y = 1
            Else
                y = -1
            End If
        End If

        Return New Point(x, y)
    End Function

    Function GetRandomWallInRoom: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Local point := New Point(0, 0)

        For Local i := 500 Until 0 Step -1
            Select Util.RndIntRangeFromZero(3, True)
                ' Left wall
                Case 0
                    point.x = xVal
                    point.y = yVal + Util.RndIntRangeFromZero(hVal - 1, True)
                ' Right wall
                Case 1
                    point.x = xVal + wVal
                    point.y = yVal + Util.RndIntRangeFromZero(hVal - 1, True)
                ' Top wall
                Case 2
                    point.x = xVal + Util.RndIntRangeFromZero(wVal - 1, True)
                    point.y = yVal
                ' Bottom wall
                Default
                    point.x = xVal + Util.RndIntRangeFromZero(wVal - 1, True)
                    point.y = yVal + hVal
            End Select

            If Level.IsWallAt(point.x, point.y, False, False) Then Exit
        End For

        Return point
    End Function

    Function GetRandPointInRoomOfTileType: Point(room: RoomBase, tileType: Int, skipCollisions: Bool)
        Local i := 200
        For i = i - 1 Until 0 Step -1
            Local point := room.GetRandPoint()
            Local tile := Level.GetTileAt(point.x, point.y)
            Local tileTypeAtPoint := TileType.Empty
            If tile <> Null
                tileTypeAtPoint = tile.GetType()
            End If

            If tileTypeAtPoint = tileType
                If Not skipCollisions Or
                   (Not Util.IsGlobalCollisionAt(point.x, point.y, False, False, False, False) And
                    Enemy.GetEnemyAt(point.x, point.y, True) = Null)
                    Return point
                End If
            End If
        End For

        Return Null
    End Function

    Function GetRandPointInRoomOfTileType: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, tileType: Int, skipCollisions: Bool)
        Debug.TraceNotImplemented("Level.GetRandPointInRoomOfTileType(Int, Int, Int, Int, Int, Bool)")
    End Function

    Function GetRandPointInRoomWithOptions: Point(room: RoomData)
        Return Level.GetRandPointInRoomWithOptions(room, True, True, True)
    End Function

    Function GetRandPointInRoomWithOptions: Point(room: RoomData, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Return Level.GetRandPointInRoomWithOptions(room.x, room.y, room.w, room.h, skipWater, nearWallIsOk, secretRoomOK)
    End Function

    Function GetRandPointInRoomWithOptions: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Return Level.GetRandPointInRoomWithOptions(xVal, yVal, wVal, hVal, True, True, True, skipWater, nearWallIsOk, secretRoomOK)
    End Function

    Function GetRandPointInRoomWithOptions: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, skipCollisions: Bool, skipExit: Bool, skipTraps: Bool, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Local body := New Rect(xVal, yVal, wVal, hVal)
        Local room := New RectRoom(body)

        Return Level.GetRandPointInRoomWithOptions(room, skipCollisions, skipExit, skipTraps, skipWater, nearWallIsOk, secretRoomOK)
    End Function

    Function GetRandPointInRoomWithOptions: Point(room: RoomBase, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Return Level.GetRandPointInRoomWithOptions(room, True, True, True, skipWater, nearWallIsOk, secretRoomOK)
    End Function

    Function GetRandPointInRoomWithOptions: Point(room: RoomBase, skipCollisions: Bool, skipExit: Bool, skipTraps: Bool, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Local pointsTested := New IntPointSet()

        Local i := 1000
        For i = i - 1 Until 0 Step -1
            Local point := room.GetRandPoint()
            If pointsTested.Contains(point) Then Continue

            pointsTested.Insert(point)

            Local x := point.x
            Local y := point.y

            If skipCollisions
                If Util.IsGlobalCollisionAt(x, y, False, False, False, False, False) Then Continue
                If Enemy.GetEnemyAt(x, y, True) <> Null Then Continue
            End If

            If skipExit
                If Level.GetExitValue(x, y).x <> -4 Then Continue
            End If

            If skipTraps
                If Trap.GetTrapAt(x, y) <> Null Then Continue
            End If

            If skipWater
                Select Level.GetTileTypeAt(x, y)
                    Case TileType.Water,
                         TileType.Tar,
                         TileType.DeepWater
                        Continue
                End Select
            End If

            If Not nearWallIsOk
                If Level.IsWallAdjacent8(x, y) Then Continue
            End If

            If Not secretRoomOK
                If Level.GetTileTypeAt(x, y) = TileType.SecretFloor Then Continue
            End If

            Return point
        End For
    End Function

    Function GetShrinePoint: Point()
        For Local i := 50 Until 0 Step -1
            Local roomIndex := Util.RndIntRangeFromZero(Level.rooms.Count() - 1, True)
            Local roomsArray := Level.rooms.ToArray()
            Local room := roomsArray[roomIndex]

            Select room.type
                Case RoomType.Shop,
                     RoomType.Start,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            If room.hasExit Then Continue

            Local point := Level.GetRandPointInRoomWithOptions(room.x + 1, room.y + 1, room.w -2, room.h - 2, True, True, False)
            If point = Null Then Continue

            If Item.GetPickupAt(point.x, point.y, Null) <> Null Then Continue

            If Not Level.IsFloorAt(point.x - 1, point.y + 1) Then Continue
            If ToughSarcophagus(Enemy.GetEnemyAt(point.x - 1, point.y + 1, True)) <> Null Then Continue
            If Not Level.IsFloorAt(point.x + 0, point.y + 1) Then Continue
            If ToughSarcophagus(Enemy.GetEnemyAt(point.x + 0, point.y + 1, True)) <> Null Then Continue
            If Not Level.IsFloorAt(point.x + 1, point.y + 1) Then Continue
            If ToughSarcophagus(Enemy.GetEnemyAt(point.x + 1, point.y + 1, True)) <> Null Then Continue

            Return point
        End For

        Return Null
    End Function

    Function GetSingleZoneModeFinalBossZone: Int()
        If Util.IsCharacterActive(Character.Aria) Then Return 1
        If Util.IsCharacterActive(Character.Nocturna) Then Return 5

        Return 4
    End Function

    Function GetStandardExitCoords: Point()
        For Local ex := EachIn Level.exits
            Local exitValue := ex.Value()
            Select exitValue.x
                Case LevelType.NextLevel,
                     LevelType.LockedExit1
                    Return ex.Key()
            End Select
        End For

        Return Null
    End Function

    Function GetTileAt: Tile(xVal: Int, yVal: Int)
        If Level.tiles.Contains(xVal)
            Local tilesOnX := Level.tiles.Get(xVal)
            If tilesOnX.Contains(yVal)
                Return tilesOnX.Get(yVal)
            End If
        End If

        Return Null
    End Function

    Function GetTileFlyawayAt: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.GetTileFlyawayAt(Int, Int)")
    End Function

    Function GetTileObstructionList: Object(includeOffscreen: Bool)
        Debug.TraceNotImplemented("Level.GetTileObstructionList(Bool)")
    End Function

    Function GetTileTypeAt: Int(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)
        If tile <> Null Then Return tile.GetType()

        Return TileType.Empty
    End Function

    Function GetZone3BeetleType: Int(xVal: Int, yVal: Int)
        If ((yVal * Level.zone3DividingLineX) - (xVal * Level.zone3DividingLineY)) > 0.0
            Return 210
        End If

        Return 209
    End Function

    Function GetZone3ElementalType: Int(xVal: Int, yVal: Int)
        If ((yVal * Level.zone3DividingLineX) - (xVal * Level.zone3DividingLineY)) > 0.0
            Return 206
        End If

        Return 205
    End Function

    Function GetZone3YetiHellhoundType: Int(xVal: Int, yVal: Int)
        If ((yVal * Level.zone3DividingLineX) - (xVal * Level.zone3DividingLineY)) > 0.0
            Return 213
        End If

        Return 211
    End Function

    Function HaveFinalBoss: Bool()
        Return Util.IsCharacterActive(Character.Aria) Or
               Util.IsCharacterActive(Character.Melody) Or
               Util.IsCharacterActive(Character.Cadence) Or
               Util.IsCharacterActive(Character.Nocturna)
    End Function

    Function InitNewMap: Void(saveGameData: Bool)
        If saveGameData Then GameData.Save()

        Camera.x = 0.0
        Camera.y = 0.0
        Camera.seekX = 0.0
        Camera.seekY = 0.0
        Camera.fadeInDuration = necrodancergame.FRAMES_PER_SEC
        Camera.fadeInCurrent = necrodancergame.FRAMES_PER_SEC
        Camera.fixed = False

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            player.ResetStateAfterLevel()
        End For

        Input.ResetMovementCounters()

        If controller_game.controllerGamePointer Then controller_game.controllerGamePointer.ResetPostDeathReplay()

        Debug.Log("INITNEWMAP: Deleting previous map")
        Level.DeleteMap()

        Level.isAnyTar = False
        Level.isConductorLevel = False
        Level.levelJustStarted = True
    End Function

    Function IsAnyPlayerWithinShop: Bool()
        Debug.TraceNotImplemented("Level.IsAnyPlayerWithinShop()")
    End Function

    Function IsAnyWallAt: Bool(r: Rect)
        Debug.TraceNotImplemented("Level.IsAnyWallAt(Rect)")
    End Function

    Function IsAnyWaterAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsAnyWaterAt(Int, Int)")
    End Function

    Function IsBossLevel: Bool()
        Debug.TraceNotImplemented("Level.IsBossLevel()")
    End Function

    Function IsCorridorFloorAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsCorridorFloorAt(Int, Int)")
    End Function

    Function IsCorridorFloorOrDoorAdjacent: Bool(xVal: Int, yVal: Int)
        Return Level.IsTileTypeAdjacent(xVal, yVal, TileType.CorridorFloor) Or
               Level.IsTileTypeAdjacent(xVal, yVal, TileType.Door) Or
               Level.IsTileTypeAdjacent(xVal, yVal, TileType.MetalDoor) Or
               Level.IsTileTypeAdjacent(xVal, yVal, TileType.LockedDoor) Or
               Level.IsTileTypeAdjacent(xVal, yVal, TileType.WiredDoor)
    End Function

    Function IsCorridorOrRoomWallAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsWall(False, True, False, False)
    End Function

    Function IsCrackedWallAdjacent: Bool(xVal: Int, yVal: Int)
        For Local x := xVal - 1 To xVal + 1
            For Local y := yVal - 1 To yVal + 1
                If (x = xVal) And (y = yVal) Then Continue

                If Level.IsCrackedWallAt(x, y) Then Return True
            End For
        End For

        Return False
    End Function

    Function IsCrackedWallAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.isCracked
    End Function

    Function IsDoorAdjacent: Bool(x: Int, y: Int)
        Local center := New Point(x, y)

        For Local i := 0 To 3
            Local offset := Util.GetPointFromDir(i)
            Local adjacent := center.Add(offset)

            If Level.IsDoorAt(adjacent.x, adjacent.y) Then Return True
        End For

        Return False
    End Function

    Function IsDoorAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsDoor()
    End Function

    Function IsExit: Bool(xVal: Int, yVal: Int)
        Return Level.GetExitValue(xVal, yVal).x <> -4
    End Function

    Function IsExitAt: Bool(x: Int, y: Int)
        Local tile := Level.GetTileAt(x, y)

        Return tile And tile.IsExit()
    End Function

    Function IsFinalBoss: Bool()
        Select controller_game.currentLevel
            Case LevelType.TrainingFinalBossBattleNecroDancer,
                 LevelType.TrainingFinalBossBattleNecroDancer2,
                 LevelType.TrainingFinalBossBattleLute,
                 LevelType.TrainingFinalBossBattleConductor,
                 LevelType.FinalBossBattle
                Return True
        End Select

        Return False
    End Function

    Function IsFinalBossZone: Bool()
        If Level.isHardcoreMode
            Local maxDepth := Level.GetMaxDepth()

            Return controller_game.currentDepth = maxDepth
        End If

        Local maxZone = Level.GetSingleZoneModeFinalBossZone()

        Return controller_game.currentZone = maxZone
    End Function

    Function IsFloorAdjacent: Bool(xVal: Int, yVal: Int)
        If Level.IsFloorAt(xVal - 1, yVal) Then Return True
        If Level.IsFloorAt(xVal + 1, yVal) Then Return True
        If Level.IsFloorAt(xVal, yVal - 1) Then Return True
        If Level.IsFloorAt(xVal, yVal + 1) Then Return True

        Return False
    End Function

    Function IsFloorAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsFloor()
    End Function

    Function IsFreeLevelForSpecialRoom: Bool(tempLevel: Int, tempDepth: Int)
        Return Not ((tempLevel = -1 Or tempDepth = -1) Or
                    (tempLevel = Level.placeBloodShopOnLevel And tempDepth = Level.placeBloodShopOnDepth) Or
                    (tempLevel = Level.placeFoodShopOnLevel And tempDepth = Level.placeFoodShopOnDepth) Or
                    (tempLevel = Level.placeGlassShopOnLevel And tempDepth = Level.placeGlassShopOnDepth) Or
                    (tempLevel = Level.placeArenaOnLevel And tempDepth = Level.placeArenaOnDepth) Or
                    (tempLevel = Level.placeTransmogrifierOnLevel And tempDepth = Level.placeTransmogrifierOnDepth) Or
                    (tempLevel = Level.placeConjurerOnLevel And tempDepth = Level.placeConjurerOnDepth) Or
                    (tempLevel = Level.placeShrinerOnLevel And tempDepth = Level.placeShrinerOnDepth) Or
                    (tempLevel = Level.placePawnbrokerOnLevel And tempDepth = Level.placePawnbrokerOnDepth))
    End Function

    Function IsHotCoalAt: Bool(xVal: Int, yVal: Int)
        Return Level.GetTileTypeAt(xVal, yVal) = TileType.HotCoal
    End Function

    Function IsIceAt: Bool(xVal: Int, yVal: Int)
        Return Level.GetTileTypeAt(xVal, yVal) = TileType.Ice
    End Function

    Function IsIcePartOfLevel: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsIcePartOfLevel(Int, Int)")
    End Function

    Function IsInZone3Hot: Bool(xVal: Int, yVal: Int)
        Return (yVal * Level.zone3DividingLineX) - (xVal * Level.zone3DividingLineY) <= 0
    End Function

    Function IsLockedExit: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsLockedExit(Int, Int)")
    End Function

    Function IsNormalFloorAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsNormalFloor()
    End Function

    Function IsPassable: Bool()
        Local points := New IntPointList()
        Local visitedPoints := New IntPointSet()
        Local startPoint := New Point(0, 0)

        points.AddLast(startPoint)
        visitedPoints.Insert(startPoint)

        While Not points.IsEmpty()
            Local point := points.RemoveFirst()

            For Local dir := 0 To 3
                Local offset := Util.GetPointFromDir(dir)
                Local nextPoint := point.Add(offset)
                Local x := nextPoint.x
                Local y := nextPoint.y

                If Not visitedPoints.Contains(nextPoint)
                    If Level.IsExit(x, y) Then Return True

                    Local tile := Level.GetTileAt(x, y)
                    If tile <> Null
                        If tile.IsFloor() Or
                           tile.type = TileType.DirtWall Or
                           tile.type = TileType.CorridorDirtWall Or
                           tile.IsDoor()
                            If Trap.GetTrapAt(x, y) <> Null Then Continue
                            If Shrine.GetShrineAt(x, y) <> Null Then Continue

                            points.AddLast(nextPoint)
                            visitedPoints.Insert(nextPoint)
                        End If
                    End If
                End If
            End For
        End While

        Return False
    End Function

    Function IsPeaceful: Bool()
        Debug.TraceNotImplemented("Level.IsPeaceful()")
    End Function

    Function IsSecretRoom: Bool(rmType: Int)
        Select rmType
            Case RoomType.Secret,
                 RoomType.Vault
                Return True
        End Select

        Return False
    End Function

    Function IsSeededMode: Bool(mode: Int)
        Debug.TraceNotImplemented("Level.IsSeededMode(Int)")
    End Function

    Function IsSurroundedByDestructibleWalls: Bool(xVal: Int, yVal: Int)
        For Local x := xVal - 1 To xVal + 1
            For Local y := yVal - 1 To yVal + 1
                ' Also checks (xVal, yVal)
                If Not Level.IsWallAt(x, y, True, False) Then Return False
            End For
        End For

        Return True
    End Function

    Function IsTileEmpty: Bool(xVal: Int, yVal: Int)
        Return Level.GetTileTypeAt(xVal, yVal) = TileType.Empty
    End Function

    Function IsTileTypeAdjacent: Bool(xVal: Int, yVal: Int, tempType: Int)
        Return Level.GetTileTypeAt(xVal - 1, yVal) = tempType Or
               Level.GetTileTypeAt(xVal + 1, yVal) = tempType Or
               Level.GetTileTypeAt(xVal, yVal - 1) = tempType Or
               Level.GetTileTypeAt(xVal, yVal + 1) = tempType
    End Function

    Function IsTrapAdjacent: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsTrapAdjacent(Int, Int)")
    End Function

    Function IsTrapOrExitAbove: Bool(xVal: Int, yVal: Int)
        If Level.IsExitAt(xVal, yVal - 1) Then Return True

        Return Trap.GetTrapTypeAt(xVal, yVal) <> TrapType.None
    End Function

    Function IsVisibleTileAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsVisibleTileAt(Int, Int)")
    End Function

    Function IsWallAdjacent: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsWallAdjacent(Int, Int)")
    End Function

    Function IsWallAdjacent8: Bool(xVal: Int, yVal: Int)
        For Local y := yVal - 1 To yVal + 1
            For Local x := xVal -1 To xVal + 1
                If x = xVal And
                   y = yVal
                    Continue
                End If

                If Level.IsWallAt(x, y, False, False) Then Return True
            End For
        End For

        Return False
    End Function

    Function IsWallAt: Bool(xVal: Int, yVal: Int)
        Return Level.IsWallAt(xVal, yVal, False, False)
    End Function

    Function IsWallAt: Bool(xVal: Int, yVal: Int, destructibleOnly: Bool, torchlessOnly: Bool)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsWall(False, destructibleOnly, False, torchlessOnly)
    End Function

    Function IsWaterOrTarAt: Bool(xVal: Int, yVal: Int)
        Select Level.GetTileTypeAt(xVal, yVal)
            Case TileType.Water,
                 TileType.Tar,
                 TileType.DeepWater
                Return True
        End Select

        Return False
    End Function

    Function IsWireLikeAt: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("Level.IsWireLikeAt(Int, Int)")
    End Function

    Function IsZone5RoomLegal: Bool(loc: Rect)
        For Local x := loc.GetLeft() To loc.GetRight()
            For Local y := loc.GetTop() To loc.GetBottom()
                Local tile := Level.GetTileAt(x, y)
                If tile = Null Then Continue

                Local tileType := tile.GetType()
                If tileType <> TileType.Empty And
                   (tileType <> TileType.DirtWall Or Not loc.OnBorder(x, y))
                    Return False
                End If
            End For
        End For

        Return True
    End Function

    Function JanitorReset: Void()
        Debug.TraceNotImplemented("Level.JanitorReset()")
    End Function

    Function LoadLevelSong: Void(levelObj: LevelObject = Null)
        Debug.TraceNotImplemented("Level.LoadLevelSong(LevelObject)")
    End Function

    Function MakeAllWallsUnbreakable: Void()
        Debug.TraceNotImplemented("Level.MakeAllWallsUnbreakable()")
    End Function

    Function MakeHelper: Void()
        controller_game.numPlayers += 1

        Local dorian := New Player(1, Character.Dorian)
        controller_game.players[1] = dorian

        Local player1 := controller_game.players[0]
        player1.helper = dorian

        dorian.x = 1
        dorian.y = 0
        dorian.isHelper = True
        dorian.SetTotallyBlank()

        dorian.AddItemOfType("weapon_dagger", Null, True, False)
        dorian.AddItemOfType("armor_platemail_dorian", Null, True, False)
        dorian.AddItemOfType("ring_might", Null, True, False)
    End Function

    Function MakeInvisibleChestAt: Void(tmpX: Int, tmpY: Int)
        Local requestedLevel := controller_game.currentLevel + 3
        Local itemName := Item.GetRandomItemInClass("", requestedLevel, "chestChance", Chest.CHEST_COLOR_NONE, False, "", False)

        New Chest(tmpX, tmpY, itemName, True, False, True, Chest.CHEST_COLOR_NONE)
    End Function

    Function MarkAllTilesAsSeen: Void()
        Debug.TraceNotImplemented("Level.MarkAllTilesAsSeen()")
    End Function

    Function MaybeForbidTrapdoor: Bool()
        If controller_game.currentZone <> 5 Then Return False
        If controller_game.currentLevel = 3 Then Return True

        Return Util.RndBool(True)
    End Function

    Function NewLevel: Void(level: Int, zone: Int, playerID: Int = 0, inEditor: Bool = False, levelObj: LevelObject = Null, continuedRun: Bool = False)
        Debug.Log("NEWLEVEL level: " + level +
                          " zone: " + zone +
                          " currentLevel: " + controller_game.currentLevel +
                          " currentZone: " + controller_game.currentZone +
                          " currentDepth: " + controller_game.currentDepth)

        Select level
            Case LevelType.Lobby
                Player.SetCoins(0, True)
            Case LevelType.NextLevel
                If ControllerLevelEditor.playingLevel <> -1
                    If ControllerLevelEditor.playingWholeDungeon And
                       (ControllerLevelEditor.playingLevel < ControllerLevelEditor.storedEditor.numLevels)
                        ControllerLevelEditor.playingLevel += 1
                        Local levelObj := ControllerLevelEditor.storedEditor.levels.Get(ControllerLevelEditor.playingLevel)
                        Level.NewLevel(LevelType.Test, zone, playerID, False, levelObj)
                    Else
                        Level.DoRestart()
                    End If

                    Return
                End If

                If Level.mentorLevel <> -1
                    GameData.SetMentorLevelClear(Level.mentorLevel)
                    level = LevelType.Lobby
                End If
            Default
                If LevelType.MinMentorLevel <= level And level <= LevelType.MaxMentorLevel
                    Level.mentorLevel = level + math.Abs(LevelType.MaxMentorLevel)

                    Local mentorLevelId := Level.mentorLevel + 1
                    Local mentorLevelPath := data.FixDataPath("mentor/mentor_" + mentorLevelId + ".xml")
                    Local mentorLevelData := app.LoadString(mentorLevelPath)
                    Local mentorLevelNode := xml.ParseXML(mentorLevelData)

                    Debug.TraceNotImplemented("Level.NewLevel(Int, Int, Int, Bool, LevelObject, Bool) (Mentor levels)")
                End If
        End Select

        If levelObj <> Null
            Local bossNum := levelObj.bossNum
            If bossNum <> -1
                level = LevelType.BossBattle

                If bossNum <= 16
                    zone = bossNum - 11
                    Level.forceBoss = BossBattleType.CongaLine
                Else If bossNum <= 21
                    zone = bossNum - 16
                    Level.forceBoss = BossBattleType.DeathMetal
                Else If bossNum <= 26
                    zone = bossNum - 21
                    Level.forceBoss = BossBattleType.DeepBlues
                Else If bossNum <= 31
                    zone = bossNum - 26
                    Level.forceBoss = BossBattleType.CoralRiff
                Else
                    zone = bossNum - 31
                    Level.forceBoss = BossBattleType.DeadRinger
                End If
            End If
        End If

        Local playVictoryCutscene := False

        If (controller_game.currentLevel = LevelType.FinalBossBattle) Or
           (controller_game.currentLevel = LevelType.BossBattle And
            controller_game.currentDepth = Level.GetMaxDepth() And
            Not Level.HaveFinalBoss())
            playVictoryCutscene = True
        End If

        If Level.isStoryMode And
           (Util.IsCharacterActive(Character.Nocturna) Or
            Util.IsCharacterActive(Character.Cadence) Or
            Util.IsCharacterActive(Character.Melody))
            playVictoryCutscene = False
        End If

        If GameData.GetEnableCutscenes() And
           Not Level.playedVictoryCutscene And
           playVictoryCutscene And
           level = LevelType.NextLevel
            If Not Level.isDeathlessMode And
               Not Level.isReplaying And
               Not Level.isAllCharactersMode And
               Not Level.isAllCharactersDLCMode And
               Not Level.isPhasingMode And
               Not Level.isRandomizerMode And
               Not Level.isMysteryMode And
               Not Level.isNoReturnMode
                Stairs_callback.levelVal = LevelType.NextLevel
                Stairs_callback.zoneVal = zone
                Stairs_callback.playerVal = playerID
                Stairs_callback.continuedRun = continuedRun

                Local creditsNum := 1

                If Util.IsCharacterActive(Character.Coda)
                    creditsNum = 4
                Else If Util.IsCharacterActive(Character.Aria)
                    creditsNum = 3
                Else If Util.IsCharacterActive(Character.Nocturna)
                    creditsNum = 5
                Else If Util.IsCharacterActive(Character.Melody) Or
                        Util.IsCharacterActive(Character.Cadence) Or
                        Util.IsCharacterActive(Character.Bolt) Or
                        Util.IsCharacterActive(Character.Dorian)
                    creditsNum = 2
                End If

                New ControllerCutscene(-1, -1, creditsNum)
                Level.playedVictoryCutscene = True

                Return
            End If
        End If

        If LevelType.MinAllCharactersCharacterSelect <= level And level <= LevelType.MaxAllCharactersCharacterSelect
            Local firstPlayer := controller_game.players[0]
            Local characterID := level + math.Abs(LevelType.MinAllCharactersCharacterSelect)
            firstPlayer.SetCharacter(characterID)

            continuedRun = Level.AllCharsAnyComplete()

            Level.NewLevel(LevelType.AllZonesMode, 1, 0, False, Null, continuedRun)

            Return
        End If

        If LevelType.MinAllCharactersDLCCharacterSelect <= level And level <= LevelType.MaxAllCharactersDLCCharacterSelect
            Local firstPlayer := controller_game.players[0]
            Local characterID := level + math.Abs(LevelType.MinAllCharactersDLCCharacterSelect)
            firstPlayer.SetCharacter(characterID)

            continuedRun = Level.AllCharsDLCAnyComplete()

            Level.NewLevel(LevelType.AllZonesMode, 1, 0, False, Null, continuedRun)

            Return
        End If

        If level = LevelType.DeathlessMode
            Level.isDeathlessMode = True
            Level.deathlessWinCount = 0

            Level.NewLevel(LevelType.AllZonesMode, 1)

            Return
        End If

        Level.isLevelEditor = inEditor
        controller_game.dailyChallengeSuccessScore = -1
        controller_game.speedrunSuccessScore = -1
        controller_game.hardcoreModeSuccessScore = -1
        Level.isLevelEnding = False

        If level = LevelType.Lobby
            Level.DoRestart_Common(False, False)
        End If

        For Local i := 0 Until controller_game.numPlayers
            GameData.SetPlayerCoins(Player.numCoins)
            GameData.SetPlayerDiamonds(Player.numDiamonds)
        End For

        Audio.songShopOpen = False

        Level.pacifismModeOn = False
        If Util.IsCharacterActive(Character.Dove) And
           level <> LevelType.DailyChallenge And
           level <> LevelType.StoryMode And
           Not inEditor And
           levelObj = Null
            Level.pacifismModeOn = True
        End If

        If level = LevelType.NextLevel
            level = controller_game.currentLevel + 1
        End If

        If pacifismModeOn
            If level = LevelType.BossBattle
                level = LevelType.FinalBossBattle
            End If
        End If

        Local flag2 := False
        If level > 5
            flag2 = True
        End If

        If level = LevelType.FinalBossBattle And
           (Not Level.isHardcoreMode Or controller_game.currentDepth = Level.GetMaxDepth()) And
           (controller_game.currentZone <> Level.GetSingleZoneModeFinalBossZone() Or Not Level.HaveFinalBoss()) And
           (Not Level.isHardcoreMode Or Not Level.HaveFinalBoss())
            flag2 = True
        End If

        If zone = 1
            Select level
                Case LevelType.Level1,
                     LevelType.Level2
                    If Not GameData.GetTutorialComplete()
                        level = LevelType.Tutorial
                    End If
            End Select
        End If

        Local allPlayersPerished := True
        ' This is not the same as `Player.AllPlayersPerished`.
        ' `Player.AllPlayersPerished` also checks helpers.
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player <> Null And
               Not player.Perished()
                allPlayersPerished = False

                Exit
            End If
        End For

        Local isTrainingLevel := LevelType.MinTrainingLevel <= level And level <= LevelType.MaxTrainingLevel

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player = Null
                player = New Player(i)
                controller_game.players[i] = player
            End If

            player.lordCrownActiveBeat = -1
            player.shieldActiveBeat = -1

            If player.Perished()
                If allPlayersPerished
                    Local characterID := player.characterID
                    Local weapon := player.weapon

                    player.Die()

                    Local weaponType: String
                    If isTrainingLevel
                        If weapon <> Null And
                           weapon.IsKeepable()
                            weaponType = weapon.type
                        End If
                    End If

                    player = New Player(i)
                    player.SetCharacter(characterID)
                    controller_game.players[i] = player

                    If isTrainingLevel
                        If weaponType <> "" And
                           weaponType <> Item.NoItem
                            player.AddItemOfType(weaponType, Null, True, False)
                        End If
                    End If
                Else
                    player.perished = False
                    If player.characterID = Character.Mary
                        player.lambFamiliar = New Familiar(player)
                    End If
                End If

                player.health.Revive()
            End If

            player.x = i Mod 2
            player.y = i / 2
            player.WarpFamiliars()

            If i = 3 And
               level = LevelType.BossBattle
                player.x = -1
                player.y = 0
            End If

            player.lastX = player.x
            player.lastY = player.y
        End For

        If controller_game.numPlayers = 1 And
           Level.IsFinalBossZone() And
           level = LevelType.FinalBossBattle And
           Util.IsCharacterActive(Character.Cadence)
            Level.MakeHelper()
        End If

        Level.previousLevelUnkilledStairLockingMinibosses.Clear()
        For Local enemy := EachIn Enemy.enemyList
            If enemy.isStairLockingMiniboss
                Level.previousLevelUnkilledStairLockingMinibosses.Push(enemy.enemyType)
            End If
        End For

        Enemy.SetEnemiesToDropNoCoins()
        RenderableObject.DeleteAll()
        Level.placedArena = False

        If allPlayersPerished
            controller_game.player1 = 0

            For Local i := 0 Until controller_game.numPlayers
                Local player := controller_game.players[i]
                player.health.Refill()
            End For
        End If

        controller_game.currentLevel = level
        controller_game.currentZone = zone

        Select controller_game.currentLevel
            Case LevelType.DailyChallenge
                If Level.randSeed = -1
                    Debug.TraceNotImplemented("Level.NewLevel(Int, Int, Int, Bool, LevelObject, Bool) (Daily seed)")
                Else
                    Debug.Log("Setting random seed to " + Level.randSeed)
                End If
            Case LevelType.SeededNoReturnMode,
                 LevelType.SeededAllZonesMode,
                 LevelType.SeededRandomizerMode,
                 LevelType.SeededHardMode,
                 LevelType.SeededMysteryMode,
                 LevelType.SeededPhasingMode
                Level.isSeededMode = True

                Level.randSeed = Util.ParseTextSeed(Level.randSeedString)
                If Level.randSeed = -1
                    Level.randSeed = 0
                End If
            Default
                Local isNonDeterministic := False
                Select level
                    Case LevelType.Lobby,
                         LevelType.Test,
                         LevelType.StoryMode,
                         LevelType.SwarmMode,
                         LevelType.NoReturnMode,
                         LevelType.SoulMode,
                         LevelType.HardMode,
                         LevelType.FloorIsLavaMode,
                         LevelType.PhasingMode,
                         LevelType.RandomizerMode,
                         LevelType.MysteryMode,
                         LevelType.AllZonesMode,
                         LevelType.RandomCharacter
                        isNonDeterministic = True
                End Select

                If Level.isLevelEditor Then isNonDeterministic = True

                If Not Level.isHardcoreMode
                    Select level
                        Case LevelType.Level1,
                             LevelType.DancePadMode
                            isNonDeterministic = True
                    End Select
                End If

                If isTrainingLevel Then isNonDeterministic = True

                If isNonDeterministic
                    Level.randSeed = -1

                    If Level.nonDeterministicMSStart = -1 Or
                       isTrainingLevel
                        Level.nonDeterministicMSStart = app.Millisecs()
                    End If

                    Debug.Log("NON-DETERMINISTIC MS START INIT: " + Level.nonDeterministicMSStart)

                    Select controller_game.currentLevel
                        Case LevelType.AllZonesMode,
                             LevelType.StoryMode,
                             LevelType.SwarmMode,
                             LevelType.NoReturnMode,
                             LevelType.SoulMode,
                             LevelType.HardMode,
                             LevelType.FloorIsLavaMode,
                             LevelType.PhasingMode,
                             LevelType.RandomizerMode,
                             LevelType.MysteryMode
                            Level.randSeed = Level.nonDeterministicMSStart
                    End Select
                End If
        End Select

        If Level.randSeed <> -1
            If Level.wholeRunRNG = Null
                Level.wholeRunRNG = RNG.Make(Level.randSeed)
            End If
        End If

        Local z := math.Max(1, controller_game.currentZone)
        Local l := math.Max(1, controller_game.currentLevel)

        Local randSeed: Int

        If Level.randSeed = -1
            Debug.Log("NON-DETERMINISTIC MS START: " + Level.nonDeterministicMSStart + " z: " + z + " l: " + l)

            Local x := l +
                (5 * z) +
                (23987 * Level.nonDeterministicMSStart)
            Level.currentFloorRNG = RNG.Make(x)
        Else
            Level.currentFloorRNG = Level.wholeRunRNG.Split()
            randSeed = Level.currentFloorRNG.Rand()

            Debug.Log("DETERMINISTIC START: " + Level.randSeed + " z: " + z + " l: " + l)
        End If

        If Level.isReplaying And
           Not flag2
            If controller_game.currentZone <> Level.replay.startingZone Or
               controller_game.currentLevel <> Level.replay.startingLevel
                Level.replay.NextLevel()
            End If

            If Level.replay.curReplayData <> Null
                randSeed = Level.replay.curReplayData.Value().randSeed
            End If

            Select controller_game.currentLevel
                Case LevelType.DailyChallenge,
                     LevelType.AllZonesMode,
                     LevelType.SeededAllZonesMode
                    Level.randSeed = randSeed
            End Select
        End If

        Debug.Log("NEWLEVEL: Using seed " + randSeed)

        Util.SeedRnd(randSeed)
        Level.creatingMap = True

        If Not Level.isReplaying And
           Not Level.isLevelEditor And
           levelObj = Null
            Select controller_game.currentLevel
                Case LevelType.Level1,
                     LevelType.DancePadMode
                    ' TODO: This needs to be converted back to the XML API.
                    'GameData.xmlSaveData.Export(1)
            End Select
        End If

        Local creatingMapStart := app.Millisecs()

        Select controller_game.currentLevel
            Case LevelType.Tutorial
                ' TODO: Verify this condition.
                If Not Level.isReplaying
                    Util.AddMetric("event", "newRun")
                    Util.AddMetric("runType", "tutorial", True)
                End If

                Level.isSeededMode = False
                Level.isHardcoreMode = False
                Level.isDailyChallenge = False
                Level.isDDRMode = False

                Local firstPlayer := controller_game.players[0]
                firstPlayer.SetCharacter(Character.Cadence)
                firstPlayer.SetTotallyBlank()

                Level.CreateTutorialMap()
            Case LevelType.FinalBossBattle
                If Level.IsFinalBossZone() And
                   Level.HaveFinalBoss()
                    If Util.IsCharacterActive(Character.Nocturna)
                        Level.bossNumber = BossBattleType.Conductor
                        Level.CreateFinalBossBattleConductor()
                    Else If Util.IsCharacterActive(Character.Aria)
                        Level.bossNumber = BossBattleType.LuteDragon
                        Level.CreateFinalBossBattle3()
                    Else If Util.IsCharacterActive(Character.Melody)
                        Level.bossNumber = BossBattleType.NecroDancer2
                        Level.CreateFinalBossBattle2()
                    Else
                        Level.bossNumber = BossBattleType.NecroDancer
                        Level.CreateFinalBossBattle()
                    End If
                Else
                    If Not Level.isReplaying
                        Select controller_game.currentZone
                            Case 1
                                Level.UnlockChar(Character.Eli)
                            Case 2
                                Level.UnlockChar(Character.Dove)
                            Case 3
                                Level.UnlockChar(Character.Monk)
                            Case 5
                                Level.UnlockChar(Character.Diamond)
                            Default
                                If Util.IsCharacterActive(Character.Monk)
                                    Level.UnlockChar(Character.Bolt)
                                End If
                        End Select

                        If controller_game.currentLevel > 5
                            If Util.IsCharacterActive(Character.Cadence)
                                Level.UnlockChar(Character.Melody)
                            End If

                            If Util.IsCharacterActive(Character.Melody)
                                Level.UnlockChar(Character.Aria)
                            End If
                        End If
                    End If

                    If Level.isHardcoreMode And
                       controller_game.currentDepth <= 4
                        controller_game.currentDepth += 1
                        controller_game.currentZone = Level.zoneOrder.Get(controller_game.currentDepth - 1)
                        controller_game.currentLevel = LevelType.Level1

                        Local isAlreadyUnlocked := False
                        Select controller_game.currentZone
                            Case 2
                                isAlreadyUnlocked = GameData.GetZone2UnlockedCurrentCharacters()
                                GameData.SetZone2UnlockedCurrentCharacters()
                            Case 3
                                isAlreadyUnlocked = GameData.GetZone3UnlockedCurrentCharacters()
                                GameData.SetZone3UnlockedCurrentCharacters()
                            Case 4
                                isAlreadyUnlocked = GameData.GetZone4UnlockedCurrentCharacters()
                                GameData.SetZone4UnlockedCurrentCharacters()
                        End Select

                        If Not isAlreadyUnlocked
                            Level.justUnlocked = "zone" + controller_game.currentZone

                            If Util.IsCharacterActive(Character.Aria)
                                Level.justUnlocked += "aria"
                            End If
                        End If

                        Level.CreateMap()
                    Else
                        Debug.Log("NEWLEVEL: Completed run")

                        Local runTime := -1
                        Local totalCoins := -1

                        If Level.isReplaying
                            If Level.isHardcoreMode
                                totalCoins = Player.numCoins + Level.continuedRunCoinScore
                                runTime = Level.replay.runTime
                            End If
                        Else
                            Select controller_game.currentZone
                                Case 1
                                    If Not GameData.GetZone2UnlockedCurrentCharacters()
                                        Level.justUnlocked = "zone2"
                                    End If

                                    GameData.SetZone2UnlockedCurrentCharacters()
                                Case 2
                                    If Not Util.IsCharacterActive(Character.Aria)
                                        If Not GameData.GetZone3UnlockedCurrentCharacters()
                                            Level.justUnlocked = "zone3"
                                        End If

                                        GameData.SetZone3UnlockedCurrentCharacters()
                                    Else
                                        If Not GameData.GetZone1UnlockedCurrentCharacters()
                                            Level.justUnlocked = "zone1aria"
                                        End If

                                        GameData.SetZone1UnlockedCurrentCharacters()
                                    End If
                                Case 3
                                    If Not Util.IsCharacterActive(Character.Aria)
                                        If Not GameData.GetZone4UnlockedCurrentCharacters()
                                            Level.justUnlocked = "zone4"
                                        End If

                                        GameData.SetZone4UnlockedCurrentCharacters()
                                    Else
                                        If Not GameData.GetZone2UnlockedCurrentCharacters()
                                            Level.justUnlocked = "zone2aria"
                                        End If

                                        GameData.SetZone2UnlockedCurrentCharacters()
                                    End If
                                Default
                                    If Util.IsCharacterActive(Character.Aria)
                                        If Not GameData.GetZone3UnlockedCurrentCharacters()
                                            Level.justUnlocked = "zone3Aria"
                                        End If

                                        GameData.SetZone3UnlockedCurrentCharacters()
                                    End If
                            End Select

                            Util.AddMetric("event", "gameWin")

                            If Level.isDailyChallenge
                                Util.AddMetric("runType", "hardcoreDaily")
                            Else If Level.isHardcoreMode
                                Util.AddMetric("runType", "hardcore")
                            Else
                                Select controller_game.currentZone
                                    Case 1
                                        Util.AddMetric("runType", "zone1")
                                    Case 2
                                        Util.AddMetric("runType", "zone2")
                                    Case 3
                                        Util.AddMetric("runType", "zone3")
                                    Case 4
                                        Util.AddMetric("runType", "zone4")
                                    Default
                                        Util.AddMetric("runType", "Unknown!")
                                End Select
                            End If

                            If Level.isHardcoreMode
                                Local runPlaytimeStr := Util.GetTimeStringFromMilliseconds(controller_game.runPlaytimeMilliseconds, False, True)
                                Util.AddMetric("speedrunWinTime", runPlaytimeStr)
                            End If

                            Local gameWinScore := Player.numCoins + Level.continuedRunCoinScore
                            Util.AddMetric("gameWinScore", gameWinScore, True)

                            If Level.isHardcoreMode
                                If Level.isDailyChallenge
                                    controller_game.dailyChallengeSuccessScore = gameWinScore
                                Else
                                    controller_game.hardcoreModeSuccessScore = gameWinScore
                                End If

                                controller_game.speedrunSuccessScore = controller_game.runPlaytimeMilliseconds
                                
                                If Level.replay <> Null
                                    Level.replay.runTime = controller_game.runPlaytimeMilliseconds
                                End If
                            End If
                        End If

                        Local allCharsCompletionCharIndex := controller_game.players[0].characterID
                        If controller_game.players[0].characterID >= Character.Coda
                            allCharsCompletionCharIndex -= 1
                        End If

                        If Level.isAllCharactersMode
                            Level.allCharsCompletion[allCharsCompletionCharIndex] = True
                        End If

                        If Level.isAllCharactersDLCMode
                            Level.allCharsCompletionDLC[allCharsCompletionCharIndex] = True
                        End If

                        If Level.isAllCharactersMode And
                           Level.AllCharsAllComplete()
                            Util.IncrementSteamStat("NumAllCharsCompletions", True, False, True, False)

                            If Level.isAllCharsRunNoItemsNoShrines
                                Util.IncrementSteamStat("NumAllCharsLowPercentCompletions", True, False, True, False)
                            End If

                            Level.UnlockChar(Character.Coda)
                        End If

                        If Level.isAllCharactersDLCMode And
                           Level.AllCharsDLCAllComplete()
                            Util.IncrementSteamStat("NumAllCharsDLCCompletions", True, False, True, False)
                        End If

                        controller_game.controllerGamePointer.specialScoreSubmit = False

                        If Level.isAllCharactersMode And
                           (Not Level.isDeathlessMode Or
                            Not Level.AllCharsAllComplete())
                            Level.popUpController = New ControllerPopUp(
                                controller_game.controllerGamePointer,
                                "|35|Submit score for this run?|",
                                "",
                                "",
                                "|1004|NO|",
                                "|1003|YES|",
                                True,
                                False,
                                "")
                            Level.popUpType = 4

                            Return
                        End If

                        If Level.isAllCharactersDLCMode And
                           (Level.isDeathlessMode Or
                            Not Level.AllCharsDLCAllComplete())
                            Level.popUpController = New ControllerPopUp(
                                controller_game.controllerGamePointer,
                                "|35|Submit score for this run?|",
                                "",
                                "",
                                "|1004|NO|",
                                "|1003|YES|",
                                True,
                                False,
                                "")
                            Level.popUpType = 4

                            Return
                        End If

                        If Level.isDeathlessMode
                            Level.deathlessWinCount += 1

                            If Util.IsCharacterActive(Character.Cadence)
                                Util.SetSteamIntStat("MaxCadenceDeathlessStreak", Level.deathlessWinCount, True, False, False)
                            End If

                            Level.DoQuickRestart(True, True, False)

                            Return
                        End If

                        If Not Level.isStoryMode Or
                           Util.IsCharacterActive(Character.Aria)
                            ' TODO: Check condition
                            If Not Level.isHardcoreMode
                                If Level.isReplaying
                                    New ControllerPostGame(
                                        controller_game.controllerGamePointer,
                                        Level.isHardcoreMode,
                                        Level.isDailyChallenge,
                                        Level.isAllCharactersMode,
                                        False,
                                        False,
                                        totalCoins,
                                        runTime)
                                Else
                                    New ControllerPostGame(
                                        controller_game.controllerGamePointer,
                                        Level.isHardcoreMode,
                                        Level.isDailyChallenge,
                                        Level.isAllCharactersMode,
                                        False,
                                        False,
                                        -1,
                                        -1)
                                End If
                            Else
                                controller_game.controllerGamePointer.coinVal = -1
                                controller_game.controllerGamePointer.timeVal = -1
                                controller_game.hasWon = True
                            End If
                        Else
                            Level.popUpController = New ControllerPopUp(
                                controller_game.controllerGamePointer,
                                "|35|Submit score for this run?|",
                                "",
                                "",
                                "|1004|NO|",
                                "|1003|YES|",
                                True,
                                False,
                                "")
                            Level.popUpType = 4
                        End If

                        Return
                    End If
                End If
            Case LevelType.CharacterSelect
                Level.CreateCharSelect()
            Case LevelType.BeastmasterZone1
                Level.CreateBeastmasterZone1()
            Case LevelType.BeastmasterZone2
                Level.CreateBeastmasterZone2()
            Case LevelType.BeastmasterZone3
                Level.CreateBeastmasterZone3()
            Case LevelType.BeastmasterZone4
                Level.CreateBeastmasterZone4()
            Case LevelType.BeastmasterZone5
                Level.CreateBeastmasterZone5()
            Case LevelType.BossmasterMinibosses
                Level.CreateBossmasterMinibosses()
            Case LevelType.BossmasterBosses
                Level.CreateBossmasterBosses()
            Case LevelType.ExtraModesSelect
                Level.CreateExtraModesSelect()
            Case LevelType.LevelEditor
                New ControllerLevelEditor()

                Return
            Case LevelType.Test
                If levelObj = Null
                    Level.CreateTestMap()
                End If
            Case LevelType.RandomCharacter
                Local character := Character.Cadence
                Local numEnabledCharacter := Player.NumEnabledCharacters() - 1

                For Local i := 1000 Until 0 Step -1
                    Local c := Util.RndIntRangeFromZero(numEnabledCharacter, False)

                    If c = Character.Coda Then Continue
                    If c = Character.None Then Continue

                    If GameData.IsCharUnlocked(c)
                        character =  c

                        Exit
                    End If
                End For

                Local player := controller_game.players[playerID]
                player.SetCharacter(character)

                Level.isAllCharactersMode = False
                Level.isAllCharactersDLCMode = False

                controller_game.currentLevel = LevelType.Lobby
                Level.CreateLobby()

                Level.nonDeterministicMSStart = -1
            Case LevelType.CreateAllCharactersCharacterSelect,
                 LevelType.AllCharactersCharacterSelect
                Level.isAllCharactersMode = True

                If controller_game.currentLevel = LevelType.CreateAllCharactersCharacterSelect
                    For Local i := 0 Until Level.allCharsCompletion.Length()
                        Level.allCharsCompletion[i] = False
                    End For

                    If controller_game.numPlayers > 1
                        controller_game.players[controller_game.numPlayers - 1].Die()
                        controller_game.players[controller_game.numPlayers - 1] = Null
                        controller_game.numPlayers -= 1
                    End If

                    Level.isAllCharsRunNoItemsNoShrines = True
                End If

                controller_game.currentLevel = LevelType.AllCharactersCharacterSelect
                Level.CreateAllCharsSelect()
            Case LevelType.CreateAllCharactersDLCCharacterSelect,
                 LevelType.AllCharactersDLCCharacterSelect
                Level.isAllCharactersDLCMode = True

                If controller_game.currentLevel = LevelType.CreateAllCharactersDLCCharacterSelect
                    For Local i := 0 Until Level.allCharsCompletionDLC.Length()
                        Level.allCharsCompletionDLC[i] = False
                    End For

                    If controller_game.numPlayers > 1
                        controller_game.players[controller_game.numPlayers - 1].Die()
                        controller_game.players[controller_game.numPlayers - 1] = Null
                        controller_game.numPlayers -= 1
                    End If

                    Level.isAllCharsRunNoItemsNoShrines = True
                End If

                controller_game.currentLevel = LevelType.AllCharactersDLCCharacterSelect
                Level.CreateAllCharsDLCSelect()
            Case LevelType.Lobby
                If Not Level.quickRestart And
                   ControllerLevelEditor.playingLevel = -1
                    Level.isSeededMode = False
                    Level.isHardcoreMode = False
                    Level.isDailyChallenge = False
                    Level.isDDRMode = False

                    controller_game.currentLevel = LevelType.Lobby
                    Level.CreateLobby()
                End If
            Case LevelType.BossBattle
                If Level.IsFinalBossZone() And
                   Util.IsCharacterActive(Character.Aria)
                    controller_game.currentLevel = LevelType.FinalBossBattle
                    Level.bossNumber = BossBattleType.LuteDragon
                    Level.CreateFinalBossBattle3()
                Else If Level.IsFinalBossZone() And
                        Util.IsCharacterActive(Character.Melody)
                    controller_game.currentLevel = LevelType.FinalBossBattle
                    Level.bossNumber = BossBattleType.NecroDancer2
                    Level.CreateFinalBossBattle2()
                Else
                    Level.CreateBossBattle()
                End If
            Case LevelType.Unknown_1
                Level.isSeededMode = False
                Level.isHardcoreMode = False
                Level.isDailyChallenge = False
                Level.isDDRMode = False

                Level.CreateTestMap()
            Case LevelType.DancePadMode
                If Not Level.isReplaying
                    Util.AddMetric("event", "newRun")
                    Util.AddMetric("runType", "DDR", True)
                End If

                controller_game.currentZone = Level.GetInitialZone()
                controller_game.currentDepth = 1
                controller_game.currentLevel = LevelType.Level1

                Level.isDDRMode = True

                Shrine.ResetShrines()
                Item.CreateItemPools()

                Util.SeedRnd(randSeed)

                Level.CreateMap()

                Level.GetTileAt(0, -1).AddTextLabel("|125|Dance pad mode! Easier difficulty.|", 0, 18)
                Level.GetTileAt(0, 0).AddTextLabel("|126|Practice with this mode until|", 0, 32)
                Level.GetTileAt(0, 1).AddTextLabel("|127|you are ready for normal modes!|", 0, 15)
            Case LevelType.Level1
                controller_game.currentDepth = controller_game.currentZone
                If Util.IsCharacterActive(Character.Aria) And
                   1 <= controller_game.currentZone And controller_game.currentZone <= 4
                    controller_game.currentDepth = 5 - controller_game.currentZone
                End If

                Shrine.ResetShrines()
                Item.CreateItemPools()

                Util.SeedRnd(randSeed)

                If Not Level.isReplaying
                    Util.AddMetric("event", "newRun")

                    Select controller_game.currentZone
                        Case 1
                            Util.AddMetric("runType", "zone1", True)
                        Case 2
                            Util.AddMetric("runType", "zone2", True)
                        Case 3
                            Util.AddMetric("runType", "zone3", True)
                        Default
                            Util.AddMetric("runType", "zone4", True)
                    End Select
                End If

                If inEditor Or
                   ControllerLevelEditor.playingLevel = 1 Or
                   Level.mentorLevel <> -1
                    Shrine.ResetShrines()
                    Item.CreateItemPools()

                    Util.SeedRnd(randSeed)

                    If Level.mentorLevel <> -1
                        Local firstPlayer := controller_game.players[0]
                        firstPlayer.SetCharacter(Character.Bard)
                        firstPlayer.SetTotallyBlank()
                        firstPlayer.health.Damage(firstPlayer.health.Get() - 1)
                    End If
                End If
            Case LevelType.ToggleCoOpMode
                If Not Level.quickRestart And
                   ControllerLevelEditor.playingLevel = -1
                    If controller_game.numPlayers > 1
                        controller_game.players[controller_game.numPlayers - 1].Die()
                        controller_game.players[controller_game.numPlayers - 1] = Null
                        controller_game.numPlayers -= 1
                    Else
                        Local playerID := controller_game.numPlayers
                        Local player := New Player(playerID, Character.None)
                        player.x = 1

                        controller_game.players[controller_game.numPlayers] = player
                        controller_game.numPlayers += 1
                    End If

                    Level.isAllCharactersMode = False
                    Level.isAllCharactersDLCMode = False
                    Level.isSeededMode = False
                    Level.isHardcoreMode = False
                    Level.isDailyChallenge = False
                    Level.isDDRMode = False

                    controller_game.currentLevel = LevelType.Lobby
                    Level.CreateLobby()
                End If
            Case LevelType.AllZonesMode,
                 LevelType.DailyChallenge,
                 LevelType.SeededAllZonesMode,
                 LevelType.StoryMode,
                 LevelType.SwarmMode,
                 LevelType.NoReturnMode,
                 LevelType.SeededNoReturnMode,
                 LevelType.SoulMode,
                 LevelType.HardMode,
                 LevelType.SeededHardMode,
                 LevelType.FloorIsLavaMode,
                 LevelType.PhasingMode,
                 LevelType.SeededPhasingMode,
                 LevelType.RandomizerMode,
                 LevelType.SeededRandomizerMode,
                 LevelType.MysteryMode,
                 LevelType.SeededMysteryMode
                Level.forceBoss = BossBattleType.None
                Shrine.ResetShrines()

                If Not Level.isReplaying
                    Util.AddMetric("event", "newRun")

                    If controller_game.currentLevel = LevelType.DailyChallenge
                        Util.AddMetric("runType", "hardcoreDaily", True)
                    Else
                        Util.AddMetric("runType", "hardcore", True)
                    End If
                End If

                If Not continuedRun
                    controller_game.runPlaytimeLastAdded = 0
                    controller_game.runPlaytimeMilliseconds = 0
                End If

                controller_game.subRunPlaytimeMilliseconds = 0

                Select controller_game.currentLevel
                    Case LevelType.DailyChallenge
                        Level.isDailyChallenge = True
                        Level.isDeathlessMode = False
                        Level.isAllCharactersMode = False
                        Level.isAllCharactersDLCMode = False

                        Local firstPlayer := controller_game.players[0]
                        firstPlayer.SetCharacter(Character.Cadence)
                    Case LevelType.StoryMode
                        Level.isStoryMode = True
                        Level.isDeathlessMode = False
                        Level.isAllCharactersMode = False
                        Level.isAllCharactersDLCMode = False

                        If Not continuedRun
                            Local firstPlayer := controller_game.players[0]
                            firstPlayer.SetCharacter(Character.Nocturna)
                        End If
                    Case LevelType.SwarmMode
                        Level.isSwarmMode = True
                    Case LevelType.NoReturnMode,
                         LevelType.SeededNoReturnMode
                        Level.isNoReturnMode = True
                    Case LevelType.HardMode,
                         LevelType.SeededHardMode
                        Level.isHardMode = True
                    Case LevelType.FloorIsLavaMode
                        Level.isFloorIsLavaMode = True

                        For Local i := 0 Until controller_game.numPlayers
                            Local player := controller_game.players[i]
                            Select player.characterID
                                Case Character.Cadence,
                                     Character.Melody,
                                     Character.Monk,
                                     Character.Bolt,
                                     Character.Bard,
                                     Character.Nocturna
                                    Continue
                            End Select

                            player.SetCharacter(Character.Cadence)
                        End For
                    Case LevelType.PhasingMode,
                         LevelType.SeededPhasingMode
                        Level.isPhasingMode = True
                    Case LevelType.RandomizerMode,
                         LevelType.SeededRandomizerMode
                        Level.isRandomizerMode = True
                        Enemy.StartRandomizerRun()
                    Case LevelType.MysteryMode,
                         LevelType.SeededMysteryMode
                        Level.isMysteryMode = True
                    Case LevelType.AllZonesMode
                        GameData.SetHavePlayedHardcore(True)
                    Case LevelType.SoulMode
                        Level.isSoulMode = True
                End Select

                Level.GenerateHardcoreZoneOrder()
                controller_game.currentZone = Level.zoneOrder.Get(0)
                controller_game.currentLevel = 1
                controller_game.currentDepth = 1

                Level.isHardcoreMode = True

                Item.CreateItemPools()
                Util.SeedRnd(Level.randSeed)

                For Local i := 0 Until controller_game.numPlayers
                    Local characterID := Character.Cadence

                    Local player := controller_game.players[i]
                    If player <> Null
                        characterID = player.characterID
                        player.Die()
                    End If

                    player = New Player(i, characterID)
                    player.x = i Mod 2
                    player.y = i / 2

                    controller_game.players[i] = player
                End For

                Level.CreateMap()

                If Level.isDeathlessMode
                    Level.GetTileAt(0, -1).AddTextLabel("|128|Deathless mode! Compete for high|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("|129|Scores by beating the game|", 0, 32)
                    Level.GetTileAt(0, 1).AddTextLabel("|130|repeatedly without dying!|", 0, 15)
                Else If Level.isAllCharactersMode
                    Level.GetTileAt(0, -1).AddTextLabel("|131|ALL CHARACTERS MODE!|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("|132|TRY TO BEAT THE GAME WITH ALL|", 0, 32)
                    Level.GetTileAt(0, 1).AddTextLabel("|133|NINE CHARACTERS IN A ROW!|", 0, 15)
                Else If Level.isAllCharactersDLCMode
                    Level.GetTileAt(0, -1).AddTextLabel("|131|ALL CHARACTERS MODE!|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("|132|TRY TO BEAT THE GAME WITH ALL|", 0, 32)
                    Level.GetTileAt(0, 1).AddTextLabel("|13510|THIRTEEN CHARACTERS IN A ROW!|", 0, 15)
                Else If Level.isStoryMode
                    Level.GetTileAt(0, -1).AddTextLabel("|134|STORY MODE!|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("|135|BEAT THE GAME WITH NOCTURNA,|", 0, 32)
                    Level.GetTileAt(0, 1).AddTextLabel("|136|CADENCE, MELODY, AND ARIA!|", 0, 15)
                Else If Level.isNoReturnMode
                    Level.GetTileAt(0, -1).AddTextLabel("|13500|NO RETURN MODE!|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("|13501|Take damage when returning|", 0, 32)
                    Level.GetTileAt(0, 1).AddTextLabel("|13502|to the previous tile|", 0, 15)
                Else If Level.isHardMode
                    Level.GetTileAt(0, -1).AddTextLabel("|13503|HARD MODE!|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("|13504|MORE ENEMIES, HARDER BOSSES|", 0, 32)
                Else If Level.isPhasingMode
                    Level.GetTileAt(0, -1).AddTextLabel("|13505|PHASING MODE!|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("|13506|PHASE THROUGH WALLS|", 0, 32)
                Else If Level.isRandomizerMode
                    Level.GetTileAt(0, -1).AddTextLabel("|13507|RANDOMIZER MODE!|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("|13508|Enemy attributes are randomized.|", 0, 32)
                Else If Level.isMysteryMode
                    Level.GetTileAt(0, -1).AddTextLabel("|13509|MYSTERY MODE!|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("??????????????", 0, 32)
                Else If Level.isDailyChallenge
                    Level.GetTileAt(0, -1).AddTextLabel("|140|Daily ALL ZONES challenge!|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("|141|EVERYONE GETS THE SAME DUNGEON!|", 0, 32)
                    Level.GetTileAt(0, 1).AddTextLabel("|142|Score = coin total when run ends.|", 0, 15)
                Else
                    Level.GetTileAt(0, -1).AddTextLabel("|137|Complete all zones in one run!|", 0, 18)
                    Level.GetTileAt(0, 0).AddTextLabel("|138|All lobby upgrades are unlocked,|", 0, 32)
                    Level.GetTileAt(0, 1).AddTextLabel("|139|but you start with lower health.|", 0, 15)
                End If
            Default
                If isTrainingLevel
                    Level.isTrainingMode = True
                    Level.practiceEnemyNum = controller_game.currentLevel + math.Abs(LevelType.MinTrainingLevel)

                    Select controller_game.currentLevel
                        Case LevelType.TrainingBossBattle1
                            Level.forceBoss = BossBattleType.CongaLine
                            controller_game.currentDepth = controller_game.currentZone
                            Level.CreateBossBattle()
                        Case LevelType.TrainingBossBattle2
                            Level.forceBoss = BossBattleType.DeathMetal
                            controller_game.currentDepth = controller_game.currentZone
                            Level.CreateBossBattle()
                        Case LevelType.TrainingBossBattle3
                            Level.forceBoss = BossBattleType.DeepBlues
                            controller_game.currentDepth = controller_game.currentZone
                            Level.CreateBossBattle()
                        Case LevelType.TrainingBossBattle4
                            Level.forceBoss = BossBattleType.CoralRiff
                            controller_game.currentDepth = controller_game.currentZone
                            Level.CreateBossBattle()
                        Case LevelType.TrainingBossBattle9
                            Level.forceBoss = BossBattleType.DeadRinger
                            controller_game.currentDepth = controller_game.currentZone
                            Level.CreateBossBattle()
                        Case LevelType.TrainingBossBattle5
                            Level.forceBoss = BossBattleType.Fortissimole
                            controller_game.currentZone = 4
                            controller_game.currentDepth = 4
                            Level.CreateBossBattle()
                        Case LevelType.TrainingFinalBossBattleNecroDancer
                            Level.bossNumber = BossBattleType.NecroDancer
                            controller_game.currentZone = 4
                            controller_game.currentDepth = 4
                            Level.CreateFinalBossBattle()
                        Case LevelType.TrainingFinalBossBattleNecroDancer2
                            Level.bossNumber = BossBattleType.NecroDancer2
                            controller_game.currentZone = 4
                            controller_game.currentDepth = 4
                            Level.CreateFinalBossBattle2()
                        Case LevelType.TrainingFinalBossBattleLute
                            Level.bossNumber = BossBattleType.LuteDragon
                            controller_game.currentZone = 1
                            controller_game.currentDepth = 4
                            Level.CreateFinalBossBattle3()
                        Case LevelType.TrainingBossBattle10
                            Level.forceBoss = BossBattleType.Frankensteinway
                            controller_game.currentZone = 5
                            controller_game.currentDepth = 5
                            Level.CreateBossBattle()
                        Case LevelType.TrainingFinalBossBattleConductor
                            Level.bossNumber = BossBattleType.Conductor
                            controller_game.currentZone = 5
                            controller_game.currentDepth = 5
                            Level.CreateFinalBossBattleConductor()
                        Default
                            Level.isBeastmaster = True
                            Level.CreateTrainingMap()
                    End Select
                Else If LevelType.MinCharacterSelect <= controller_game.currentLevel And controller_game.currentLevel <= LevelType.MaxCharacterSelect
                    Local characterID := controller_game.currentLevel + math.Abs(LevelType.MinCharacterSelect)

                    Local player := controller_game.players[playerID]
                    player.SetCharacter(characterID)

                    Level.isAllCharactersMode = False
                    Level.isAllCharactersDLCMode = False
                    Level.isSeededMode = False
                    Level.isHardcoreMode = False
                    Level.isDailyChallenge = False
                    Level.isDDRMode = False

                    controller_game.currentLevel = LevelType.Lobby
                    Level.CreateLobby()
                End If
        End Select

        If Level.isFloorIsLavaMode
            For Local tilesOnXNode := EachIn Level.tiles
                For Local tileNode := EachIn tilesOnXNode.Value()
                    Local tile := tileNode.Value()
                    If Not tile.trigger
                        If tile.IsNormalFloor()
                            If Not Util.IsAnyPlayerAt(tile.x, tile.y) And
                               Shrine.GetShrineAt(tile.x, tile.y - 1) = Null
                                Level.PlaceTileRemovingExistingTiles(tile.x, tile.y, TileType.HotCoal)
                            End If
                        End If

                        If tile.IsDoor()
                            Level.PlaceTileRemovingExistingTiles(tile.x, tile.y, TileType.HotCoal)
                        End If
                    End If
                End For
            End For

            While Not Chest.chestList.IsEmpty()
                Local chest := Chest.chestList.First()
                chest.Open(Null)
            End While
        End If

        Local creatingMapEnd := app.Millisecs()

        Local creatingMapDuration = creatingMapStart - creatingMapEnd
        Debug.Log("Level generation completed in " + creatingMapDuration + " ms")

        If Shrine.paceShrineActive
            Local firstPlayer := controller_game.players[0]
            If firstPlayer.paceBeat = -1
                Local itemName := Item.GetRandomItemInClass("", controller_game.currentLevel, "chestChance", Chest.CHEST_COLOR_NONE, False, "", True)
                New Item(0, 1, itemName, False, -1, False)
            End If
        End If

        Level.skipNextPenaltyBox = False
        Level.creatingMap = False

        If Level.isHardMode
            Debug.TraceNotImplemented("Level.NewLevel(Int, Int, Int, Bool, LevelObject, Bool) (Hard Mode)")
        End If

        If controller_game.currentLevel <= 0
            Crate.fallenCrates.Clear()
            Crate.fallenGargoyles.Clear()
        Else
            Crate.ProcessFallenCrates()
        End If

        If isTrainingLevel

        Else If Level.isTrainingMode

        End If

        If isTrainingLevel
            If Level.isDDRMode
                For Local i := 0 Until controller_game.numPlayers
                    Local player := controller_game.players[i]
                    If player <> Null
                        Select player.characterID
                            Case Character.Aria,
                                 Character.Melody,
                                 Character.Coda
                                player.AddItemOfType("armor_glass", Null, True, False)
                                player.AddItemOfType("spell_fireball", Null, True, False)
                                player.AddItemOfType("spell_heal", Null, True, False)
                            Case Character.Eli,
                                 Character.Nocturna
                                player.health.Reset(10)
                                player.AddItemOfType("spell_fireball", Null, True, False)
                                player.AddItemOfType("spell_heal", Null, True, False)
                            Case Character.Dove
                                player.health.Reset(10)
                                player.AddItemOfType("spell_heal", Null, True, False)
                            Case Character.Diamond
                                player.health.Reset(10)
                            Default
                                player.ownedItems.Set("weapon", Item.NoItem)
                                player.AddItemOfType("weapon_broadsword", Null, True, False)
                                player.health.Reset(10)
                                player.AddItemOfType("spell_fireball", Null, True, False)
                                player.AddItemOfType("spell_heal", Null, True, False)
                        End Select
                    End If
                End For
            End If

            Tile.anyPlayerHaveRingOfShadowsCachedFrame = -1
            Tile.anyPlayerHaveCompassCachedFrame = -1
            Tile.anyPlayerHaveZoneMapCachedFrame = -1
            Tile.anyPlayerHaveMonocleCachedFrame = -1
            Tile.anyPlayerHaveRingOfLuckCachedFrame = -1
            Tile.anyPlayerHaveSunglassesCachedFrame = -1
            Entity.anyPlayerHaveCircletCachedFrame = -1;
            Entity.anyPlayerHaveGlassTorchCachedFrame = -1;
            Entity.anyPlayerHaveForesightTorchCachedFrame = -1;
            Entity.anyPlayerHaveWallsTorchCachedFrame = -1;
            Entity.anyPlayerHaveNazarCharmCachedFrame = -1;

            If Not Level.isReplaying And
               Not Level.isLevelEditor And
               randSeed = 0
                For Local i := 0 Until controller_game.numPlayers
                    Local player := controller_game.players[i]
                    player.health.Refill()
                End For

                Chain.kills = 0

                If Not continuedRun
                    Level.usedCustomMusic = False
                End If

                ' TODO: Probably not correct.
                Local hadWeapon := False
                If hadWeapon
                    Level.todaysRandSeedString = ""
                End If

                Local replay := New Replay()
                replay.startingLevel = controller_game.currentLevel
                replay.startingZone = controller_game.currentZone
                replay.saveData = ""
                replay.startingGold = Player.numCoins

                Local player1 := controller_game.players[controller_game.player1]
                replay.hasBroadsword = player1.HasItemOfType("weapon_broadsword", False)
            End If
        End If

        If Level.replay <> Null And
           Not Level.isReplaying
            Level.replay.NewLevel(randSeed)
        End If

        If isTrainingLevel And
           Not Level.isLevelEditor And
           levelObj = Null And
           Not Level.isHardcoreMode And
           Not Level.isDailyChallenge
            Debug.TraceNotImplemented("Level.NewLevel(Int, Int, Int, Bool, LevelObject, Bool) (Training level)")
        End If

        Level.RecalcLevelBoundaries()

        For Local i := 0 Until Chain.waitingForFirstMovement.Length()
            Chain.waitingForFirstMovement[i] = True
        End For

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            player.CancelTween()
            player.falling = False
        End For

        Camera.fadeOutDuration = 0
        Camera.fadeOutCurrent = 0
        Camera.fadeOutCallback = Null
        Camera.fadeInDuration = 0
        Camera.fadeInCurrent = 0
        Camera.fadeInCallback = Null

        Enemy.ApplyMonkeyPawAll()

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player.HasItemOfType("ring_regeneration", False) Or
               player.HasItemOfType("ring_wonder", False)
                player.Heal(2, False, True, False)
            End If
        End For

        If controller_game.currentLevel = LevelType.Level1 And
           controller_game.currentDepth = 1
            Level.isRunNoItemsNoShrines = True
        End If

        Level.LoadLevelSong()

        Select controller_game.currentLevel
            Case LevelType.BossBattle,
                 LevelType.FinalBossBattle
                If GameData.GetEnableBossIntros() And
                   Not Level.isReplaying
                    New ControllerBossIntro(controller_game.controllerGamePointer, Level.bossNumber)
                End If
        End Select

        If Level.mentorLevel <> -1
            Local firstPlayer := controller_game.players[0]
            firstPlayer.SetCharacter(Character.Bard)
            firstPlayer.SetTotallyBlank()
            firstPlayer.health.Damage(firstPlayer.health.Get() - 1)
        End If

        Level.DumpMap()

        Debug.TraceNotImplemented("Level.NewLevel(Int, Int, Int, Bool, LevelObject, Bool)")
    End Function

    Function PadWalls: Void()
        Debug.Log("PADWALLS: Padding walls")

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsWall()
                    Local x := tilesOnXNode.Key()
                    Local y := tileNode.Key

                    Level.RandomWalkOfTempTiles(x, y, 2)
                End If
            End For
        End For

        For Local location := EachIn Level.tempTileWalk
            Local x := location.x
            Local y := location.y
            If Not Level.GetTileAt(x, y)
                New Tile(x, y, TileType.CorridorDirtWall, False, -1)
            End If
        End For

        Level.tempTileWalk.Clear()
    End Function

    Function PaintTriggerInterior: Void(x: Int, y: Int, w: Int, h: Int, trigger: Int)
        For Local a := x + 1 To x + w - 1
            For Local b := y + 1 To y + h - 1
                Level.GetTileAt(a, b).SetTrigger(trigger)
            End For
        End For
    End Function

    Function PawnSlot: Void(slotName: String, ent: Entity)
        Debug.TraceNotImplemented("Level.PawnSlot(String, Entity)")
    End Function

    Function PlaceAdditionalChestAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceAdditionalChestAt(Int, Int)")
    End Function

    Function PlaceAppropriateMinibosses: Void(room: RoomBase)
        Local weights := New WeightedPicker()
        Local minibossTypes := New IntStack()

        Select controller_game.currentZone
            Case 1
                weights.Push(1)
                minibossTypes.Push(EnemyBaseType.Dragon)
                weights.Push(1)
                minibossTypes.Push(EnemyBaseType.Minotaur)

                If controller_game.currentLevel <= 2
                    weights.Push(1)
                    minibossTypes.Push(EnemyBaseType.BatMiniboss)
                End If
            Case 4
                weights.Push(20)
                minibossTypes.Push(EnemyBaseType.Dragon)
                weights.Push(15)
                minibossTypes.Push(EnemyBaseType.Banshee)
                weights.Push(15)
                minibossTypes.Push(EnemyBaseType.Nightmare)
                weights.Push(25)
                minibossTypes.Push(EnemyBaseType.Ogre)
                weights.Push(25)
                minibossTypes.Push(EnemyBaseType.Mommy)
            Case 5
                weights.Push(2)
                minibossTypes.Push(EnemyBaseType.Dragon)
                weights.Push(1)
                minibossTypes.Push(EnemyBaseType.Minotaur)
                weights.Push(1)
                minibossTypes.Push(EnemyBaseType.MetroGnome)
            Default
                weights.Push(25)
                minibossTypes.Push(EnemyBaseType.Dragon)
                weights.Push(15)
                minibossTypes.Push(EnemyBaseType.BatMiniboss)
                weights.Push(20)
                minibossTypes.Push(EnemyBaseType.Banshee)
                weights.Push(15)
                minibossTypes.Push(EnemyBaseType.Nightmare)
                weights.Push(25)
                minibossTypes.Push(EnemyBaseType.Minotaur)
        End Select

        Debug.Assert(weights.Length() = minibossTypes.Length())

        Local numMinibosses := 1

        If Shrine.bossShrineActive Then numMinibosses += 1

        If Level.isHardMode Or
           Util.IsCharacterActive(Character.Tempo)
            Local hardModeNode := Level.GetHardModeXML()
            Local extraMinibossesPerExit := item.GetInt(hardModeNode, "extraMinibossesPerExit", 0)

            numMinibosses += extraMinibossesPerExit
        End If

        Local placedMinibossTypes := New IntStack()
        Local minibossPoint := Level.GetStandardExitCoords()

        For Local i := 0 Until numMinibosses
            If i > 0
                minibossPoint = Level.GetRandPointInRoomWithOptions(room, True, True, False)
                If minibossPoint = Null Then Exit
            End If

            Local minibossesPlacedFlags := New IntStack()
            Local minibossPlacedFlagsMin := 999999

            For Local minibossType := EachIn minibossTypes
                Local minibossPlacedFlags := 0

                For Local previousLevelMiniboss := EachIn Level.previousLevelMinibosses
                    If minibossType = Enemy.GetBaseType(previousLevelMiniboss) Then minibossPlacedFlags += 1
                End For

                For Local placedMinibossType := EachIn placedMinibossTypes
                    If minibossType = placedMinibossType Then minibossPlacedFlags += 2
                End For

                minibossesPlacedFlags.Push(minibossPlacedFlags)

                minibossPlacedFlagsMin = math.Min(minibossPlacedFlagsMin, minibossPlacedFlags)
            End For

            For Local j := 0 Until weights.Length()
                Local minibossPlacedFlags := minibossesPlacedFlags.Get(j)

                Local enabled := False
                If minibossPlacedFlags = minibossPlacedFlagsMin Then enabled = True

                weights.SetEnabled(j, enabled)
            End For

            Local minibossTypeIndex := weights.PickRandom(True)
            Local minibossType := minibossTypes.Get(minibossTypeIndex)
            placedMinibossTypes.Push(minibossType)

            Local miniboss := Level.PlaceMinibossOfShapeAt(minibossType, minibossPoint.x, minibossPoint.y)
            miniboss.isStairLockingMiniboss = True

            Local dragon := Dragon(miniboss)
            If dragon <> Null
                dragon.seekDistance = 0
                If dragon.level = 2 Then dragon.seekDistance = 10

                dragon.dontMove = True
            End If

            Local metroGnome := MetroGnome(miniboss)
            If metroGnome <> Null
                metroGnome.originX = minibossPoint.x
                metroGnome.originY = minibossPoint.y
            End If
        End For
    End Function

    Function PlaceChests: Void(freeBroadSword: Bool)
        Local trapChestRoll := Util.RndIntRangeFromZero(99, True)
        Local placeTrapChest := False

        Select controller_game.currentLevel
            Case 1 If trapChestRoll <=  0 Then placeTrapChest = True
            Case 2 If trapChestRoll <=  3 Then placeTrapChest = True
            Case 3 If trapChestRoll <=  7 Then placeTrapChest = True
            Case 4 If trapChestRoll <= 10 Then placeTrapChest = True
            Default
                If controller_game.currentLevel >= 5
                    If trapChestRoll <= 13 Then placeTrapChest = True
                End If
        End Select

        If Player.DoesPlayer1HaveItemOfType("weapon_broadsword") Then freeBroadSword = False
        If Util.IsCharacterActive(Character.Diamond) Then freeBroadSword = False
        If Level.isHardcoreMode Then freeBroadSword = False

        Debug.Log("PLACECHESTS: Placing chests: " + Level.chestsStillToPlace)

        Local usedRooms := New IntSet()
        Local placedDiamonds := False

        Local i := 100
        While Level.chestsStillToPlace > 0 Or
              Level.DoWePlaceAdditionalChestThisLevel()
            i -= 1
            If i <= 0 Then Exit

            Local roomIndex := Util.RndIntRangeFromZero(Level.rooms.Count() - 1, True)

            If usedRooms.Contains(roomIndex) Then Continue

            Local roomsArray := Level.rooms.ToArray()
            Local room := roomsArray[roomIndex]

            Select room.type
                Case RoomType.Shop,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            If room.hasExit Then Continue

            usedRooms.Insert(roomIndex)

            Local point: Point

            For Local j := 0 Until 40
                If Level.chestsStillToPlace <= 0 And
                   Not Level.DoWePlaceAdditionalChestThisLevel()
                    Exit
                End If

                point = Level.GetRandPointInRoomWithOptions(room, True, True, False)
                If point = Null Then Continue

                If Not Level.IsTileTypeAdjacent(point.x, point.y, TileType.CorridorFloor) And
                   Not Level.IsDoorAdjacent(point.x, point.y)
                    Exit
                End If
            End For

            If point = Null Then Continue

            If Level.DoWePlaceAdditionalChestThisLevel()
                Level.PlaceAdditionalChestAt(point.x, point.y)

                Continue
            End If

            If placeTrapChest And
               (placedDiamonds Or Level.isHardcoreMode)
                Local trapChestLevelRoll := Util.RndIntRangeFromZero(9, True)
                If Level.chestsStillToPlace > 0
                    Select trapChestLevelRoll
                        Case 0  New TrapChest(point.x, point.y, 3)
                        Case 1  New TrapChest(point.x, point.y, 2)
                        Default New TrapChest(point.x, point.y, 1)
                    End Select
                End If

                Level.chestsStillToPlace -= 1
                placeTrapChest = False

                Continue
            End If

            If freeBroadSword
                Debug.TraceNotImplemented("Level.PlaceChests(Bool) (Free BroadSword section)")

                Local itemName: String

                For Local k := 0 Until GameData.GetNumPendingSpawnItems()
                    itemName = GameData.GetPendingSpawnItem(k)
                    Local itemSlot := Item.GetSlot(itemName)

                    If itemSlot = "weapon"
                        GameData.RemovePendingSpawnItem(itemName)
                    End If
                End For

                If itemName <> ""
                    New Chest(point.x, point.y, itemName, False, False, False, Chest.CHEST_COLOR_NONE)
                    Level.chestsStillToPlace -= 1
                    freeBroadSword = False

                    Continue
                End If

                Local weaponQualityRoll := Util.RndIntRangeFromZero(99, True)
                Local weaponQuality := 0
                If weaponQualityRoll < 10 Then weaponQuality = 1
                If weaponQualityRoll < 20 Then weaponQuality = 2
                If weaponQualityRoll < 25 Then weaponQuality = 3
                If weaponQualityRoll = 25 Then weaponQuality = 4

                Local contents: String

                Local weaponTypeRoll := Util.RndIntRangeFromZero(99, True)
                If weaponTypeRoll <= 40
                    Select weaponQuality
                        Case 1  contents = "weapon_golden_broadsword"
                        Case 2  contents = "weapon_blood_broadsword"
                        Case 3  contents = "weapon_titanium_broadsword"
                        Case 4  contents = "weapon_obsidian_broadsword"
                        Default contents = "weapon_broadsword"
                    End Select
                Else If weaponTypeRoll <= 55
                    Select weaponQuality
                        Case 1  contents = "weapon_golden_rapier"
                        Case 2  contents = "weapon_blood_rapier"
                        Case 3  contents = "weapon_titanium_rapier"
                        Case 4  contents = "weapon_obsidian_rapier"
                        Default contents = "weapon_rapier"
                    End Select
                End If

                Continue
            End If

            If placedDiamonds Or Level.isHardcoreMode
                If Level.chestsStillToPlace > 0
                    New Chest(point.x, point.y, Item.NoItem, False, False, False, Chest.CHEST_COLOR_NONE)
                End If

                Level.chestsStillToPlace -= 1
            Else
                Level.PlaceZoneAppropriateNumberOfDiamondsAt(point.x, point.y)
                Level.chestsStillToPlace -= 1
                placedDiamonds = True
            End If
        End While

        If Level.chestsStillToPlace > 0
            Debug.Log("PLACECHESTS: ********* Failed to place all the chests!: " + Level.chestsStillToPlace)
        End If
    End Function

    Function PlaceConnectedWireDoor: Void(p: Point)
        Local wiredDoor := Level.PlaceTileRemovingExistingTiles(p.x, p.y, TileType.WiredDoor)

        For Local d := 0 Until 3
            Local offset := Util.GetPointFromDir(d)
            Local connectionPoint := p.Add(offset)

            If Level.IsFloorAt(connectionPoint.x, connectionPoint.y)
                wiredDoor.AddWireConnection(d)
            End If
        End For
    End Function

    Function PlaceCrateOrBarrel: Void()
        Debug.Log("CREATEMAP: Placing crate or barrel")

        Local failedRooms := New IntMap<Int>()

        Local i := 100
        For i = i - 1 Until 0 Step -1
            Local roomIndex := Util.RndIntRangeFromZero(Level.rooms.Count() - 1, True)
            If Not failedRooms.Contains(roomIndex)
                Local roomsArray := Level.rooms.ToArray()
                Local room := roomsArray[roomIndex]

                Select room.type
                    Case RoomType.Shop,
                         RoomType.Secret,
                         RoomType.Vault
                        Continue
                End Select

                If room.hasExit Then Continue

                failedRooms.Add(roomIndex, 1)

                For Local j := 40 Until 0 Step -1
                    Local point := Level.GetRandPointInRoomWithOptions(room, True, True, False)
                    If point = Null Then Continue

                    ' This is not equivalent to `Level.IsCorridorFloorOrDoorAdjacent`.
                    ' `Level.IsDoorAdjacent` does not count open Metal Doors.
                    If Not Level.IsTileTypeAdjacent(point.x, point.y, TileType.CorridorFloor) And
                       Not Level.IsDoorAdjacent(point.x, point.y)
                        Level.PutCrateOrBarrel(point.x, point.y)

                        Return
                    End If
                End For
            End If
        End For

        Debug.Log("CREATEMAP: ********* Failed to place a crate or barrel")
    End Function

    Function PlaceEnemies: Void()
        Debug.Log("PLACEENEMIES")

        Select controller_game.currentZone
            Case 5 Level.PlaceEnemiesZone5()
            Case 4 Level.PlaceEnemiesZone4()
            Case 3 Level.PlaceEnemiesZone3()
            Case 2 Level.PlaceEnemiesZone2()
            Default Level.PlaceEnemiesZone1()
        End Select

        If Util.IsCharacterActive(Character.Aria) Or
           Util.IsCharacterActive(Character.Coda) Or
           Util.IsCharacterActive(Character.Dove) Or
           Util.IsCharacterActive(Character.Bolt)
            Local maxEnemies := 0

            If Player.DoesAnyPlayerHaveItemOfType("ring_war", False)
                maxEnemies = 5
            End If

            maxEnemies += 5 * Level.GetHardModeExtraEnemies()

            maxEnemies += controller_game.currentLevel

            Select controller_game.currentZone
                Case 1,
                     4
                    maxEnemies += 24
                Case 3
                    maxEnemies += 17
                Default
                    maxEnemies += 20
            End Select

            If Level.isHardcoreMode
                maxEnemies += 3

                If controller_game.currentZone = 3
                    maxEnemies -= 1
                End If
            End If

            Enemy.CullEnemiesDownTo(maxEnemies)
        End If

        If Level.placeLordOnLevel = -1
            Level.placeLordOnLevel = Util.RndIntRangeFromZero(11, True)
        End If

        If controller_game.currentLevel <= 3 And
           (controller_game.currentDepth * controller_game.currentLevel) = Level.placeLordOnLevel
            Enemy.CreateLord()
        End If

        If Player.DoesAnyPlayerHaveItemOfType("ring_peace", False) Or
           Level.isDDRMode
            Local i := 500
            Local numEnemiesToCull := 8

            For i = i - 1 Until 0 Step -1
                Local enemyIndex := Util.RndIntRangeFromZero(Enemy.enemyList.Count() - 1, False)
                Local enemies := Enemy.enemyList.ToArray()
                Local enemy := enemies[enemyIndex]

                If Not enemy.isNPC And
                   Not enemy.isSarcophagus And
                   Not enemy.containsItem And
                   enemy.level <= 1 And
                   Not enemy.isMiniboss And
                   Not enemy.dead And
                   Not enemy.isLord
                    numEnemiesToCull -= 1
                    enemy.Cull()
                End If

                If numEnemiesToCull <= 0 Then Exit
            End For
        End If
    End Function

    Function PlaceEnemiesZone1: Void()
        Debug.Log("PLACEENEMIES: Placing zone 1 enemies")

        For Local room := EachIn Level.rooms
            Select room.type
                Case RoomType.Shop,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            If room.hasExit
                Level.PlaceAppropriateMinibosses(New RectRoom(room))

                Local exitCoords := Level.GetStandardExitCoords()
                Level.PlaceShopkeeperGhostIfNeededAt(exitCoords.x, exitCoords.y)
            End If

            If Level.GetRandPointInRoomWithOptions(room, False, True, False) = Null Then Continue

            Level.PlaceRareEnemies(New RectRoom(room), room.hasExit)

            Local extraEnemies := Level.GetExtraEnemiesBase()

            If Util.IsCharacterActive(Character.Aria)
                extraEnemies += 2
            End If

            Local point: Point

            Local i := 500
            For i = i - 1 Until 0 Step -1
                If extraEnemies <= 0 Then Exit

                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                extraEnemies -= 1

                Local enemyRoll := Util.RndIntRangeFromZero(3, True)
                Select enemyRoll
                    Case 0
                        New Wraith(point.x, point.y, 1)
                    Case 1
                        point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                        If point = Null Then Continue

                        Local batLevel := Util.RndIntRange(1, 2, True, -1)
                        New Bat(point.x, point.y, batLevel)
                    Case 2
                        Local skeletonLevel := Util.RndIntRange(2, 3, True, -1)
                        New Skeleton(point.x, point.y, skeletonLevel)
                    Default
                        New Ghost(point.x, point.y, 1)
                End Select
            End For

            Select controller_game.currentLevel
                Case 1
                    Local batRoll := Util.RndIntRangeFromZero(5, True)
                    If batRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Bat(point.x, point.y, 1)
                    End If

                    Local monkeyRoll := Util.RndIntRangeFromZero(4, True)
                    If monkeyRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Monkey(point.x, point.y, 1)
                    End If

                    Local zombieRoll := Util.RndIntRangeFromZero(4, True)
                    If zombieRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Zombie(point.x, point.y, 1)
                    End If

                    If room.hasExit
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 1)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Monkey(point.x, point.y, 1)

                        If Util.IsCharacterActive(Character.Aria)
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Sarcophagus(point.x, point.y, 1)
                        End If
                    End If

                    point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                    If point = Null Then Continue

                    New Slime(point.x, point.y, 2)

                    Local skeletonRoll := Util.RndIntRangeFromZero(4, True)
                    If skeletonRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 1)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Slime(point.x, point.y, 1)
                    End If

                    Local slimeRoll := Util.RndBool(True)
                    If slimeRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                        If point = Null Then Continue

                        New Slime(point.x, point.y, 2)
                    End If

                    Local slimeRoll2 := Util.RndBool(True)
                    If slimeRoll2
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Slime(point.x, point.y, 1)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 1)
                    End If
                Case 2
                    Local batRoll := Util.RndBool(True)
                    If batRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Bat(point.x, point.y, 1)
                    End If

                    Local wraithRoll := Util.RndIntRangeFromZero(5, True)
                    If wraithRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Wraith(point.x, point.y, 1)
                    End If

                    Local zombieRoll := Util.RndIntRangeFromZero(3, True)
                    If zombieRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Zombie(point.x, point.y, 1)
                    End If

                    Local ghostRoll := Util.RndIntRangeFromZero(2, True)
                    If ghostRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Ghost(point.x, point.y, 1)
                    Else
                        Local monkeyRoll := Util.RndIntRangeFromZero(4, True)
                        If monkeyRoll = 0
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Monkey(point.x, point.y, 1)
                        Else
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            Local skeletonLevelRoll := Util.RndBool(True)
                            If skeletonLevelRoll
                                New Skeleton(point.x, point.y, 1)
                            Else
                                New Skeleton(point.x, point.y, 2)
                            End If
                        End If
                    End If

                    Local monkeyRoll := Util.RndIntRangeFromZero(7, True)
                    If monkeyRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Monkey(point.x, point.y, 1)
                    End If

                    If room.hasExit
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 2)

                        point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                        If point = Null Then Continue

                        New Slime(point.x, point.y, 3)

                        If Util.IsCharacterActive(Character.Aria)
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Sarcophagus(point.x, point.y, 2)
                        End If
                    End If

                    point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                    If point = Null Then Continue

                    New Slime(point.x, point.y, 2)

                    Local slimeRoll := Util.RndIntRangeFromZero(4, True)
                    If slimeRoll <> 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                        If point = Null Then Continue

                        New Slime(point.x, point.y, 3)
                    End If

                    Local slimeRoll2 := Util.RndBool(True)
                    If slimeRoll2
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Slime(point.x, point.y, 1)
                    End If
                Default
                    Local ghostRoll := Util.RndIntRangeFromZero(6, True)
                    If ghostRoll <> 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Ghost(point.x, point.y, 1)
                    End If

                    Local wraithRoll := Util.RndBool(True)
                    If wraithRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Wraith(point.x, point.y, 1)
                    End If

                    Local wraithRoll2 := Util.RndIntRangeFromZero(4, True)
                    If wraithRoll2 = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Wraith(point.x, point.y, 1)
                    End If

                    Local skeletonRoll := Util.RndIntRangeFromZero(2, True)
                    If skeletonRoll <> 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 2)
                    End If

                    Local skeletonRoll2 := Util.RndBool(True)
                    If skeletonRoll2
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 2)
                    End If

                    Local skeletonRoll3 := Util.RndIntRangeFromZero(5, True)
                    If skeletonRoll3 = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 3)
                    End If

                    Local skeletonRoll4 := Util.RndIntRangeFromZero(2, True)
                    If skeletonRoll4 = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 3)
                    End If

                    Local batRoll := Util.RndIntRangeFromZero(3, True)
                    If batRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Bat(point.x, point.y, 2)
                    End If

                    Local batRoll2 := Util.RndIntRangeFromZero(2, True)
                    If batRoll2 = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Bat(point.x, point.y, 1)
                    End If

                    Local zombieRoll := Util.RndBool(True)
                    If zombieRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Zombie(point.x, point.y, 1)
                    End If

                    Local monkeyRoll := Util.RndIntRangeFromZero(3, True)
                    If monkeyRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Monkey(point.x, point.y, 1)
                    End If

                    Local monkeyRoll2 := Util.RndIntRangeFromZero(3, True)
                    If monkeyRoll2 = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Monkey(point.x, point.y, 2)
                    End If

                    If room.hasExit
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 3)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Monkey(point.x, point.y, 2)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Slime(point.x, point.y, 1)

                        If Util.IsCharacterActive(Character.Aria)
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Sarcophagus(point.x, point.y, 3)
                        End If
                    End If

                    Local numEnemies := math.Floor((controller_game.currentLevel - 3) * 0.5)
                    Local i := 500

                    For i = i - 1 Until 0 Step -1
                        If numEnemies <= 0 Then Exit

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        Local enemyRoll := Util.RndIntRangeFromZero(3, True)
                        Select enemyRoll
                            Case 0
                                New Wraith(point.x, point.y, 1)
                            Case 1
                                point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                                If point = Null Then Continue

                                New Slime(point.x, point.y, 3)
                            Case 2
                                New Skeleton(point.x, point.y, 3)
                            Default
                                New Monkey(point.x, point.y, 2)
                        End Select
                    End For

                    Local slimeRoll := Util.RndIntRangeFromZero(3, True)
                    If slimeRoll <> 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                        If point = Null Then Continue

                        New Slime(point.x, point.y, 3)
                    End If
            End Select
        End For

        If Util.IsCharacterActive(Character.Aria)
            Debug.TraceNotImplemented("Level.PlaceEnemiesZone1() (Aria)")
        End If

        If Util.IsCharacterActive(Character.Tempo)
            Debug.TraceNotImplemented("Level.PlaceEnemiesZone1() (Tempo)")
        End If
    End Function

    Function PlaceEnemiesZone2: Void()
        Debug.Log("PLACEENEMIES: Placing zone 2 enemies")

        For Local room := EachIn Level.rooms
            Select room.type
                Case RoomType.Shop,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            If room.hasExit
                Local lastRoom := New RectRoom(room)
                Level.PlaceAppropriateMinibosses(lastRoom)

                Local exitCoords := Level.GetStandardExitCoords()
                Level.PlaceShopkeeperGhostIfNeededAt(exitCoords.x, exitCoords.y)
            End If

            Local point := Level.GetRandPointInRoomWithOptions(room, True, True, False)
            If point = Null Then Continue

            New MushroomLight(point.x, point.y, 1)

            Local mushroomLightRoll := Util.RndIntRangeFromZero(10, True)
            If mushroomLightRoll = 0
                point = Level.GetRandPointInRoomWithOptions(room, True, True, False)
                If point = Null Then Continue

                New MushroomLight(point.x, point.y, 1)
            End If

            Local rectRoom := New RectRoom(room)
            Level.PlaceRareEnemies(rectRoom, room.hasExit)

            Local extraEnemies := Level.GetExtraEnemiesBase()
            If Util.IsCharacterActive(Character.Aria)
                extraEnemies += 1
            End If

            Local i := 500
            For Local i = i - 1 Until 0 Step -1
                If extraEnemies <= 0 Then Exit

                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                extraEnemies -= 1

                Local enemyTypeRoll := Util.RndIntRangeFromZero(4, True)
                Select enemyTypeRoll
                    Case 0
                        New Wight(point.x, point.y, 1)
                    Case 1
                        point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                        If point = Null Then Continue

                        Local skeletonMageLevelRoll := Util.RndIntRange(2, 3, True, -1)
                        New SkeletonMage(point.x, point.y, skeletonMageLevelRoll)
                    Case 2
                        Local armoredSkeletonLevelRoll := Util.RndIntRange(2, 3, True, -1)
                        New ArmoredSkeleton(point.x, point.y, armoredSkeletonLevelRoll)
                    Case 3
                        Local batLevelRoll := Util.RndIntRange(1, 2, True, -1)
                        New Bat(point.x, point.y, batLevelRoll)
                    Default
                        Local armadilloLevelRoll := Util.RndIntRange(1, 2, True, -1)
                        New Armadillo(point.x, point.y, armadilloLevelRoll)
                End Select
            End For

            Select controller_game.currentLevel
                Case 1
                    Local skeletonMageRoll := Util.RndBool(True)
                    If skeletonMageRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New SkeletonMage(point.x, point.y, 1)
                    End If

                    Local mushroomOrArmoredSkeletonRoll := Util.RndBool(True)
                    If mushroomOrArmoredSkeletonRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Mushroom(point.x, point.y, 1)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New ArmoredSkeleton(point.x, point.y, 1)
                    End If

                    Local armadilloRoll := Util.RndIntRangeFromZero(3, True)
                    If armadilloRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Armadillo(point.x, point.y, 1)
                    End If

                    Local mushroomOrGolemRoll := Util.RndIntRangeFromZero(2, True)
                    If mushroomOrGolemRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Golem(point.x, point.y, 1)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Mushroom(point.x, point.y, 1)
                    End If

                    If room.hasExit
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Golem(point.x, point.y, 1)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New ArmoredSkeleton(point.x, point.y, 1)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Armadillo(point.x, point.y, 1)

                        If Util.IsCharacterActive(Character.Aria)
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Sarcophagus(point.x, point.y, 1)
                        End If
                    End If

                    Local cloneOrArmoredSkeletonRoll := Util.RndIntRangeFromZero(2, True)
                    If cloneOrArmoredSkeletonRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Clone(point.x, point.y, 1)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New ArmoredSkeleton(point.x, point.y, 1)
                    End If
                Case 2
                    Local skeletonMageRoll := Util.RndBool(True)
                    If skeletonMageRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        Local skeletonMageLevelRoll := Util.RndIntRange(1, 2, True, -1)
                        New SkeletonMage(point.x, point.y, skeletonMageLevelRoll)
                    End If

                    Local wightOrMoleRoll := Util.RndIntRangeFromZero(5, True)
                    If wightOrMoleRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Wight(point.x, point.y, 1)
                    Else
                        Local moleRoll := Util.RndBool(True)
                        If moleRoll
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Mole(point.x, point.y, 1)
                        End If
                    End If

                    Local golemOrMushroomRoll := Util.RndIntRangeFromZero(2, True)
                    If golemOrMushroomRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Golem(point.x, point.y, 1)
                    Else
                        Local mushroomRoll := Util.RndBool(True)
                        If mushroomRoll
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Mushroom(point.x, point.y, 1)
                        End If
                    End If

                    If room.hasExit
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Golem(point.x, point.y, 2)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New ArmoredSkeleton(point.x, point.y, 2)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Armadillo(point.x, point.y, 1)

                        If Util.IsCharacterActive(Character.Aria)
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Sarcophagus(point.x, point.y, 2)
                        End If
                    End If

                    Local cloneOrArmoredSkeletonRoll := Util.RndIntRangeFromZero(2, True)
                    If cloneOrArmoredSkeletonRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Clone(point.x, point.y, 1)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New ArmoredSkeleton(point.x, point.y, 1)
                    End If

                    Local armadilloOrMushroomRoll := Util.RndBool(True)
                    If armadilloOrMushroomRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        Local armadilloLevelRoll := Util.RndIntRange(1, 2, True, -1)
                        New Armadillo(point.x, point.y, armadilloLevelRoll)
                    Else
                        Local mushroomRoll := Util.RndBool(True)
                        If mushroomRoll
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Mushroom(point.x, point.y, 2)
                        End If
                    End If

                    Local batRoll := Util.RndIntRangeFromZero(4, True)
                    If batRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Bat(point.x, point.y, 1)
                    End If
                Default
                    Local skeletonMageRoll := Util.RndBool(True)
                    If skeletonMageRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        Local skeletonMageLevelRoll := Util.RndIntRange(2, 3, True, -1)
                        New SkeletonMage(point.x, point.y, skeletonMageLevelRoll)
                    End If

                    Local wightOrMoleRoll := Util.RndIntRangeFromZero(4, True)
                    If wightOrMoleRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Wight(point.x, point.y, 1)
                    Else
                        Local moleRoll := Util.RndBool(True)
                        If moleRoll
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Mole(point.x, point.y, 1)
                        End If
                    End If

                    Local golemOrMushroomRoll := Util.RndIntRangeFromZero(2, True)
                    If golemOrMushroomRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Golem(point.x, point.y, 2)
                    Else
                        Local mushroomRoll := Util.RndBool(True)
                        If mushroomRoll
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Mushroom(point.x, point.y, 2)
                        End If
                    End If

                    If room.hasExit
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Golem(point.x, point.y, 2)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New ArmoredSkeleton(point.x, point.y, 3)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Armadillo(point.x, point.y, 2)

                        If Util.IsCharacterActive(Character.Aria)
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = Null Then Continue

                            New Sarcophagus(point.x, point.y, 3)
                        End If
                    End If

                    Local cloneOrArmoredSkeletonRoll := Util.RndIntRangeFromZero(2, True)
                    If cloneOrArmoredSkeletonRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Clone(point.x, point.y, 1)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New ArmoredSkeleton(point.x, point.y, 2)
                    End If

                    Local armoredSkeletonRoll := Util.RndIntRangeFromZero(2, True)
                    If armoredSkeletonRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New ArmoredSkeleton(point.x, point.y, 3)
                    End If

                    Local armadilloOrMushroomRoll := Util.RndIntRangeFromZero(3, True)
                    If armadilloOrMushroomRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        Local armadilloLevelRoll := Util.RndIntRange(1, 2, True, -1)
                        New Armadillo(point.x, point.y, armadilloLevelRoll)
                    Else
                        Local mushroomRoll := Util.RndBool(True)
                        If mushroomRoll
                            New Mushroom(point.x, point.y, 2)
                        End If
                    End If

                    Local batRoll := Util.RndIntRangeFromZero(3, True)
                    If batRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Bat(point.x, point.y, 1)
                    End If

                    Local batRoll2 := Util.RndIntRangeFromZero(4, True)
                    If batRoll2 = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Bat(point.x, point.y, 2)
                    End If

                    Local tarMonsterRoll := Util.RndIntRangeFromZero(2, True)
                    If tarMonsterRoll = 0
                        point = Level.GetRandPointInRoomOfTileType(New RectRoom(room), TileType.Tar, True)
                        If point = Null Then Continue

                        New TarMonster(point.x, point.y, 1)
                    End If
            End Select
        End For

        If Util.IsCharacterActive(Character.Aria)
            Debug.TraceNotImplemented("Level.PlaceEnemiesZone2() (Aria)")
        End If

        If Util.IsCharacterActive(Character.Tempo)
            Debug.TraceNotImplemented("Level.PlaceEnemiesZone2() (Tempo)")
        End If
    End Function

    Function PlaceEnemiesZone3: Void()
        Debug.Log("PLACEENEMIES: Placing zone 3 enemies")

        For Local room := EachIn Level.rooms
            Select room.type
                Case RoomType.Shop,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            If room.hasExit
                Level.PlaceAppropriateMinibosses(New RectRoom(room))

                Local exitCoords := Level.GetStandardExitCoords()
                Level.PlaceShopkeeperGhostIfNeededAt(exitCoords.x, exitCoords.y)
            End If

            Local point := Level.GetRandPointInRoomWithOptions(room, True, True, False)
            If point = Null Then Continue

            Level.PlaceZone3Cauldron(point.x, point.y)

            Local cauldronRoll := Util.RndIntRangeFromZero(10, True)
            If cauldronRoll = 0
                point = Level.GetRandPointInRoomWithOptions(room, True, True, False)
                If point = null Then Continue

                Level.PlaceZone3Cauldron(point.x, point.y)
            End If

            Level.PlaceRareEnemies(New RectRoom(room), room.hasExit)

            Local extraEnemies := Level.GetExtraEnemiesBase()
            Local i := 500
            For i = i - 1 Until 0 Step -1
                If extraEnemies <= 0 Then Exit

                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = null Then Continue

                extraEnemies -= 1

                Select Util.RndIntRangeFromZero(4, True)
                    Case 0
                        Level.PlaceZone3YetiHellhound(point.x, point.y)
                    Case 1
                        ' NOTE: This value is not used.
                        point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                    Case 2
                        Local skeletonKnightLevel := Util.RndIntRange(2, 3, True, -1)
                        New SkeletonKnight(point.x, point.y, skeletonKnightLevel)
                    Default
                        Level.PlaceZone3Elemental(point.x, point.y)
                End Select
            End For

            Select controller_game.currentLevel
                Case 1
                    Local ghastRoll := Util.RndIntRangeFromZero(4, True)
                    If ghastRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New Ghast(point.x, point.y, 1)
                    End If

                    Local skeletonKnightRoll := Util.RndIntRangeFromZero(2, True)
                    If skeletonKnightRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New SkeletonKnight(point.x, point.y, 1)
                    End If

                    Local shoveMonsterOrSlimeRoll := Util.RndBool(True)
                    If shoveMonsterOrSlimeRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New ShoveMonster(point.x, point.y, 1)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3Slime(point.x, point.y)
                    End If

                    Local elementalOrGoblinRoll := Util.RndIntRangeFromZero(2, True)
                    If elementalOrGoblinRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        ' NOTE: The value for this roll is not checked.
                        Util.RndBool(True)

                        Level.PlaceZone3Elemental(point.x, point.y)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New Goblin(point.x, point.y, 1)
                    End If

                    If room.hasExit
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New Goblin(point.x, point.y, 1)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3YetiHellhound(point.x, point.y)

                        If Util.IsCharacterActive(Character.Aria)
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = null Then Continue

                            New Sarcophagus(point.x, point.y, 1)
                        End If
                    End If

                    point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                    If point = null Then Continue

                    Level.PlaceZone3Slime(point.x, point.y)
                Case 2
                    Local ghastRoll := Util.RndIntRangeFromZero(4, True)
                    If ghastRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New Ghast(point.x, point.y, 1)
                    End If

                    Local skeletonKnightRoll := Util.RndBool(True)
                    If skeletonKnightRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New SkeletonKnight(point.x, point.y, 2)
                    End If

                    Local shoveMonsterOrSlimeRoll := Util.RndBool(True)
                    If shoveMonsterOrSlimeRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New ShoveMonster(point.x, point.y, 1)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3Slime(point.x, point.y)
                    End If

                    Local beetleRoll := Util.RndIntRangeFromZero(5, True)
                    If beetleRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3Beetle(point.x, point.y)
                    End If

                    Local elementalOrGoblinRoll := Util.RndIntRangeFromZero(2, True)
                    If elementalOrGoblinRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        ' NOTE: The value for this roll is not checked.
                        Util.RndBool(True)

                        Level.PlaceZone3Elemental(point.x, point.y)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New Goblin(point.x, point.y, 1)
                    End If

                    If room.hasExit
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3YetiHellhound(point.x, point.y)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New Goblin(point.x, point.y, 2)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3Beetle(point.x, point.y)

                        If Util.IsCharacterActive(Character.Aria)
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = null Then Continue

                            New Sarcophagus(point.x, point.y, 2)
                        End If
                    End If

                    Local yetiHellhoundOrSlimeRoll := Util.RndIntRangeFromZero(4, True)
                    If yetiHellhoundOrSlimeRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3YetiHellhound(point.x, point.y)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3Slime(point.x, point.y)
                    End If
                Default
                    Local ghastRoll := Util.RndIntRangeFromZero(3, True)
                    If ghastRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New Ghast(point.x, point.y, 1)
                    End If

                    Local skeletonKnightOrYetiHellhoundRoll := Util.RndBool(True)
                    If skeletonKnightOrYetiHellhoundRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New SkeletonKnight(point.x, point.y, 3)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3YetiHellhound(point.x, point.y)
                    End If

                    Local shoveMonsterOrSlimeRoll := Util.RndBool(True)
                    If shoveMonsterOrSlimeRoll
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New ShoveMonster(point.x, point.y, 2)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3Slime(point.x, point.y)
                    End If

                    Local yetiHellhoundRoll := Util.RndIntRangeFromZero(5, True)
                    If yetiHellhoundRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3YetiHellhound(point.x, point.y)
                    End If

                    Local goblinOrElementalRoll := Util.RndIntRangeFromZero(2, True)
                    If goblinOrElementalRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Local goblinLevel := Util.RndIntRange(1, 2, True, -1)
                        New Goblin(point.x, point.y, goblinLevel)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        ' NOTE: The value for this roll is not checked.
                        Util.RndBool(True)

                        Level.PlaceZone3Elemental(point.x, point.y)
                    End If

                    If room.hasExit
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3YetiHellhound(point.x, point.y)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        New Goblin(point.x, point.y, 2)

                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3Beetle(point.x, point.y)

                        If Util.IsCharacterActive(Character.Aria)
                            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                            If point = null Then Continue

                            New Sarcophagus(point.x, point.y, 3)
                        End If
                    End If

                    Local beetleOrSlimeRoll := Util.RndIntRangeFromZero(4, True)
                    If beetleOrSlimeRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3Beetle(point.x, point.y)
                    Else
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = null Then Continue

                        Level.PlaceZone3Slime(point.x, point.y)
                    End If
            End Select
        End For

        If Util.IsCharacterActive(Character.Aria)
            Debug.TraceNotImplemented("Level.PlaceEnemiesZone3() (Aria section)")
        End If

        If Util.IsCharacterActive(Character.Tempo)
            Debug.TraceNotImplemented("Level.PlaceEnemiesZone3() (Tempo section)")
        End If
    End Function

    Function PlaceEnemiesZone4: Void()
        Debug.Log("PLACEENEMIES: Placing zone 4 enemies")

        For Local room := EachIn Level.rooms
            Select room.type
                Case RoomType.Shop,
                     RoomType.Start,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            If room.hasExit
                Level.PlaceExitRoomMiniboss(New RectRoom(room))
            End If

            Level.PlaceRareEnemies(New RectRoom(room), room.hasExit)

            Local extraEnemies := Level.GetExtraEnemiesBase()
            If room.w * room.h > 40
                If room.w * room.h <= 60
                    extraEnemies += 1
                Else
                    extraEnemies += 2
                End If
            End If

            Local point: Point

            Local limit := 500
            For limit = limit - 1 Until 0 Step -1
                If extraEnemies <= 0 Then Exit

                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                extraEnemies -= 1

                Local enemyTypeRoll := Util.RndIntRangeFromZero(4, True)
                Select enemyTypeRoll
                    Case 0
                        If controller_game.currentLevel <= 2
                            New Monkey(point.x, point.y, 4)
                        Else
                            New Monkey(point.x, point.y, 3)
                        End If
                    Case 1
                        ' Do nothing.
                    Case 2
                        New Golem(point.x, point.y, 3)
                    Case 3
                        ' Useless Dorian check goes here.
                        New Harpy(point.x, point.y, 1)
                    Default
                        ' There's a check to place a bat here but only when 4 != 4.

                        New Harpy(point.x, point.y, 1)
                End Select
            End For

            If room.type = RoomType.Basic
                Local gargoyleRoll := Util.RndIntRangeFromZero(4, True)
                If gargoyleRoll = 0 And
                   Not room.hasExit
                    If room.w <= 5 And
                       room.h <= 5
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        ' No null check?
                        ' TODO: This Null check isn't supposed to be here. Remove this after debugging.
                        If point = Null Then Continue

                        Local gargoyleLevel := Util.RndIntRange(1, 5, True, -1)
                        New Gargoyle(point.x, point.y, gargoyleLevel)
                    Else
                        If Util.RndBool(True)
                            Level.PlaceGargoyle(room.x + 2, room.y + 2)
                            Level.PlaceGargoyle(room.x + 2, room.y + room.h - 2)
                            Level.PlaceGargoyle(room.x + room.w - 2, room.y + 2)
                            Level.PlaceGargoyle(room.x + room.w - 2, room.y + room.h - 2)
                        Else
                            Local gargoyleY := Util.RndIntRange(room.y + 1, room.y + room.h - 2, True, -1)
                            Local roomXMax := room.x + room.w - 1
                            For Local gargoyleX := room.x + 2 Until roomXMax Step 2
                                Level.PlaceGargoyle(gargoyleX, gargoyleY)
                            End For
                        End If
                    End If
                End If
            End If

            Local poltergeistRoll := Util.RndIntRangeFromZero(4, True)
            If poltergeistRoll = 0 And
               Level.AllowSpirit()
                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                New Poltergeist(point.x, point.y, 1)
            End If

            ' TODO: Consider breaking this section up into level-specific blocks like the other enemy placement functions.
            Local warlockOrBatRoll := Util.RndIntRangeFromZero(2, True)
            If warlockOrBatRoll = 0
                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                New Bat(point.x, point.y, 4)
            Else
                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                Local warlockLevel := math.Min(2, controller_game.currentLevel)
                New Warlock(point.x, point.y, warlockLevel)
            End If

            Local monkeyOrBlademasterRoll := Util.RndIntRangeFromZero(3, True)
            If monkeyOrBlademasterRoll = 0 Or
               Util.IsCharacterActive(Character.Dorian)
                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                Local monkeyLevel := 3
                If controller_game.currentLevel >= 3
                    monkeyLevel = 4
                End If

                New Monkey(point.x, point.y, monkeyLevel)
            Else
                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                Local blademasterLevel := 1
                If controller_game.currentLevel >= 3
                    blademasterLevel = 2
                End If

                New Blademaster(point.x, point.y, blademasterLevel)
            End If

            If controller_game.currentLevel >= 2
                Local armadilloRoll := Util.RndIntRangeFromZero(5, True)
                If armadilloRoll = 0
                    point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                    If point = Null Then Continue

                    New Armadillo(point.x, point.y, 3)
                End If
            End If

            If controller_level_editor.currentLevel >= 3
                Local pixieRoll := Util.RndIntRangeFromZero(4, True)
                If pixieRoll = 0
                    point = Level.GetRandPointInRoomWithOptions(room, False, False, False)
                    If point = Null Then Continue

                    New Pixie(point.x, point.y, 1)
                End If
            End If

            Local goblinBomberRoll := Util.RndIntRangeFromZero(3, True)
            If goblinBomberRoll = 0
                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                New GoblinBomber(point.x, point.y, 1)
            End If

            Local lichRoll := Util.RndIntRangeFromZero(2, True)
            If lichRoll = 0
                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                Local lichLevel = math.Min(3, controller_game.currentLevel)
                New Lich(point.x, point.y, lichLevel)
            End If

            Local sleepingGoblinOrHarpyRoll := Util.RndBool(True)
            If sleepingGoblinOrHarpyRoll
                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                New SleepingGoblin(point.x, point.y, 1)
            Else
                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                New Harpy(point.x, point.y, 1)
            End If

            If room.hasExit
                If Not Util.IsCharacterActive(Character.Dove)
                    point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                    If point = Null Then Continue

                    Local sarcophagusLevel := math.Min(3, controller_game.currentLevel)
                    New Sarcophagus(point.x, point.y, sarcophagusLevel)
                End If

                point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                If point = Null Then Continue

                New Golem(point.x, point.y, 3)
            End If
        End For

        If Util.IsCharacterActive(Character.Tempo)
            Debug.TraceNotImplemented("Level.PlaceEnemiesZone4() (Tempo section)")
        End If

        Local walls := New IntPointList()

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()

                If Not tile.IsWall(False, True, False, False) Then Continue
                If tile.health >= 3 Then Continue

                walls.AddLast(New Point(tile.x, tile.y))
            End For
        End For

        For Local numSpiders := 3 Until 0 Step -1
            Local wallsIndex := Util.RndIntRangeFromZero(walls.Count() - 1, True)
            Local wallsArray := walls.ToArray()
            Local wall := wallsArray[wallsIndex]

            If Enemy.GetEnemyAt(wall.x, wall.y, True) <> Null Then Continue
            If Trap.GetTrapAt(wall.x, wall.y) <> Null Then Continue

            New Spider(wall.x, wall.y, 1)
        End For
    End Function

    Function PlaceEnemiesZone5: Void()
        Debug.Log("PLACEENEMIES: Placing zone 5 enemies")

        Local wraithRooms := New StackEx<RoomBase>()

        For Local roomData := EachIn Level.rooms
            Select roomData.type
                Case RoomType.Shop,
                     RoomType.Start,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            Local room := New RectRoom(roomData)
            Level.PutRoomEnemiesZone5(room, roomData.hasExit)
            wraithRooms.Push(room)
        End For

        Level.PutRoomEnemiesZone5(Level.hallwayZone5, False)
        Level.PutRoomEnemiesZone5(Level.hallwayZone5, False)
        wraithRooms.Push(Level.hallwayZone5)

        If Level.AllowSpirit()
            Local room := wraithRooms.ChooseRandom(True)
            Local point := Level.GetRandPointInRoomWithOptions(room, True, True, True, False, True, False)
            If point = Null Then Return

            New Wraith(point.x, point.y, 2)
        End If

        If Not Level.isHardcoreMode
            Debug.TraceNotImplemented("Level.PlaceEnemiesZone5() (Non-Hardcore Mode)")
        End If

        If Util.IsCharacterActive(Character.Tempo)
            Debug.TraceNotImplemented("Level.PlaceEnemiesZone5() (Tempo)")
        End If
    End Function

    Function PlaceExit: Bool(rdExit: RoomData)
        If necrodancer.DEBUG_BUILD
            Debug.Log("PLACEEXIT: Placing exit in room " + rdExit.ToString())
        End If

        Local i := 500
        For i = i - 1 Until 0 Step -1
            Local xOff := Util.RndIntRangeFromZero(rdExit.w - 1, True)
            Local x := rdExit.x + xOff
            Local yOff := Util.RndIntRangeFromZero(rdExit.h - 1, True)
            Local y := rdExit.y + yOff
            If Level.GetTileTypeAt(x, y) = TileType.Floor And
               Not Level.IsCorridorFloorOrDoorAdjacent(x, y) And
               Not Level.IsWallAt(x, y + 1, False, False)
                Level.CreateExit(x, y)

                Return True
            End If
        End For

        Debug.Log("PLACEEXIT: Unable to place exit")

        Return Level._FailMap()
    End Function

    Function PlaceExitRoomMiniboss: Void(rd: RoomBase)
        Level.PlaceAppropriateMinibosses(rd)

        Local exitCoords := Level.GetStandardExitCoords()
        Level.PlaceShopkeeperGhostIfNeededAt(exitCoords.x, exitCoords.y)
    End Function

    Function PlaceFirstRoom: RoomData()
        Debug.Log("Creating first room")

        Const xVal := -3
        Const yVal := -3
        Const width := 6
        Const height := 6
        Const type := RoomType.Start

        Level.CreateRoom(xVal, yVal, width, height, False, type, -1, -1, -1, -1, False, TileType.DirtWall, False, True)

        Local roomData := New RoomData(xVal, yVal, width, height, type, False)
        Level.firstRoom = roomData

        Return roomData
    End Function

    Function PlaceGargoyle: Gargoyle(xVal: Int, yVal: Int)
        Local level := Util.RndIntRange(1, 5, True, -1)

        Return Level.PlaceGargoyle(xVal, yVal, level)
    End Function

    Function PlaceGargoyle: Gargoyle(xVal: Int, yVal: Int, l: Int)
        If Util.IsGlobalCollisionAt(xVal, yVal, False, False, False, False) Then Return Null
        If Level.IsExit(xVal, yVal) Then Return Null
        If Trap.GetTrapAt(xVal, yVal) <> Null Then Return Null
        If Level.IsWaterOrTarAt(xVal, yVal) Then Return Null

        Return New Gargoyle(xVal, yVal, l)
    End Function

    Function PlaceHotCoalTileAt: Void(xVal: Int, yVal: Int)
        Local exitValue := Level.GetExitValue(xVal, yVal)
        If exitValue.x <> -4 Then Return

        If Not Level.IsFloorAt(xVal, yVal) Then Return

        Select Level.GetTileTypeAt(xVal, yVal)
            Case TileType.Ice
                Level.PlaceTileRemovingExistingTiles(xVal, yVal, TileType.Water)
                ' SKIPPING: Audio part
            Default
                Local trap := Trap.GetTrapAt(xVal, yVal)
                If trap <> Null
                    trap.Die()
                End If

                Level.PlaceTileRemovingExistingTiles(xVal, yVal, TileType.Ice)
        End Select
    End Function

    Function PlaceIceTileAt: Void(xVal: Int, yVal: Int)
        Local exitValue := Level.GetExitValue(xVal, yVal)
        If exitValue.x <> -4 Then Return

        If Not Level.IsFloorAt(xVal, yVal) Then Return

        Select Level.GetTileTypeAt(xVal, yVal)
            Case TileType.HotCoal
                Level.PlaceTileRemovingExistingTiles(xVal, yVal, TileType.Water)
                ' SKIPPING: Audio part
            Case TileType.Water,
                 TileType.DeepWater
                Level.PlaceTileRemovingExistingTiles(xVal, yVal, TileType.Floor)
            Default
                Local trap := Trap.GetTrapAt(xVal, yVal)
                If trap <> Null
                    trap.Die()
                End If

                Level.PlaceTileRemovingExistingTiles(xVal, yVal, TileType.HotCoal)
        End Select
    End Function

    Function PlaceLockedChests: Void()
        Debug.Log("PLACELOCKEDCHESTS: Deciding on locked chests")

        Local lockedChestsChance := Util.RndIntRangeFromZero(99, True)
        If lockedChestsChance <= 15 And
           Chest.GetNumEmptySecretChests() > 0 And
           Chest.GetNumEmptyNonSecretChests() > 0
            Debug.Log("PLACELOCKEDCHESTS: Placing locked chest and key")

            Local emptySecretChest := Chest.GetEmptySecretChest()
            emptySecretChest.AddKeyToContents()

            Local emptyNonSecretChest := Chest.GetEmptyNonSecretChest()
            emptyNonSecretChest.BecomeLocked()
        End If
    End Function

    Function PlaceMinibossOfShapeAt: Enemy(newMiniboss: Int, xVal: Int, yVal: Int)
        Local level := 1

        If controller_game.currentLevel >= 3 Then level = 2

        If Level.isHardcoreMode And
           controller_game.currentLevel >= 2
            level = 2
        End If

        If controller_game.currentDepth >= 2 And
           level = 1
            Select newMiniboss
                Case EnemyBaseType.Dragon,
                     EnemyBaseType.BatMiniboss,
                     EnemyBaseType.Minotaur
                    level = 2
            End Select
        End If

        If controller_game.currentZone = 3 And
           level = 2 And
           newMiniboss = EnemyBaseType.Dragon
            level = 3
        End If

        If controller_game.currentDepth >= 4
            Select newMiniboss
                Case EnemyBaseType.Banshee,
                     EnemyBaseType.Nightmare
                    level = 2
                Case EnemyBaseType.Dragon
                    level = Util.RndIntRange(2, 3, True, -1)
            End Select
        End If

        If controller_game.currentZone = 5 And
           newMiniboss = EnemyBaseType.Dragon
            If Util.RndBool(True) Then level = 4
        End If

        If Player.DoesAnyPlayerHaveItemOfType("ring_peace") Then level = 1
        If Player.DoesAnyPlayerHaveItemOfType("ring_war") Then level = 2

        If Level.isHardMode
            ' TODO: Hard Mode
            Debug.TraceNotImplemented("Level.PlaceMinibossOfShapeAt(Int, Int, Int) (Hard Mode)")
        End If

        Local miniboss: Enemy

        Select newMiniboss
            Case EnemyBaseType.Dragon
                miniboss = New Dragon(xVal, yVal, level)
            Case EnemyBaseType.BatMiniboss
                miniboss = New BatMiniboss(xVal, yVal, level)
            Case EnemyBaseType.Banshee
                miniboss = New Banshee(xVal, yVal, level)
            Case EnemyBaseType.Nightmare
                miniboss = New Nightmare(xVal, yVal, level)
            Case EnemyBaseType.Minotaur
                miniboss = New Minotaur(xVal, yVal, level)
            Case EnemyBaseType.Ogre
                miniboss = New Ogre(xVal, yVal, 1)
            Case EnemyBaseType.Mommy
                miniboss = New Mommy(xVal, yVal, 1)
            Default
                miniboss = New MetroGnome(xVal, yVal, level)
        End Select

        Return miniboss
    End Function

    Function PlaceNocturnaArea: Void()
        Debug.TraceNotImplemented("Level.PlaceNocturnaArea()")
    End Function

    Function PlacePenaltyBoxEnemies: Void()
        Local initialCorner := Util.RndIntRangeFromZero(3, True)

        Local corners := New IntPointStack()
        corners.Push(New Point(-2, -2))
        corners.Push(New Point(2, -2))
        corners.Push(New Point(2, 2))
        corners.Push(New Point(-2, 2))

        Local orderedCorners := New IntPointStack()
        For Local i := 0 To 3
            Local corner := corners.Get((initialCorner + i) Mod 4)
            orderedCorners.Push(corner)
        End For

        Local enemyTypes := New IntStack()

        enemyTypes.Push(EnemyType.GreenSlime)

        Select controller_game.currentZone
            Case 1
                Select controller_game.currentLevel
                    Case 2
                        enemyTypes.Push(EnemyType.BlueBat)
                        enemyTypes.Push(EnemyType.WhiteSkeleton)
                    Case 3
                        enemyTypes.Push(EnemyType.RedBat)
                        enemyTypes.Push(EnemyType.YellowSkeleton)
                    Default
                        enemyTypes.Push(EnemyType.RedBat)
                        enemyTypes.Push(EnemyType.BlackSkeleton)
                End Select

                enemyTypes.Push(EnemyType.Ghost)
            Case 2
                Select controller_game.currentLevel
                    Case 2
                        enemyTypes.Push(EnemyType.BlueBat)
                        enemyTypes.Push(EnemyType.WhiteArmoredSkeleton)
                    Case 3
                        enemyTypes.Push(EnemyType.RedBat)
                        enemyTypes.Push(EnemyType.YellowSkeleton)
                    Default
                        enemyTypes.Push(EnemyType.RedBat)
                        enemyTypes.Push(EnemyType.BlackSkeleton)
                End Select

                enemyTypes.Push(EnemyType.Clone)
            Case 3
                If controller_game.currentLevel <= 3
                    enemyTypes.Push(EnemyType.IceElemental)
                Else
                    enemyTypes.Push(EnemyType.FireElemental)
                End If

                Select controller_game.currentLevel
                    Case 2
                        enemyTypes.Push(EnemyType.WhiteSkeletonKnight)
                    Case 3
                        enemyTypes.Push(EnemyType.YellowSkeletonKnight)
                    Default
                        enemyTypes.Push(EnemyType.BlackSkeletonKnight)
                End Select

                If controller_game.currentLevel <= 3
                    enemyTypes.Push(EnemyType.FireElemental)
                Else
                    enemyTypes.Push(EnemyType.IceElemental)
                End If
            Case 4
                Select controller_game.currentLevel
                    Case 2
                        enemyTypes.Push(EnemyType.Warlock)
                        enemyTypes.Push(EnemyType.Lich)
                    Case 3
                        enemyTypes.Push(EnemyType.NeonWarlock)
                        enemyTypes.Push(EnemyType.RedLich)
                    Default
                        enemyTypes.Push(EnemyType.NeonWarlock)
                        enemyTypes.Push(EnemyType.BlackLich)
                End Select

                If Util.IsCharacterActive(Character.Dorian)
                    enemyTypes.Push(EnemyType.Harpy)
                Else
                    If controller_game.currentLevel <= 3
                        enemyTypes.Push(EnemyType.ApprenticeBlademaster)
                    Else
                        enemyTypes.Push(EnemyType.Blademaster)
                    End If
                End If
            Default
                Select controller_game.currentLevel
                    Case 2
                        enemyTypes.Push(EnemyType.GreenGorgon)
                        enemyTypes.Push(EnemyType.PurpleElectricMage)
                    Case 3
                        enemyTypes.Push(EnemyType.GreenGorgon)
                        enemyTypes.Push(EnemyType.RedElectricMage)
                    Default
                        enemyTypes.Push(EnemyType.GreenGorgon)
                        enemyTypes.Push(EnemyType.GoldElectricMage)
                End Select

                If controller_game.currentLevel <= 3
                    enemyTypes.Push(EnemyType.RedDevil)
                Else
                    enemyTypes.Push(EnemyType.GreenDevil)
                End If
        End Select

        Debug.Assert(enemyTypes.Length() = 4)
        Debug.Assert(Level.previousLevelUnkilledStairLockingMinibosses.Length() > 0)

        Local previousLevelUnkilledStairLockingMinibossesIndexes := New Stack<Int>()
        previousLevelUnkilledStairLockingMinibossesIndexes.Push(0)
        previousLevelUnkilledStairLockingMinibossesIndexes.Push(2)
        previousLevelUnkilledStairLockingMinibossesIndexes.Push(1)
        previousLevelUnkilledStairLockingMinibossesIndexes.Push(3)

        For Local i := 0 To 3
            Local enemyType := enemyTypes.Get(i)
            Local previousLevelUnkilledStairLockingMinibossesIndex := previousLevelUnkilledStairLockingMinibossesIndexes.Get(i)
            If previousLevelUnkilledStairLockingMinibossesIndex < Level.previousLevelUnkilledStairLockingMinibosses.Length()
                enemyType = Level.previousLevelUnkilledStairLockingMinibosses.Get(previousLevelUnkilledStairLockingMinibossesIndex)
            End If

            Local corner := orderedCorners.Get(i)
            Local enemy := Enemy.MakeEnemy(corner.x, corner.y, enemyType)
            enemy.inPenaltyBox = True
            enemy.hasBeenVisible = True
            enemy.exemptFromPause = True

            Local dragon := Dragon(enemy)
            If dragon <> Null
                dragon.seekDistance = 0
                If dragon.level = 2
                    dragon.seekDistance = 10
                End If

                dragon.dontMove = True
            End If
        End For
    End Function

    Function PlaceRandomEnemyForTempo: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceRandomEnemyForTempo(Int, Int)")
    End Function

    Function PlaceRareEnemies: Void(room: RoomBase, hasExit: Bool)
        Local point: Point

        If Level.isHardcoreMode
            Local greenBatRoll := Util.RndIntRangeFromZero(5000, True)
            If greenBatRoll = 0
                point = Level.GetRandPointInRoomWithOptions(room, True, True, True, False, True, False)
                If point = Null Then Return

                New Bat(point.x, point.y, 3)
            End If

            Local purpleSlimeRoll := Util.RndIntRangeFromZero(1000, True)
            If purpleSlimeRoll = 0
                point = Level.GetRandPointInRoomWithOptions(room, True, True, True, False, True, False)
                If point = Null Then Return

                New Slime(point.x, point.y, 6)
            End If
        End If

        If Not Level.isHardMode Or hasExit Then Return

        Local hardModeXML := Level.GetHardModeXML()
        Local minibossesPerNonExit := item.GetInt(hardModeXML, "minibossesPerNonExit", 0)

        Local weights := New WeightedPicker()
        Local enemyTypes := New IntStack()

        weights.Push(1)
        enemyTypes.Push(EnemyType.GreenDragon)

        Select controller_game.currentZone
            Case 1,
                 2,
                 3,
                 5
                weights.Push(1)
                enemyTypes.Push(EnemyType.LightMinotaur)
        End Select

        Select controller_game.currentZone
            Case 1,
                 2,
                 3
                weights.Push(1)
                enemyTypes.Push(EnemyType.YellowDireBat)
        End Select

        Select controller_game.currentZone
            Case 2,
                 3,
                 4
                weights.Push(1)
                enemyTypes.Push(EnemyType.BlueBanshee)

                weights.Push(1)
                enemyTypes.Push(EnemyType.DarkNightmare)
        End Select

        Select controller_game.currentZone
            Case 5
                weights.Push(1)
                enemyTypes.Push(EnemyType.GoldMetroGnome)
        End Select

        If minibossesPerNonExit > 0
            For Local i := 0 Until minibossesPerNonExit
                point = Level.GetRandPointInRoomWithOptions(room, True, True, True, True, True, False)
                If point = Null Then Exit

                Local enemyTypeIndex := weights.PickRandom(True)
                Local enemyType := enemyTypes.Get(enemyTypeIndex)

                Enemy.MakeEnemy(point.x, point.y, enemyType)
            End For
        End If

        Local sarcsPerRoom := ToughSarcophagus.GetPerRoomCount()
        If sarcsPerRoom > 0
            Local toughSarcophagusEnemyTypes := New StackEx<Int>()

            Select controller_game.currentZone
                Case 1
                    Select controller_game.currentLevel
                        Case 1  toughSarcophagusEnemyTypes.Push(EnemyType.WhiteSkeleton)
                        Case 2  toughSarcophagusEnemyTypes.Push(EnemyType.YellowSkeleton)
                        Default toughSarcophagusEnemyTypes.Push(EnemyType.BlackSkeleton)
                    End Select

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyTypes.Push(EnemyType.PurpleMonkey)
                    Else
                        toughSarcophagusEnemyTypes.Push(EnemyType.WhiteMonkey)
                    End If

                    toughSarcophagusEnemyTypes.Push(EnemyType.Ghost)
                Case 2
                    Select controller_game.currentLevel
                        Case 1
                            toughSarcophagusEnemyTypes.Push(EnemyType.WhiteArmoredSkeleton)
                            toughSarcophagusEnemyTypes.Push(EnemyType.WhiteSkeletonMage)
                        Case 2
                            toughSarcophagusEnemyTypes.Push(EnemyType.YellowArmoredSkeleton)
                            toughSarcophagusEnemyTypes.Push(EnemyType.YellowSkeletonMage)
                        Default
                            toughSarcophagusEnemyTypes.Push(EnemyType.BlackArmoredSkeleton)
                            toughSarcophagusEnemyTypes.Push(EnemyType.BlackSkeletonMage)
                    End Select

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyTypes.Push(EnemyType.LightGolem)
                        toughSarcophagusEnemyTypes.Push(EnemyType.WhiteArmadillo)
                    Else
                        toughSarcophagusEnemyTypes.Push(EnemyType.DarkGolem)
                        toughSarcophagusEnemyTypes.Push(EnemyType.YellowArmadillo)
                    End If

                    toughSarcophagusEnemyTypes.Push(EnemyType.Mole)
                Case 3
                    Select controller_game.currentLevel
                        Case 1  toughSarcophagusEnemyTypes.Push(EnemyType.WhiteSkeletonKnight)
                        Case 2  toughSarcophagusEnemyTypes.Push(EnemyType.YellowSkeletonKnight)
                        Default toughSarcophagusEnemyTypes.Push(EnemyType.BlackSkeletonKnight)
                    End Select

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyTypes.Push(EnemyType.PurpleGoblin)
                    Else
                        toughSarcophagusEnemyTypes.Push(EnemyType.GrayGoblin)
                    End If

                    If controller_game.currentLevel = 1
                        toughSarcophagusEnemyTypes.Push(EnemyType.ShoveMonster)
                    Else
                        toughSarcophagusEnemyTypes.Push(EnemyType.GrayShoveMonster)
                    End If

                    toughSarcophagusEnemyTypes.Push(EnemyType.FireElemental)
                    toughSarcophagusEnemyTypes.Push(EnemyType.Hellhound)
                    toughSarcophagusEnemyTypes.Push(EnemyType.FireBeetle)
                Case 4
                    Select controller_game.currentLevel
                        Case 1  toughSarcophagusEnemyTypes.Push(EnemyType.Lich)
                        Case 2  toughSarcophagusEnemyTypes.Push(EnemyType.RedLich)
                        Default toughSarcophagusEnemyTypes.Push(EnemyType.BlackLich)
                    End Select

                    If Not Util.IsCharacterActive(Character.Dorian)
                        If controller_game.currentLevel <= 2
                            toughSarcophagusEnemyTypes.Push(EnemyType.ApprenticeBlademaster)
                        Else
                            toughSarcophagusEnemyTypes.Push(EnemyType.Blademaster)
                        End If
                    End If

                    If controller_game.currentLevel = 1
                        toughSarcophagusEnemyTypes.Push(EnemyType.Warlock)
                    Else
                        toughSarcophagusEnemyTypes.Push(EnemyType.NeonWarlock)
                    End If

                    toughSarcophagusEnemyTypes.Push(EnemyType.GoblinBomber)
                    toughSarcophagusEnemyTypes.Push(EnemyType.OrangeArmadillo)
                    toughSarcophagusEnemyTypes.Push(EnemyType.OozeGolem)
                    toughSarcophagusEnemyTypes.Push(EnemyType.Harpy)
                    toughSarcophagusEnemyTypes.Push(EnemyType.GreenMonkey)
                    toughSarcophagusEnemyTypes.Push(EnemyType.MagicMonkey)
                Default
                    Select controller_game.currentLevel
                        Case 1
                            toughSarcophagusEnemyTypes.Push(EnemyType.WhiteSkull)
                            toughSarcophagusEnemyTypes.Push(EnemyType.PurpleElectricMage)
                            toughSarcophagusEnemyTypes.Push(EnemyType.GreenOrc)
                        Case 2
                            toughSarcophagusEnemyTypes.Push(EnemyType.YellowSkull)
                            toughSarcophagusEnemyTypes.Push(EnemyType.RedElectricMage)
                            toughSarcophagusEnemyTypes.Push(EnemyType.PinkOrc)
                        Default
                            toughSarcophagusEnemyTypes.Push(EnemyType.BlackSkull)
                            toughSarcophagusEnemyTypes.Push(EnemyType.GoldElectricMage)
                            toughSarcophagusEnemyTypes.Push(EnemyType.PurpleOrc)
                    End Select

                    If controller_game.currentLevel = 1
                        toughSarcophagusEnemyTypes.Push(EnemyType.GreenEvilEye)
                    Else
                        toughSarcophagusEnemyTypes.Push(EnemyType.PinkEvilEye)
                    End If

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyTypes.Push(EnemyType.RedDevil)
                    Else
                        toughSarcophagusEnemyTypes.Push(EnemyType.GreenDevil)
                    End If

                    toughSarcophagusEnemyTypes.Push(EnemyType.WaterBall)
            End Select

            Debug.Assert(toughSarcophagusEnemyTypes.Length() > 0)

            toughSarcophagusEnemyTypes.Shuffle(True)

            For Local i := 0 Until sarcsPerRoom
                Local nearWallIsOk: Bool
                Select controller_game.currentZone
                    Case 1,
                         4
                        nearWallIsOk = False
                    Default
                        nearWallIsOk = True
                End Select

                point = Level.GetRandPointInRoomWithOptions(room, True, True, True, True, nearWallIsOk, False)
                If point = Null Then Exit

                Local enemyType := toughSarcophagusEnemyTypes.Get(i Mod toughSarcophagusEnemyTypes.Length())
                Select enemyType
                    Case EnemyType.FireElemental enemyType = Level.GetZone3ElementalType(point.x, point.y)
                    Case EnemyType.Hellhound enemyType = Level.GetZone3YetiHellhoundType(point.x, point.y)
                    Case EnemyType.FireBeetle enemyType = Level.GetZone3BeetleType(point.x, point.y)
                End Select

                New ToughSarcophagus(point.x, point.y, enemyType)
            End For
        End If
    End Function

    Function PlaceResourceWall: Void()
        Debug.Log("PLACERESOURCEWALL: Placing diamond or gold in wall")

        If Level.isHardcoreMode
            If Util.IsCharacterActive(Character.Monk) Or
               Util.IsCharacterActive(Character.Coda)
                Debug.Log("Skipping wall gold for Monk/Coda")

                Return
            End If
        End If

        Local dirtWallLocation := Level.FindTileOfType(TileType.DirtWall)
        If dirtWallLocation <> Null
            Local dirtWall := Level.GetTileAt(dirtWallLocation.x, dirtWallLocation.y)
            If dirtWall <> Null
                dirtWall.BecomeDiamond()
            End If
        End If
    End Function

    Function PlaceRoomZone1: RoomData(roomToAttachTo: RoomData)
        Return Level.PlaceRoomZone1(RoomType.None, roomToAttachTo)
    End Function

    Function PlaceRoomZone1: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Level.pendingTiles.Clear()
        Tile.CleanUpPendingTiles()

        Local wideCorridorRoll := Util.RndIntRangeFromZero(100, True)
        Local wideCorridor: Bool
        If (controller_game.currentLevel = 2) And (wideCorridorRoll <= 30) Then wideCorridor = True
        If (controller_game.currentLevel = 3) And (wideCorridorRoll <= 60) Then wideCorridor = True
        If (controller_game.currentLevel = 4) And (wideCorridorRoll <= 80) Then wideCorridor = True
        If (controller_game.currentLevel > 4) And (wideCorridorRoll <= 90) Then wideCorridor = True

        ' Overwrites `wideCorridor` but cannot skip the call to `RndIntRange` because it has side effects.
        ' TODO: Windows version doesn't set `wideCorridor` to `False` for `Secret` and `Vault`.
        Select roomType
            Case RoomType.Shop,
                 RoomType.Secret,
                 RoomType.Vault
                wideCorridor = False
        End Select

        Local x: Int
        Local y: Int

        If roomToAttachTo
            While True
                If roomToAttachTo.x = x Then Exit
                If roomToAttachTo.x + roomToAttachTo.w = x Then Exit
                If roomToAttachTo.y = y Then Exit
                If roomToAttachTo.y + roomToAttachTo.h = y Then Exit

                x = 1 + roomToAttachTo.x + Util.RndIntRangeFromZero(roomToAttachTo.w - 1, True)
                y = 1 + roomToAttachTo.y + Util.RndIntRangeFromZero(roomToAttachTo.h - 1, True)
            End While
        Else
            Local tileLocation := Level.FindTileOfType(TileType.Unknown98, True)
            x = tileLocation.x
            y = tileLocation.y
        End If

        Local numFloor: Int

        If Level.GetTileTypeAt(x + 1, y) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x, y + 1) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x - 1, y) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x, y - 1) = TileType.Floor Then numFloor += 1

        If numFloor <> 1
            Debug.WriteLine("Failed to place room for zone 1. Attachment point has " + numFloor + " tiles adjacent that are Floor (expected 1).")
            Return Null
        End If

        Local moveX := 0 ' Possible values: -1, 0, 1
        Local moveY := 0 ' Possible values: -1, 0, 1

        If Level.GetTileTypeAt(x + 1, y) = TileType.Floor Then moveX = -1
        If Level.GetTileTypeAt(x, y + 1) = TileType.Floor Then moveY = -1
        If Level.GetTileTypeAt(x - 1, y) = TileType.Floor Then moveX = 1
        If Level.GetTileTypeAt(x, y - 1) = TileType.Floor Then moveY = 1

        Local horizontal := True
        If moveX = 0 Then horizontal = False

        Level.carveX = x
        Level.carveY = y

        If Not Level.CarveNewCorridor(moveX, moveY, horizontal, True, False, roomType, wideCorridor) Then Return Null

        For Local i := 0 Until 2
            If Util.RndBool(True)
                If Not Level.IsFloorAt(Level.carveX, Level.carveY)
                    New Tile(Level.carveX, Level.carveY, TileType.CorridorDirtWall, True, -1)
                End If

                If horizontal
                    If Not Level.IsFloorAt(Level.carveX, Level.carveY - 1)
                        New Tile(Level.carveX, Level.carveY - 1, TileType.CorridorDirtWall, True, -1)
                    End If

                    If Not Level.IsFloorAt(Level.carveX, Level.carveY + 1)
                        New Tile(Level.carveX, Level.carveY + 1, TileType.CorridorDirtWall, True, -1)
                    End If

                    Level.carveX -= moveX
                    Level.carveY -= moveY

                    moveX = 0
                    moveY = -1
                    If Util.RndBool(True)
                        moveY = 1
                    End If
                Else
                    If Not Level.IsFloorAt(Level.carveX - 1, Level.carveY)
                        New Tile(Level.carveX - 1, Level.carveY, TileType.CorridorDirtWall, True, -1)
                    End If

                    If Not Level.IsFloorAt(Level.carveX + 1, Level.carveY)
                        New Tile(Level.carveX + 1, Level.carveY, TileType.CorridorDirtWall, True, -1)
                    End If

                    Level.carveX -= moveX
                    Level.carveY -= moveY

                    moveX = -1
                    moveY = 0
                    If Util.RndBool(True)
                        moveX = 1
                    End If
                End If

                horizontal = Not horizontal

                If Not Level.CarveNewCorridor(moveX, moveY, horizontal, True, True, roomType, wideCorridor)
                    Return Null
                End If
            End If
        End For

        Local width := Util.RndIntRange(6, 8, True, -1)
        Local height := Util.RndIntRange(5, 7, True, -1)

        If roomType = RoomType.Shop
            width = 6
            height = 8
        End If

        If Level.IsSecretRoom(roomType)
            width = 4
            height = 3
        End If

        Local xVal: Int
        Local yVal: Int
        Local xOff: Int
        Local yOff: Int
        Local originX := Level.carveX
        Local originY := Level.carveY

        Select moveX
            Case -1
                yOff = Util.RndIntRangeFromZero(height - 2, True)

                If wideCorridor
                    yOff = Util.RndIntRangeFromZero(height - 3, True)
                End If

                xVal = originX - width
                yVal = originY - yOff - 1
            Case 1
                yOff = Util.RndIntRangeFromZero(height - 2, True)

                If wideCorridor
                    yOff = Util.RndIntRangeFromZero(height - 3, True)
                End If

                xVal = originX
                yVal = originY - yOff - 1
            Default
                xOff = Util.RndIntRangeFromZero(width - 2, True)

                If wideCorridor
                    xOff = Util.RndIntRangeFromZero(width - 3, True)
                End If

                xVal = originX - xOff - 1
                yVal = originY
                If moveY = -1 Then yVal -= height
        End Select

        Local originX2 := originX + 1
        Local originY2 := originY

        If horizontal
            originX2 = originX
            originY2 = originY + 1
        End If

        If Not Level.CreateRoom(xVal, yVal, width, height, True, roomType, originX, originY, originX2, originY2, wideCorridor, TileType.DirtWall, False, True)
            Return Null
        End If

        For Local pendingTilesOnXNode := EachIn Level.pendingTiles
            For Local pendingTileNode := EachIn pendingTilesOnXNode.Value()
                Local tileX := pendingTilesOnXNode.Key()
                Local tileY := pendingTileNode.Key()

                Local tile := Level.GetTileAt(tileX, tileY)
                Local tileType := pendingTileNode.Value().GetType()
                If tile Then tile.Die()

                New Tile(tileX, tileY, tileType, False, -1)
            End For
        End For

        If roomType = RoomType.Shop
            Level.PlaceShopItemsAt(xVal, yVal, Null)

            Return Level._PlaceRoom(xVal, yVal, width, height)
        End If

        If Level.IsSecretRoom(roomType)
            Return Level._PlaceRoom(xVal, yVal, width, height)
        End If

        Local addDoorRoll := Util.RndIntRangeFromZero(100, True)
        Local addDoor: Bool
        If (controller_game.currentLevel = 1) And (addDoorRoll <= 80) Then addDoor = True
        If (controller_game.currentLevel = 2) And (addDoorRoll <= 70) Then addDoor = True
        If (controller_game.currentLevel = 3) And (addDoorRoll <= 60) Then addDoor = True
        If (controller_game.currentLevel > 3) And (addDoorRoll <= 50) Then addDoor = True

        If addDoor And
           Level.isHardcoreMode And
           Not wideCorridor
            If Util.RndIntRangeFromZero(8, True)
                New Tile(originX, originY, TileType.Door, False, -1)
            Else
                New Tile(originX, originY, TileType.MetalDoor, False, -1)
            End If

            Return Level._PlaceRoom(xVal, yVal, width, height)
        End If

        Local tileType: Int
        If addDoor
            tileType = TileType.Door
        Else
            tileType = TileType.CorridorFloor
        End If

        New Tile(originX, originY, tileType, False, -1)
        If wideCorridor
            New Tile(originX2, originY2, tileType, False, -1)
        End If

        Return Level._PlaceRoom(xVal, yVal, width, height)
    End Function

    Function _PlaceRoom: RoomData(xVal: Int, yVal: Int, width: Int, height: Int)
        Local room := New RoomData(xVal, yVal, width, height, Level.lastCreatedRoomType, False)
        Level.rooms.AddLast(room)

        Return room
    End Function

    Function PlaceRoomZone2: RoomData(roomToAttachTo: RoomData)
        Return Level.PlaceRoomZone2(RoomType.None, roomToAttachTo)
    End Function

    Function PlaceRoomZone2: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Level.pendingTiles.Clear()
        Tile.CleanUpPendingTiles()

        Local wideCorridor := True
        Select roomType
            Case RoomType.Shop,
                 RoomType.Secret,
                 RoomType.Vault
                wideCorridor = False
        End Select

        Local x: Int
        Local y: Int

        If roomToAttachTo
            While True
                If roomToAttachTo.x = x Then Exit
                If roomToAttachTo.x + roomToAttachTo.w = x Then Exit
                If roomToAttachTo.y = y Then Exit
                If roomToAttachTo.y + roomToAttachTo.h = y Then Exit

                x = roomToAttachTo.x + Util.RndIntRangeFromZero(roomToAttachTo.w, True)
                y = roomToAttachTo.y + Util.RndIntRangeFromZero(roomToAttachTo.h, True)
            End While
        Else
            Local tileLocation := Level.FindTileOfType(TileType.Unknown98, True)
            x = tileLocation.x
            y = tileLocation.y
        End If

        Local numFloor: Int

        If Level.GetTileTypeAt(x + 1, y) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x, y + 1) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x - 1, y) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x, y - 1) = TileType.Floor Then numFloor += 1

        If numFloor <> 1
            Debug.WriteLine("Failed to place room for zone 2. Attachment point has " + numFloor + " tiles adjacent that are Floor (expected 1).")
            Return Null
        End If

        Local moveX := 0 ' Possible values: -1, 0, 1
        Local moveY := 0 ' Possible values: -1, 0, 1

        If Level.GetTileTypeAt(x + 1, y) = TileType.Floor Then moveX = -1
        If Level.GetTileTypeAt(x, y + 1) = TileType.Floor Then moveY = -1
        If Level.GetTileTypeAt(x - 1, y) = TileType.Floor Then moveX = 1
        If Level.GetTileTypeAt(x, y - 1) = TileType.Floor Then moveY = 1

        Local horizontal := True
        If moveX = 0 Then horizontal = False

        Level.carveX = x
        Level.carveY = y

        If Not Level.CarveNewCorridor(moveX, moveY, horizontal, True, False, roomType, wideCorridor) Then Return Null

        Local wVal := Util.RndIntRange(8, 7, True, -1)
        Local hVal := Util.RndIntRange(7, 6, True, -1)

        Select roomType
            Case RoomType.Shop
                wVal = 6
                hVal = 8
            Case RoomType.Secret
                wVal = 4
                hVal = 3
            Case RoomType.Vault
                wVal = 4
                hVal = 3
        End Select

        Local xVal: Int
        Local yVal: Int
        Local xOff: Int
        Local yOff: Int
        Local originX := Level.carveX
        Local originY := Level.carveY

        Select moveX
            Case -1
                yOff = Util.RndIntRangeFromZero(hVal - 2, True)

                If wideCorridor
                    yOff = Util.RndIntRangeFromZero(hVal - 3, True)
                End If

                xVal = originX - wVal
                yVal = originY - yOff - 1
            Case 1
                yOff = Util.RndIntRangeFromZero(hVal - 2, True)

                If wideCorridor
                    yOff = Util.RndIntRangeFromZero(hVal - 3, True)
                End If

                xVal = originX
                yVal = originY - yOff - 1
            Default
                xOff = Util.RndIntRangeFromZero(wVal - 2, True)

                If wideCorridor
                    xOff = Util.RndIntRangeFromZero(wVal - 3, True)
                End If

                xVal = originX - xOff - 1
                yVal = originY
                If moveY = -1 Then yVal -= hVal
        End Select

        Local originX2 := originX + 1
        Local originY2 := originY

        If horizontal
            originX2 = originX
            originY2 = originY + 1
        End If

        If Not Level.CreateRoom(xVal, yVal, wVal, hVal, True, roomType, originX, originY, originX2, originY2, wideCorridor, TileType.DirtWall, False, True)
            Return Null
        End If

        For Local pendingTilesOnXNode := EachIn Level.pendingTiles
            For Local pendingTileNode := EachIn pendingTilesOnXNode.Value()
                Local tileX := pendingTilesOnXNode.Key()
                Local tileY := pendingTileNode.Key()

                Local tile := Level.GetTileAt(tileX, tileY)
                Local tileType := pendingTileNode.Value().GetType()
                If tile <> Null Then tile.Die()

                New Tile(tileX, tileY, tileType, False, -1)
            End For
        End For

        Select roomType
            Case RoomType.Shop
                Level.PlaceShopItemsAt(xVal, yVal, Null)
            Case RoomType.Secret,
                 RoomType.Vault
                ' Do nothing
            Default
                Local addDoorRoll := Util.RndIntRangeFromZero(100, True)
                Local addDoor: Bool
                Select controller_game.currentLevel
                    Case 1 If addDoorRoll <= 20 Then addDoor = True
                    Case 2 If addDoorRoll <= 15 Then addDoor = True
                    Case 3 If addDoorRoll <= 10 Then addDoor = True
                    Default
                        If controller_game.currentLevel > 3
                            If addDoorRoll <= 5 Then addDoor = True
                        End If
                End Select

                If addDoor
                    If Level.isHardcoreMode
                        If wideCorridor
                            New Tile(originX, originY, TileType.Door, False, -1)
                            New Tile(originX2, originY2, TileType.Door, False, -1)
                        Else
                            Local metalDoorRoll := Util.RndIntRangeFromZero(8, True)
                            If metalDoorRoll = 0
                                New Tile(originX, originY, TileType.MetalDoor, False, -1)
                            Else
                                New Tile(originX, originY, TileType.Door, False, -1)
                            End If
                        End If
                    Else
                        New Tile(originX, originY, TileType.Door, False, -1)
                        If wideCorridor
                            New Tile(originX2, originY2, TileType.Door, False, -1)
                        End If
                    End If
                Else
                    New Tile(originX, originY, TileType.CorridorFloor, False, -1)
                    If wideCorridor
                        New Tile(originX2, originY2, TileType.CorridorFloor, False, -1)
                    End If
                End If
        End Select

        Local room := New RoomData(xVal, yVal, wVal, hVal, Level.lastCreatedRoomType, False)
        Level.rooms.AddLast(room)

        Return room
    End Function

    Function PlaceRoomZone3: RoomData(roomToAttachTo: RoomData)
        Return Level.PlaceRoomZone3(RoomType.None, roomToAttachTo)
    End Function

    Function PlaceRoomZone3: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Level.pendingTiles.Clear()
        Tile.CleanUpPendingTiles()

        Local wideCorridor := True
        Select roomType
            Case RoomType.Shop,
                 RoomType.Secret,
                 RoomType.Vault
                wideCorridor = False
        End Select

        Local x: Int
        Local y: Int

        If roomToAttachTo
            While True
                If roomToAttachTo.x = x Then Exit
                If roomToAttachTo.x + roomToAttachTo.w = x Then Exit
                If roomToAttachTo.y = y Then Exit
                If roomToAttachTo.y + roomToAttachTo.h = y Then Exit

                x = roomToAttachTo.x + Util.RndIntRangeFromZero(roomToAttachTo.w, True)
                y = roomToAttachTo.y + Util.RndIntRangeFromZero(roomToAttachTo.h, True)
            End While
        Else
            Local tileLocation := Level.FindTileOfType(TileType.Unknown98, True)
            x = tileLocation.x
            y = tileLocation.y
        End If

        Local numFloor: Int

        If Level.GetTileTypeAt(x + 1, y) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x, y + 1) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x - 1, y) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x, y - 1) = TileType.Floor Then numFloor += 1

        If numFloor <> 1
            Debug.WriteLine("Failed to place room for zone 3. Attachment point has " + numFloor + " tiles adjacent that are Floor (expected 1).")
            Return Null
        End If

        Local moveX := 0 ' Possible values: -1, 0, 1
        Local moveY := 0 ' Possible values: -1, 0, 1

        If Level.GetTileTypeAt(x + 1, y) = TileType.Floor Then moveX = -1
        If Level.GetTileTypeAt(x, y + 1) = TileType.Floor Then moveY = -1
        If Level.GetTileTypeAt(x - 1, y) = TileType.Floor Then moveX = 1
        If Level.GetTileTypeAt(x, y - 1) = TileType.Floor Then moveY = 1

        Local horizontal := True
        If moveX = 0 Then horizontal = False

        Level.carveX = x
        Level.carveY = y

        If Not Level.CarveNewCorridor(moveX, moveY, horizontal, True, False, roomType, wideCorridor) Then Return Null

        If Not Level.IsSecretRoom(roomType)
            For Local i := 0 Until 2
                If Util.RndBool(True)
                    If Not Level.IsFloorAt(Level.carveX, Level.carveY)
                        New Tile(Level.carveX, Level.carveY, TileType.CorridorDirtWall, True, -1)
                    End If

                    If horizontal
                        If Not Level.IsFloorAt(Level.carveX, Level.carveY - 1)
                            New Tile(Level.carveX, Level.carveY - 1, TileType.CorridorDirtWall, True, -1)
                        End If

                        If Not Level.IsFloorAt(Level.carveX, Level.carveY + 1)
                            New Tile(Level.carveX, Level.carveY + 1, TileType.CorridorDirtWall, True, -1)
                        End If

                        Level.carveX -= moveX
                        Level.carveY -= moveY

                        moveX = 0
                        moveY = -1
                        If Util.RndBool(True)
                            moveY = 1
                        End If
                    Else
                        If Not Level.IsFloorAt(Level.carveX - 1, Level.carveY)
                            New Tile(Level.carveX - 1, Level.carveY, TileType.CorridorDirtWall, True, -1)
                        End If

                        If Not Level.IsFloorAt(Level.carveX + 1, Level.carveY)
                            New Tile(Level.carveX + 1, Level.carveY, TileType.CorridorDirtWall, True, -1)
                        End If

                        Level.carveX -= moveX
                        Level.carveY -= moveY

                        moveX = -1
                        moveY = 0
                        If Util.RndBool(True)
                            moveX = 1
                        End If
                    End If

                    horizontal = Not horizontal

                    If Not Level.CarveNewCorridor(moveX, moveY, horizontal, True, True, roomType, wideCorridor)
                        Return Null
                    End If
                End If
            End For
        End If

        Local wVal := Util.RndIntRange(5, 6, True, -1)
        Local hVal := Util.RndIntRange(5, 7, True, -1)

        Select roomType
            Case RoomType.Shop
                wVal = 6
                hVal = 8
            Case RoomType.Secret
                wVal = 4
                hVal = 3
            Case RoomType.Vault
                wVal = 4
                hVal = 3
        End Select

        Local xVal: Int
        Local yVal: Int
        Local xOff: Int
        Local yOff: Int
        Local originX := Level.carveX
        Local originY := Level.carveY

        Select moveX
            Case -1
                yOff = Util.RndIntRangeFromZero(hVal - 2, True)

                If wideCorridor
                    yOff = Util.RndIntRangeFromZero(hVal - 3, True)
                End If

                xVal = originX - wVal
                yVal = originY - yOff - 1
            Case 1
                yOff = Util.RndIntRangeFromZero(hVal - 2, True)

                If wideCorridor
                    yOff = Util.RndIntRangeFromZero(hVal - 3, True)
                End If

                xVal = originX
                yVal = originY - yOff - 1
            Default
                xOff = Util.RndIntRangeFromZero(wVal - 2, True)

                If wideCorridor
                    xOff = Util.RndIntRangeFromZero(wVal - 3, True)
                End If

                xVal = originX - xOff - 1
                yVal = originY
                If moveY = -1 Then yVal -= hVal
        End Select

        Local originX2 := originX + 1
        Local originY2 := originY

        If horizontal
            originX2 = originX
            originY2 = originY + 1
        End If

        If Not Level.CreateRoom(xVal, yVal, wVal, hVal, True, roomType, originX, originY, originX2, originY2, wideCorridor, TileType.DirtWall, True, True)
            Return Null
        End If

        For Local pendingTilesOnXNode := EachIn Level.pendingTiles
            For Local pendingTileNode := EachIn pendingTilesOnXNode.Value()
                Local tileX := pendingTilesOnXNode.Key()
                Local tileY := pendingTileNode.Key()

                Local tile := Level.GetTileAt(tileX, tileY)
                Local tileType := pendingTileNode.Value().GetType()
                If tile <> Null Then tile.Die()

                New Tile(tileX, tileY, tileType, False, -1)
            End For
        End For

        Select roomType
            Case RoomType.Shop
                Level.PlaceShopItemsAt(xVal, yVal, Null)
            Case RoomType.Secret,
                 RoomType.Vault
                ' Do nothing
            Default
                New Tile(originX, originY, TileType.CorridorFloor, False, -1)
                If wideCorridor
                    New Tile(originX2, originY2, TileType.CorridorFloor, False, -1)
                End If
        End Select

        Local room := New RoomData(xVal, yVal, wVal, hVal, Level.lastCreatedRoomType, False)
        Level.rooms.AddLast(room)

        Return room
    End Function

    Function PlaceRoomZone4: RoomData(roomType: Int)
        Level.pendingTiles.Clear()
        Tile.CleanUpPendingTiles()

        Local roomToAttachTo: RoomData

        Repeat
            Local roomsIndex := Util.RndIntRangeFromZero(Level.rooms.Count - 1, True)
            Local roomsArray := Level.rooms.ToArray()
            roomToAttachTo = roomsArray[roomsIndex]

            Select roomToAttachTo.type
                Case RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            Exit
        Forever

        Local x := 0
        Local y := 0

        Repeat
            If roomToAttachTo.x = x Then Exit
            If roomToAttachTo.x + roomToAttachTo.w = x Then Exit
            If roomToAttachTo.y = y Then Exit
            If roomToAttachTo.y + roomToAttachTo.h = y Then Exit

            x = roomToAttachTo.x + Util.RndIntRangeFromZero(roomToAttachTo.w, True)
            y = roomToAttachTo.y + Util.RndIntRangeFromZero(roomToAttachTo.h, True)
        Forever

        Local numFloor: Int

        If Level.GetTileTypeAt(x + 1, y) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x, y + 1) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x - 1, y) = TileType.Floor Then numFloor += 1
        If Level.GetTileTypeAt(x, y - 1) = TileType.Floor Then numFloor += 1

        If numFloor <> 1
            Debug.WriteLine("Failed to place room for zone 4. Attachment point has " + numFloor + " tiles adjacent that are Floor (expected 1).")
            Return Null
        End If

        Local moveX := 0 ' Possible values: -1, 0, 1
        Local moveY := 0 ' Possible values: -1, 0, 1

        If Level.GetTileTypeAt(x + 1, y) = TileType.Floor Then moveX = -1
        If Level.GetTileTypeAt(x, y + 1) = TileType.Floor Then moveY = -1
        If Level.GetTileTypeAt(x - 1, y) = TileType.Floor Then moveX = 1
        If Level.GetTileTypeAt(x, y - 1) = TileType.Floor Then moveY = 1

        Local horizontal := True
        If moveX = 0 Then horizontal = False

        Level.carveX = x
        Level.carveY = y

        Level.CarveCorridorTile(x, y, horizontal, True, False, roomType, False)

        Local wVal := Util.RndIntRange(5, 7, True, -1)
        Local hVal := Util.RndIntRange(5, 7, True, -1)

        Select roomType
            Case RoomType.Shop
                wVal = 6
                hVal = 8
            Case RoomType.Secret
                wVal = 4
                hVal = 3
            Case RoomType.Vault
                wVal = 4
                hVal = 3
        End Select

        Local xVal: Int
        Local yVal: Int
        Local xOff: Int
        Local yOff: Int
        Local originX := Level.carveX
        Local originY := Level.carveY

        Select moveX
            Case -1
                yOff = Util.RndIntRangeFromZero(hVal - 3, True)

                xVal = originX - wVal
                yVal = originY - yOff - 1
            Case 1
                yOff = Util.RndIntRangeFromZero(hVal - 3, True)

                xVal = originX
                yVal = originY - yOff - 1
            Default
                xOff = Util.RndIntRangeFromZero(wVal - 3, True)

                xVal = originX - xOff - 1
                yVal = originY
                If moveY = -1 Then yVal -= hVal
        End Select

        Local originX2 := originX + 1
        Local originY2 := originY

        If horizontal
            originX2 = originX
            originY2 = originY + 1
        End If

        If Not Level.CreateRoom(xVal, yVal, wVal, hVal, True, roomType, originX, originY, originX2, originY2, False, TileType.DirtWall, True, True)
            Return Null
        End If

        For Local pendingTilesOnXNode := EachIn Level.pendingTiles
            For Local pendingTileNode := EachIn pendingTilesOnXNode.Value()
                Local tileX := pendingTilesOnXNode.Key()
                Local tileY := pendingTileNode.Key()

                Local tile := Level.GetTileAt(tileX, tileY)
                Local tileType := pendingTileNode.Value().GetType()
                If tile <> Null Then tile.Die()

                New Tile(tileX, tileY, tileType, False, -1)
            End For
        End For

        Select roomType
            Case RoomType.Shop
                Level.PlaceShopItemsAt(xVal, yVal, Null)
            Case RoomType.Secret,
                 RoomType.Vault
                ' Do nothing
            Default
                New Tile(originX, originY, TileType.Door, False, -1)
        End Select

        Local room := New RoomData(xVal, yVal, wVal, hVal, Level.lastCreatedRoomType, False)
        Level.rooms.AddLast(room)

        Return room
    End Function

    Function PlaceRoomZone5: RoomWithDoor(pseg: PortalSeg, width: Int, height: Int, minEntryDist: Int)
        Local origin := pseg.GetOrigin()
        Local normal := pseg.GetNormal()
        Local faceVector := pseg.GetFaceVector()
        Local length := pseg.GetLength()

        Local faceScalar := width
        Local normalScalar := height
        If faceVector.y <> 0
            faceScalar = height
            normalScalar = width
        End If

        Local rooms := New StackEx<RoomWithDoor>()

        For Local i := 3 Until faceScalar + length - 2
            Local scaledFaceVector1 := faceVector.Scale(i)
            Local offsetOrigin1 := origin.Add(scaledFaceVector1)

            Local scaledNormal := normal.Scale(normalScalar)
            Local offsetOrigin2 := offsetOrigin1.Add(scaledNormal)
            Local scaledFaceVector2 := faceVector.Scale(-faceScalar)
            offsetOrigin2 = offsetOrigin2.Add(scaledFaceVector2)

            Local bodyX := math.Min(offsetOrigin1.x, offsetOrigin2.x)
            Local bodyY := math.Min(offsetOrigin1.y, offsetOrigin2.y)
            Local bodyXMax := math.Max(offsetOrigin1.x, offsetOrigin2.x)
            Local bodyYMax := math.Max(offsetOrigin1.y, offsetOrigin2.y)
            Local body := Rect.MakeBounds(bodyX, bodyY, bodyXMax, bodyYMax)

            If Level.IsZone5RoomLegal(body)
                Local firstRoomBounds := Level.firstRoom.GetBounds()
                If firstRoomBounds.GetL1Dist(body) >= minEntryDist
                    For Local j := 1 Until length - 1
                        Local scaledFaceVector3 := faceVector.Scale(j)
                        Local offsetOrigin3 := origin.Add(scaledFaceVector3)

                        Local scaledFaceVector4 := faceVector.Scale(2)
                        Local offsetOrigin4 := offsetOrigin3.Add(scaledFaceVector4)

                        Local doorX := math.Min(offsetOrigin3.x, offsetOrigin4.x)
                        Local doorY := math.Min(offsetOrigin3.y, offsetOrigin4.y)
                        Local doorXMax := math.Max(offsetOrigin3.x, offsetOrigin4.x)
                        Local doorYMax := math.Max(offsetOrigin3.y, offsetOrigin4.y)
                        Local door := Rect.MakeBounds(doorX, doorY, doorXMax, doorYMax)

                        If body.ContainsNoCorners(door)
                            Local room := New RoomWithDoor(body, door)

                            Debug.Assert(body.Contains(door))

                            rooms.Push(room)
                        End If
                    End For
                End If
            End If
        End For

        If rooms.Length <> 0
            Return rooms.ChooseRandom(True)
        End If

        Return Null
    End Function

    Function PlaceRoomZone5: RoomWithDoor(portalSegs: StackEx<PortalSeg>, width: Int, height: Int, minEntryDist: Int, roomType: Int)
        Debug.TraceNotImplemented("Level.PlaceRoomZone5(StackEx<PortalSeg>, Int, Int, Int, Int)")
    End Function

    Function PlaceSecondarySpecialShop: Void(useBloodCost: Bool, isFoodShop: Bool)
        Debug.Log("Placing Secondary Special Shop")

        If isFoodShop
            Level.CreateRoom(-200, -207, 8, 8, False, RoomType.Special, -1, -1, -1, -1, False, TileType.DirtWall, False, True)
        Else
            Level.CreateRoom(-200, -207, 6, 8, False, RoomType.Special, -1, -1, -1, -1, False, TileType.DirtWall, False, True)
        End If

        Level.GetTileAt(-197, -207).AddTorch()

        Local medic := New Medic(-197, -205, 1, False)

        Local itemName := Item.GetRandomItemInClass("", controller_game.currentLevel + 3, "shopChance", Chest.CHEST_COLOR_NONE, True, "", False)
        Local coinCost := Item.GetCost(itemName)

        Local forceCost := coinCost / 10
        If useBloodCost
            forceCost = 0.5
        End If

        New SaleItem(-197, -203, itemName, useBloodCost, Null, forceCost, medic)

        Debug.Log("Done Placing Secondary Special Shop")
    End Function

    Function PlaceSecretRooms: Void(numRooms: Int)
        Local room: SecretRoomData

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local x := tilesOnXNode.Key()
                Local y := tileNode.Key()

                room = Level._CreateSecretRoom(x, y, 2, 2)
                If Not room Then room = Level._CreateSecretRoom(x, y, 1, 2)
                If Not room Then room = Level._CreateSecretRoom(x, y, 2, 1)
                If Not room Then room = Level._CreateSecretRoom(x, y, 1, 1)

                If room
                    Local rndVal := Util.RndIntRangeFromZero(10, True)
                    Local roomType: Int

                    If (rndVal < 1) And
                       (room.w = 4 And room.h = 4) And
                       Not Level.secretRockRoomPlaced And
                       Not room.isCrackedWallAdjacent
                        roomType = RoomType.Vault
                        Level.secretRockRoomPlaced = True
                    Else
                        roomType = RoomType.Secret
                    End If

                    If Level.CreateRoom(room.x, room.y, room.w, room.h, False, roomType, -1, -1, -1, -1, False, TileType.DirtWall, False, True)
                        Local roomData := New RoomData(room.x, room.y, room.w, room.h, roomType, False)
                        Level.rooms.AddLast(roomData)

                        Local location := New Point(room.x, room.y)
                        Local size := New Point(room.w, room.h)
                        Local rock := 0
                        If roomType = RoomType.Vault Then rock = 1
                        Debug.Log("Created secret room at " + location.ToString() + " of size " + size.ToString() + " rock = " + rock)

                        numRooms -= 1
                        If numRooms <= 0 Then Return
                    End If
                End If
            End For
        End For

        ' Is this realistically reachable?
        Debug.WriteLine("WARN: Failed to place secret rooms.")
    End Function

    Function _CreateSecretRoom: SecretRoomData(xVal: Int, yVal: Int, width: Int, height: Int)
        Local isCrackedWallAdjacentToRoom := False

        For Local x := xVal To xVal + width
            For Local y := yVal To yVal + height
                If Not Level.IsSurroundedByDestructibleWalls(x, y) Then Return Null
                If Level.IsCrackedWallAdjacent(x, y) Then isCrackedWallAdjacentToRoom = True
            End For
        End For

        Local roomX := xVal - 1
        Local roomY := yVal - 1
        Local roomW := width + 2
        Local roomH := height + 2

        Return New SecretRoomData(roomX, roomY, roomW, roomH, isCrackedWallAdjacentToRoom)
    End Function

    Function PlaceShopItemsAt: Void(tmpX: Int, tmpY: Int, door: Rect)
        Local itemsXMid := tmpX + 3
        Local itemsY := tmpY + 5

        If door = Null
            door = New Rect(Level.carveX, Level.carveY, 0, 0)
        End If

        Local monstrousShop := False
        If Level.isHardcoreMode Or
           controller_game.currentDepth > 1
            monstrousShop = True

            If Util.RndIntRangeFromZero(160, True) <> 0
                monstrousShop = Level.debugForceMonstrousShop
            End If
        End If

        If Not Util.IsCharacterActive(Character.Unknown15)
            If Not Level.shopkeeperDead
                If monstrousShop
                    New Shopkeeper(itemsXMid, itemsY - 2, 5, False)
                Else
                    New Shopkeeper(itemsXMid, itemsY - 2, 1, False)
                End If
            End If
        End If

        Local createKey: Bool
        If Not Level.isHardcoreMode And
           Not Level.isDDRMode And
           Not Level.isLevelEditor
            If controller_game.currentZone = 1 And
               controller_game.currentLevel = 1
               createKey = Not GameData.GetNPCUnlock("beastmaster")
            Else If controller_game.currentZone = 1 And
                    controller_game.currentLevel = 3
                createKey = Not GameData.GetNPCUnlock("bossmaster")
            Else If controller_game.currentZone = 2 And
                    controller_game.currentLevel = 2
                createKey = Not GameData.GetNPCUnlock("weaponmaster")
            End If
        End If

        ' Locked shop
        Local lockedShopRoll := Util.RndIntRangeFromZero(3, True)
        If lockedShopRoll = 0 And
           controller_game.currentLevel > 1 And
           Not Level.lockedShopPlaced
            Local randomPoint := door.RandomPoint()
            New Tile(randomPoint.x, randomPoint.y, TileType.CrackedShopWall, False, -1)

            Level.addKeyInSecretChest = True

            If Not Util.IsCharacterActive(Character.Unknown15)
                ' Left item
                If createKey
                    Local key: String

                    Select controller_game.currentLevel
                        Case 1 key = "misc_golden_key"
                        Case 2 key = "misc_golden_key3"
                        Default key = "misc_golden_key2"
                    End Select

                    New SaleItem(itemsXMid - 1, itemsY, key, False, Null, -1.0, Null)
                Else
                    Local item1Name := SaleItem.GetRandomItem(controller_game.currentLevel, "lockedShopChance")
                    Local item1 := New SaleItem(itemsXMid - 1, itemsY, item1Name, False, Null, -1.0, Null)
                    item1.ApplyDiscount(0.5)

                    If item1.itemType = "resource_hoard_gold"
                        item1.Die()
                    End If
                End If

                ' Center item
                If Not Util.IsWeaponlessCharacterActive()
                    Local item2Name := SaleItem.GetRandomItem(controller_game.currentLevel, "lockedShopChance")
                    Local item2 := New SaleItem(itemsXMid + 0, itemsY, item2Name, False, Null, -1.0, Null)
                    item2.ApplyDiscount(0.5)

                    If item2.itemType = "resource_hoard_gold"
                        item2.Die()
                    End If
                End If

                ' Right item
                Local item3Name := SaleItem.GetRandomItem(controller_game.currentLevel, "lockedShopChance")
                Local item3 := New SaleItem(itemsXMid + 1, itemsY, item3Name, False, Null, -1.0, Null)
                item3.ApplyDiscount(0.5)

                If item3.itemType = "resource_hoard_gold"
                    item3.Die()
                End If

                Debug.Log("PlaceShopItemsAt ZONE " + controller_game.currentZone + ": Placing LOCKED shop at " + tmpX + ", " + tmpY)

                If Level.shopkeeperDead
                    Debug.Log("PlaceShopItemsAt: REMOVING items since shopkeeper is dead.")

                    Local item1Pickup := Item.GetPickupAt(itemsXMid - 1, itemsY, Null)
                    If item1Pickup Then item1Pickup.Die()
                    Local item2Pickup := Item.GetPickupAt(itemsXMid + 0, itemsY, Null)
                    If item2Pickup Then item2Pickup.Die()
                    Local item3Pickup := Item.GetPickupAt(itemsXMid + 1, itemsY, Null)
                    If item3Pickup Then item3Pickup.Die()
                End If
            End If

            Level.lockedShopPlaced = True
        ' Shop
        Else
            ' TODO: Rewrite this so that `Util.RndIntRangeFromZero` is on its own line.
            If Not Level.isHardcoreMode Or
               Util.RndIntRangeFromZero(8, True)
                For Local point := EachIn door.GetPoints()
                    Local tile := New Tile(point.x, point.y, TileType.Door, False, -1)
                    tile.SetDoorTrigger(3)
                End For
            Else
                Local randomPoint := door.RandomPoint()
                Local tile := New Tile(randomPoint.x, randomPoint.y, TileType.MetalDoor, False, -1)
                tile.SetDoorTrigger(3)
            End If

            Local replaceWithChestPosition := -1
            If Util.RndIntRangeFromZero(3, True) = 0
                replaceWithChestPosition = Util.RndIntRange(1, 3, True, -1)
            End If

            ' Red, black, or purple
            Local chestColor := Util.RndIntRange(1, 3, True, -1)

            If Level.isFloorIsLavaMode
                replaceWithChestPosition = -1
            End If

            If Not Util.IsCharacterActive(Character.Unknown15)
                Local item1: Entity

                If createKey
                    Local key: String

                    Select controller_game.currentLevel
                        Case 1 key = "misc_golden_key"
                        Case 2 key = "misc_golden_key3"
                        Default key = "misc_golden_key2"
                    End Select

                    item1 = New SaleItem(itemsXMid - 1, itemsY, key, False, Null, -1.0, Null)
                Else
                    If replaceWithChestPosition = 1
                        item1 = New SaleChest(itemsXMid - 1, itemsY, Item.NoItem, False, False, False, chestColor)
                    Else
                        Local randomItemName := SaleItem.GetRandomItem(controller_game.currentLevel, "shopChance")
                        item1 = New SaleItem(itemsXMid - 1, itemsY, randomItemName, False, Null, -1.0, Null)
                    End If
                End If

                If Level.shopkeeperDead
                    item1.Die()
                End If

                If Not Util.IsWeaponlessCharacterActive()
                    Local item2: Entity

                    If replaceWithChestPosition = 2
                        item2 = New SaleChest(itemsXMid + 0, itemsY, Item.NoItem, False, False, False, chestColor)
                    Else
                        Local randomItemName := SaleItem.GetRandomItem(controller_game.currentLevel, "shopChance")
                        item2 = New SaleItem(itemsXMid + 0, itemsY, randomItemName, False, Null, -1.0, Null)
                    End If

                    If Level.shopkeeperDead
                        item2.Die()
                    End If
                End If

                Local item3: Entity

                If replaceWithChestPosition = 3
                    item3 = New SaleChest(itemsXMid + 1, itemsY, Item.NoItem, False, False, False, chestColor)
                Else
                    Local randomItemName := SaleItem.GetRandomItem(controller_game.currentLevel, "shopChance")
                    item3 = New SaleItem(itemsXMid + 1, itemsY, randomItemName, False, Null, -1.0, Null)
                End If

                If Level.shopkeeperDead
                    item3.Die()
                End If

                Debug.Log("PlaceShopItemsAt ZONE " + controller_game.currentZone + ": Placing shop at " + tmpX + ", " + tmpY)
            End If
        End If

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsShopWall()
                    tile.SetDigTrigger(3)

                    If monstrousShop Then tile.DarkenShopWall()
                End If
            End For
        End For

        If controller_game.currentDepth > 2 And
           Not monstrousShop
            Local fakeWallRoll := Util.RndIntRange(1, 5, True, -1)
            If fakeWallRoll <= 2
                Local pointsNotAdjacentToDoors := New IntPointStack()

                For Local tilesOnXNode := EachIn Level.tiles
                    For Local tileNode := EachIn tilesOnXNode.Value()
                        Local tile := tileNode.Value()

                        If Not Level.IsDoorAdjacent(tile.x, tile.y) And
                           Level.GetTileTypeAt(tile.x, tile.y) = TileType.ShopWall
                            pointsNotAdjacentToDoors.Push(New Point(tile.x, tile.y))
                        End If
                    End For
                End For

                Local fakeWallLocation := pointsNotAdjacentToDoors.ChooseRandom(True)
                Level.PlaceTileRemovingExistingTiles(fakeWallLocation.x, fakeWallLocation.y, TileType.Floor)
                New FakeWall(fakeWallLocation.x, fakeWallLocation.y, 2)
            End If
        End If
    End Function

    Function PlaceShopkeeperGhostIfNeededAt: Void(xVal: Int, yVal: Int)
        If Level.shopkeeperGhostLevel = controller_game.currentLevel And
           Level.shopkeeperGhostDepth = controller_game.currentDepth
            New ShopkeeperGhost(xVal, yVal, 1)
        End If
    End Function

    Function PlaceShrine: Void()
        Shrine.AddPendingShrinesToUsedList()

        If Not Level.placeShrineOnLevel.Contains(controller_game.currentZone)
            Local level: Int

            If controller_game.currentDepth <> 1 Or
               Not Level.isHardcoreMode Or
               Level.isDailyChallenge
                level = Util.RndIntRange(1, 3, True, -1)
            Else
                level = Util.RndIntRange(2, 3, True, -1)
            End If

            Level.placeShrineOnLevel.Set(controller_game.currentZone, level)
        End If

        If Level.placeShrineOnLevel.Get(controller_game.currentZone) = controller_game.currentLevel
            Local point := Level.GetShrinePoint()
            If point <> Null
                Local shrineInt: Int
                Repeat
                    shrineInt = Shrine.GetRandomShrineInt(False, -1, -2)
                Until shrineInt <> -1

                Local shrineRNG := Level.currentFloorRNG.Split()

                New Shrine(point.x, point.y, shrineInt, shrineRNG, False, False)
            End If
        Else
            Local trapChestRoll := Util.RndIntRange(1, 50, True, -1)
            If trapChestRoll = 1
                Local point := Level.GetShrinePoint()
                If point <> Null
                    New TrapChest(point.x, point.y, 6)
                End If
            End If
        End If
    End Function

    Function PlaceTileRemovingExistingTiles: Tile(xVal: Int, yVal: Int, tileType: Int)
        Return Level.PlaceTileRemovingExistingTiles(xVal, yVal, tileType, False, -1, False)
    End Function

    Function PlaceTileRemovingExistingTiles: Tile(xVal: Int, yVal: Int, tileType: Int, pending: Bool, tilesetOverride: Int, fromEarthSpell: Bool)
        Local lightValueCached: Float
        Local alpha: Float
        Local hasBeenSeen: Bool
        Local lightValueFrameNum: Int

        Local tile := Level.GetTileAt(xVal, yVal)
        If Not tile Or
           tilesetOverride <> TilesetType.None Or
           tile.type <> tileType
            If Not tile
                hasBeenSeen = False
                lightValueFrameNum = -1
                lightValueCached = -1.0
                alpha = 0.0
            Else
                If fromEarthSpell And
                   tile.trigger <> 0 And
                   tile.trigger <> 1
                    Return tile
                End If

                If tilesetOverride = TilesetType.None Then tilesetOverride = tile.tilesetOverride
                hasBeenSeen = tile.hasBeenSeen
                lightValueFrameNum = tile.lightValueFrameNum
                lightValueCached = tile.lightValueCached
                alpha = tile.image.alpha

                tile.Die()
            End If

            tile = New Tile(xVal, yVal, tileType, pending, tilesetOverride)
            tile.hasBeenSeen = hasBeenSeen
            tile.lightValueFrameNum = lightValueFrameNum
            tile.lightValueCached = lightValueCached
            tile.image.alpha = alpha
        End If

        Return tile
    End Function

    Function PlaceTileTypeAt: Void(xVal: Int, yVal: Int, tileType: Int)
        Local exitValue := Level.GetExitValue(xVal, yVal)
        If exitValue.x <> LevelType.Unknown_4 Then Return

        If Not Level.IsFloorAt(xVal, yVal) Then Return

        Level.PlaceTileRemovingExistingTiles(xVal, yVal, tileType)

        Local trap := Trap.GetTrapAt(xVal, yVal)
        If trap <> Null And
           Not trap.indestructible
            trap.Die()
        End If
    End Function

    Function PlaceTorchesAnywhere: Void()
        Debug.Log("PLACETORCHESANYWHERE: Placing torches")

        For Local limit := 5000 Until 0 Step -1
            Local wallTypeRoll := Util.RndIntRangeFromZero(1, True)
            Local wallType := TileType.ShopWall
            If wallType = 0
                wallType = TileType.DirtWall
            End If

            Local wallLocation := Level.FindTileOfType(wallType)
            Local wall := Level.GetTileAt(wallLocation.x, wallLocation.y)

            If wall = Null Then Continue
            If Level.GetDistanceToNearestTorch(wall) < 4.0 Then Continue
            If Enemy.GetEnemyAt(wallLocation.x, wallLocation.y, True) <> Null Then Continue

            wall.AddTorch()
        End For
    End Function

    Function PlaceTrapInRoom: Trap(room: RoomData, trapType: Int)
        Return Level.PlaceTrapInRoom(room, trapType, -1)
    End Function

    Function PlaceTrapInRoom: Trap(room: RoomData, trapType: Int, bounceDir: Int)
        Return Level.PlaceTrapInRoom(room.x, room.y, room.w, room.h, trapType, bounceDir)
    End Function

    Function PlaceTrapInRoom: Trap(xVal: Int, yVal: Int, wVal: Int, hVal: Int, trapType: Int, bounceDir: Int)
        Return Level.PlaceTrapInRoom(xVal, yVal, wVal, hVal, trapType, bounceDir, Null)
    End Function

    Function PlaceTrapInRoom: Trap(xVal: Int, yVal: Int, wVal: Int, hVal: Int, trapType: Int, bounceDir: Int, twoAwayTrap: Trap)
        For Local i := 200 Until 0 Step -1
            Local point: Point

            ' Diagonal Bounce Traps
            If trapType = TrapType.BounceTrap And
               (4 <= bounceDir And bounceDir <= 7)
                point = Level.GetRandPointInRoomWithOptions(xVal + 1, yVal + 1, wVal - 2, hVal - 2, True, True, False)
            Else
                point = Level.GetRandPointInRoomWithOptions(xVal, yVal, wVal, hVal, True, True, False)
            End If

            If point = Null Then Continue

            ' TODO: `twoAwayTrap` logic.
            '       Windows version doesn't have this at all. Might always be called with `twoAwayTrap` = Null?

            If Level.IsWallAt(point.x, point.y + 1, False, False) Then Continue
            If Level.IsCorridorFloorOrDoorAdjacent(point.x, point.y) Then Continue
            If Level.GetTileTypeAt(point.x, point.y) = TileType.Wire Then Continue
            If Level.GetTileTypeAt(point.x, point.y) = TileType.WiredDoor Then Continue

            Select trapType
                Case TrapType.BounceTrap
                    If Trap.GetTrapTypeAt(point.x + 1, point.y) = TrapType.BounceTrap Then Continue
                    If Trap.GetTrapTypeAt(point.x, point.y + 1) = TrapType.BounceTrap Then Continue
                    If Trap.GetTrapTypeAt(point.x - 1, point.y) = TrapType.BounceTrap Then Continue
                    If Trap.GetTrapTypeAt(point.x, point.y - 1) = TrapType.BounceTrap Then Continue

                    ' Diagonal Bounce Traps
                    If 4 <= bounceDir And bounceDir <= 7
                        If Trap.GetTrapTypeAt(point.x + 1, point.y + 1) = TrapType.BounceTrap Then Continue
                        If Trap.GetTrapTypeAt(point.x + 1, point.y - 1) = TrapType.BounceTrap Then Continue
                        If Trap.GetTrapTypeAt(point.x - 1, point.y + 1) = TrapType.BounceTrap Then Continue
                        If Trap.GetTrapTypeAt(point.x - 1, point.y - 1) = TrapType.BounceTrap Then Continue
                    End If

                    Return New BounceTrap(point.x, point.y, bounceDir)
                Case TrapType.SpikeTrap
                    Return New SpikeTrap(point.x, point.y)
                Case TrapType.TrapDoor
                    Return New TrapDoor(point.x, point.y)
                Case TrapType.ConfuseTrap
                    Return New ConfuseTrap(point.x, point.y)
                Case TrapType.TeleportTrap
                    Return New TeleportTrap(point.x, point.y)
                Case TrapType.ABTeleportTrap
                    Return New ABTeleportTrap(point.x, point.y)
                Case TrapType.BombTrap
                    Return New BombTrap(point.x, point.y)
                Case TrapType.ScatterTrap
                    Return New ScatterTrap(point.x, point.y)
            End Select
        End For

        Debug.Log("FAILED TO PLACE TRAP AT ROOM: " + xVal + ", " + yVal + ", " + wVal + ", " + hVal + " type: " + trapType)

        Return Null
    End Function

    Function PlaceTraps: Void()
        Debug.Log("PLACETRAPS")

        Select controller_game.currentZone
            Case 5 Level.PlaceTrapsZone5()
            Case 4 Level.PlaceTrapsZone4()
            Case 3 Level.PlaceTrapsZone3()
            Case 2 Level.PlaceTrapsZone2()
            Default Level.PlaceTrapsZone1()
        End Select
    End Function

    Function PlaceTrapsZone1: Void()
        For Local room := EachIn Level.rooms
            Select room.type
                Case RoomType.Shop,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            If room.hasExit Then Continue

            Select controller_game.currentLevel
                Case 1
                    If Util.RndBool(True)
                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap)
                    End If

                    Local bounceTrapRoll := Util.RndIntRangeFromZero(2, True)
                    If bounceTrapRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap)
                    Else
                        Local bombTrapRoll := Util.RndIntRangeFromZero(3, True)
                        If bombTrapRoll = 0
                            Level.PlaceTrapInRoom(room, TrapType.BombTrap)
                        End If
                    End If
                Case 2
                    Local trapDoorRoll := Util.RndIntRangeFromZero(4, True)
                    If trapDoorRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.TrapDoor)
                    Else
                        Local bombTrapRoll := Util.RndIntRangeFromZero(3, True)
                        If bombTrapRoll = 0
                            Level.PlaceTrapInRoom(room, TrapType.BombTrap)
                        End If
                    End If

                    Local spikeTrapRoll := Util.RndIntRangeFromZero(3, True)
                    If spikeTrapRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.SpikeTrap)
                    End If

                    Local bounceTrapRoll := Util.RndIntRangeFromZero(3, True)
                    If bounceTrapRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap)
                    End If

                    If Util.RndBool(True)
                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap)
                    End If
                Case 3
                    Local trapDoorRoll := Util.RndIntRangeFromZero(2, True)
                    If trapDoorRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.TrapDoor)
                    Else
                        Local bombTrapRoll := Util.RndIntRangeFromZero(3, True)
                        If bombTrapRoll = 0
                            Level.PlaceTrapInRoom(room, TrapType.BombTrap)
                        End If
                    End If

                    If Util.RndBool(True)
                        Level.PlaceTrapInRoom(room, TrapType.SpikeTrap)
                    End If

                    Local numBounceTraps := Util.RndIntRange(1, 3, True, -1)
                    For Local i := 0 Until numBounceTraps
                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap)
                    End For
                Default
                    If controller_game.currentLevel <= 0 Then Continue

                    Local trapDoorRoll := Util.RndIntRangeFromZero(2, True)
                    If trapDoorRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.TrapDoor)
                    Else
                        Local bombTrapRoll := Util.RndIntRangeFromZero(3, True)
                        If bombTrapRoll = 0
                            Level.PlaceTrapInRoom(room, TrapType.BombTrap)
                        End If
                    End If

                    If Util.RndBool(True)
                        Level.PlaceTrapInRoom(room, TrapType.SpikeTrap)
                    End If

                    Local spikeTrapRoll := Util.RndIntRangeFromZero(4, True)
                    If spikeTrapRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.SpikeTrap)
                    End If

                    Local numBounceTraps := Util.RndIntRange(1, 3, True, -1)
                    For Local i := 0 Until numBounceTraps
                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap)
                    End For
            End Select
        End For
    End Function

    Function PlaceTrapsZone2: Void()
        For Local room := EachIn Level.rooms
            Select room.type
                Case RoomType.Shop,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
                Default
            End Select

            If room.hasExit Then Continue

            Select controller_game.currentLevel
                Case 1
                    Local bounceTrapRoll := Util.RndBool(True)
                    If bounceTrapRoll
                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap)
                    End If

                    Local bounceTrapRoll2 = Util.RndIntRangeFromZero(2, True)
                    If bounceTrapRoll2 = 0
                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap)
                    Else
                        Local bombTrapRoll := Util.RndIntRangeFromZero(3, True)
                        If bombTrapRoll = 0
                            Level.PlaceTrapInRoom(room, TrapType.BombTrap)
                        End If
                    End If
                Case 2
                    Local trapDoorRoll := Util.RndIntRangeFromZero(4, True)
                    If trapDoorRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.TrapDoor)
                    Else
                        Local bombTrapRoll := Util.RndIntRangeFromZero(3, True)
                        If bombTrapRoll = 0
                            Level.PlaceTrapInRoom(room, TrapType.BombTrap)
                        End If
                    End If

                    Local spikeTrapRoll := Util.RndIntRangeFromZero(3, True)
                    If spikeTrapRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.SpikeTrap)
                    End If

                    Local bounceTrapRoll := Util.RndIntRangeFromZero(3, True)
                    If bounceTrapRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap)
                    End If

                    Local bounceTrapRoll2 := Util.RndBool(True)
                    If bounceTrapRoll2
                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap)
                    End If
                Case 3
                    Local trapDoorRoll := Util.RndIntRangeFromZero(2, True)
                    If trapDoorRoll = 0
                        Level.PlaceTrapInRoom(room, TrapType.TrapDoor)
                    Else
                        Local bombTrapRoll := Util.RndIntRangeFromZero(3, True)
                        If bombTrapRoll = 0
                            Level.PlaceTrapInRoom(room, TrapType.BombTrap)
                        End If
                    End If

                    Local spikeTrapRoll := Util.RndBool(True)
                    If spikeTrapRoll
                        Level.PlaceTrapInRoom(room, TrapType.SpikeTrap)
                    End If

                    Local numBounceTraps := Util.RndIntRange(1, 3, True, -1)
                    For Local numBounceTraps = numBounceTraps Until 0 Step -1
                        Local bounceTrapDirectionRoll := Util.RndBool(True)
                        Local bounceTrapDirection := BounceTrapDirection.None
                        If Not bounceTrapDirectionRoll
                            bounceTrapDirection = BounceTrapDirection.Omni
                        End If

                        Level.PlaceTrapInRoom(room, TrapType.BounceTrap, bounceTrapDirection)
                    End For
                Default
                    If controller_game.currentLevel > 3
                        Local trapDoorRoll := Util.RndIntRangeFromZero(2, True)
                        If trapDoorRoll = 0
                            Level.PlaceTrapInRoom(room, TrapType.TrapDoor)
                        Else
                            Local bombTrapRoll := Util.RndIntRangeFromZero(3, True)
                            If bombTrapRoll = 0
                                Level.PlaceTrapInRoom(room, TrapType.BombTrap)
                            End If
                        End If

                        Local spikeTrapRoll := Util.RndBool(True)
                        If spikeTrapRoll
                            Level.PlaceTrapInRoom(room, TrapType.SpikeTrap)
                        End If

                        Local spikeTrapRoll2 := Util.RndIntRangeFromZero(4, True)
                        If spikeTrapRoll2 = 0
                            Level.PlaceTrapInRoom(room, TrapType.SpikeTrap)
                        End If

                        Local numBounceTraps := Util.RndIntRange(1, 3, True, -1)
                        For Local numBounceTraps = numBounceTraps Until 0 Step -1
                            Local bounceTrapDirectionRoll := Util.RndIntRangeFromZero(2, True)
                            Local bounceTrapDirection := BounceTrapDirection.None
                            If bounceTrapDirectionRoll <> 0
                                Local bounceTrapDirectionRoll2 := Util.RndBool(True)
                                If bounceTrapDirectionRoll2
                                    bounceTrapDirection = BounceTrapDirection.Omni
                                Else
                                    bounceTrapDirection = BounceTrapDirection.Spin
                                End If
                            End If

                            Level.PlaceTrapInRoom(room, TrapType.BounceTrap, bounceTrapDirection)
                        End For
                    End If
            End Select
        End For
    End Function

    Function PlaceTrapsZone3: Void()
        For Local room := EachIn Level.rooms
            Select room.type
                Case RoomType.Shop,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            If room.hasExit Then Continue

            Select controller_game.currentLevel
                Case 1
                    Local trapRoll := Util.RndBool(True)
                    If trapRoll
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll2 := Util.RndIntRangeFromZero(2, True)
                    If trapRoll2 = 0
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If
                Case 2
                    Local trapRoll := Util.RndIntRangeFromZero(4, True)
                    If trapRoll = 0
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll2 := Util.RndIntRangeFromZero(3, True)
                    If trapRoll2 = 0
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll3 := Util.RndIntRangeFromZero(3, True)
                    If trapRoll3 = 0
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll4 := Util.RndBool(True)
                    If trapRoll4
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If
                Case 3
                    Local trapRoll := Util.RndIntRangeFromZero(2, True)
                    If trapRoll = 0
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll2 := Util.RndBool(True)
                    If trapRoll2
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If

                    Local numTraps := Util.RndIntRange(1, 3, True, -1)
                    For numTraps = numTraps Until 0 Step -1
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End For
                Default
                    Local trapRoll := Util.RndIntRangeFromZero(2, True)
                    If trapRoll = 0
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll2 := Util.RndBool(True)
                    If trapRoll2
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll3 := Util.RndIntRangeFromZero(4, True)
                    If trapRoll3 = 0
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End If

                    Local numTraps := Util.RndIntRange(1, 3, True, -1)
                    For numTraps = numTraps Until 0 Step -1
                        Level.PlaceTrapZone3(room.x, room.y, room.w, room.h)
                    End For
            End Select
        End For
    End Function

    Function PlaceTrapsZone4: Void()
        For Local room := EachIn Level.rooms
            Select room.type
                Case RoomType.Shop,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            If room.hasExit Then Continue

            Select controller_game.currentLevel
                Case 1
                    Local trapRoll := Util.RndBool(True)
                    If trapRoll
                        Level.PlaceTrapZone4(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll2 := Util.RndIntRangeFromZero(2, True)
                    If trapRoll2 = 0
                        Level.PlaceTrapZone4(room.x, room.y, room.w, room.h)
                    End If
                Case 2
                    Local trapRoll := Util.RndIntRangeFromZero(4, True)
                    If trapRoll = 0
                        Level.PlaceTrapZone4(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll2 := Util.RndIntRangeFromZero(3, True)
                    If trapRoll2 = 0
                        Level.PlaceTrapZone4(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll3 := Util.RndIntRangeFromZero(3, True)
                    If trapRoll3 = 0
                        Level.PlaceTrapZone4(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll4 := Util.RndBool(True)
                    If trapRoll4
                        Level.PlaceTrapZone4(room.x, room.y, room.w, room.h)
                    End If
                Case 3
                    Local trapRoll := Util.RndIntRangeFromZero(2, True)
                    If trapRoll = 0
                        Level.PlaceTrapZone4(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll2 := Util.RndBool(True)
                    If trapRoll2
                        Level.PlaceTrapZone4(room.x, room.y, room.w, room.h)
                    End If

                    Local numTraps := Util.RndIntRange(1, 3, True, -1)
                    For numTraps = numTraps Until 0 Step -1
                        Level.PlaceTrapZone4(room.x, room.y, room.w, room.h)
                    End For
            End Select
        End For

        Local destructibleWalls := New IntPointList()

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsWall(False, True, False, False)
                    destructibleWalls.AddLast(New Point(tile.x, tile.y))
                End If
            End For
        End For

        For Local limit := 500 Until 0 Step -1
            Local destructibleWallsIndex := Util.RndIntRangeFromZero(destructibleWalls.Count() - 1, True)
            Local destructibleWallsArray := destructibleWalls.ToArray()
            Local destructibleWall := destructibleWallsArray[destructibleWallsIndex]

            If Util.GetDist(0, destructibleWall.y, destructibleWall.x, 0) < 5.0 Then Continue

            If Util.RndBool(True)
                If Not Level.IsFloorAt(destructibleWall.x + 1, destructibleWall.y) Then Continue
                If destructibleWall.y = 0 Then Continue

                Level.PlaceTileRemovingExistingTiles(destructibleWall.x, destructibleWall.y, TileType.CatacombWall)

                New FireTrap(destructibleWall.x, destructibleWall.y, 0, False)
            Else
                If Not Level.IsFloorAt(destructibleWall.x - 1, destructibleWall.y) Then Continue
                If destructibleWall.y = 0 Then Continue

                Level.PlaceTileRemovingExistingTiles(destructibleWall.x, destructibleWall.y, TileType.CatacombWall)

                New FireTrap(destructibleWall.x, destructibleWall.y, 2, False)
            End If

            Return
        End For
    End Function

    Function PlaceTrapsZone5: Void()
        For Local room := EachIn Level.rooms
            Select room.type
                Case RoomType.Shop,
                     RoomType.Secret,
                     RoomType.Vault
                    Continue
            End Select

            If room.hasExit Then Continue

            Select controller_game.currentLevel
                Case 1
                    Local trapRoll := Util.RndBool(True)
                    If trapRoll
                        Level.PlaceTrapZone5(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll2 := Util.RndIntRangeFromZero(2, True)
                    If trapRoll2 = 0
                        Level.PlaceTrapZone5(room.x, room.y, room.w, room.h)
                    End If
                Case 2
                    Local trapRoll := Util.RndIntRangeFromZero(4, True)
                    If trapRoll = 0
                        Level.PlaceTrapZone5(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll2 := Util.RndIntRangeFromZero(3, True)
                    If trapRoll2 = 0
                        Level.PlaceTrapZone5(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll3 := Util.RndIntRangeFromZero(3, True)
                    If trapRoll3 = 0
                        Level.PlaceTrapZone5(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll4 := Util.RndBool(True)
                    If trapRoll4
                        Level.PlaceTrapZone5(room.x, room.y, room.w, room.h)
                    End If
                Case 3
                    Local trapRoll := Util.RndIntRangeFromZero(2, True)
                    If trapRoll = 0
                        Level.PlaceTrapZone5(room.x, room.y, room.w, room.h)
                    End If

                    Local trapRoll2 := Util.RndBool(True)
                    If trapRoll2
                        Level.PlaceTrapZone5(room.x, room.y, room.w, room.h)
                    End If

                    Local numTraps := Util.RndIntRange(1, 3, True, -1)
                    For numTraps = numTraps Until 0 Step -1
                        Level.PlaceTrapZone5(room.x, room.y, room.w, room.h)
                    End For
            End Select
        End For
    End Function

    Function PlaceTrapZone3: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Local trapTypeRoll := Util.RndIntRangeFromZero(100, True)
        Local trapType: Int
        Local direction := -1

        If trapTypeRoll <= 1
            trapType = TrapType.BounceTrap
            direction = BounceTrapDirection.Spin
        Else If trapTypeRoll <=  5
            trapType = TrapType.BounceTrap
            direction = BounceTrapDirection.Omni
        Else If trapTypeRoll <= 10
            trapType = TrapType.TrapDoor
        Else If trapTypeRoll <= 30
            trapType = TrapType.ConfuseTrap
        Else If trapTypeRoll <= 45
            trapType = TrapType.TeleportTrap
        Else If trapTypeRoll <= 60
            trapType = TrapType.SpikeTrap
        Else If trapTypeRoll <= 75
            trapType = TrapType.BombTrap
        Else
            trapType = TrapType.BounceTrap
        End If

        Level.PlaceTrapInRoom(xVal, yVal, wVal, hVal, trapType, direction)
    End Function

    Function PlaceTrapZone4: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Local trapTypeRoll := Util.RndIntRangeFromZero(100, True)
        Local trapType: Int
        Local direction := BounceTrapDirection.None

        If trapTypeRoll <= 5
            trapType = TrapType.BounceTrap
            direction = BounceTrapDirection.Omni
        Else If trapTypeRoll <= 10
            trapType = TrapType.TrapDoor
        Else If trapTypeRoll <= 20
            trapType = TrapType.ConfuseTrap
        Else If trapTypeRoll <= 30
            trapType = TrapType.BombTrap
        Else If trapTypeRoll <= 40
            trapType = TrapType.SpikeTrap
        Else If trapTypeRoll <= 55
            trapType = TrapType.BounceTrap
            direction = BounceTrapDirection.DownRight
        Else If trapTypeRoll <= 70
            trapType = TrapType.BounceTrap
            direction = BounceTrapDirection.DownLeft
        Else If trapTypeRoll <= 85
            trapType = TrapType.BounceTrap
            direction = BounceTrapDirection.UpLeft
        Else
            trapType = TrapType.BounceTrap
            direction = BounceTrapDirection.UpRight
        End If

        Level.PlaceTrapInRoom(xVal, yVal, wVal, hVal, trapType, direction)
    End Function

    Function PlaceTrapZone5: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Local trapDoorWeight := 5
        If Level.MaybeForbidTrapdoor()
            trapDoorWeight = 0
        End If

        Local weights := New WeightedPicker()
        weights.Push(10)
        weights.Push(20)
        weights.Push(trapDoorWeight)
        weights.Push(50)
        weights.Push(10)

        Local trapType: Int

        Select weights.PickRandom(True)
            Case 0
                trapType = TrapType.BombTrap
            Case 1
                trapType = TrapType.SpikeTrap
            Case 2
                trapType = TrapType.TrapDoor
            Case 3
                trapType = TrapType.BounceTrap
            Default
                trapType = TrapType.ScatterTrap
        End Select

        Level.PlaceTrapInRoom(xVal, yVal, wVal, hVal, trapType, BounceTrapDirection.None)
    End Function

    Function PlaceWire: Bool(src: Point, dst: Point)
        Debug.Log("PLACEWIRE: Wiring " + src.ToString() + " to " + dst.ToString())

        Local connections := New IntPointMap<Point>()
        Local wirePoints := New List<Point>()

        connections.Add(src, Null)
        wirePoints.AddLast(src)

        While wirePoints.Count() > 0
            Local wirePoint := wirePoints.RemoveFirst()

            For Local dir := 0 To 3
                Local offset := Util.GetPointFromDir(dir)
                Local wirePointCandidate := wirePoint.Add(offset)

                If wirePointCandidate.Equals(dst) Or
                   Not Level.IsWallAdjacent8(wirePointCandidate.x, wirePointCandidate.y)
                    If Level.IsFloorAt(wirePointCandidate.x, wirePointCandidate.y) And
                       Not connections.Contains(wirePointCandidate)
                        connections.Add(wirePointCandidate, wirePoint)
                        wirePoints.AddLast(wirePointCandidate)
                    End If
                End If
            End For
        End While

        Local dstKey := dst
        If connections.Contains(dstKey)
            Local dstValue: Point
            Local dirToPrev := Direction.None

            Repeat
                Local dirToNext := Direction.None

                dstValue = connections.Get(dstKey)
                If dstValue <> Null
                    Local xDiff := dstValue.x - dstKey.x
                    Local yDiff := dstValue.y - dstKey.y

                    If xDiff > 0
                        If yDiff > 0
                            dirToNext = Direction.DownRight
                        Else If yDiff < 0
                            dirToNext = Direction.UpRight
                        End If
                    Else If xDiff < 0
                        If yDiff > 0
                            dirToNext = Direction.DownLeft
                        Else If yDiff < 0
                            dirToNext = Direction.UpLeft
                        End If
                    Else
                        If yDiff > 0
                            dirToNext = Direction.Down
                        Else If yDiff < 0
                            dirToNext = Direction.Up
                        End If
                    End If

                    If yDiff = 0
                        If xDiff > 0
                            dirToNext = Direction.Right
                        Else If xDiff < 0
                            dirToNext = Direction.Left
                        End If
                    End If
                End If

                If Not Level.IsExitAt(dstKey.x, dstKey.y)
                    Local wire := Level.PlaceTileRemovingExistingTiles(dstKey.x, dstKey.y, TileType.Wire)

                    If dirToPrev <> Direction.None
                        wire.AddWireConnection(dirToPrev)
                    End If
                    If dirToNext <> Direction.None
                        wire.AddWireConnection(dirToNext)
                    End If
                End If

                Select dirToNext
                    Case Direction.Up
                        dirToPrev = Direction.Down
                    Case Direction.Down
                        dirToPrev = Direction.Up
                    Case Direction.Left
                        dirToPrev = Direction.Right
                    Case Direction.Right
                        dirToPrev = Direction.Left
                    Case Direction.UpLeft
                        dirToPrev = Direction.DownRight
                    Case Direction.UpRight
                        dirToPrev = Direction.DownLeft
                    Case Direction.DownLeft
                        dirToPrev = Direction.UpRight
                    Case Direction.DownRight
                        dirToPrev = Direction.UpLeft
                    Default
                        dirToPrev = Direction.None
                End Select

                dstKey = dstValue
            Until dstValue = Null

            Return True
        End If

        Debug.Log("PLACEWIRE: Failed to find route to destination")

        Return False
    End Function

    Function PlaceZone3Beetle: Enemy(xVal: Int, yVal: Int)
        If Level.IsInZone3Hot(xVal, yVal)
            Return Enemy.MakeEnemy(xVal, yVal, EnemyType.FireBeetle)
        End If

        Return Enemy.MakeEnemy(xVal, yVal, EnemyType.IceBeetle)
    End Function

    Function PlaceZone3Cauldron: Enemy(xVal: Int, yVal: Int)
        Local trapCauldronRoll := Util.RndIntRangeFromZero(20, True)
        If trapCauldronRoll = 0
            Return New TrapCauldron(xVal, yVal, 1)
        End If

        Return New Cauldron(xVal, yVal, 1)
    End Function

    Function PlaceZone3Elemental: Enemy(xVal: Int, yVal: Int)
        If Level.IsInZone3Hot(xVal, yVal)
            Return Enemy.MakeEnemy(xVal, yVal, EnemyType.FireElemental)
        End If

        Return Enemy.MakeEnemy(xVal, yVal, EnemyType.IceElemental)
    End Function

    Function PlaceZone3Slime: Slime(xVal: Int, yVal: Int)
        If Level.IsInZone3Hot(xVal, yVal)
            Return New Slime(xVal, yVal, 5)
        End If

        Return New Slime(xVal, yVal, 4)
    End Function

    Function PlaceZone3YetiHellhound: Enemy(xVal: Int, yVal: Int)
        If Level.IsInZone3Hot(xVal, yVal)
            Return Enemy.MakeEnemy(xVal, yVal, EnemyType.Hellhound)
        End If


        Return Enemy.MakeEnemy(xVal, yVal, EnemyType.Yeti)
    End Function

    Function PlaceZoneAppropriateNumberOfDiamondsAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZoneAppropriateNumberOfDiamondsAt(Int, Int)")
    End Function

    Function ProcessSpecialRoom: Void()
        Debug.Log("Processing special rooms")

        If controller_game.currentDepth = Level.placeTransmogrifierOnDepth And controller_game.currentLevel = Level.placeTransmogrifierOnLevel
            Level.AddSpecialRoom(SpecialRoomType.Transmogrifier, True)
        Else If controller_game.currentDepth = Level.placeArenaOnDepth And controller_game.currentLevel = Level.placeArenaOnLevel
            Level.AddSpecialRoom(SpecialRoomType.Arena, True)
        Else If controller_game.currentDepth = Level.placeBloodShopOnDepth And controller_game.currentLevel = Level.placeBloodShopOnLevel
            Level.AddSpecialRoom(SpecialRoomType.BloodShop, True)
        Else If controller_game.currentDepth = Level.placeGlassShopOnDepth And controller_game.currentLevel = Level.placeGlassShopOnLevel
            Level.AddSpecialRoom(SpecialRoomType.GlassShop, True)
        Else If controller_game.currentDepth = Level.placeFoodShopOnDepth And controller_game.currentLevel = Level.placeFoodShopOnLevel
            Level.AddSpecialRoom(SpecialRoomType.FoodShop, True)
        Else If controller_game.currentDepth = Level.placeConjurerOnDepth And controller_game.currentLevel = Level.placeConjurerOnLevel
            Level.AddSpecialRoom(SpecialRoomType.Conjurer, True)
        Else If controller_game.currentDepth = Level.placeShrinerOnDepth And controller_game.currentLevel = Level.placeShrinerOnLevel
            Level.AddSpecialRoom(SpecialRoomType.Shriner, True)
        Else If controller_game.currentDepth = Level.placePawnbrokerOnDepth And controller_game.currentLevel = Level.placePawnbrokerOnLevel
            Level.AddSpecialRoom(SpecialRoomType.Pawnbroker, True)
        End If

        Debug.Log("Done processing special rooms")
    End Function

    Function PutBeastmasterStairs: Void(x: Int, y: Int, stairName: String, enemyName: String, enemyType: Int, enemyType: Int, stairNamePrefix: String)
        Debug.TraceNotImplemented("Level.PutBeastmasterStairs(Int, Int, String, String, Int, Int, Int)")
    End Function

    Function PutBossStair: Void(x: Int, y: Int, bossName: String, enemyType: Int, zone: Int, label: String, labelXOff: Int)
        Debug.TraceNotImplemented("Level.PutBossStair(Int, Int, String, Int, Int, String, Int)")
    End Function

    Function PutCrateOrBarrel: Void(x: Int, y: Int)
        If Level.isHardcoreMode Or
           controller_game.currentDepth > 1
            Local trapChestRoll := Util.RndIntRange(1, 100, True, -1)
            If trapChestRoll <= 3
                Local trapChestBaseLevel := Util.RndIntRangeFromZero(1, True)
                New TrapChest(x, y, trapChestBaseLevel + 4)

                Return
            End If
        End If

        Local crateType := Util.RndIntRangeFromZero(1, True)
        New Crate(x, y, crateType, Item.NoItem)
    End Function

    Function PutEnemyZone5: Void(x: Int, y: Int)
        Local pts := New StackEx<Point>()
        pts.Push(New Point(x, y))

        Level.PutVariedEnemiesZone5(pts)
    End Function

    Function PutFutureStair: Void(x: Int, y: Int)
        Debug.TraceNotImplemented("Level.PutFutureStair(Int, Int)")
    End Function

    Function PutMinibossStair: Void(x: Int, y: Int, minibossName: String, enemyType: Int, label: String, labelXOff: Int)
        Debug.TraceNotImplemented("Level.PutMinibossStair(Int, Int, String, Int, String, Int)")
    End Function

    Function PutRoomEnemiesZone5: Void(room: RoomBase, hasExit: Bool)
        If hasExit
            Level.PlaceExitRoomMiniboss(room)
        End If

        Level.PlaceRareEnemies(room, hasExit)

        Local wire := Level.GetRandPointInRoomOfTileType(room, TileType.Wire, True)
        If wire <> Null
            New ZombieElectric(wire.x, wire.y, 1)
        End If

        Local point: Point

        Local extraEnemies := Level.GetExtraEnemiesBase()
        If Util.IsCharacterActive(Character.Aria)
            extraEnemies += 1
        End If

        For Local limit := 500 Until 0 Step -1
            If extraEnemies <= 0 Then Exit

            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
            If point = Null Then Return

            extraEnemies -= 1
            Level.PutEnemyZone5(point.x, point.y)
        End For

        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
        If point = Null Then Return

        Local electricMageOrSkullRoll := Util.RndBool(True)
        If electricMageOrSkullRoll
            Local levelHigh := math.Min(3, controller_game.currentLevel)
            Local electricMageLevel := Util.RndIntRange(1, levelHigh, True, -1)
            New ElectricMage(point.x, point.y, electricMageLevel)
        Else
            Local levelHigh := math.Min(3, controller_game.currentLevel)
            Local skullLevel := Util.RndIntRange(1, levelHigh, True, -1)
            New Skull(point.x, point.y, skullLevel)
        End If

        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
        If point = Null Then Return

        Local orcOrWaterBallOrGorgonRoll := Util.RndBool(True)
        If orcOrWaterBallOrGorgonRoll
            Local levelHigh := math.Min(3, controller_game.currentLevel)
            Local orcLevel := Util.RndIntRange(1, levelHigh, True, -1)
            New Orc(point.x, point.y, orcLevel)
        Else
            Local waterBallOrGorgonRoll := Util.RndBool(True)
            If waterBallOrGorgonRoll
                New WaterBall(point.x, point.y, 1)
            Else
                Local gorgonLevelRoll := Util.RndIntRangeFromZero(3, True)
                Local gorgonLevel := 1
                If gorgonLevelRoll = 0
                    gorgonLevel = 2
                End If

                New Gorgon(point.x, point.y, gorgonLevel)
            End If
        End If

        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
        If point = Null Then Return

        Local devilOrEvilEyeRoll := Util.RndBool(True)
        If devilOrEvilEyeRoll
            Local levelHigh := math.Min(2, controller_game.currentLevel)
            Local devilLevel := Util.RndIntRange(1, levelHigh, True, -1)
            New Devil(point.x, point.y, devilLevel)
        Else
            Local levelHigh := math.Min(2, controller_game.currentLevel)
            Local evilEyeLevel := Util.RndIntRange(1, levelHigh, True, -1)
            New EvilEye(point.x, point.y, evilEyeLevel)
        End If

        If hasExit
            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
            If point = Null Then Return

            Local electricMageLevel := math.Min(3, controller_game.currentLevel)
            New ElectricMage(point.x, point.y, electricMageLevel)

            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
            If point = Null Then Return

            Local skullLevel := math.Min(3, controller_game.currentLevel)
            New Skull(point.x, point.y, skullLevel)

            point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
            If point = Null Then Return

            Local evilEyeLevel := math.Min(2, controller_game.currentLevel)
            New EvilEye(point.x, point.y, evilEyeLevel)
        End If
    End Function

    Function PutVariedEnemiesZone5: Void(pts: StackEx<Point>)
        pts.Shuffle(True)

        Local picker := New WeightedPicker()
        picker.Push(100)
        picker.Push(50)
        picker.Push(50)
        picker.Push(200)
        picker.Push(100)
        picker.Push(100)
        picker.Push(100)

        Local selected: Int[7]

        For Local point := EachIn pts
            Local minSelected := 999
            For Local s := EachIn selected
                minSelected = math.Min(minSelected, s)
            End For

            For Local i := 0 Until picker.weights.Length()
                Local s := selected[i]
                Local isMinSelected := s = minSelected
                picker.SetEnabled(i, isMinSelected)
            End For

            Local enemyTypeRoll := picker.PickRandom(True)
            Local weight := picker.weights.Get(enemyTypeRoll)
            picker.weights.Set(enemyTypeRoll, weight + 1)

            Select enemyTypeRoll
                Case 0
                    Local electricMageLevelHigh := math.Min(3, controller_game.currentLevel)
                    Local electricMageLevel := Util.RndIntRange(1, electricMageLevelHigh, True, -1)
                    New ElectricMage(point.x, point.y, electricMageLevel)
                Case 1
                    New WaterBall(point.x, point.y, 1)
                Case 2
                    Local gorgonLevel := 1
                    If controller_game.currentLevel >= 2
                        Local gorgonLevelRoll := Util.RndIntRangeFromZero(2, True)
                        If gorgonLevelRoll = 0
                            gorgonLevel = 2
                        End If
                    End If

                    New Gorgon(point.x, point.y, gorgonLevel)
                Case 3
                    Local skullLevelHigh := math.Min(3, controller_game.currentLevel)
                    Local skullLevel := Util.RndIntRange(1, skullLevelHigh, True, -1)
                    New Skull(point.x, point.y, skullLevel)
                Case 4
                    Local evilEyeLevelHigh := math.Min(2, controller_game.currentLevel)
                    Local evilEyeLevel := Util.RndIntRange(1, evilEyeLevelHigh, True, -1)
                    New EvilEye(point.x, point.y, evilEyeLevel)
                Case 5
                    Local orcLevelHigh := math.Min(3, controller_game.currentLevel)
                    Local orcLevel := Util.RndIntRange(1, orcLevelHigh, True, -1)
                    New Orc(point.x, point.y, orcLevel)
                Default
                    Local devilLevelHigh := math.Min(2, controller_game.currentLevel)
                    Local devilLevel := Util.RndIntRange(1, devilLevelHigh, True, -1)
                    New Devil(point.x, point.y, devilLevel)
            End Select
        End For
    End Function

    Function QueryHarderBosses: Bool()
        Debug.TraceNotImplemented("Level.QueryHarderBosses()")
    End Function

    Function RandomFood: String()
        Select Util.RndIntRangeFromZero(5, True)
            Case 0 Return "food_1"
            Case 1 Return "food_2"
            Case 2 Return "food_3"
            Case 3 Return "food_4"
            Case 4 Return "food_carrot"
        End Select

        Return "food_cookies"
    End Function

    Function RandomWalkOfTempTiles: Void(xVal: Int, yVal: Int, distCounter: Int)
        Repeat
            If Util.RndBool(True)
                If Util.RndBool(True)
                    xVal += 1
                Else
                    xVal -= 1
                End If
            Else
                If Util.RndBool(True)
                    yVal += 1
                Else
                    yVal -= 1
                End If
            End If

            Level.tempTileWalk.AddLast(New Point(xVal, yVal))

            distCounter -= 1
        Until distCounter <= 0
    End Function

    Function RecalcLevelBoundaries: Void()
        Debug.TraceNotImplemented("Level.RecalcLevelBoundaries()")
    End Function

    Function RefreshLineOfSightTiles: Void()
        Debug.TraceNotImplemented("Level.RefreshLineOfSightTiles()")
    End Function

    Function RemoveExit: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.RemoveExit(Int, Int)")
    End Function

    Function RemoveSomeWallsAwayFromCorridors: Void(percentToRemove: Float, includeCorridors: Bool, maxHealth: Int)
        Local removalCandidates := New IntPointList()

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsWall(Not includeCorridors, True, False, False)
                    If tile.health <= maxHealth
                        removalCandidates.AddLast(New Point(tile.x, tile.y))
                    End If
                End If
            End For
        End For

        Local i := 500
        Local numWallsToRemove := Int(removalCandidates.Count() * percentToRemove)

        For Local i = i - 1 Until 0 Step -1
            If removalCandidates.IsEmpty() Then Exit
            If numWallsToRemove <= 0 Then Exit

            Local removalCandidatesIndex := Util.RndIntRangeFromZero(removalCandidates.Count() - 1, True)
            Local removalCandidatesArray := removalCandidates.ToArray()
            Local wallToRemove := removalCandidatesArray[removalCandidatesIndex]

            If Level.IsFloorAdjacent(wallToRemove.x, wallToRemove.y)
                If Not Level.IsCorridorFloorOrDoorAdjacent(wallToRemove.x, wallToRemove.y)
                    Level.PlaceTileRemovingExistingTiles(wallToRemove.x, wallToRemove.y, False, False, -1, False)
                    numWallsToRemove -= 1
                End If
            End If

            removalCandidates.RemoveEach(wallToRemove)
        End For

        If i <= 0
            Debug.Log("****************** RemoveSomeWallsAwayFromCorridors: Unable to remove the desired number of walls! ******************")
        End If
    End Function

    Function RemoveTileAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.RemoveTileAt(Int, Int)")
    End Function

    Function RenderAll: Void()
        Debug.TraceNotImplemented("Level.RenderAll()")
    End Function

    Function RenderExitArrow: Void()
        Debug.TraceNotImplemented("Level.RenderExitArrow()")
    End Function

    Function ResetCosts: Void()
        Debug.TraceNotImplemented("Level.ResetCosts()")
    End Function

    Function ResetSpecialRoomVariables: Void()
        Debug.TraceNotImplemented("Level.ResetSpecialRoomVariables()")
    End Function

    Function SetMagicBarrier: Void(on: Bool)
        For Local x := -2 To 3
            Level.SetMagicBarrierAt(x, -7, on)
        End For
    End Function

    Function SetMagicBarrierAt: Void(xVal: Int, yVal: Int, on: Bool)
        Local tile := Level.GetTileAt(xVal, yVal)
        If tile <> Null
            tile.magicBarrier = on
        End If
    End Function

    Function ShopkeeperMissing: Bool()
        Debug.TraceNotImplemented("Level.ShopkeeperMissing()")
    End Function

    Function ShowModPopup: Void(imageName: String)
        Debug.TraceNotImplemented("Level.ShowModPopup(String)")
    End Function

    Function SplashWater: Void(xVal: Int, yVal: Int, destroyWater: Bool)
        Debug.TraceNotImplemented("Level.SplashWater(Int, Int, Bool)")
    End Function

    Function StartReplayPlayback: Void()
        Debug.TraceNotImplemented("Level.StartReplayPlayback()")
    End Function

    Function TakeActionAfterAllCharsScoreSubmit: Void()
        Debug.TraceNotImplemented("Level.TakeActionAfterAllCharsScoreSubmit()")
    End Function

    Function TransmogrifySlot: Void(slotName: String, ent: Entity)
        Debug.TraceNotImplemented("Level.TransmogrifySlot(String, Entity)")
    End Function

    Function TransmogrifyWeaponToType: Void(ent: Entity, type: Int)
        Debug.TraceNotImplemented("Level.TransmogrifyWeaponToType(Entity, Int)")
    End Function

    Function TrySpawnBossMinibossAt: Void(x: Int, y: Int, etype: Int)
        Debug.TraceNotImplemented("Level.TrySpawnBossMinibossAt(Int, Int, Int)")
    End Function

    Function UnlockChar: Void(characterID: Int)
        Debug.TraceNotImplemented("Level.UnlockChar(Int)")
    End Function

    Function Update: Void()
        Debug.TraceNotImplemented("Level.Update()")
    End Function

    Function WantPenaltyBox: Bool()
        Return Level.previousLevelUnkilledStairLockingMinibosses.Length() > 0 And
               Not Level.pacifismModeOn And
               Not Level.isLevelEditor And
               ControllerLevelEditor.playingLevel = -1 And
               Not Level.skipNextPenaltyBox
    End Function

    Function WidenCorridors: Void()
        Local corridorWallLocations := New IntPointList()

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.GetType() = TileType.CorridorDirtWall
                    corridorWallLocations.AddLast(New Point(tile.x, tile.y))
                End If
            End For
        End For

        For Local corridorWallLocation := EachIn corridorWallLocations
            Level.PlaceTileRemovingExistingTiles(corridorWallLocation.x, corridorWallLocation.y, TileType.Floor)
        End For
    End Function

    Function _EditorFix: Void() End

End Class

Class MinibossTileData

    Function _EditorFix: Void() End

    Field x: Int
    Field y: Int
    Field type: Int
    Field wireMask: Int

End Class

' Helper type
Class SecretRoomData

    Method New(xVal: Int, yVal: Int, width: Int, height: Int, isCrackedWallAdjacent: Bool)
        Self.x = xVal
        Self.y = yVal
        Self.w = width
        Self.h = height
        Self.isCrackedWallAdjacent = isCrackedWallAdjacent
    End Method

    Field x: Int
    Field y: Int
    Field w: Int
    Field h: Int
    Field isCrackedWallAdjacent: Bool

End Class

Class RoomType

    Const None: Int = -1
    Const Basic: Int = 0
    Const Pillar: Int = 1
    Const OutsideCorners: Int = 2
    Const Shop: Int = 3
    Const Start: Int = 4
    Const Secret: Int = 5
    Const Boss: Int = 6
    Const Vault: Int = 7
    Const Notched: Int = 8
    Const Special: Int = 10

End Class

Class SpecialRoomType

    Const Transmogrifier: Int = 1
    Const Arena: Int = 2
    Const BloodShop: Int = 3
    Const GlassShop: Int = 4
    Const FoodShop: Int = 5
    Const Conjurer: Int = 6
    Const Shriner: Int = 7
    Const Pawnbroker: Int = 8

End Class

Class LevelType

    Const LevelEditor: Int = -3001
    Const Test: Int = -3000

    Const MinCharacterSelect: Int = -2000
    Const MaxCharacterSelect: Int = -1985
    Const SelectCharacterSelectCadence: Int = -2000
    Const SelectCharacterSelectMelody: Int = -1999
    Const SelectCharacterSelectAria: Int = -1998
    Const SelectCharacterSelectDorian: Int = -1997
    Const SelectCharacterSelectEli: Int = -1996
    Const SelectCharacterSelectMonk: Int = -1995
    Const SelectCharacterSelectDove: Int = -1994
    Const SelectCharacterSelectCoda: Int = -1993
    Const SelectCharacterSelectBolt: Int = -1992
    Const SelectCharacterSelectBard: Int = -1991
    Const SelectCharacterSelectNocturna: Int = -1990
    Const SelectCharacterSelectDiamond: Int = -1989
    Const SelectCharacterSelectMary: Int = -1988
    Const SelectCharacterSelectTempo: Int = -1987
    Const SelectCharacterSelectReaper: Int = -1986

    Const DeathlessMode: Int = -1902
    Const RandomCharacter: Int = -1901

    Const CreateAllCharactersCharacterSelect: Int = -1900
    Const MinAllCharactersCharacterSelect: Int = -1800
    Const MaxAllCharactersCharacterSelect: Int = -1785
    Const AllCharactersCharacterSelectCadence: Int = -1800
    Const AllCharactersCharacterSelectMelody: Int = -1799
    Const AllCharactersCharacterSelectAria: Int = -1798
    Const AllCharactersCharacterSelectDorian: Int = -1797
    Const AllCharactersCharacterSelectEli: Int = -1796
    Const AllCharactersCharacterSelectMonk: Int = -1795
    Const AllCharactersCharacterSelectDove: Int = -1794
    Const AllCharactersCharacterSelectCoda: Int = -1793
    Const AllCharactersCharacterSelectBolt: Int = -1792
    Const AllCharactersCharacterSelectBard: Int = -1791
    Const AllCharactersCharacterSelectNocturna: Int = -1790
    Const AllCharactersCharacterSelectDiamond: Int = -1789
    Const AllCharactersCharacterSelectMary: Int = -1788
    Const AllCharactersCharacterSelectTempo: Int = -1787

    Const CreateAllCharactersDLCCharacterSelect: Int = -1700
    Const MinAllCharactersDLCCharacterSelect: Int = -1600
    Const MaxAllCharactersDLCCharacterSelect: Int = -1585
    Const AllCharactersDLCCharacterSelectCadence: Int = -1600
    Const AllCharactersDLCCharacterSelectMelody: Int = -1599
    Const AllCharactersDLCCharacterSelectAria: Int = -1598
    Const AllCharactersDLCCharacterSelectDorian: Int = -1597
    Const AllCharactersDLCCharacterSelectEli: Int = -1596
    Const AllCharactersDLCCharacterSelectMonk: Int = -1595
    Const AllCharactersDLCCharacterSelectDove: Int = -1594
    Const AllCharactersDLCCharacterSelectCoda: Int = -1593
    Const AllCharactersDLCCharacterSelectBolt: Int = -1592
    Const AllCharactersDLCCharacterSelectBard: Int = -1591
    Const AllCharactersDLCCharacterSelectNocturna: Int = -1590
    Const AllCharactersDLCCharacterSelectDiamond: Int = -1589
    Const AllCharactersDLCCharacterSelectMary: Int = -1588
    Const AllCharactersDLCCharacterSelectTempo: Int = -1587

    Const MinMentorLevel: Int = -1100
    Const MaxMentorLevel: Int = -1050
    Const MentorLevel1: Int = -1100
    Const MentorLevel2: Int = -1099
    Const MentorLevel3: Int = -1098
    Const MentorLevel4: Int = -1097

    Const MinTrainingLevel: Int = -1000
    Const MaxTrainingLevel: Int = -101
    Const TrainingBossBattle1: Int = -500
    Const TrainingBossBattle2: Int = -499
    Const TrainingBossBattle3: Int = -498
    Const TrainingBossBattle4: Int = -497
    Const TrainingBossBattle9: Int = -496
    Const TrainingBossBattle5: Int = -495
    Const TrainingFinalBossBattleNecroDancer: Int = -494
    Const TrainingFinalBossBattleNecroDancer2: Int = -493
    Const TrainingFinalBossBattleLute: Int = -492
    Const TrainingBossBattle10: Int = -491
    Const TrainingFinalBossBattleConductor: Int = -490

    Const SeededMysteryMode: Int = -64
    Const SeededRandomizerMode: Int = -63
    Const SeededPhasingMode: Int = -62
    Const MysteryMode: Int = -61
    Const RandomizerMode: Int = -60
    Const PhasingMode: Int = -59
    Const FloorIsLavaMode: Int = -57
    Const SeededHardMode: Int = -56
    Const HardMode: Int = -55
    Const SoulMode: Int = -54
    Const SeededNoReturnMode: Int = -53
    Const NoReturnMode: Int = -52
    Const SwarmMode: Int = -51
    Const StoryMode: Int = -50
    Const AllCharactersDLCCharacterSelect: Int = -22
    Const BeastmasterZone5: Int = -21
    Const ExtraModesSelect: Int = -20
    Const AllCharactersCharacterSelect: Int = -19
    Const BossmasterBosses: Int = -18
    Const BossmasterMinibosses: Int = -17
    Const BeastmasterZone4: Int = -16
    Const BeastmasterZone3: Int = -15
    Const BeastmasterZone2: Int = -14
    Const BeastmasterZone1: Int = -13
    Const CharacterSelect: Int = -12
    Const ToggleCoOpMode: Int = -11
    Const SeededAllZonesMode: Int = -10
    Const DailyChallenge: Int = -9
    Const DancePadMode: Int = -8
    Const AllZonesMode: Int = -7
    Const LockedExit1: Int = -6
    Const LockedExit2: Int = -5
    Const Unknown_4: Int = -4
    Const NextLevel: Int = -3
    Const Lobby: Int = -2
    Const Unknown_1: Int = -1
    Const Tutorial: Int = 0
    Const Level1: Int = 1
    Const Level2: Int = 2
    Const Level3: Int = 3
    Const BossBattle: Int = 4
    Const FinalBossBattle: Int = 5

End Class

Class BossBattleType

    Const None: Int = -1
    Const CongaLine: Int = 1
    Const DeathMetal: Int = 2
    Const DeepBlues: Int = 3
    Const CoralRiff: Int = 4
    Const DeadRinger: Int = 5
    Const NecroDancer: Int = 6
    Const NecroDancer2: Int = 7
    Const LuteDragon: Int = 8
    Const Fortissimole: Int = 9
    Const Frankensteinway: Int = 10
    Const Conductor: Int = 11

End Class
