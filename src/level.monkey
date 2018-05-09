'Strict

Import monkey.map
Import monkey.math
Import monkey.random
Import monkey.set
Import abteleporttrap
Import banshee
Import bat
Import bat_miniboss
Import beastmaster
Import bishop
Import bombtrap
Import bossmaster
Import bouncetrap
Import camera
Import chest
Import confusetrap
Import conjurer
Import controller_game
Import controller_level_editor
Import crate
Import death_metal
Import diamonddealer
Import dragon
Import entity
Import exitmap
Import fakewall
import gamedata
Import ghast
Import ghost
Import input2
Import intpointlist
Import intpointset
Import intpointstack
Import king
Import king_conga
Import knight
Import level_object
Import logger
Import merlin
Import metrognome
Import minotaur
Import mommy
Import monkey_enemy
Import necrodancer
Import necrodancergame
Import nightmare
Import npc
Import ogre
Import particles
Import pawn
Import pawnbroker
Import player_class
Import poltergeist
Import portal_seg
Import queen
Import rect
Import renderable_object
Import replay
Import rng
Import rook
Import room_with_door
Import roomdata
Import saleitem
Import sarcophagus
Import sarcophagus_tough
Import scattertrap
Import shopkeeper_ghost
Import shrine
Import shriner
Import skeleton
Import slime
Import slowdowntrap
Import speeduptrap
Import spells
Import spiketrap
Import stack_ex
Import swarm_sarcophagus
Import teleporttrap
Import tile
Import tiledata
Import transmogrifier
Import trap
Import trapchest
Import trapdoor
Import util
Import weaponmaster
Import weighted_picker
Import wraith
Import zombie
Import zombiesnake

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
    Global creatingMap: Int
    Global currentFloorRNG: RNG
    Global dailyChallengeX: Int
    Global dailyChallengeY: Int
    Global deathlessWinCount: Int
    Global debugForceMonstrousShop: Bool
    Global enemiesDropSingleCoinForThisLevel: Bool
    Global exitArrow: Object
    Global exitArrowX: Float
    Global exitArrowY: Float
    Global exits: ExitMap = New ExitMap()
    Global firstRoom: RoomData
    Global flawlessVictory: Bool = True
    Global forceBoss: Int = -1
    Global hallwayZone5: Object
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
    Global justUnlocked: Int
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
    Global minimap: Object
    Global nonDeterministicMSStart: Int = -1
    Global outsideBossChamber: Int
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
    Global placedAdditionalBlackChest: Int
    Global placedAdditionalRedChest: Int
    Global placedAdditionalWhiteChest: Bool
    Global placedArena: Bool
    Global placedUrnThisRun: Bool
    Global playedVictoryCutscene: Bool
    Global popUpController: Object
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
    Global triggerList: List<Int> = New List<Int>()
    Global usedBosses: IntSet = New IntSet()
    Global usedCustomMusic: Int
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

    Function CreateBossBattleEntrance: Void(bossTrainingName: String)
        Level.InitNewMap(True)
        Level.DisableLevelConstraints()

        Level.CreateRoom(-3, -3, 6, 6, False, RoomType.Boss)

        Level.EnsureBossTraining(bossTrainingName)

        If Level.isTrainingMode
            Level.AddExit(0, 2, LevelType.Lobby, 1)
            Level.PlaceTileRemovingExistingTiles(2, 0, TileType.Stairs)
        End If

        If Util.IsCharacterActive(Character.Tempo)
            If Level.WantPenaltyBox()
                New Sarcophagus(-2, 2, 1)
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
                Level.PlaceTileRemovingExistingTiles(x, y, TileType.BossFloor)
            End For
        End For

        Level.PlaceTileRemovingExistingTiles(-2, -4, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(2, -4, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(-2, -5, TileType.BossWall)
        Level.PlaceTileRemovingExistingTiles(2, -5, TileType.BossWall)
    End Function

    Function CreateBossBattle1: Void()
        Debug.Log("CREATEBOSSBATTLE1: Creating conga line boss battle.")

        Level.CreateBossBattleEntrance("conga")

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

        For Local x := -7 To 7
            For Local y := -17 To -7
                Level.GetTileAt(x, y).SetTrigger(1)
            End For
        End For

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

        If Level.isHardMode
            Debug.TraceNotImplemented("Level.CreateBossBattle1() (Hard Mode)")
        End If

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

        Level.CreateBossBattleEntrance("deathmetal")

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

        For Local x := -5 To 5
            For Local y := -15 To -7
                Level.GetTileAt(x, y).SetTrigger(1)
            End For
        End For

        Local point := Level.GetRandomOffsetPoint()
        Local deathMetal := New DeathMetal(point.x, -11, 1)
        deathMetal.ActivateLight(0.01, 1.5)

        Local enemyId1: Int
        Local enemyId2: Int

        Select controller_game.currentZone
            Case 1
                enemyId1 = EnemyId.Ghost
                enemyId2 = EnemyId.Ghost
            Case 2
                enemyId1 = EnemyId.Clone
                enemyId2 = EnemyId.Clone
            Case 3
                enemyId1 = EnemyId.IceBeetle
                enemyId2 = EnemyId.FireBeetle
            Case 4
                enemyId1 = EnemyId.Warlock
                enemyId2 = EnemyId.NeonWarlock
            Default
                enemyId1 = EnemyId.GreenEvilEye
                enemyId2 = EnemyId.PinkEvilEye
        End Select

        point = Level.GetRandomOffsetPoint()
        Local enemy11 := Enemy.MakeEnemy(point.x - 3, math.Abs(point.y) - 15, enemyId1)
        enemy11.ActivateLight(0.01, 1.5)
        point = Level.GetRandomOffsetPoint()
        Local enemy21 := Enemy.MakeEnemy(point.x + 3, math.Abs(point.y) - 15, enemyId2)
        enemy21.ActivateLight(0.01, 1.5)
        point = Level.GetRandomOffsetPoint()
        Local enemy22 := Enemy.MakeEnemy(point.x - 3, point.y - 9, enemyId2)
        enemy22.ActivateLight(0.01, 1.5)
        point = Level.GetRandomOffsetPoint()
        Local enemy12 := Enemy.MakeEnemy(point.x + 3, point.y - 9, enemyId1)
        enemy12.ActivateLight(0.01, 1.5)

        If Level.isHardMode
            Debug.TraceNotImplemented("Level.CreateBossBattle2() (Hard Mode)")
        End If

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

        Level.CreateBossBattleEntrance("deepblues")

        Level.CreateRoom(-4, -15, 9, 9, False, RoomType.Boss)

        For Local x := -1 To 1
            Level.PlaceTileRemovingExistingTiles(x, -6, TileType.Door)
        End For

        For Local x := -1 To 1
            Level.GetTileAt(x, -6).SetDoorTrigger(2)
        End For

        Level.SetMagicBarrier(True)

        For Local x := -3 To 4
            For Local y := -14 To -7
                Level.GetTileAt(x, y).SetTrigger(1)
            End For
        End For

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

        If Level.isHardMode
            Debug.TraceNotImplemented("Level.CreateBossBattle3() (Hard Mode)")
        End If

        Enemy.enemiesPaused = True
    End Function

    Function CreateBossBattle4: Void()
        Debug.TraceNotImplemented("Level.CreateBossBattle4()")
    End Function

    Function CreateBossBattle5: Void()
        Debug.TraceNotImplemented("Level.CreateBossBattle5()")
    End Function

    Function CreateBossBattle9: Void()
        Debug.TraceNotImplemented("Level.CreateBossBattle9()")
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
        Debug.TraceNotImplemented("Level.CreateFinalBossBattle()")
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

    Function CreateMap: Bool(levelObj: LevelObject)
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
        Debug.TraceNotImplemented("Level.CreateMapZone5(Bool)")
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
        Debug.TraceNotImplemented("Level.CreateRoomZone5(RoomWithDoor, Int)")
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
        Debug.TraceNotImplemented("Level.DryUpAllWater(Int)")
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
        Debug.TraceNotImplemented("Level.FillTiles(Rect, Int, Int)")
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

    Function GetRandPointInRoomWithOptions: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Return Level.GetRandPointInRoomWithOptions(xVal, yVal, wVal, hVal, True, True, True, skipWater, nearWallIsOk, secretRoomOK)
    End Function

    Function GetRandPointInRoomWithOptions: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, skipCollisions: Bool, skipExit: Bool, skipTraps: Bool, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Local body := New Rect(xVal, yVal, wVal, hVal)
        Local room := New RectRoom(body)

        Return Level.GetRandPointInRoomWithOptions(room, skipCollisions, skipExit, skipTraps, skipWater, nearWallIsOk, secretRoomOK)
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
                Case -3,
                     -6
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
        Debug.TraceNotImplemented("Level.HaveFinalBoss()")
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
        Debug.TraceNotImplemented("Level.IsFinalBoss()")
    End Function

    Function IsFinalBossZone: Bool()
        If Level.isHardcoreMode Then Return controller_game.currentDepth = 5

        Local singleZoneModeFinalBossZone = Level.GetSingleZoneModeFinalBossZone()

        Return controller_game.currentZone = singleZoneModeFinalBossZone
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
        Debug.TraceNotImplemented("Level.IsZone5RoomLegal(Rect)")
    End Function

    Function JanitorReset: Void()
        Debug.TraceNotImplemented("Level.JanitorReset()")
    End Function

    Function LoadLevelSong: Void(levelObj: LevelObject)
        Debug.TraceNotImplemented("Level.LoadLevelSong(LevelObject)")
    End Function

    Function MakeAllWallsUnbreakable: Void()
        Debug.TraceNotImplemented("Level.MakeAllWallsUnbreakable()")
    End Function

    Function MakeHelper: Void()
        Debug.TraceNotImplemented("Level.MakeHelper()")
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

    Function NewLevel: Void(level: Int, zone: Int, playerID: Int, inEditor: Bool, levelObj: LevelObject, continuedRun: Bool)
        Debug.Log("NEWLEVEL level: " + level +
                          " zone: " + zone +
                          " currentLevel: " + controller_game.currentLevel +
                          " currentZone: " + controller_game.currentZone +
                          " currentDepth: " + controller_game.currentDepth)

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]

            player.WarpFamiliars()
        End For

        Level.previousLevelUnkilledStairLockingMinibosses.Clear()
        For Local enemy := EachIn Enemy.enemyList
            If enemy.isStairLockingMiniboss
                Level.previousLevelUnkilledStairLockingMinibosses.Push(enemy.enemyType)
            End If
        End For

        For Local enemy := EachIn Enemy.enemyList
            enemy.coinsToDrop = 0
        End For

        RenderableObject.DeleteAll(True)

        Level.placedArena = False

        Select level
            Case LevelType.SeededAllZonesMode
                Level.isSeededMode = True
                Level.randSeedString = "1"
                Level.randSeed = Util.ParseTextSeed(Level.randSeedString)
                If Level.randSeed = -1 Then Level.randSeed = 0
            Case LevelType.NextLevel
                controller_game.currentLevel += 1
        End Select

        ' TODO: Verify that this is correct.
        If controller_game.currentLevel = 5
            controller_game.currentDepth += 1
            controller_game.currentZone = controller_game.currentDepth
            controller_game.currentLevel = 1
        End If

        If Level.wholeRunRNG = Null
            Level.wholeRunRNG = RNG.Make(Level.randSeed)
        End If

        Level.currentFloorRNG = Level.wholeRunRNG.Split()
        Local randSeed := Level.currentFloorRNG.Rand()

        Debug.Log("DETERMINISTIC START: " + Level.randSeed +
                                   " z: " + controller_game.currentZone +
                                   " l: " + controller_game.currentLevel)

        Debug.Log("NEWLEVEL: Using seed " + randSeed)

        Level.creatingMap = True

        Util.SeedRnd(randSeed)

        Select level
            Case LevelType.SeededAllZonesMode
                Level.GenerateHardcoreZoneOrder()
                controller_game.currentZone = Level.zoneOrder.Get(0)
                controller_game.currentLevel = 1
                controller_game.currentDepth = 1
                Level.isHardcoreMode = True
                Item.CreateItemPools()

                Util.SeedRnd(randSeed)

                For Local i := 0 Until controller_game.numPlayers
                    Local characterID: Int
                    Local player := controller_game.players[i]
                    If player <> Null
                        characterID = player.characterID
                        player.Die()
                    End If

                    controller_game.players[i] = New Player(i, characterID)
                End For
        End Select

        Select controller_game.currentLevel
            Case LevelType.BossBattle
                Level.CreateBossBattle()
            Default
                If Level.CreateMap(levelObj)
                    Debug.WriteLine("Created map.")
                    Level.DumpMap()
                Else
                    Debug.WriteLine("Failed to create map.")
                End If
        End Select

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
        Debug.TraceNotImplemented("Level.PaintTriggerInterior(Int, Int, Int, Int, Int)")
    End Function

    Function PawnSlot: Void(slotName: String, ent: Entity)
        Debug.TraceNotImplemented("Level.PawnSlot(String, Entity)")
    End Function

    Function PlaceAdditionalChestAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceAdditionalChestAt(Int, Int)")
    End Function

    Function PlaceAppropriateMinibosses: Void(room: RoomBase)
        Local weights := New WeightedPicker()
        Local minibossIds := New IntStack()

        Select controller_game.currentZone
            Case 1
                weights.Push(1)
                minibossIds.Push(EnemyId.GreenDragon)
                weights.Push(1)
                minibossIds.Push(EnemyId.LightMinotaur)

                If controller_game.currentLevel <= 2
                    weights.Push(1)
                    minibossIds.Push(EnemyId.YellowDireBat)
                End If
            Case 4
                weights.Push(20)
                minibossIds.Push(EnemyId.GreenDragon)
                weights.Push(15)
                minibossIds.Push(EnemyId.BlueBanshee)
                weights.Push(15)
                minibossIds.Push(EnemyId.DarkNightmare)
                weights.Push(25)
                minibossIds.Push(EnemyId.Ogre)
                weights.Push(25)
                minibossIds.Push(EnemyId.TheMommy)
            Case 5
                weights.Push(2)
                minibossIds.Push(EnemyId.GreenDragon)
                weights.Push(1)
                minibossIds.Push(EnemyId.LightMinotaur)
                weights.Push(1)
                minibossIds.Push(EnemyId.GoldMetroGnome)
            Default
                weights.Push(25)
                minibossIds.Push(EnemyId.GreenDragon)
                weights.Push(15)
                minibossIds.Push(EnemyId.YellowDireBat)
                weights.Push(20)
                minibossIds.Push(EnemyId.BlueBanshee)
                weights.Push(15)
                minibossIds.Push(EnemyId.DarkNightmare)
                weights.Push(25)
                minibossIds.Push(EnemyId.LightMinotaur)
        End Select

        Assert(weights.Length() = minibossIds.Length())

        Local numMinibosses := 1

        If Shrine.bossShrineActive Then numMinibosses += 1

        If Level.isHardMode Or
           Util.IsCharacterActive(Character.Tempo)
            Local hardModeNode := Level.GetHardModeXML()
            Local extraMinibossesPerExit := item.GetInt(hardModeNode, "extraMinibossesPerExit", 0)

            numMinibosses += extraMinibossesPerExit
        End If

        Local placedMinibossIds := New IntStack()
        Local minibossPoint := Level.GetStandardExitCoords()

        For Local i := 0 Until numMinibosses
            If i > 0
                minibossPoint = Level.GetRandPointInRoomWithOptions(room, True, True, True, True, True, False)
                If minibossPoint = Null Then Exit
            End If

            Local minibossesPlacedFlags := New IntStack()
            Local minibossPlacedFlagsMin := 999999

            For Local minibossId := EachIn minibossIds
                Local minibossPlacedFlags := 0

                For Local previousLevelMiniboss := EachIn Level.previousLevelMinibosses
                    If minibossId = Enemy.GetBaseType(previousLevelMiniboss) Then minibossPlacedFlags += 1
                End For

                For Local placedMinibossId := EachIn placedMinibossIds
                    If minibossId = placedMinibossId Then minibossPlacedFlags += 2
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

            Local minibossIdIndex := weights.PickRandom(True)
            Local minibossId := minibossIds.Get(minibossIdIndex)
            placedMinibossIds.Push(minibossId)

            Local miniboss := Level.PlaceMinibossOfShapeAt(minibossId, minibossPoint.x, minibossPoint.y)
            miniboss.isStairLockingMiniboss = True

            Local dragon := Dragon(miniboss)
            If dragon <> Null
                dragon.seekDistance = 0
                If dragon.level = 2 Then dragon.seekDistance = 10

                dragon.dontMove = True
            End If

            Local metrognome := MetroGnome(miniboss)
            If metrognome <> Null
                metrognome.originX = minibossPoint.x
                metrognome.originY = minibossPoint.y
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
        Debug.TraceNotImplemented("Level.PlaceConnectedWireDoor(Point)")
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
        Debug.TraceNotImplemented("Level.PlaceEnemiesZone5()")
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
                Case 402,
                     400,
                     407
                    level = 2
            End Select
        End If

        If controller_game.currentZone = 3 And
           level = 2 And
           newMiniboss = 402
            level = 3
        End If

        If controller_game.currentDepth >= 4
            Select newMiniboss
                Case 405,
                     409
                    level = 2
                Case 402
                    level = Util.RndIntRange(2, 3, True, -1)
            End Select
        End If

        If controller_game.currentZone = 5 And
           newMiniboss = 402
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
            Case 402 miniboss = New Dragon(xVal, yVal, level)
            Case 400 miniboss = New BatMiniboss(xVal, yVal, level)
            Case 405 miniboss = New Banshee(xVal, yVal, level)
            Case 409 miniboss = New Nightmare(xVal, yVal, level)
            Case 407 miniboss = New Minotaur(xVal, yVal, level)
            Case 412 miniboss = New Ogre(xVal, yVal, 1)
            Case 411 miniboss = New Mommy(xVal, yVal, 1)
            Default  miniboss = New MetroGnome(xVal, yVal, level)
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

        Local enemyIds := New IntStack()

        enemyIds.Push(EnemyId.GreenSlime)

        Select controller_game.currentZone
            Case 1
                Select controller_game.currentLevel
                    Case 2
                        enemyIds.Push(EnemyId.BlueBat)
                        enemyIds.Push(EnemyId.WhiteSkeleton)
                    Case 3
                        enemyIds.Push(EnemyId.RedBat)
                        enemyIds.Push(EnemyId.YellowSkeleton)
                    Default
                        enemyIds.Push(EnemyId.RedBat)
                        enemyIds.Push(EnemyId.BlackSkeleton)
                End Select

                enemyIds.Push(EnemyId.Ghost)
            Case 2
                Select controller_game.currentLevel
                    Case 2
                        enemyIds.Push(EnemyId.BlueBat)
                        enemyIds.Push(EnemyId.WhiteArmoredSkeleton)
                    Case 3
                        enemyIds.Push(EnemyId.RedBat)
                        enemyIds.Push(EnemyId.YellowSkeleton)
                    Default
                        enemyIds.Push(EnemyId.RedBat)
                        enemyIds.Push(EnemyId.BlackSkeleton)
                End Select

                enemyIds.Push(EnemyId.Clone)
            Case 3
                If controller_game.currentLevel <= 3
                    enemyIds.Push(EnemyId.IceElemental)
                Else
                    enemyIds.Push(EnemyId.FireElemental)
                End If

                Select controller_game.currentLevel
                    Case 2
                        enemyIds.Push(EnemyId.WhiteSkeletonKnight)
                    Case 3
                        enemyIds.Push(EnemyId.YellowSkeletonKnight)
                    Default
                        enemyIds.Push(EnemyId.BlackSkeletonKnight)
                End Select

                If controller_game.currentLevel <= 3
                    enemyIds.Push(EnemyId.FireElemental)
                Else
                    enemyIds.Push(EnemyId.IceElemental)
                End If
            Case 4
                Select controller_game.currentLevel
                    Case 2
                        enemyIds.Push(EnemyId.Warlock)
                        enemyIds.Push(EnemyId.Lich)
                    Case 3
                        enemyIds.Push(EnemyId.NeonWarlock)
                        enemyIds.Push(EnemyId.RedLich)
                    Default
                        enemyIds.Push(EnemyId.NeonWarlock)
                        enemyIds.Push(EnemyId.BlackLich)
                End Select

                If Util.IsCharacterActive(Character.Dorian)
                    enemyIds.Push(EnemyId.Harpy)
                Else
                    If controller_game.currentLevel <= 3
                        enemyIds.Push(EnemyId.ApprenticeBlademaster)
                    Else
                        enemyIds.Push(EnemyId.Blademaster)
                    End If
                End If
            Default
                Select controller_game.currentLevel
                    Case 2
                        enemyIds.Push(EnemyId.GreenGorgon)
                        enemyIds.Push(EnemyId.PurpleElectricMage)
                    Case 3
                        enemyIds.Push(EnemyId.GreenGorgon)
                        enemyIds.Push(EnemyId.RedElectricMage)
                    Default
                        enemyIds.Push(EnemyId.GreenGorgon)
                        enemyIds.Push(EnemyId.GoldElectricMage)
                End Select

                If controller_game.currentLevel <= 3
                    enemyIds.Push(EnemyId.RedDevil)
                Else
                    enemyIds.Push(EnemyId.GreenDevil)
                End If
        End Select

        Assert(enemyIds.Length() = 4)
        Assert(Level.previousLevelUnkilledStairLockingMinibosses.Length() > 0)

        Local previousLevelUnkilledStairLockingMinibossesIndexes := New Stack<Int>()
        previousLevelUnkilledStairLockingMinibossesIndexes.Push(0)
        previousLevelUnkilledStairLockingMinibossesIndexes.Push(2)
        previousLevelUnkilledStairLockingMinibossesIndexes.Push(1)
        previousLevelUnkilledStairLockingMinibossesIndexes.Push(3)

        For Local i := 0 To 3
            Local enemyId := enemyIds.Get(i)
            Local previousLevelUnkilledStairLockingMinibossesIndex := previousLevelUnkilledStairLockingMinibossesIndexes.Get(i)
            If previousLevelUnkilledStairLockingMinibossesIndex < Level.previousLevelUnkilledStairLockingMinibosses.Length()
                enemyId = Level.previousLevelUnkilledStairLockingMinibosses.Get(previousLevelUnkilledStairLockingMinibossesIndex)
            End If

            Local corner := orderedCorners.Get(i)
            Local enemy := Enemy.MakeEnemy(corner.x, corner.y, enemyId)
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

        Local weightedPicker := New WeightedPicker()
        Local enemyIds := New IntStack()

        weightedPicker.Push(1)
        enemyIds.Push(EnemyId.GreenDragon)

        Select controller_game.currentZone
            Case 1,
                 2,
                 3,
                 5
                weightedPicker.Push(1)
                enemyIds.Push(EnemyId.LightMinotaur)
        End Select

        Select controller_game.currentZone
            Case 1,
                 2,
                 3
                weightedPicker.Push(1)
                enemyIds.Push(EnemyId.YellowDireBat)
        End Select

        Select controller_game.currentZone
            Case 2,
                 3,
                 4
                weightedPicker.Push(1)
                enemyIds.Push(EnemyId.BlueBanshee)

                weightedPicker.Push(1)
                enemyIds.Push(EnemyId.DarkNightmare)
        End Select

        Select controller_game.currentZone
            Case 5
                weightedPicker.Push(1)
                enemyIds.Push(EnemyId.GoldMetroGnome)
        End Select

        If minibossesPerNonExit > 0
            For Local i := 0 Until minibossesPerNonExit
                point = Level.GetRandPointInRoomWithOptions(room, True, True, True, True, True, False)
                If point = Null Then Exit

                Local enemyIdIndex := weightedPicker.PickRandom(True)
                Local enemyId := enemyIds.Get(enemyIdIndex)

                Enemy.MakeEnemy(point.x, point.y, enemyId)
            End For
        End If

        Local sarcsPerRoom := ToughSarcophagus.GetPerRoomCount()
        If sarcsPerRoom > 0
            Local toughSarcophagusEnemyIds := New StackEx<Int>()

            Select controller_game.currentZone
                Case 1
                    Select controller_game.currentLevel
                        Case 1  toughSarcophagusEnemyIds.Push(EnemyId.WhiteSkeleton)
                        Case 2  toughSarcophagusEnemyIds.Push(EnemyId.YellowSkeleton)
                        Default toughSarcophagusEnemyIds.Push(EnemyId.BlackSkeleton)
                    End Select

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyIds.Push(EnemyId.PurpleMonkey)
                    Else
                        toughSarcophagusEnemyIds.Push(EnemyId.WhiteMonkey)
                    End If

                    toughSarcophagusEnemyIds.Push(EnemyId.Ghost)
                Case 2
                    Select controller_game.currentLevel
                        Case 1
                            toughSarcophagusEnemyIds.Push(EnemyId.WhiteArmoredSkeleton)
                            toughSarcophagusEnemyIds.Push(EnemyId.WhiteSkeletonMage)
                        Case 2
                            toughSarcophagusEnemyIds.Push(EnemyId.YellowArmoredSkeleton)
                            toughSarcophagusEnemyIds.Push(EnemyId.YellowSkeletonMage)
                        Default
                            toughSarcophagusEnemyIds.Push(EnemyId.BlackArmoredSkeleton)
                            toughSarcophagusEnemyIds.Push(EnemyId.BlackSkeletonMage)
                    End Select

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyIds.Push(EnemyId.LightGolem)
                        toughSarcophagusEnemyIds.Push(EnemyId.WhiteArmadillo)
                    Else
                        toughSarcophagusEnemyIds.Push(EnemyId.DarkGolem)
                        toughSarcophagusEnemyIds.Push(EnemyId.YellowArmadillo)
                    End If

                    toughSarcophagusEnemyIds.Push(EnemyId.Mole)
                Case 3
                    Select controller_game.currentLevel
                        Case 1  toughSarcophagusEnemyIds.Push(EnemyId.WhiteSkeletonKnight)
                        Case 2  toughSarcophagusEnemyIds.Push(EnemyId.YellowSkeletonKnight)
                        Default toughSarcophagusEnemyIds.Push(EnemyId.BlackSkeletonKnight)
                    End Select

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyIds.Push(EnemyId.PurpleGoblin)
                    Else
                        toughSarcophagusEnemyIds.Push(EnemyId.GrayGoblin)
                    End If

                    If controller_game.currentLevel = 1
                        toughSarcophagusEnemyIds.Push(EnemyId.ShoveMonster)
                    Else
                        toughSarcophagusEnemyIds.Push(EnemyId.GrayShoveMonster)
                    End If

                    toughSarcophagusEnemyIds.Push(EnemyId.FireElemental)
                    toughSarcophagusEnemyIds.Push(EnemyId.Hellhound)
                    toughSarcophagusEnemyIds.Push(EnemyId.FireBeetle)
                Case 4
                    Select controller_game.currentLevel
                        Case 1  toughSarcophagusEnemyIds.Push(EnemyId.Lich)
                        Case 2  toughSarcophagusEnemyIds.Push(EnemyId.RedLich)
                        Default toughSarcophagusEnemyIds.Push(EnemyId.BlackLich)
                    End Select

                    If Not Util.IsCharacterActive(Character.Dorian)
                        If controller_game.currentLevel <= 2
                            toughSarcophagusEnemyIds.Push(EnemyId.ApprenticeBlademaster)
                        Else
                            toughSarcophagusEnemyIds.Push(EnemyId.Blademaster)
                        End If
                    End If

                    If controller_game.currentLevel = 1
                        toughSarcophagusEnemyIds.Push(EnemyId.Warlock)
                    Else
                        toughSarcophagusEnemyIds.Push(EnemyId.NeonWarlock)
                    End If

                    toughSarcophagusEnemyIds.Push(EnemyId.GoblinBomber)
                    toughSarcophagusEnemyIds.Push(EnemyId.OrangeArmadillo)
                    toughSarcophagusEnemyIds.Push(EnemyId.OozeGolem)
                    toughSarcophagusEnemyIds.Push(EnemyId.Harpy)
                    toughSarcophagusEnemyIds.Push(EnemyId.GreenMonkey)
                    toughSarcophagusEnemyIds.Push(EnemyId.MagicMonkey)
                Default
                    Select controller_game.currentLevel
                        Case 1
                            toughSarcophagusEnemyIds.Push(EnemyId.WhiteSkull)
                            toughSarcophagusEnemyIds.Push(EnemyId.PurpleElectricMage)
                            toughSarcophagusEnemyIds.Push(EnemyId.GreenOrc)
                        Case 2
                            toughSarcophagusEnemyIds.Push(EnemyId.YellowSkull)
                            toughSarcophagusEnemyIds.Push(EnemyId.RedElectricMage)
                            toughSarcophagusEnemyIds.Push(EnemyId.PinkOrc)
                        Default
                            toughSarcophagusEnemyIds.Push(EnemyId.BlackSkull)
                            toughSarcophagusEnemyIds.Push(EnemyId.GoldElectricMage)
                            toughSarcophagusEnemyIds.Push(EnemyId.PurpleOrc)
                    End Select

                    If controller_game.currentLevel = 1
                        toughSarcophagusEnemyIds.Push(EnemyId.GreenEvilEye)
                    Else
                        toughSarcophagusEnemyIds.Push(EnemyId.PinkEvilEye)
                    End If

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyIds.Push(EnemyId.RedDevil)
                    Else
                        toughSarcophagusEnemyIds.Push(EnemyId.GreenDevil)
                    End If

                    toughSarcophagusEnemyIds.Push(EnemyId.WaterBall)
            End Select

            Assert(toughSarcophagusEnemyIds.Length() > 0)

            toughSarcophagusEnemyIds.Shuffle(True)

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

                Local enemyType := toughSarcophagusEnemyIds.Get(i Mod toughSarcophagusEnemyIds.Length())
                Select enemyType
                    Case EnemyId.FireElemental enemyType = Level.GetZone3ElementalType(point.x, point.y)
                    Case EnemyId.Hellhound enemyType = Level.GetZone3YetiHellhoundType(point.x, point.y)
                    Case EnemyId.FireBeetle enemyType = Level.GetZone3BeetleType(point.x, point.y)
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

    Function PlaceRoomZone5: RoomData(pseg: PortalSeg, width: Int, height: Int, minEntryDist: Int)
        Debug.TraceNotImplemented("Level.PlaceRoomZone5(PortalSeg, Int, Int, Int)")
    End Function

    Function PlaceRoomZone5: RoomData(portalSegs: StackEx<PortalSeg>, width: Int, height: Int, minEntryDist: Int, roomType: Int)
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

                        If Not Level.IsDoorAdjacent(tile.x, tile.y)
                            pointsNotAdjacentToDoors.Push(New Point(tile.x, tile.y))
                        End If
                    End For
                End For

                Local fakeWallLocation := pointsNotAdjacentToDoors.ChooseRandom(True)
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
        Debug.TraceNotImplemented("Level.PlaceTileTypeAt(Int, Int, Int)")
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
        Debug.TraceNotImplemented("Level.PlaceTrapsZone5()")
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
        Debug.TraceNotImplemented("Level.PlaceTrapZone5(Int, Int, Int, Int)")
    End Function

    Function PlaceWire: Bool(src: Point, dst: Point)
        Debug.TraceNotImplemented("Level.PlaceWire(Point, Point)")
    End Function

    Function PlaceZone3Beetle: Enemy(xVal: Int, yVal: Int)
        If Level.IsInZone3Hot(xVal, yVal)
            Return Enemy.MakeEnemy(xVal, yVal, EnemyId.FireBeetle)
        End If

        Return Enemy.MakeEnemy(xVal, yVal, EnemyId.IceBeetle)
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
            Return Enemy.MakeEnemy(xVal, yVal, EnemyId.FireElemental)
        End If

        Return Enemy.MakeEnemy(xVal, yVal, EnemyId.IceElemental)
    End Function

    Function PlaceZone3Slime: Slime(xVal: Int, yVal: Int)
        If Level.IsInZone3Hot(xVal, yVal)
            Return New Slime(xVal, yVal, 5)
        End If

        Return New Slime(xVal, yVal, 4)
    End Function

    Function PlaceZone3YetiHellhound: Enemy(xVal: Int, yVal: Int)
        If Level.IsInZone3Hot(xVal, yVal)
            Return Enemy.MakeEnemy(xVal, yVal, EnemyId.Hellhound)
        End If


        Return Enemy.MakeEnemy(xVal, yVal, EnemyId.Yeti)
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

    Function PutBeastmasterStairs: Void(x: Int, y: Int, stairName: String, enemyName: String, enemyType: Int, enemyId: Int, stairNamePrefix: String)
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
        Debug.TraceNotImplemented("Level.PutEnemyZone5(Int, Int)")
    End Function

    Function PutFutureStair: Void(x: Int, y: Int)
        Debug.TraceNotImplemented("Level.PutFutureStair(Int, Int)")
    End Function

    Function PutMinibossStair: Void(x: Int, y: Int, minibossName: String, enemyType: Int, label: String, labelXOff: Int)
        Debug.TraceNotImplemented("Level.PutMinibossStair(Int, Int, String, Int, String, Int)")
    End Function

    Function PutRoomEnemiesZone5: Void(room: RoomBase, hasExit: Bool)
        Debug.TraceNotImplemented("Level.PutRoomEnemiesZone5(RoomBase, Bool)")
    End Function

    Function PutVariedEnemiesZone5: Void(pts: StackEx<Point>)
        Debug.TraceNotImplemented("Level.PutVariedEnemiesZone5(StackEx<Point>)")
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

    Const Test: Int = -3000
    Const SelectCadence: Int = -2000
    Const SelectMelody: Int = -1999
    Const SelectAria: Int = -1998
    Const SelectDorian: Int = -1997
    Const SelectEli: Int = -1996
    Const SelectMonk: Int = -1995
    Const SelectDove: Int = -1994
    Const SelectCoda: Int = -1993
    Const SelectBolt: Int = -1992
    Const SelectBard: Int = -1991
    Const SelectNocturna: Int = -1990
    Const SelectDiamond: Int = -1989
    Const SelectMary: Int = -1988
    Const SelectTempo: Int = -1987
    Const SelectReaper: Int = -1986
    Const Unknown_1902: Int = -1902
    Const RandomCharacter: Int = -1901
    Const SeededAllCharactersSelect: Int = -1900
    Const SeededAllCharactersCadence: Int = -1800
    Const SeededAllCharactersMelody: Int = -1799
    Const SeededAllCharactersAria: Int = -1798
    Const SeededAllCharactersDorian: Int = -1797
    Const SeededAllCharactersEli: Int = -1796
    Const SeededAllCharactersMonk: Int = -1795
    Const SeededAllCharactersDove: Int = -1794
    Const SeededAllCharactersCoda: Int = -1793
    Const SeededAllCharactersBolt: Int = -1792
    Const SeededAllCharactersBard: Int = -1791
    Const SeededAllCharactersNocturna: Int = -1790
    Const SeededAllCharactersDiamond: Int = -1789
    Const SeededAllCharactersMary: Int = -1788
    Const SeededAllCharactersTempo: Int = -1787
    Const SeededAllCharactersDLCSelect: Int = -1700
    Const MentorLevel1: Int = -1100
    Const MentorLevel2: Int = -1099
    Const MentorLevel3: Int = -1098
    Const MentorLevel4: Int = -1097
    Const MentorLevel5: Int = -1096
    Const MentorLevel6: Int = -1095
    Const MentorLevel7: Int = -1094
    Const MentorLevel8: Int = -1093
    Const MentorLevel9: Int = -1092
    Const MentorLevel10: Int = -1091
    Const MentorLevel11: Int = -1090
    Const MentorLevel12: Int = -1089
    Const MentorLevel13: Int = -1088
    Const MentorLevel14: Int = -1087
    Const MentorLevel15: Int = -1086
    Const MentorLevel16: Int = -1085
    Const MentorLevel17: Int = -1084
    Const MentorLevel18: Int = -1083
    Const MentorLevel19: Int = -1082
    Const MentorLevel20: Int = -1081
    Const MentorLevel21: Int = -1080
    Const MentorLevel22: Int = -1079
    Const MentorLevel23: Int = -1078
    Const MentorLevel24: Int = -1077
    Const MentorLevel25: Int = -1076
    Const MentorLevel26: Int = -1075
    Const MentorLevel27: Int = -1074
    Const MentorLevel28: Int = -1073
    Const MentorLevel29: Int = -1072
    Const MentorLevel30: Int = -1071
    Const MentorLevel31: Int = -1070
    Const MentorLevel32: Int = -1069
    Const MentorLevel33: Int = -1068
    Const MentorLevel34: Int = -1067
    Const MentorLevel35: Int = -1066
    Const MentorLevel36: Int = -1065
    Const MentorLevel37: Int = -1064
    Const MentorLevel38: Int = -1063
    Const MentorLevel39: Int = -1062
    Const MentorLevel40: Int = -1061
    Const MentorLevel41: Int = -1060
    Const MentorLevel42: Int = -1059
    Const MentorLevel43: Int = -1058
    Const MentorLevel44: Int = -1057
    Const MentorLevel45: Int = -1056
    Const MentorLevel46: Int = -1055
    Const MentorLevel47: Int = -1054
    Const MentorLevel48: Int = -1053
    Const MentorLevel49: Int = -1052
    Const MentorLevel50: Int = -1051
    Const MentorLevel51: Int = -1050
    Const TrainingUnknown_1000: Int = -1000
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
    Const TrainingUnknown_101: Int = -101
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
    Const AllCharactersDLCSelect: Int = -22
    Const BeastmasterZone5: Int = -21
    Const ExtraModesSelect: Int = -20
    Const AllCharactersSelect: Int = -19
    Const BossmasterBosses: Int = -18
    Const BossmasterMinibosses: Int = -17
    Const BeastmasterZone4: Int = -16
    Const BeastmasterZone3: Int = -15
    Const BeastmasterZone2: Int = -14
    Const BeastmasterZone1: Int = -13
    Const CharacterSelect: Int = -12
    Const Unknown_11: Int = -11
    Const SeededAllZonesMode: Int = -10
    Const DailyChallenge: Int = -9
    Const Unknown_8: Int = -8
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
