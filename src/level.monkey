'Strict

Import monkey.map
Import monkey.math
Import monkey.random
Import monkey.set
Import beastmaster
Import bossmaster
Import chest
Import conjurer
Import controller_game
Import crate
Import entity
Import exitmap
import gamedata
Import intpointlist
Import intpointset
Import level_object
Import logger
Import merlin
Import necrodancer
Import necrodancergame
Import npc
Import particles
Import pawnbroker
Import player_class
Import portal_seg
Import rect
Import renderable_object
Import replay
Import rng
Import room_with_door
Import roomdata
Import saleitem
Import shriner
Import slowdowntrap
Import speeduptrap
Import spells
Import spiketrap
Import stack_ex
Import swarm_sarcophagus
Import tile
Import tiledata
Import transmogrifier
Import trap
Import util
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
    Global creatingMap: Int
    Global currentFloorRNG: RNG
    Global dailyChallengeX: Int
    Global dailyChallengeY: Int
    Global deathlessWinCount: Int
    Global debugForceMonstrousShop: Bool
    Global enemiesDropSingleCoinForThisLevel: Bool
    Global exitArrow: Int
    Global exitArrowX: Float
    Global exitArrowY: Float
    Global exits: ExitMap = New ExitMap()
    Global firstRoom: RoomData
    Global flawlessVictory: Int = True
    Global forceBoss: Int = -1
    Global hallwayZone5: Int
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
    Global lockedShopPlaced: Int
    Global mapLightValues: Float[]
    Global mapLightValuesCachedFrame: Int = -1
    Global mapLightValuesInitialized: Int
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
    Global minimap: Int
    Global nonDeterministicMSStart: Int = -1
    Global outsideBossChamber: Int
    Global pacifismModeOn: Int
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
    Global placeShrineOnLevel: Int
    Global placeShrinerOnDepth: Int = -1
    Global placeShrinerOnLevel: Int = -1
    Global placeTransmogrifierOnDepth: Int = -1
    Global placeTransmogrifierOnLevel: Int = -1
    Global placedAdditionalBlackChest: Int
    Global placedAdditionalRedChest: Int
    Global placedAdditionalWhiteChest: Int
    Global placedArena: Int
    Global placedUrnThisRun: Int
    Global playedVictoryCutscene: Int
    Global popUpController: Int
    Global popUpType: Int = -1
    Global practiceEnemyNum: Int = -1
    Global previousLevelMinibosses: StackEx<Int> = New StackEx<Int>()
    Global previousLevelUnkilledStairLockingMinibosses: StackEx<Int> = New StackEx<Int>()
    Global quickRestart: Int
    Global randSeed: Int = -1
    Global randSeedString: String
    Global replay: Replay
    Global rooms: List<RoomData> = New List<RoomData>()
    Global secretAtX: Int
    Global secretAtY: Int
    Global secretRockRoomPlaced: Int
    Global shopX: Int
    Global shopY: Int
    Global shopW: Int
    Global shopH: Int
    Global shopkeeperDead: Int
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
        Debug.TraceNotImplemented("Level.ActivateTrigger()")
    End Function

    Function ActuallyGetMapTileLightValue: Float(xVal: Int, yVal: Int, forVision: Bool)
        Debug.TraceNotImplemented("Level.ActuallyGetMapTileLightValue()")
    End Function

    Function AddCrackedWall: Void(roomType: Int)
        Debug.TraceNotImplemented("Level.AddCrackedWall()")
    End Function

    Function AddExit: Void(xVal: Int, yVal: Int, levelPointer: Int, zonePointer: Int)
        Debug.TraceEntered("Level.AddExit()")

        Local location := New Point(xVal, yVal)
        Local floor := New Point(levelPointer, zonePointer)
        Level.exits.Set(location, floor)
    End Function

    Function AddHarderStone: Void()
        Debug.TraceNotImplemented("Level.AddHarderStone()")
    End Function

    Function AddMinibossWall: Void(xVal: Int, yVal: Int, wallType: Int)
        Debug.TraceEntered("Level.AddMinibossWall()")

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
        Debug.TraceNotImplemented("Level.AddSomePillarsInOpenSpace()")
    End Function

    Function AddSpecialRoom: Void(roomType: Int, addCrack: Bool)
        Debug.TraceEntered("Level.AddSpecialRoom()")

        Debug.Log("Adding special room")

        If addCrack
            Level.AddCrackedWall(roomType)
        End If

        ' Probably an inlined function
        Level.levelConstraintX = -1000
        Level.levelConstraintY = -1000
        Level.levelConstraintW = 2000
        Level.levelConstraintH = 2000
        Level.levelConstraintNum = 0

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

                Local heartContainerChance := Util.RndIntRangeFromZero(100, True)
                Local heartContainer: String
                If heartContainerChance <= 20 Then heartContainer = "misc_heart_container"
                If heartContainerChance <= 25 Then heartContainer = "misc_heart_container2"
                If heartContainerChance <= 50 Then heartContainer = "misc_heart_container_empty2"
                If heartContainerChance >  50 Then heartContainer = "misc_heart_container_empty"
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
                    If Not (randomItem1 = "no_item") Or
                       Not (randomItem1 = "resource_hoard_gold")
                        New SaleItem(entranceX - 1, entranceY - 2, randomItem1, True, Null, -1.0, Null)
                    End If
                End If

                ' Center item (left item if a weaponless character is active)
                Local randomItem2 := Item.GetRandomItemInClass("", requestedLevel, "anyChest", Chest.CHEST_COLOR_NONE, True, "", False)
                If Not (randomItem2 = "no_item") Or
                   Not (randomItem2 = "resource_hoard_gold")
                    New SaleItem(entranceX + saleItemXOff, entranceY - 2, randomItem2, True, Null, -1.0, Null)
                End If

                ' Right item
                Local randomItem3 := Item.GetRandomItemInClass("", requestedLevel, "anyChest", Chest.CHEST_COLOR_NONE, True, "", False)
                If Not (randomItem3 = "no_item") Or
                   Not (randomItem3 = "resource_hoard_gold")
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
                    ' TOOD: Update to use JSON
                    'Local itemsNode := necrodancergame.xmlData.GetChildAtPath("items/")
                    Local itemsNode: XMLNode
                    If Item.IsValidItemForCurrentChars(itemsNode)
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
                Local i := 0
                Repeat
                    Local anotherItem := anotherItems.Get(i)
                    If Not (anotherItem = "no_item") And
                       Not (anotherItem = "resource_hoard_gold")
                        Local glassItem := New SaleItem(entranceX + glassItemXOff, entranceY - 2, anotherItem, False, shopkeeper, -1.0, Null)
                        glassItem.ApplyDiscount(0.5)
                    End If

                    If Util.IsWeaponlessCharacterActive()
                        glassItemXOff += 2
                    Else
                        glassItemXOff += 1
                    End If

                    i += 1
                Until (i < 3) And (glassItemXOff <= 1)

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
        Debug.TraceNotImplemented("Level.AddStone()")
    End Function

    Function AdvanceLevel: Void()
        Debug.TraceNotImplemented("Level.AdvanceLevel()")
    End Function

    Function AllowSpirit: Bool()
        Debug.TraceNotImplemented("Level.AllowSpirit()")
    End Function

    Function BossMaybeMinibossesAt: Void(x1: Int, y1: Int, x2: Int, y2: Int)
        Debug.TraceNotImplemented("Level.BossMaybeMinibossesAt()")
    End Function

    Function BreakIce: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.BreakIce()")
    End Function

    Function CarveCorridorTile: Void(xVal: Int, yVal: Int, horiz: Bool, pending: Bool, skipWalls: Bool, roomType: Int, wideCorridor: Bool)
        If Level.IsSecretRoom(roomType)
            New Tile(xVal, yVal, TileType.CorridorDirtWall, pending, -1)
        Else
            New Tile(xVal, yVal, TileType.CorridorFloor, pending, -1)

            If wideCorridor
                If horiz
                    New Tile(xVal, yVal + 1, TileType.CorridorFloor, pending, -1)
                Else
                    New Tile(xVal + 1, yVal, TileType.CorridorFloor, pending, -1)
                End If
            End If
        End If

        If Not skipWalls
            If horiz
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

    Function CarveNewCorridor: Bool(moveX: Int, moveY: Int, horiz: Bool, pending: Bool, secondaryCarve: Bool, roomType: Int, wideCorridor: Bool)
        Local numCarves := 2
        If Level.IsSecretRoom(roomType)
            numCarves = 1
        End If

        For Local i := 0 Until numCarves
            If (i > 0) And Not secondaryCarve
                If Not (Level.GetTileTypeAt(Level.carveX, Level.carveY) = TileType.Empty)
                    Return False
                End If

                If wideCorridor
                    If horiz
                        If Not (Level.GetTileTypeAt(Level.carveX, Level.carveY + 1) = TileType.Empty)
                            Return False
                        End If
                    Else
                        If Not (Level.GetTileTypeAt(Level.carveX + 1, Level.carveY) = TileType.Empty)
                            Return False
                        End If
                    End If
                End If
            End If

            Local skipWalls := secondaryCarve
            Level.CarveCorridorTile(Level.carveX, Level.carveY, horiz, pending, skipWalls, roomType, wideCorridor)

            Level.carveX += moveX
            Level.carveY += moveY

            secondaryCarve = False
        End For

        Return True
    End Function

    Function CheckLOS: Bool(x1: Int, y1: Int, x2: Int, y2: Int, includeOffscreen: Bool)
        Debug.TraceNotImplemented("Level.CheckLOS()")
    End Function

    Function CheckMapConsistency: Void()
        Debug.TraceNotImplemented("Level.CheckMapConsistency()")
    End Function

    Function ClearMinibossWall: Void()
        Debug.TraceNotImplemented("Level.ClearMinibossWall()")
    End Function

    Function ClearTextLabelAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.ClearTextLabelAt()")
    End Function

    Function CloseInOuterWalls: Void()
        Debug.TraceNotImplemented("Level.CloseInOuterWalls()")
    End Function

    Function ConjureSlot: Void(slotName: String, ent: Entity)
        Debug.TraceNotImplemented("Level.ConjureSlot()")
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
        Debug.TraceNotImplemented("Level.CreateBossBattle()")
    End Function

    Function CreateBossBattle1: Void()
        Debug.TraceNotImplemented("Level.CreateBossBattle1()")
    End Function

    Function CreateBossBattle2: Void()
        Debug.TraceNotImplemented("Level.CreateBossBattle2()")
    End Function

    Function CreateBossBattle3: Void()
        Debug.TraceNotImplemented("Level.CreateBossBattle3()")
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
        Debug.TraceEntered("Level.CreateExit()")

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
        Debug.TraceNotImplemented("Level.CreateIndestructibleBorder()")
    End Function

    Function CreateJanitor: Void()
        Debug.TraceNotImplemented("Level.CreateJanitor()")
    End Function

    Function CreateLobby: Void()
        Debug.TraceNotImplemented("Level.CreateLobby()")
    End Function

    Function CreateMap: Bool(levelObj: LevelObject)
        Debug.TraceEntered("Level.CreateMap()")

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

            While Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeShrinerOnLevel = level
            Level.placeShrinerOnDepth = depth

            Debug.WriteLine("Placed shriner on " + depth + "-" + level)
        End If

        If Level.placeBloodShopOnLevel = -1 And Not Util.AreAriaOrCodaActive()
            Local level: Int = -1
            Local depth: Int = -1

            While Level.IsFreeLevelForSpecialRoom(level, depth)
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

            Debug.WriteLine("Placed blood shop on " + depth + "-" + level)
        End If

        If Level.placeGlassShopOnLevel = -1
            Local level: Int = -1
            Local depth: Int = -1

            While Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeGlassShopOnLevel = level
            Level.placeGlassShopOnDepth = depth

            Debug.WriteLine("Placed glass shop on " + depth + "-" + level)
        End If

        If Level.placeFoodShopOnLevel = -1 And Not Util.AreAriaOrCodaActive()
            Local level: Int = -1
            Local depth: Int = -1

            While Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeFoodShopOnLevel = level
            Level.placeFoodShopOnDepth = depth

            Debug.WriteLine("Placed food shop on " + depth + "-" + level)
        End If

        If Level.placeArenaOnLevel = -1 And Not Util.IsCharacterActive(Character.Dove)
            Local level: Int = -1
            Local depth: Int = -1

            While Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeArenaOnLevel = level
            Level.placeArenaOnDepth = depth
            Level.arenaNum = Util.RndIntRangeFromZero(2, True)

            Debug.WriteLine("Placed arena on " + depth + "-" + level)
        End If

        If Level.placeTransmogrifierOnLevel = -1 And Level.isHardcoreMode
            Local level: Int = -1
            Local depth: Int = -1

            While IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeTransmogrifierOnLevel = level
            Level.placeTransmogrifierOnDepth = depth

            Debug.WriteLine("Placed transmogrifier on " + depth + "-" + level)
        End If

        If Level.placeConjurerOnLevel = -1
            Local level: Int = -1
            Local depth: Int = -1

            While IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeConjurerOnLevel = level
            Level.placeConjurerOnDepth = depth

            Debug.WriteLine("Placed conjurer on " + depth + "-" + level)
        End If

        If Level.placePawnbrokerOnLevel = -1 And Not Util.IsCharacterActive(Character.Monk)
            Local level: Int = -1
            Local depth: Int = -1

            While Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placePawnbrokerOnLevel = level
            Level.placePawnbrokerOnDepth = depth

            Debug.WriteLine("Placed pawnbroker on " + depth + "-" + level)
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

        If Level.pacifismModeOn Or (Level.isHardMode And Level.GetHardModeXML().GetAttribute("disableTrapdoors", False))
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
        Debug.TraceEntered("Level.CreateMapZone1()")

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
                If Not Util.RndIntRangeFromZero(50, True) Then Exit

                room5 = Level.PlaceRoomZone1(room4)
                If room5
                    lastRoomIndex = 4

                    Exit
                End If
            End For

            If limit <= 0 Then Return Level._FailMap()

            If Util.RndBool(True)
                room5 = Level.PlaceRoomZone1(room3)
            Else
                room5 = Level.PlaceRoomZone1(room1)
            End If

            If room5
                lastRoomIndex = 3

                Exit
            End If
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE1: Trying to place room 6")
        For limit = limit - 1 Until 0 Step -1
            If Util.RndIntRangeFromZero(50, True)
                room6 = Level.PlaceRoomZone1(room1)
            Else If Util.RndIntRangeFromZero(10, True)
                room6 = Level.PlaceRoomZone1(room4)

                If room6 And lastRoomIndex = 3
                    lastRoomIndex = 5
                End If
            Else
                room6 = Level.PlaceRoomZone1(room5)

                If room6 And lastRoomIndex = 4
                    lastRoomIndex = 5
                End If
            End If

            If room6 Then Exit
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
            Case 1
                If Not GameData.GetNPCUnlock("beastmaster") Then deployNPC = True
            Case 2
                If Not GameData.GetNPCUnlock("merlin") Then deployNPC = True
            Case 3
                If Not GameData.GetNPCUnlock("bossmaster") Then deployNPC = True
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
                    If Not (tile.GetType() = TileType.Floor) And
                       Not Level.IsCorridorFloorOrDoorAdjacent(x, y)
                        tile = GetTileAt(x, y + 1)
                        If tile And Not tile.IsWall(False, False, False, False) Then Exit
                    End If
                End If
            End For

            If limit <= 0 Then Return Level._FailMap()

            Local npc: NPC
            Select controller_game.currentLevel
                Case 1
                    npc = New Beastmaster()
                    npc.NPCInit(x, y, 1, "beastmaster", True, False)
                Case 2
                    npc = New Merlin()
                    npc.NPCInit(x, y, 1, "merlin", True, False)
                Case 3
                    npc = New Bossmaster()
                    npc.NPCInit(x, y, 1, "bossmaster", True, False)
            End Select

            If npc
                Debug.Log("CREATEMAP: NPC placed at " + npc.x + ", " + npc.y)
            End If
        End If

        Debug.Log("CREATEMAP ZONE1: Placing shop")
        For limit = limit - 1 Until 0 Step -1
            Local shop := Level.PlaceRoomZone1(RoomType.Shop, Null)
            If shop Then Exit
        End For

        If limit <= 0 Then Return Level._FailMap()

        Debug.Log("CREATEMAP ZONE1: Filling out walls surrounding all floor")
        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsFloor()
                    Local x := tilesOnXNode.Key()
                    Local xLeft := x - 1
                    Local xRight := x + 1
                    Local y := tileNode.Key()
                    Local yAbove := y - 1
                    Local yBelow := y + 1

                    If Not Level.GetTileAt(xRight, yAbove)
                        New Tile(xRight, yAbove, TileType.CorridorDirtWall, False, -1)
                    End If
                    If Not Level.GetTileAt(x, yAbove)
                        New Tile(x, yAbove, TileType.CorridorDirtWall, False, -1)
                    End If
                    If Not Level.GetTileAt(xLeft, yAbove)
                        New Tile(xLeft, yAbove, TileType.CorridorDirtWall, False, -1)
                    End If

                    If Not Level.GetTileAt(xRight, y)
                        New Tile(xRight, y, TileType.CorridorDirtWall, False, -1)
                    End If
                    If Not Level.GetTileAt(xLeft, y)
                        New Tile(xLeft, y, TileType.CorridorDirtWall, False, -1)
                    End If

                    If Not Level.GetTileAt(xRight, yBelow)
                        New Tile(xRight, yBelow, TileType.CorridorDirtWall, False, -1)
                    End If
                    If Not Level.GetTileAt(x, yBelow)
                        New Tile(x, yBelow, TileType.CorridorDirtWall, False, -1)
                    End If
                    If Not Level.GetTileAt(xLeft, yBelow)
                        New Tile(xLeft, yBelow, TileType.CorridorDirtWall, False, -1)
                    End If
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
        Level.PlaceSecretRooms(-1) ' Decompiler showing wrong value for t_numRooms

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
            Local numTraps := Trap.trapList.Count()
            If numTraps > 0
                Local trapIndex := Util.RndIntRangeFromZero(numTraps - 1, True)
                Local traps := Trap.trapList.ToArray()
                trap = traps[trapIndex]
                If trap
                    If trap.canBeReplacedByTempoTrap And
                       trap.trapType = TrapType.BounceTrap
                        Exit
                    End If
                End If
            End If
        End For

        If trap
            Local trapX := trap.x
            Local trapY := trap.y
            trap.Die()

            If Util.RndBool(True)
                New SpeedUpTrap(trapX, trapY)
                Debug.Log("CREATEMAP ZONE1: Speedup trap placed at " + trapX + ", " + trapY)
            Else
                New SlowDownTrap(trapX, trapY)
                Debug.Log("CREATEMAP ZONE1: Slowdown trap placed at " + trapX + ", " + trapY)
            End If
        End If

        Debug.Log("CREATEMAP ZONE1: Placing torches")
        Local torchChanceLow := 4
        Select controller_game.currentLevel
            Case 2
                torchChanceLow = 3
            Case 3
                torchChanceLow = 2
            Case 4
                torchChanceLow = 1
            Default
                If controller_game.currentLevel > 4
                    torchChanceLow = 0
                End If
        End Select
        Local torchChanceHigh := torchChanceLow + 1

        Local rooms := New List<RoomData>()
        For Local room := EachIn Level.rooms
            rooms.AddLast(room)
        End For

        For Local room := EachIn rooms
            Local numTorch := Util.RndIntRange(torchChanceLow, torchChanceHigh, True, -1)
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
        Level.PlaceChests(currentLevel = 1)
        Level.PlaceResourceWall()
        Level.PlaceLockedChests()
        Level.PlaceShrine()
        Debug.Log("CREATEMAP ZONE1: Cleaning up pending tiles")
        Tile.CleanUpPendingTiles()
        Level.PlaceNocturnaArea()
        Debug.Log("CREATEMAP ZONE1: Finished!")

        Return True
    End Function

    Function _FailMap: Bool()
        Debug.TraceEntered("Level._FailMap()")

        Level.CreateMap(Null)

        Return False
    End Function

    Function CreateMapZone2: Bool()
        Debug.TraceNotImplemented("Level.CreateMapZone2()")
    End Function

    Function CreateMapZone3: Bool()
        Debug.TraceNotImplemented("Level.CreateMapZone3()")
    End Function

    Function CreateMapZone4: Bool(recursive: Bool)
        Debug.TraceNotImplemented("Level.CreateMapZone4()")
    End Function

    Function CreateMapZone5: Bool(recursive: Bool)
        Debug.TraceNotImplemented("Level.CreateMapZone5()")
    End Function

    Function CreateMerlin: Void()
        Debug.TraceNotImplemented("Level.CreateMerlin()")
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
            Case 1
                catacombWallChance = 0.0
            Case 2
                catacombWallChance = 0.1
            Case 3
                catacombWallChance = 0.13
            Case 4
                catacombWallChance = 0.16
            Default
                If currentLevel > 4
                    catacombWallChance = math.Max(controller_game.currentLevel * 0.04, 0.4)
                End If
        End Select

        If catacombWallChance > Util.RndIntRangeFromZero(1, True) And
           roomType = RoomType.None And
           controller_game.currentZone = 1
            wallType = TileType.CatacombWall
        End If

        Local lastCreatedRoomType := roomType
        Local tiles: List<TileData>
        Select roomType
            Case RoomType.None
                If controller_game.currentZone = 1
                    If controller_game.currentLevel = 1
                        If Not Util.RndBool(True)
                            lastCreatedRoomType = RoomType.Basic
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Basic, originX, originY, originX2, originY2, wideCorridor, wallType)
                        End If

                        lastCreatedRoomType = RoomType.OutsideCorners
                        tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.OutsideCorners, originX, originY, originX2, originY2, wideCorridor, wallType)
                    End If

                    Select Util.RndIntRangeFromZero(2, True)
                        Case 0
                            lastCreatedRoomType = RoomType.Basic
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Basic, originX, originY, originX2, originY2, wideCorridor, wallType)
                        Case 1
                            lastCreatedRoomType = RoomType.Pillar
                            ' No room?
                        Case 2
                            lastCreatedRoomType = RoomType.Pillar
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Pillar, originX, originY, originX2, originY2, wideCorridor, wallType)
                    End Select
                Else
                    If controller_game.currentZone = 4
                        lastCreatedRoomType = RoomType.Basic
                        If Not Util.RndIntRangeFromZero(1, True) Then lastCreatedRoomType = RoomType.None

                        tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Basic, originX, originY, originX2, originY2, wideCorridor, wallType)
                    End If

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
            Case RoomType.Pillar
            Case RoomType.OutsideCorners
            Case RoomType.Shop
            Case RoomType.Secret
            Case RoomType.Boss
            Case RoomType.Vault
            Case RoomType.Notched
            Case RoomType.Special
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, roomType, originX, originY, originX2, originY2, wideCorridor, wallType)
            Default
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, RoomType.Basic, originX, originY, originX2, originY2, wideCorridor, wallType)
        End Select

        If allowWaterTarOoze
            Local liquidChance := Util.RndIntRangeFromZero(100, True)

            Local numPendingLiquidMaxPart1 := math.Max(controller_game.currentLevel - 1, 5)
            Local numPendingLiquidMaxPart2 := Util.RndIntRange(2, 7, True, -1)
            Local numPendingLiquidMaxPart3 := Util.RndIntRangeFromZero(numPendingLiquidMaxPart1, True)
            Local numPendingLiquidMax := numPendingLiquidMaxPart2 + numPendingLiquidMaxPart3

            Local liquidTileType: Int
            Select controller_game.currentZone
                Case 2
                    numPendingLiquidMaxPart2 = Util.RndIntRange(2, 7, True, -1)
                    numPendingLiquidMaxPart3 = Util.RndIntRangeFromZero(numPendingLiquidMaxPart1, True)
                    numPendingLiquidMax = numPendingLiquidMaxPart2 + numPendingLiquidMaxPart3

                    liquidTileType = TileType.Tar
                Case 4
                    liquidTileType = TileType.Ooze
                Default
                    liquidTileType = TileType.Water
            End Select

            Local placeLiquid := False
            If (controller_game.currentLevel = 1) And (liquidChance <=  5) Then placeLiquid = True
            If (controller_game.currentLevel = 2) And (liquidChance <= 25) Then placeLiquid = True
            If (controller_game.currentLevel = 3) And (liquidChance <= 45) Then placeLiquid = True
            If (controller_game.currentLevel > 3) And (liquidChance <= 65) Then placeLiquid = True

            Local numPendingLiquid := 0
            Local minFloorCount: Int
            If placeLiquid
                Select lastCreatedRoomType
                    Case 0
                    Case 1
                    Case 2
                        For Local tile := EachIn tiles
                            ' Can be simplified to `tile.type = TileType.Floor` if `tile.type` can be guaranteed to be non-negative.
                            If tile.type < 1 Then numPendingLiquid += 1
                        End For

                        numPendingLiquid = math.Max(numPendingLiquid, numPendingLiquidMax)
                        minFloorCount = Util.RndIntRangeFromZero(numPendingLiquid - 1, True)
                End Select
            End If

            Local i := 1000
            For Local i = i - 1 To 0 Step -1
                Local lastTileX := 0
                Local lastTileY := 0
                Local createdFirstLiquid := False

                If Not createdFirstLiquid
                    For Local tile := EachIn tiles
                        If tile.type = TileType.Floor
                            minFloorCount -= 1
                            If minFloorCount < 0
                                lastTileX = tile.x
                                lastTileY = tile.y
                                tile.type = liquidTileType
                                numPendingLiquid -= 1

                                createdFirstLiquid = True

                                Exit
                            End If
                        End If
                    End For
                Else
                    For Local tile := EachIn tiles
                        If tile.type = TileType.Floor And
                           Util.GetDist(lastTileX, lastTileY, tile.x, tile.y) <= 1.01 And
                           Not Util.RndIntRangeFromZero(3, True)
                            lastTileX = tile.x
                            lastTileY = tile.y
                            tile.type = liquidTileType
                            numPendingLiquid -= 1

                            Exit
                       End If
                    End For
                End If

                If numPendingLiquid <= 0 Then Exit
            End For

            If i = 0
                Debug.WriteLine("CREATEROOM abort: failed to place liquid")

                Return False
            End If
        End If

        For Local tile := EachIn tiles
            Local tileX := tile.x
            Local tileY := tile.y
            Local tileType := tile.type

            If pending And Not (Level.GetTileTypeAt(tileX, tileY) = TileType.Empty)
                If Not allowWallOverlap Then Return False
                If Not Level.IsWallAt(tileX, tileY, False, False) Then Return False

                New Tile(tileX, tileY, tileType, True, -1)
            Else
                Level.PlaceTileRemovingExistingTiles(tileX, tileY, tileType, pending, -1, False)
            End If
        End For

        Level.lastCreatedRoomType = lastCreatedRoomType

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

                Local wallChance := Util.RndIntRangeFromZero(6, True)

                For Local x := xVal + 1 Until xMax
                    For Local y := yVal + 1 Until yMax
                        ' If 2 units away (horizontally and veritcally) from the walls
                        If ((x - xVal = 2) Or (xMax - x - 2 = 2)) And
                           ((y - yVal = 2) Or (yMax - y - 2 = 2))
                            If wallChance
                                tiles.AddLast(New TileData(x, y, wallType))
                            Else
                                tiles.AddLast(New TileData(x, y, TileType.CatacombWall))
                            End If

                            Continue
                        End If

                        tiles.AddLast(New TileData(x, y, TileType.Floor))
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
                            Local xRem := originX - x - 2
                            Local yRem := originY - y - 2
                            If (Not wideCorridor Or Util.GetDist(originX, originY, originX2 + xRem, originY2 + yRem) > 1.0) And
                               (Util.GetDist(0, 0, xRem, yRem) > 1.0)
                                tiles.AddLast(New TileData(x, y, wallType))

                                Continue
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
                Level._CreateFloor(tiles, xVal, yVal, xMax, yMax, TileType.Floor4)
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
                    If Not (Level.GetTileTypeAt(x, yVal) = TileType.CatacombWall)
                        Level.PlaceTileRemovingExistingTiles(x, yVal, tileType, False, -1, False) ' Top wall
                    End If
                    If Not (Level.GetTileTypeAt(x, yMax) = TileType.CatacombWall)
                        Level.PlaceTileRemovingExistingTiles(x, yMax, tileType, False, -1, False) ' Bottom wall
                    End If
                End For

                ' Vertical walls
                For Local y := yVal + 1 Until yMax
                    If Not (Level.GetTileTypeAt(xVal, y) = TileType.CatacombWall)
                        Level.PlaceTileRemovingExistingTiles(xVal, y, tileType, False, -1, False) ' Left wall
                    End If
                    If Not (Level.GetTileTypeAt(xVal, y) = TileType.CatacombWall)
                        Level.PlaceTileRemovingExistingTiles(xVal, y, tileType, False, -1, False) ' Right wall
                    End If
                End For

                Level._CreateFloor(tiles, xVal, yVal, xMax, yMax, TileType.Floor4)
            Case RoomType.Notched
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, wallType)

                Local xDiffMin := 2
                If Not (originX = xVal) Then xDiffMin = (originX = xMax) + 1
                Local yDiffMin := 2
                If Not (originY = yVal) Then yDiffMin = (originY = yMax) + 1

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
        Debug.TraceNotImplemented("Level.CreateRoomZone5()")
    End Function

    Function CreateSwarmMap: Void()
        Level.InitNewMap(True)

        ' Probably an inlined function
        Level.levelConstraintX = -1000
        Level.levelConstraintY = -1000
        Level.levelConstraintW = 2000
        Level.levelConstraintH = 2000
        Level.levelConstraintNum = 0

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
        Debug.TraceEntered("Level.DeleteMap()")

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

    Function DistanceFromZone3DividingLine: Float(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.DistanceFromZone3DividingLine()")
    End Function

    Function DoQuickRestart: Void(continuedRun: Bool, showPopups: Bool, playIntroCutscene: Bool)
        Debug.TraceNotImplemented("Level.DoQuickRestart()")
    End Function

    Function DoRestart: Void()
        Debug.TraceNotImplemented("Level.DoRestart()")
    End Function

    Function DoRestart: Void(continuedRun: Bool, cancelFade: Bool)
        Debug.TraceNotImplemented("Level.DoRestart()")
    End Function

    Function DoWePlaceAdditionalChestThisLevel: Bool()
        Debug.TraceNotImplemented("Level.DoWePlaceAdditionalChestThisLevel()")
    End Function

    Function DryUpAllWater: Void(replacementFloor: Int)
        Debug.TraceNotImplemented("Level.DryUpAllWater()")
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
                        value = "#"
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
        Debug.TraceNotImplemented("Level.Earthquake()")
    End Function

    Function EnsureBossTraining: Void(name: String)
        Debug.TraceNotImplemented("Level.EnsureBossTraining()")
    End Function

    Function FillSecretRooms: Bool()
        Select controller_game.currentZone
            Case 4
                Return Level.FillSecretRoomsZone4()
            Case 2
                Return Level.FillSecretRoomsZone2()
        End Select

        Return Level.FillSecretRoomsZone1()
    End Function

    Function FillSecretRoomsZone1: Bool()
        Debug.TraceNotImplemented("Level.FillSecretRoomsZone1()")
    End Function

    Function FillSecretRoomsZone2: Bool()
        Debug.TraceNotImplemented("Level.FillSecretRoomsZone2()")
    End Function

    Function FillSecretRoomsZone4: Bool()
        Debug.TraceNotImplemented("Level.FillSecretRoomsZone4()")
    End Function

    Function FillTiles: Void(rect: Rect, tileType: Int, tileTypeEdge: Int)
        Debug.TraceNotImplemented("Level.FillTiles()")
    End Function

    Function FillVault: Void(tmpRoom: RoomData)
        Debug.TraceNotImplemented("Level.FillVault()")
    End Function

    Function FindTileOfType: Point(tileType: Int, ignoreCrackedWalls: Bool)
        Debug.TraceEntered("Level.FindTileOfType()")

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
        Debug.TraceNotImplemented("Level.FreezeTilesNear()")
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
        Debug.TraceNotImplemented("Level.GetExtraEnemiesBase()")
    End Function

    Function GetHardModeExtraEnemies: Int()
        Debug.TraceNotImplemented("Level.GetHardModeExtraEnemies()")
    End Function

    Function GetHardModeXML: XMLNode()
        Debug.TraceNotImplemented("Level.GetHardModeXML()")
    End Function

    Function GetInitialZone: Int()
        Debug.TraceNotImplemented("Level.GetInitialZone()")
    End Function

    Function GetMapTileLightValue: Float(xVal: Int, yVal: Int, forVision: Bool)
        Debug.TraceNotImplemented("Level.GetMapTileLightValue()")
    End Function

    Function GetMaxDepth: Int()
        Return 5
    End Function

    Function GetNPCSaleItem: Int(npcNum: Int, slotNum: Int, exclude1: String, exclude2: String)
        Debug.TraceNotImplemented("Level.GetNPCSaleItem()")
    End Function

    Function GetRandomOffsetPoint: Point()
        Debug.TraceNotImplemented("Level.GetRandomOffsetPoint()")
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
        Debug.TraceNotImplemented("Level.GetRandPointInRoomOfTileType()")
    End Function

    Function GetRandPointInRoomOfTileType: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, tileType: Int, skipCollisions: Bool)
        Debug.TraceNotImplemented("Level.GetRandPointInRoomOfTileType()")
    End Function

    Function GetRandPointInRoomWithOptions: Point(room: RoomBase, skipCollisions: Bool, skipExit: Bool, skipTraps: Bool, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Debug.TraceNotImplemented("Level.GetRandPointInRoomWithOptions()")
    End Function

    Function GetRandPointInRoomWithOptions: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, skipCollisions: Bool, skipExit: Bool, skipTraps: Bool, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Debug.TraceNotImplemented("Level.GetRandPointInRoomWithOptions()")
    End Function

    Function GetShrinePoint: Point()
        Debug.TraceNotImplemented("Level.GetShrinePoint()")
    End Function

    Function GetSingleZoneModeFinalBossZone: Int()
        Debug.TraceNotImplemented("Level.GetSingleZoneModeFinalBossZone()")
    End Function

    Function GetStandardExitCoords: Object()
        Debug.TraceNotImplemented("Level.GetStandardExitCoords()")
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
        Debug.TraceNotImplemented("Level.GetTileFlyawayAt()")
    End Function

    Function GetTileObstructionList: Object(includeOffscreen: Bool)
        Debug.TraceNotImplemented("Level.GetTileObstructionList()")
    End Function

    Function GetTileTypeAt: Int(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)
        If tile Then Return tile.GetType()

        Return -1
    End Function

    Function HaveFinalBoss: Bool()
        Debug.TraceNotImplemented("Level.HaveFinalBoss()")
    End Function

    Function InitNewMap: Void(saveGameData: Bool)
        Debug.TraceEntered("Level.InitNewMap()")

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            player.ResetStateAfterLevel()
        End For

        Level.DeleteMap()
        Level.isAnyTar = False
        Level.isConductorLevel = False
        Level.levelJustStarted = True
    End Function

    Function IsAnyPlayerWithinShop: Bool()
        Debug.TraceNotImplemented("Level.IsAnyPlayerWithinShop()")
    End Function

    Function IsAnyWallAt: Bool(r: Rect)
        Debug.TraceNotImplemented("Level.IsAnyWallAt()")
    End Function

    Function IsAnyWaterAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsAnyWaterAt()")
    End Function

    Function IsBossLevel: Bool()
        Debug.TraceNotImplemented("Level.IsBossLevel()")
    End Function

    Function IsCorridorFloorAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsCorridorFloorAt()")
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
        Debug.TraceNotImplemented("Level.IsDoorAdjacent()")
    End Function

    Function IsDoorAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsDoor()
    End Function

    Function IsExit: Bool(xVal: Int, yVal: Int)
        Return Not (Level.GetExitValue(xVal, yVal).x = -4)
    End Function

    Function IsExitAt: Bool(x: Int, y: Int)
        Local tile := Level.GetTileAt(x, y)

        Return tile And tile.IsExit()
    End Function

    Function IsFinalBoss: Bool()
        Debug.TraceNotImplemented("Level.IsFinalBoss()")
    End Function

    Function IsFinalBossZone: Bool()
        Debug.TraceNotImplemented("Level.IsFinalBossZone()")
    End Function

    Function IsFloorAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsFloor()
    End Function

    Function IsFreeLevelForSpecialRoom: Bool(tempLevel: Int, tempDepth: Int)
        Return (tempLevel = -1 Or tempDepth = -1) Or
               (tempLevel = Level.placeBloodShopOnLevel And tempDepth = Level.placeBloodShopOnDepth) Or
               (tempLevel = Level.placeFoodShopOnLevel And tempDepth = Level.placeFoodShopOnDepth) Or
               (tempLevel = Level.placeGlassShopOnLevel And tempDepth = Level.placeGlassShopOnDepth) Or
               (tempLevel = Level.placeArenaOnLevel And tempDepth = Level.placeArenaOnDepth) Or
               (tempLevel = Level.placeTransmogrifierOnLevel And tempDepth = Level.placeTransmogrifierOnDepth) Or
               (tempLevel = Level.placeConjurerOnLevel And tempDepth = Level.placeConjurerOnDepth) Or
               (tempLevel = Level.placeShrinerOnLevel And tempDepth = Level.placeShrinerOnDepth) Or
               (tempLevel = Level.placePawnbrokerOnLevel And tempDepth = Level.placePawnbrokerOnDepth)
    End Function

    Function IsHotCoalAt: Bool(xVal: Int, yVal: Int)
        Return Level.GetTileTypeAt(xVal, yVal) = TileType.HotCoal
    End Function

    Function IsIceAt: Bool(xVal: Int, yVal: Int)
        Return Level.GetTileTypeAt(xVal, yVal) = TileType.Ice
    End Function

    Function IsIcePartOfLevel: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsIcePartOfLevel()")
    End Function

    Function IsLockedExit: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsLockedExit()")
    End Function

    Function IsNormalFloorAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsNormalFloor()
    End Function

    Function IsPassable: Bool()
        Debug.TraceEntered("Level.IsPassable()")

        Local points := New List<Point>()
        Local intPointSet := New IntPointSet()
        Local point := New Point(0, 0)

        points.AddLast(point)
        intPointSet.Insert(point)

        While Not points.IsEmpty()
            Local firstPoint := points.RemoveFirst()

            For Local dir := 0 Until 4
                Local newPoint := firstPoint.Add(Util.GetPointFromDir(dir))
                Local x := newPoint.x
                Local y := newPoint.y

                If Not intPointSet.Contains(newPoint)
                    If Level.IsExit(x, y) Then Return True

                    Local tile := Level.GetTileAt(x, y)
                    If tile
                        If tile.IsFloor() Or
                           tile.type = TileType.DirtWall Or
                           tile.type = TileType.CorridorDirtWall Or
                           tile.IsDoor()
                            Local dirBlocked := False

                            For Local trap := EachIn Trap.trapList
                                If (x = trap.x) And (y = trap.y)
                                    dirBlocked = True
                                End If
                            End For

                            If dirBlocked Then Continue

                            For Local shrine := EachIn Shrine.shrineList
                                If (x = shrine.x) And (y = shrine.y)
                                    dirBlocked = True
                                End If
                            End For

                            If dirBlocked Then Continue

                            points.AddLast(newPoint)
                            intPointSet.Insert(newPoint)
                        End If
                    End If
                End If
            End For
        End While

        Throw New Throwable()
    End Function

    Function IsPeaceful: Bool()
        Debug.TraceNotImplemented("Level.IsPeaceful()")
    End Function

    Function IsSecretRoom: Bool(rmType: Int)
        Select rmType
            Case RoomType.Secret
            Case RoomType.Vault
                Return True
        End Select

        Return False
    End Function

    Function IsSeededMode: Bool(mode: Int)
        Debug.TraceNotImplemented("Level.IsSeededMode()")
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
        Debug.TraceNotImplemented("Level.IsTrapAdjacent()")
    End Function

    Function IsTrapOrExitAbove: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsTrapOrExitAbove()")
    End Function

    Function IsVisibleTileAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsVisibleTileAt()")
    End Function

    Function IsWallAdjacent: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsWallAdjacent()")
    End Function

    Function IsWallAdjacent8: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsWallAdjacent8()")
    End Function

    Function IsWallAt: Bool(xVal: Int, yVal: Int, destructibleOnly: Bool, torchlessOnly: Bool)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsWall(False, destructibleOnly, False, torchlessOnly)
    End Function

    Function IsWaterOrTarAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsWaterOrTarAt()")
    End Function

    Function IsWireLikeAt: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("Level.IsWireLikeAt()")
    End Function

    Function IsZone5RoomLegal: Bool(loc: Rect)
        Debug.TraceNotImplemented("Level.IsZone5RoomLegal()")
    End Function

    Function JanitorReset: Void()
        Debug.TraceNotImplemented("Level.JanitorReset()")
    End Function

    Function LoadLevelSong: Void(levelObj: LevelObject)
        Debug.TraceNotImplemented("Level.LoadLevelSong()")
    End Function

    Function MakeAllWallsUnbreakable: Void()
        Debug.TraceNotImplemented("Level.MakeAllWallsUnbreakable()")
    End Function

    Function MakeHelper: Void()
        Debug.TraceNotImplemented("Level.MakeHelper()")
    End Function

    Function MakeInvisibleChestAt: Void(tmpX: Int, tmpY: Int)
        Debug.TraceNotImplemented("Level.MakeInvisibleChestAt()")
    End Function

    Function MarkAllTilesAsSeen: Void()
        Debug.TraceNotImplemented("Level.MarkAllTilesAsSeen()")
    End Function

    Function MaybeForbidTrapdoor: Bool()
        Debug.TraceNotImplemented("Level.MaybeForbidTrapdoor()")
    End Function

    Function NewLevel: Void(level: Int, zone: Int, playerID: Int, inEditor: Bool, levelObj: LevelObject, continuedRun: Bool)
        Debug.TraceNotImplemented("Level.NewLevel()")
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
        Debug.TraceNotImplemented("Level.PaintTriggerInterior()")
    End Function

    Function PawnSlot: Void(slotName: String, ent: Entity)
        Debug.TraceNotImplemented("Level.PawnSlot()")
    End Function

    Function PlaceAdditionalChestAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceAdditionalChestAt()")
    End Function

    Function PlaceAppropriateMinibosses: Void(room: RoomBase)
        Debug.TraceNotImplemented("Level.PlaceAppropriateMinibosses()")
    End Function

    Function PlaceChests: Void(freeBroadSword: Bool)
        Debug.TraceNotImplemented("Level.PlaceChests()")
    End Function

    Function PlaceConnectedWireDoor: Void(p: Point)
        Debug.TraceNotImplemented("Level.PlaceConnectedWireDoor()")
    End Function

    Function PlaceCrateOrBarrel: Void()
        Debug.TraceNotImplemented("Level.PlaceCrateOrBarrel()")
    End Function

    Function PlaceEnemies: Void()
        Debug.TraceNotImplemented("Level.PlaceEnemies()")
    End Function

    Function PlaceEnemiesZone1: Void()
        Debug.TraceNotImplemented("Level.PlaceEnemiesZone1()")
    End Function

    Function PlaceEnemiesZone2: Void()
        Debug.TraceNotImplemented("Level.PlaceEnemiesZone2()")
    End Function

    Function PlaceEnemiesZone3: Void()
        Debug.TraceNotImplemented("Level.PlaceEnemiesZone3()")
    End Function

    Function PlaceEnemiesZone4: Void()
        Debug.TraceNotImplemented("Level.PlaceEnemiesZone4()")
    End Function

    Function PlaceEnemiesZone5: Void()
        Debug.TraceNotImplemented("Level.PlaceEnemiesZone5()")
    End Function

    Function PlaceExit: Bool(rdExit: RoomData)
        Debug.TraceEntered("Level.PlaceExit()")

        For Local i := 499 Until 0 Step -1
            Local x := rdExit.x + Util.RndIntRangeFromZero(rdExit.w - 1, True)
            Local y := rdExit.y + Util.RndIntRangeFromZero(rdExit.h - 1, True)
            If Not (Level.GetTileTypeAt(x, y) = TileType.Floor) And
               Not Level.IsCorridorFloorOrDoorAdjacent(x, y)
                If Level.IsWallAt(x, y + 1, False, False)
                    Level.CreateExit(x, y)

                    Return True
                End If
            End If
        End For

        Return Level._FailMap()
    End Function

    Function PlaceFirstRoom: RoomData()
        Debug.TraceEntered("Level.PlaceFirstRoom()")

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

    Function PlaceGargoyle: Object(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Level.PlaceGargoyle()")
    End Function

    Function PlaceHotCoalTileAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceHotCoalTileAt()")
    End Function

    Function PlaceIceTileAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceIceTileAt()")
    End Function

    Function PlaceLockedChests: Void()
        Debug.TraceNotImplemented("Level.PlaceLockedChests()")
    End Function

    Function PlaceMinibossOfShapeAt: Object(newMiniboss: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceMinibossOfShapeAt()")
    End Function

    Function PlaceNocturnaArea: Void()
        Debug.TraceNotImplemented("Level.PlaceNocturnaArea()")
    End Function

    Function PlacePenaltyBoxEnemies: Void()
        Debug.TraceNotImplemented("Level.PlacePenaltyBoxEnemies()")
    End Function

    Function PlaceRandomEnemyForTempo: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceRandomEnemyForTempo()")
    End Function

    Function PlaceRareEnemies: Void(room: RoomBase, hasExit: Bool)
        Debug.TraceNotImplemented("Level.PlaceRareEnemies()")
    End Function

    Function PlaceResourceWall: Void()
        Debug.TraceNotImplemented("Level.PlaceResourceWall()")
    End Function

    Function PlaceRoomZone1: RoomData(roomToAttachTo: RoomData)
        Return Level.PlaceRoomZone1(RoomType.None, roomToAttachTo)
    End Function

    Function PlaceRoomZone1: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Level.pendingTiles.Clear()

        While Tile.pendingTilesList.Count() > 0
            Tile.pendingTilesList.RemoveFirst().Die()
        End While

        Local wideCorridorChance := Util.RndIntRangeFromZero(100, True)
        Local wideCorridor: Bool
        If (controller_game.currentLevel = 2) And (wideCorridorChance <= 30) Then wideCorridor = True
        If (controller_game.currentLevel = 3) And (wideCorridorChance <= 60) Then wideCorridor = True
        If (controller_game.currentLevel = 4) And (wideCorridorChance <= 80) Then wideCorridor = True
        If (controller_game.currentLevel > 4) And (wideCorridorChance <= 90) Then wideCorridor = True

        ' Overwrites `wideCorridor` but cannot skip the call to `RndIntRange` because it has side effects.
        Select roomType
            Case RoomType.Shop
            Case RoomType.Secret
            Case RoomType.Vault
                wideCorridor = False
        End Select

        Local x: Int
        Local y: Int

        If roomToAttachTo
            If roomToAttachTo.x And
               roomToAttachTo.x + roomToAttachTo.w And
               roomToAttachTo.y And
               roomToAttachTo.y + roomToAttachTo.h
                While True
                    x = 1 + roomToAttachTo.x + Util.RndIntRangeFromZero(roomToAttachTo.w - 1, True)
                    y = 1 + roomToAttachTo.y + Util.RndIntRangeFromZero(roomToAttachTo.h - 1, True)

                    If roomToAttachTo.x = x Then Exit
                    If (roomToAttachTo.x + roomToAttachTo.w) = x Then Exit
                    If roomToAttachTo.y = y Then Exit
                    If (roomToAttachTo.y + roomToAttachTo.h) = y Then Exit
                End While
            Else
                x = 0
                y = 0
            End If
        Else
            Local tileLocation := Level.FindTileOfType(TileType.Unknown98, True)
            x = tileLocation.x
            y = tileLocation.y
        End If

        Local dunno3 := 4
        Local dunno2 := 3
        Local dunno1 := 2
        Local dunno0 := 1

        Local tileRight := Level.GetTileAt(x + 1, y)
        If tileRight And Not (tileRight.GetType() = TileType.Floor)
            dunno3 = 3
            dunno2 = 2
            dunno1 = 1
            dunno0 = 0
        End If

        Local tileBelow := Level.GetTileAt(x, y + 1)
        If tileBelow And Not (tileBelow.GetType() = TileType.Floor)
            dunno2 += 1
            dunno1 += 1
            dunno0 += 1
        End If

        Local tileLeft := Level.GetTileAt(x - 1, y)
        If tileLeft And Not (tileLeft.GetType() = TileType.Floor)
            dunno1 += 1
            dunno0 += 1
        End If

        Local tileAbove := Level.GetTileAt(x, y - 1)
        If tileAbove And Not (tileAbove.GetType() = TileType.Floor)
            dunno0 += 1
        End If

        If Not (dunno0 = 1) Return Null

        Local horiz := False
        Local moveX := 0 ' Possible values: -1, 0, 1
        Local moveY := 0 ' Possible values: -1, 0, 1

        If tileRight And Not (tileRight.GetType() = TileType.Floor)
            horiz = True
            moveX = -1
        End If

        If tileBelow And Not (tileBelow.GetType() = TileType.Floor)
            moveY = -1
        Else
            moveY = 0
        End If

        If tileLeft And Not (tileLeft.GetType() = TileType.Floor)
            horiz = True
            moveX = 1
        End If

        If tileAbove And Not (tileAbove.GetType() = TileType.Floor)
            moveY = 1
        End If

        Level.carveX = x
        Level.carveY = y

        Local width: Int
        Local height: Int

        If Not Level.CarveNewCorridor(moveX, moveY, horiz, True, False, roomType, wideCorridor) Return Null

        If Level.IsSecretRoom(roomType)
            ' `width` and `height` are overwritten but `RndIntRange` has side effects. Do not remove.
            width = Util.RndIntRange(6, 8, True, -1)
            height = Util.RndIntRange(5, 7, True, -1)

            width = 4
            height = 3
        Else
            For Local i := 0 Until 2
                If Util.RndBool(True)
                    If Not (Level.IsFloorAt(Level.carveX, Level.carveY))
                        New Tile(Level.carveX, Level.carveY, TileType.CorridorDirtWall, True, -1)
                    End If

                    If horiz
                        If Not (Level.IsFloorAt(Level.carveX, Level.carveY - 1))
                            New Tile(Level.carveX, Level.carveY - 1, TileType.CorridorDirtWall, True, -1)
                        End If

                        If Not (Level.IsFloorAt(Level.carveX, Level.carveY + 1))
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
                        If Not (Level.IsFloorAt(Level.carveX - 1, Level.carveY))
                            New Tile(Level.carveX - 1, Level.carveY, TileType.CorridorDirtWall, True, -1)
                        End If

                        If Not (Level.IsFloorAt(Level.carveX + 1, Level.carveY))
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

                    If Not Level.CarveNewCorridor(moveX, moveY, Not horiz, True, True, roomType, wideCorridor)
                        Return Null
                    End If
                End If
            End For

            ' `width` and `height` are overwritten if `roomType` is 3 (Shop) but `RndIntRange` has side effects.
            width = Util.RndIntRange(6, 8, True, -1)
            height = Util.RndIntRange(5, 7, True, -1)

            If roomType = RoomType.Shop
                width = 6
                height = 8
            End If
        End If

        Local xVal: Int
        Local yVal: Int
        Local originX := Level.carveX
        Local originY := Level.carveY

        Select moveX
            Case -1
                xVal = Level.carveX - width
                Local yOff := Util.RndIntRangeFromZero(height - 2, True)

                If wideCorridor
                    yVal = Level.carveY - Util.RndIntRangeFromZero(height - 3, True) - 1
                Else
                    yVal = originY - yOff - 1
                End If
            Case 1
                xVal = Level.carveX
                Local yOff := Util.RndIntRangeFromZero(height - 2, True)

                If wideCorridor
                    yOff = Util.RndIntRangeFromZero(height - 3, True)
                End If

                yVal = originY - yOff - 1
            Default
                ' `RndIntRange` has side effects. Must stay outside of the following If-block.
                Local xOff := Util.RndIntRangeFromZero(width - 2, True)

                yVal = Level.carveY
                If moveY = -1 Then yVal -= height

                If wideCorridor
                    xVal = Level.carveX - Util.RndIntRangeFromZero(width - 3, True) - 1
                Else
                    xVal = Level.carveX - xOff - 1
                End If
        End Select

        Local originX2 := originX + 1
        Local originY2 := originY

        If horiz
            originX2 = originX
            originY2 = originY + 1
        End If

        If Not Level.CreateRoom(xVal, yVal, width, height, True, roomType, originX, originY, originX2, originY2, wideCorridor, TileType.DirtWall, False, True)
            Return Null
        End If

        For Local pendingTilesOnXNode := EachIn Level.pendingTiles
            For Local pendingTileNode := EachIn pendingTilesOnXNode.Value()
                Local pendingTileX := pendingTilesOnXNode.Key()
                Local pendingTileY := pendingTileNode.Key()

                Local tileAt := Level.GetTileAt(pendingTileX, pendingTileY)
                If tileAt Then tileAt.Die()

                Local pendingTileType := pendingTileNode.Value().GetType()
                New Tile(pendingTileX, pendingTileY, pendingTileType, False, -1)
            End For
        End For

        If roomType = RoomType.Shop
            Level.PlaceShopItemsAt(xVal, yVal, Null)

            Return Level._PlaceRoom(xVal, yVal, width, height)
        End If

        If Level.IsSecretRoom(roomType)
            Return Level._PlaceRoom(xVal, yVal, width, height)
        End If

        Local addDoorChance := Util.RndIntRangeFromZero(100, True)
        Local addDoor: Bool
        If (controller_game.currentLevel = 1) And (addDoorChance <= 80) Then addDoor = True
        If (controller_game.currentLevel = 2) And (addDoorChance <= 70) Then addDoor = True
        If (controller_game.currentLevel = 3) And (addDoorChance <= 60) Then addDoor = True
        If (controller_game.currentLevel > 3) And (addDoorChance <= 50) Then addDoor = True

        Local tileType: Int
        If addDoor
            If Level.isHardcoreMode
                If Not wideCorridor
                    If Util.RndIntRangeFromZero(8, True)
                        New Tile(Level.carveX, Level.carveY, TileType.Door, False, -1)
                    Else
                        New Tile(Level.carveX, Level.carveY, TileType.MetalDoor, False, -1)
                    End If

                    Return Level._PlaceRoom(xVal, yVal, width, height)
                Else
                    New Tile(Level.carveX, Level.carveY, TileType.Door, False, -1)
                End If
            Else
                New Tile(Level.carveX, Level.carveY, TileType.Door, False, -1)
            End If

            tileType = TileType.Door
        Else
            New Tile(Level.carveX, Level.carveY, TileType.CorridorFloor, False, -1)

            tileType = TileType.CorridorFloor
        End If

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

    Function PlaceRoomZone2: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Debug.TraceNotImplemented("Level.PlaceRoomZone2()")
    End Function

    Function PlaceRoomZone3: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Debug.TraceNotImplemented("Level.PlaceRoomZone3()")
    End Function

    Function PlaceRoomZone4: RoomData(roomType: Int)
        Debug.TraceNotImplemented("Level.PlaceRoomZone4()")
    End Function

    Function PlaceRoomZone5: RoomData(pseg: PortalSeg, width: Int, height: Int, minEntryDist: Int)
        Debug.TraceNotImplemented("Level.PlaceRoomZone5()")
    End Function

    Function PlaceRoomZone5: RoomData(portalSegs: StackEx<PortalSeg>, width: Int, height: Int, minEntryDist: Int, roomType: Int)
        Debug.TraceNotImplemented("Level.PlaceRoomZone5()")
    End Function

    Function PlaceSecondarySpecialShop: Void(useBloodCost: Bool, isFoodShop: Bool)
        Debug.TraceNotImplemented("Level.PlaceSecondarySpecialShop()")
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
        If Not door
            door = New Rect(Level.carveX, Level.carveY, 0, 0)
        End If

        Local v4 := False
        If Level.isHardcoreMode Or controller_game.currentDepth > 1
            v4 = True
            If Util.RndIntRangeFromZero(160, True)
                v4 = Level.debugForceMonstrousShop
            End If
        End If

        Local v8: Bool
        If Util.IsCharacterActive(Character.Unknown15)
            'LABEL_13
            v8 = False
            If Not (controller_game.currentLevel = 1)
                'goto LABEL_14
            End If
            'goto LABEL_81
        Else
            'LABEL_12
            If Level.shopkeeperDead
                'goto LABEL_13
            End If

            If Not v4
                New Shopkeeper(tmpX + 3, tmpY + 3, 1, False)
                'goto LABEL_13
            End If

            New Shopkeeper(tmpX + 3, tmpY + 3, 5, False)

            If Not (controller_game.currentLevel = 1)
                'goto LABEL_14
            End If

            'LABEL_81
            If Not (controller_game.currentZone = 1)
                'goto LABEL_17
            End If

            v8 = False
            If Not GameData.GetNPCUnlock("beastmaster")
                v8 = Not Level.isLevelEditor
            End If

            If Not (controller_game.currentLevel = 3)
                'goto LABEL_144
            End If

            'LABEL_14
            If Not (controller_game.currentLevel = 1)
                'goto LABEL_17
            End If

            Local v49 := False
            If Not GameData.GetNPCUnlock("bossmaster")
                v49 = Not Level.isLevelEditor
            End If

            If v49
                v8 = True
                If Not (controller_game.currentLevel = 2)
                    'goto LABEL_17
                End If
            Else
                'LABEL_144
                If Not (controller_game.currentLevel = 2)
                    'goto LABEL_17
                End If
            End If

            If controller_game.currentZone = 2
                Local v97 := False
                If Not GameData.GetNPCUnlock("weaponmaster")
                    v97 = Not Level.isLevelEditor
                End If

                If v97 Then v8 = True
            End If

            'LABEL_17
            If Level.isHardcoreMode
                v8 = False
            Else If Level.isDDRMode
                v8 = False
            End If

            If Not Util.RndIntRangeFromZero(3, True) And
               controller_game.currentLevel > 1 And
               Not Level.lockedShopPlaced
                Local randomPoint := door.RandomPoint()
                New Tile(randomPoint.x, randomPoint.y, TileType.CrackedShopWall, False, -1)
                Level.addKeyInSecretChest = True

                If controller_game.numPlayers <= 0
                    'LABEL_28
                    If v8
                        Local key: String

                        Select controller_game.currentLevel
                            Case 1
                                key = "misc_golden_key"
                            Case 2
                                key = "misc_golden_key3"
                            Default
                                key = "misc_golden_key2"
                        End Select

                        New SaleItem(tmpX + 2, tmpY + 5, key, False, Null, -1.0, Null)
                    Else
                        Local randomItemName := SaleItem.GetRandomItem(controller_game.currentLevel, "lockedShopChance")
                        Local randomItem := New SaleItem(tmpX + 2, tmpY + 5, randomItemName, False, Null, -1.0, Null)
                        randomItem.ApplyDiscount(0.5)
                        If randomItem.itemType = "resource_hoard_gold"
                            randomItem.Die()
                        End If
                    End If

                    If Not Util.IsWeaponlessCharacterActive()
                        Local randomItemName := SaleItem.GetRandomItem(controller_game.currentLevel, "lockedShopChance")
                        Local randomItem := New SaleItem(tmpX + 3, tmpY + 5, randomItemName, False, Null, -1.0, Null)
                        randomItem.ApplyDiscount(0.5)
                        If randomItem.itemType = "resource_hoard_gold"
                            randomItem.Die()
                        End If
                    End If

                    Local randomItemName := SaleItem.GetRandomItem(controller_game.currentLevel, "lockedShopChance")
                    Local randomItem := New SaleItem(tmpX + 4, tmpY + 5, randomItemName, False, Null, -1.0, Null)
                    randomItem.ApplyDiscount(0.5)
                    If randomItem.itemType = "resource_hoard_gold"
                        randomItem.Die()
                    End If

                    Debug.Log("PlaceShopItemsAt ZONE " + controller_game.currentZone + ": Placing LOCKED shop at " + 0 + ", " + 0)

                    If Level.shopkeeperDead
                        Debug.Log("PlaceShopItemsAt: REMOVING items since shopkeeper is dead.")

                        Local pickup1 := Item.GetPickupAt(tmpX + 2, tmpY + 5, Null)
                        If pickup1 Then pickup1.Die()
                        Local pickup2 := Item.GetPickupAt(tmpX + 3, tmpY + 5, Null)
                        If pickup2 Then pickup2.Die()
                        Local pickup3 := Item.GetPickupAt(tmpX + 4, tmpY + 5, Null)
                        If pickup3 Then pickup3.Die()
                    End If
                Else
                    If Not Util.IsCharacterActive(Character.Unknown15)
                        'goto LABEL_28
                    End If
                End If

                Level.lockedShopPlaced = True
                'goto LABEL_40
            End If

            If Not Level.isHardcoreMode Or Util.RndIntRangeFromZero(8, True)
                For Local point := EachIn door.GetPoints()
                    Local tile := New Tile(point.x, point.y, TileType.Door, False, -1)
                    tile.SetDoorTrigger(3)
                End For
            Else
                Local randomPoint := door.RandomPoint()
                Local tile := New Tile(randomPoint.x, randomPoint.y, TileType.MetalDoor, False, -1)
                tile.SetDoorTrigger(3)
            End If

            Local v38 := -1
            If Not Util.RndIntRangeFromZero(3, True)
                v38 = Util.RndIntRange(1, 3, True, -1)
            End If
            Local t_contb := Util.RndIntRange(1, 3, True, -1)
            If Level.isFloorIsLavaMode
                v38 = -1
            End If
        End If

        Debug.TraceNotImplemented("Level.PlaceShopItemsAt()")
    End Function

    Function PlaceShopkeeperGhostIfNeededAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceShopkeeperGhostIfNeededAt()")
    End Function

    Function PlaceShrine: Void()
        Debug.TraceNotImplemented("Level.PlaceShrine()")
    End Function

    Function PlaceTileRemovingExistingTiles: Tile(xVal: Int, yVal: Int, tileType: Int, pending: Bool, tilesetOverride: Int, fromEarthSpell: Bool)
        Local lightValueCached: Float
        Local alpha: Float
        Local hasBeenSeen: Bool
        Local lightValueFrameNum: Int

        Local tile := Level.GetTileAt(xVal, yVal)
        If Not tile Or
           Not (tilesetOverride = -1) Or
           Not (tile.type = tileType)
            If Not tile
                hasBeenSeen = False
                lightValueFrameNum = -1
                lightValueCached = -1.0
                alpha = 0.0
            Else
                If fromEarthSpell And
                   Not (tile.trigger = 0) And
                   Not (tile.trigger = 1)
                    Return tile
                End If

                If tilesetOverride = -1 Then tilesetOverride = tile.tilesetOverride
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
        Debug.TraceNotImplemented("Level.PlaceTileTypeAt()")
    End Function

    Function PlaceTorchesAnywhere: Void()
        Debug.TraceNotImplemented("Level.PlaceTorchesAnywhere()")
    End Function

    Function PlaceTrapInRoom: Object(xVal: Int, yVal: Int, wVal: Int, hVal: Int, trapType: Int, bounceDir: Int, twoAwayTrap: Trap)
        Debug.TraceNotImplemented("Level.PlaceTrapInRoom()")
    End Function

    Function PlaceTraps: Void()
        Debug.TraceNotImplemented("Level.PlaceTraps()")
    End Function

    Function PlaceTrapsZone1: Void()
        Debug.TraceNotImplemented("Level.PlaceTrapsZone1()")
    End Function

    Function PlaceTrapsZone2: Void()
        Debug.TraceNotImplemented("Level.PlaceTrapsZone2()")
    End Function

    Function PlaceTrapsZone3: Void()
        Debug.TraceNotImplemented("Level.PlaceTrapsZone3()")
    End Function

    Function PlaceTrapsZone4: Void()
        Debug.TraceNotImplemented("Level.PlaceTrapsZone4()")
    End Function

    Function PlaceTrapsZone5: Void()
        Debug.TraceNotImplemented("Level.PlaceTrapsZone5()")
    End Function

    Function PlaceTrapZone3: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Debug.TraceNotImplemented("Level.PlaceTrapZone3()")
    End Function

    Function PlaceTrapZone4: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Debug.TraceNotImplemented("Level.PlaceTrapZone4()")
    End Function

    Function PlaceTrapZone5: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Debug.TraceNotImplemented("Level.PlaceTrapZone5()")
    End Function

    Function PlaceWire: Bool(src: Point, dst: Point)
        Debug.TraceNotImplemented("Level.PlaceWire()")
    End Function

    Function PlaceZone3Beetle: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZone3Beetle()")
    End Function

    Function PlaceZone3Cauldron: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZone3Cauldron()")
    End Function

    Function PlaceZone3Elemental: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZone3Elemental()")
    End Function

    Function PlaceZone3Slime: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZone3Slime()")
    End Function

    Function PlaceZone3YetiHellhound: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZone3YetiHellhound()")
    End Function

    Function PlaceZoneAppropriateNumberOfDiamondsAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZoneAppropriateNumberOfDiamondsAt()")
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
        Else If controller_game.currentDepth = Level.placeShrinerOnDepth And controller_game.currentLevel = Level.placeShrineOnLevel
            Level.AddSpecialRoom(SpecialRoomType.Shriner, True)
        Else If controller_game.currentDepth = Level.placePawnbrokerOnDepth And controller_game.currentLevel = Level.placePawnbrokerOnLevel
            Level.AddSpecialRoom(SpecialRoomType.Pawnbroker, True)
        End If

        Debug.Log("Done processing special rooms")
    End Function

    Function PutBeastmasterStairs: Void(x: Int, y: Int, stairName: String, enemyName: String, enemyType: Int, enemyId: Int, stairNamePrefix: String)
        Debug.TraceNotImplemented("Level.PutBeastmasterStairs()")
    End Function

    Function PutBossStair: Void(x: Int, y: Int, bossName: String, enemyType: Int, zone: Int, label: String, labelXOff: Int)
        Debug.TraceNotImplemented("Level.PutBossStair()")
    End Function

    Function PutCrateOrBarrel: Void(x: Int, y: Int)
        Debug.TraceNotImplemented("Level.PutCrateOrBarrel()")
    End Function

    Function PutEnemyZone5: Void(x: Int, y: Int)
        Debug.TraceNotImplemented("Level.PutEnemyZone5()")
    End Function

    Function PutFutureStair: Void(x: Int, y: Int)
        Debug.TraceNotImplemented("Level.PutFutureStair()")
    End Function

    Function PutMinibossStair: Void(x: Int, y: Int, minibossName: String, enemyType: Int, label: String, labelXOff: Int)
        Debug.TraceNotImplemented("Level.PutMinibossStair()")
    End Function

    Function PutRoomEnemiesZone5: Void(room: RoomBase, hasExit: Bool)
        Debug.TraceNotImplemented("Level.PutRoomEnemiesZone5()")
    End Function

    Function PutVariedEnemiesZone5: Void(pts: StackEx<Point>)
        Debug.TraceNotImplemented("Level.PutVariedEnemiesZone5()")
    End Function

    Function QueryHarderBosses: Bool()
        Debug.TraceNotImplemented("Level.QueryHarderBosses()")
    End Function

    Function RandomFood: Int()
        Debug.TraceNotImplemented("Level.RandomFood()")
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
        Debug.TraceNotImplemented("Level.RemoveExit()")
    End Function

    Function RemoveSomeWallsAwayFromCorridors: Void(percentToRemove: Float, includeCorridors: Bool, maxHealth: Int)
        Debug.TraceNotImplemented("Level.RemoveSomeWallsAwayFromCorridors()")
    End Function

    Function RemoveTileAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.RemoveTileAt()")
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
        Debug.TraceNotImplemented("Level.SetMagicBarrier()")
    End Function

    Function ShopkeeperMissing: Bool()
        Debug.TraceNotImplemented("Level.ShopkeeperMissing()")
    End Function

    Function ShowModPopup: Void(imageName: String)
        Debug.TraceNotImplemented("Level.ShowModPopup()")
    End Function

    Function SplashWater: Void(xVal: Int, yVal: Int, destroyWater: Bool)
        Debug.TraceNotImplemented("Level.SplashWater()")
    End Function

    Function StartReplayPlayback: Void()
        Debug.TraceNotImplemented("Level.StartReplayPlayback()")
    End Function

    Function TakeActionAfterAllCharsScoreSubmit: Void()
        Debug.TraceNotImplemented("Level.TakeActionAfterAllCharsScoreSubmit()")
    End Function

    Function TransmogrifySlot: Void(slotName: String, ent: Entity)
        Debug.TraceNotImplemented("Level.TransmogrifySlot()")
    End Function

    Function TransmogrifyWeaponToType: Void(ent: Entity, type: Int)
        Debug.TraceNotImplemented("Level.TransmogrifyWeaponToType()")
    End Function

    Function TrySpawnBossMinibossAt: Void(x: Int, y: Int, etype: Int)
        Debug.TraceNotImplemented("Level.TrySpawnBossMinibossAt()")
    End Function

    Function UnlockChar: Void(characterID: Int)
        Debug.TraceNotImplemented("Level.UnlockChar()")
    End Function

    Function Update: Void()
        Debug.TraceNotImplemented("Level.Update()")
    End Function

    Function WantPenaltyBox: Bool()
        Debug.TraceNotImplemented("Level.WantPenaltyBox()")
    End Function

    Function WidenCorridors: Void()
        Debug.TraceNotImplemented("Level.WidenCorridors()")
    End Function

    Function _EditorFix: Void() End

    Method NoTrim: Void()
        ActivateTrigger(0, Null, Null)
        ActuallyGetMapTileLightValue(0, 0, False)
        AddCrackedWall(0)
        AddExit(0, 0, 0, 0)
        AddHarderStone()
        AddMinibossWall(0, 0, 0)
        AddSomePillarsInOpenSpace()
        AddSpecialRoom(0, False)
        AddStone()
        AdvanceLevel()
        AllowSpirit()
        BossMaybeMinibossesAt(0, 0, 0, 0)
        BreakIce(0, 0)
        CarveCorridorTile(0, 0, False, False, False, 0, False)
        CarveNewCorridor(0, 0, False, False, False, 0, False)
        CheckLOS(0, 0, 0, 0, False)
        CheckMapConsistency()
        ClearMinibossWall()
        ClearTextLabelAt(0, 0)
        CloseInOuterWalls()
        ConjureSlot("", Null)
        CreateAllCharsDLCSelect()
        CreateAllCharsSelect()
        CreateBeastmaster()
        CreateBeastmasterZone1()
        CreateBeastmasterZone2()
        CreateBeastmasterZone3()
        CreateBeastmasterZone4()
        CreateBeastmasterZone5()
        CreateBossBattle()
        CreateBossBattle1()
        CreateBossBattle2()
        CreateBossBattle3()
        CreateBossBattle4()
        CreateBossBattle5()
        CreateBossBattle9()
        CreateBossBattleFrankensteinway()
        CreateBossmaster()
        CreateBossmasterBosses()
        CreateBossmasterMinibosses()
        CreateCharSelect()
        CreateDiamondDealer()
        CreateDungeonMaster()
        CreateExit(0, 0)
        CreateExtraModesSelect()
        CreateFinalBossBattle()
        CreateFinalBossBattle2()
        CreateFinalBossBattle3()
        CreateFinalBossBattleConductor()
        CreateHephaestus()
        CreateIndestructibleBorder()
        CreateJanitor()
        CreateLobby()
        CreateMap(Null)
        CreateMapZone1()
        CreateMapZone2()
        CreateMapZone3()
        CreateMapZone4(False)
        CreateMapZone5(False)
        CreateMerlin()
        CreateRoom(0, 0, 0, 0, False, 0, 0, 0, 0, 0, False, 0, False, False)
        CreateRoomZone5(Null, 0)
        CreateSwarmMap()
        CreateTestMap()
        CreateTrainer()
        CreateTrainingMap()
        CreateTutorialMap()
        CreateWeaponmaster()
        DeleteMap()
        DistanceFromZone3DividingLine(0, 0)
        DoQuickRestart(False, False, False)
        DoRestart()
        DoRestart(False, False)
        DoWePlaceAdditionalChestThisLevel()
        DryUpAllWater(0)
        DumpMap()
        Earthquake(0, 0)
        EnsureBossTraining("")
        FillSecretRooms()
        FillSecretRoomsZone1()
        FillSecretRoomsZone2()
        FillSecretRoomsZone4()
        FillTiles(Null, 0, 0)
        FillVault(Null)
        FindTileOfType(0, False)
        FreezeTilesNear(0, 0, False)
        GenerateHardcoreZoneOrder()
        GenerateJanitorItems()
        GetAdjustedZoneForAllChars()
        GetAdjustedZoneForAllCharsDLC()
        GetAdjustedZoneForStoryMode()
        GetDistanceToNearestTorch(Null)
        GetExitValue(0, 0)
        GetExtraEnemiesBase()
        GetHardModeExtraEnemies()
        GetHardModeXML()
        GetInitialZone()
        GetMapTileLightValue(0, 0, False)
        GetNPCSaleItem(0, 0, "", "")
        GetRandomOffsetPoint()
        GetRandomWallInRoom(0, 0, 0, 0)
        GetRandPointInRoomOfTileType(Null, 0, False)
        GetRandPointInRoomOfTileType(0, 0, 0, 0, 0, False)
        GetRandPointInRoomWithOptions(Null, False, False, False, False, False, False)
        GetRandPointInRoomWithOptions(0, 0, 0, 0, False, False, False, False, False, False)
        GetShrinePoint()
        GetSingleZoneModeFinalBossZone()
        GetStandardExitCoords()
        GetTileAt(0, 0)
        GetTileFlyawayAt(0, 0)
        GetTileObstructionList(False)
        GetTileTypeAt(0, 0)
        HaveFinalBoss()
        InitNewMap(False)
        IsAnyPlayerWithinShop()
        IsAnyWallAt(Null)
        IsAnyWaterAt(0, 0)
        IsBossLevel()
        IsCorridorFloorAt(0, 0)
        IsCorridorFloorOrDoorAdjacent(0, 0)
        IsCorridorOrRoomWallAt(0, 0)
        IsCrackedWallAdjacent(0, 0)
        IsCrackedWallAt(0, 0)
        IsDoorAdjacent(0, 0)
        IsDoorAt(0, 0)
        IsExit(0, 0)
        IsExitAt(0, 0)
        IsFinalBoss()
        IsFinalBossZone()
        IsFloorAt(0, 0)
        IsFreeLevelForSpecialRoom(0, 0)
        IsHotCoalAt(0, 0)
        IsIceAt(0, 0)
        IsIcePartOfLevel(0, 0)
        IsLockedExit(0, 0)
        IsNormalFloorAt(0, 0)
        IsPassable()
        IsPeaceful()
        IsSecretRoom(0)
        IsSeededMode(0)
        IsSurroundedByDestructibleWalls(0, 0)
        IsTileEmpty(0, 0)
        IsTileTypeAdjacent(0, 0, 0)
        IsTrapAdjacent(0, 0)
        IsTrapOrExitAbove(0, 0)
        IsVisibleTileAt(0, 0)
        IsWallAdjacent(0, 0)
        IsWallAdjacent8(0, 0)
        IsWallAt(0, 0, False, False)
        IsWaterOrTarAt(0, 0)
        IsWireLikeAt(0, 0)
        IsZone5RoomLegal(Null)
        JanitorReset()
        LoadLevelSong(Null)
        MakeAllWallsUnbreakable()
        MakeHelper()
        MakeInvisibleChestAt(0, 0)
        MarkAllTilesAsSeen()
        MaybeForbidTrapdoor()
        NewLevel(0, 0, 0, False, Null, False)
        PadWalls()
        PaintTriggerInterior(0, 0, 0, 0, 0)
        PawnSlot("", Null)
        PlaceAdditionalChestAt(0, 0)
        PlaceAppropriateMinibosses(Null)
        PlaceChests(False)
        PlaceConnectedWireDoor(Null)
        PlaceCrateOrBarrel()
        PlaceEnemies()
        PlaceEnemiesZone1()
        PlaceEnemiesZone2()
        PlaceEnemiesZone3()
        PlaceEnemiesZone4()
        PlaceEnemiesZone5()
        PlaceExit(Null)
        PlaceFirstRoom()
        PlaceGargoyle(0, 0, 0)
        PlaceHotCoalTileAt(0, 0)
        PlaceIceTileAt(0, 0)
        PlaceLockedChests()
        PlaceMinibossOfShapeAt(0, 0, 0)
        PlaceNocturnaArea()
        PlacePenaltyBoxEnemies()
        PlaceRandomEnemyForTempo(0, 0)
        PlaceRareEnemies(Null, False)
        PlaceResourceWall()
        PlaceRoomZone1(0, Null)
        PlaceRoomZone2(0, Null)
        PlaceRoomZone3(0, Null)
        PlaceRoomZone4(0)
        PlaceRoomZone5(Null, 0, 0, 0)
        PlaceRoomZone5(Null, 0, 0, 0, 0)
        PlaceSecondarySpecialShop(False, False)
        PlaceSecretRooms(0)
        PlaceShopItemsAt(0, 0, Null)
        PlaceShopkeeperGhostIfNeededAt(0, 0)
        PlaceShrine()
        PlaceTileRemovingExistingTiles(0, 0, 0, False, 0, False)
        PlaceTileTypeAt(0, 0, 0)
        PlaceTorchesAnywhere()
        PlaceTrapInRoom(0, 0, 0, 0, 0, 0, Null)
        PlaceTraps()
        PlaceTrapsZone1()
        PlaceTrapsZone2()
        PlaceTrapsZone3()
        PlaceTrapsZone4()
        PlaceTrapsZone5()
        PlaceTrapZone3(0, 0, 0, 0)
        PlaceTrapZone4(0, 0, 0, 0)
        PlaceTrapZone5(0, 0, 0, 0)
        PlaceWire(Null, Null)
        PlaceZone3Beetle(0, 0)
        PlaceZone3Cauldron(0, 0)
        PlaceZone3Elemental(0, 0)
        PlaceZone3Slime(0, 0)
        PlaceZone3YetiHellhound(0, 0)
        PlaceZoneAppropriateNumberOfDiamondsAt(0, 0)
        ProcessSpecialRoom()
        PutBeastmasterStairs(0, 0, "", "", 0, 0, "")
        PutBossStair(0, 0, "", 0, 0, "", 0)
        PutCrateOrBarrel(0, 0)
        PutEnemyZone5(0, 0)
        PutFutureStair(0, 0)
        PutMinibossStair(0, 0, "", 0, "", 0)
        PutRoomEnemiesZone5(Null, False)
        PutVariedEnemiesZone5(Null)
        QueryHarderBosses()
        RandomFood()
        RandomWalkOfTempTiles(0, 0, 0)
        RecalcLevelBoundaries()
        RefreshLineOfSightTiles()
        RemoveExit(0, 0)
        RemoveSomeWallsAwayFromCorridors(0, False, 0)
        RemoveTileAt(0, 0)
        RenderAll()
        RenderExitArrow()
        ResetCosts()
        ResetSpecialRoomVariables()
        SetMagicBarrier(False)
        ShopkeeperMissing()
        ShowModPopup("")
        SplashWater(0, 0, False)
        StartReplayPlayback()
        TakeActionAfterAllCharsScoreSubmit()
        TransmogrifySlot("", Null)
        TransmogrifyWeaponToType(Null, 0)
        TrySpawnBossMinibossAt(0, 0, 0)
        UnlockChar(0)
        Update()
        WantPenaltyBox()
        WidenCorridors()
    End Method

End

Class MinibossTileData

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
