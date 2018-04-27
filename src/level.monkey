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
Import bossmaster
Import chest
Import conjurer
Import controller_game
Import crate
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
Import pawnbroker
Import player_class
Import poltergeist
Import portal_seg
Import rect
Import renderable_object
Import replay
Import rng
Import room_with_door
Import roomdata
Import saleitem
Import sarcophagus
Import sarcophagus_tough
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
Import tile
Import tiledata
Import transmogrifier
Import trap
Import trapchest
Import util
Import weighted_picker
Import wraith
Import xml
Import zombie

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
        Debug.TraceNotImplemented("Level.AddHarderStone()")
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
        Debug.TraceNotImplemented("Level.AddSomePillarsInOpenSpace()")
    End Function

    Function AddSpecialRoom: Void(roomType: Int, addCrack: Bool)
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

                Local heartContainerRoll := Util.RndIntRangeFromZero(100, True)
                Local heartContainer: String
                If heartContainerRoll <= 20 Then heartContainer = "misc_heart_container"
                If heartContainerRoll <= 25 Then heartContainer = "misc_heart_container2"
                If heartContainerRoll <= 50 Then heartContainer = "misc_heart_container_empty2"
                If heartContainerRoll >  50 Then heartContainer = "misc_heart_container_empty"
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
                    If randomItem1 <> "no_item" Or
                       randomItem1 <> "resource_hoard_gold"
                        New SaleItem(entranceX - 1, entranceY - 2, randomItem1, True, Null, -1.0, Null)
                    End If
                End If

                ' Center item (left item if a weaponless character is active)
                Local randomItem2 := Item.GetRandomItemInClass("", requestedLevel, "anyChest", Chest.CHEST_COLOR_NONE, True, "", False)
                If randomItem2 <> "no_item" Or
                   randomItem2 <> "resource_hoard_gold"
                    New SaleItem(entranceX + saleItemXOff, entranceY - 2, randomItem2, True, Null, -1.0, Null)
                End If

                ' Right item
                Local randomItem3 := Item.GetRandomItemInClass("", requestedLevel, "anyChest", Chest.CHEST_COLOR_NONE, True, "", False)
                If randomItem3 <> "no_item" Or
                   randomItem3 <> "resource_hoard_gold"
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
                    If anotherItem <> "no_item" And
                       anotherItem <> "resource_hoard_gold"
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
        Debug.TraceNotImplemented("Level.CheckMapConsistency()")
    End Function

    Function ClearMinibossWall: Void()
        Debug.TraceNotImplemented("Level.ClearMinibossWall()")
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

            Debug.WriteLine("Placed shriner on " + depth + "-" + level)
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

            Debug.WriteLine("Placed blood shop on " + depth + "-" + level)
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

            Debug.WriteLine("Placed glass shop on " + depth + "-" + level)
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

            Debug.WriteLine("Placed food shop on " + depth + "-" + level)
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

            Debug.WriteLine("Placed arena on " + depth + "-" + level)
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

            Debug.WriteLine("Placed transmogrifier on " + depth + "-" + level)
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

            Debug.WriteLine("Placed conjurer on " + depth + "-" + level)
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
        Debug.TraceNotImplemented("Level.CreateMapZone4(Bool)")
    End Function

    Function CreateMapZone5: Bool(recursive: Bool)
        Debug.TraceNotImplemented("Level.CreateMapZone5(Bool)")
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

        Local catacombWallRoll: Float
        Select controller_game.currentLevel
            Case 1 catacombWallRoll = 0.00
            Case 2 catacombWallRoll = 0.10
            Case 3 catacombWallRoll = 0.13
            Case 4 catacombWallRoll = 0.16
            Default
                If currentLevel > 4
                    catacombWallRoll = math.Max(controller_game.currentLevel * 0.04, 0.40)
                End If
        End Select

        If catacombWallRoll > Util.RndIntRangeFromZero(1, True) And
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
                                lastCreatedRoomType = RoomType.Pillar
                                ' No room?
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

            If (controller_game.currentLevel = 1) And (liquidRoll <=  5) Then placeLiquid = True
            If (controller_game.currentLevel = 2) And (liquidRoll <= 25) Then placeLiquid = True
            If (controller_game.currentLevel = 3) And (liquidRoll <= 45) Then placeLiquid = True
            If (controller_game.currentLevel > 3) And (liquidRoll <= 65) Then placeLiquid = True

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
                                    Local convertToLiquidChance := Util.RndIntRangeFromZero(3, True)
                                    If convertToLiquidChance = 0
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

        Debug.WriteLine("Created room (" + xVal + ", " +  yVal + ", " +  wVal + ", " +  hVal + ", " +  originX + ", " +  originY + ")")

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

                Local wallRoll := Util.RndIntRangeFromZero(6, True)

                For Local x := xVal + 1 Until xMax
                    For Local y := yVal + 1 Until yMax
                        ' If 2 units away (horizontally and veritcally) from the walls
                        If ((x - xVal = 2) Or (xMax - x - 2 = 2)) And
                           ((y - yVal = 2) Or (yMax - y - 2 = 2))
                            If wallRoll
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
        Debug.TraceNotImplemented("Level.DoWePlaceAdditionalChestThisLevel()")
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
                        New Crate(point.x, point.y, Crate.TYPE_URN, "no_item")
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
                            New Chest(point.x, point.y, "no_item", False, False, True, Chest.CHEST_COLOR_NONE)
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
        Debug.TraceNotImplemented("Level.FillSecretRoomsZone2()")
    End Function

    Function FillSecretRoomsZone4: Bool()
        Debug.TraceNotImplemented("Level.FillSecretRoomsZone4()")
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
        Debug.TraceNotImplemented("Level.GetRandPointInRoomOfTileType(RoomBase, Int, Bool)")
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
                If Level._IsWallAdjacent(x, y) Then Continue
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
        Debug.TraceNotImplemented("Level.GetSingleZoneModeFinalBossZone()")
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
        If tile Then Return tile.GetType()

        Return -1
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
        Debug.TraceNotImplemented("Level.IsFinalBossZone()")
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

    Function IsLockedExit: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsLockedExit(Int, Int)")
    End Function

    Function IsNormalFloorAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsNormalFloor()
    End Function

    Function IsPassable: Bool()
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
        Debug.TraceNotImplemented("Level.IsTrapOrExitAbove(Int, Int)")
    End Function

    Function IsVisibleTileAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsVisibleTileAt(Int, Int)")
    End Function

    Function IsWallAdjacent: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsWallAdjacent(Int, Int)")
    End Function

    Function IsWallAdjacent8: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.IsWallAdjacent8(Int, Int)")
    End Function

    Function _IsWallAdjacent: Bool(xVal: Int, yVal: Int)
        For Local y := yVal - 1 To yVal + 1
            For Local x := xVal - 1 To xVal + 1
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
        Debug.TraceNotImplemented("Level.IsWaterOrTarAt(Int, Int)")
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
        Level.isSeededMode = True
        Level.randSeedString = "1"
        Level.randSeed = Util.ParseTextSeed(Level.randSeedString)
        If Level.randSeed = -1 Then Level.randSeed = 0

        If Not Level.wholeRunRNG
            Level.wholeRunRNG = RNG.Make(Level.randSeed)
        End If

        Level.currentFloorRNG = Level.wholeRunRNG.Split()
        Local randSeed := Level.currentFloorRNG.Rand()
        ' TODO: Deterministic start log message

        Debug.Log("NEWLEVEL: Using seed " + randSeed)

        Util.SeedRnd(randSeed)

        Level.creatingMap = True

        'INIT_HARDCORE_MODE_COMMON
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

        If Level.CreateMap(Null)
            Debug.WriteLine("Created map.")
        Else
            Debug.WriteLine("Failed to create map.")
        End If

        Level.DumpMap()

        Debug.TraceNotImplemented("Level.NewLevel(Int, Int, Int, Bool, Object, Bool)")
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
        Local types := New IntStack()

        Select controller_game.currentZone
            Case 1
                weights.Push(1)
                types.Push(402)
                weights.Push(1)
                types.Push(407)

                If controller_game.currentLevel <= 2
                    weights.Push(1)
                    types.Push(400)
                End If
            Case 4
                weights.Push(20)
                types.Push(402)
                weights.Push(15)
                types.Push(405)
                weights.Push(15)
                types.Push(409)
                weights.Push(25)
                types.Push(412)
                weights.Push(25)
                types.Push(411)
            Case 5
                weights.Push(2)
                types.Push(402)
                weights.Push(1)
                types.Push(407)
                weights.Push(1)
                types.Push(413)
            Default
                weights.Push(25)
                types.Push(402)
                weights.Push(15)
                types.Push(400)
                weights.Push(20)
                types.Push(405)
                weights.Push(15)
                types.Push(409)
                weights.Push(25)
                types.Push(407)
        End Select

        'AssertImpl(weights.Length() = types.Length())

        Local numMinibosses := 1

        If Shrine.bossShrineActive Then numMinibosses += 1

        If Level.isHardMode Or
           Util.IsCharacterActive(Character.Tempo)
            Local hardModeNode := Level.GetHardModeXML()
            Local extraMinibossesPerExit := item.GetInt(hardModeNode, "extraMinibossesPerExit", 0)

            numMinibosses += extraMinibossesPerExit
        End If

        Local types2 := New IntStack()
        Local minibossPoint := Level.GetStandardExitCoords()

        For Local i := 0 Until numMinibosses
            Local v56 := New IntStack()
            Local dunno := 999999

            For Local type := EachIn types
                Local j := 0

                For Local previousLevelMiniboss := EachIn Level.previousLevelMinibosses
                    If type = Enemy.GetBaseType(previousLevelMiniboss) Then j += 1
                End For

                For Local type2 := EachIn types2
                    If type = type2 Then j += 2
                End For

                v56.Push(j)

                If dunno <= j Then j = dunno
                dunno = j
            End For

            For Local k := 0 Until weights.Length()
                Local v26 := v56.Get(k)

                Local enabled := False
                If v26 = dunno Then enabled = True

                weights.SetEnabled(k + 1, enabled)
            End For

            Local typesIndex := weights.PickRandom(True)
            Local type := types.Get(typesIndex)
            types2.Push(type)

            Local miniboss := Level.PlaceMinibossOfShapeAt(type, minibossPoint.x, minibossPoint.y)
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

            minibossPoint = Level.GetRandPointInRoomWithOptions(room, True, True, True, True, True, False)
            If minibossPoint = Null Then Exit
        End For
    End Function

    Function PlaceChests: Void(freeBroadSword: Bool)
        Debug.TraceNotImplemented("Level.PlaceChests(Bool)")
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

            If extraEnemies > 0
                Local i := 500
                For i = i - 1 Until 0 Step -1
                    point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                    If point = Null Then Continue

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

                    extraEnemies -= 1
                    If extraEnemies <= 0 Then Exit
                End For
            End If

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

                        New Monkey(point.x, point.y, 1)
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

                        New Slime(point.x, point.y, 3)
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
                        If point = Null
                            'goto NEXT_ROOM
                        End If

                        New Skeleton(point.x, point.y, 3)
                    End If

                    Local batRoll := Util.RndIntRangeFromZero(3, True)
                    If batRoll = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 2)
                    End If

                    Local batRoll2 := Util.RndIntRangeFromZero(2, True)
                    If batRoll2 = 0
                        point = Level.GetRandPointInRoomWithOptions(room, False, True, False)
                        If point = Null Then Continue

                        New Skeleton(point.x, point.y, 1)
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

            ' TODO: Aria section
            ' TODO: Tempo section
        End For
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

    Function PlaceGargoyle: Object(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Level.PlaceGargoyle(Int, Int, Int)")
    End Function

    Function PlaceHotCoalTileAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceHotCoalTileAt(Int, Int)")
    End Function

    Function PlaceIceTileAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceIceTileAt(Int, Int)")
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
            Case 412 miniboss = New Ogre(xVal, yVal, level)
            Case 411 miniboss = New Mommy(xVal, yVal, level)
            Default  miniboss = New MetroGnome(xVal, yVal, level)
        End Select

        Return miniboss
    End Function

    Function PlaceNocturnaArea: Void()
        Debug.TraceNotImplemented("Level.PlaceNocturnaArea()")
    End Function

    Function PlacePenaltyBoxEnemies: Void()
        Debug.TraceNotImplemented("Level.PlacePenaltyBoxEnemies()")
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
        Local types := New IntStack()

        weightedPicker.Push(1)
        types.Push(402)

        Select controller_game.currentZone
            Case 1,
                 2,
                 3,
                 5
                weightedPicker.Push(1)
                types.Push(407)
        End Select

        Select controller_game.currentZone
            Case 1,
                 2,
                 3
                weightedPicker.Push(1)
                types.Push(400)
        End Select

        Select controller_game.currentZone
            Case 2,
                 3,
                 4
                weightedPicker.Push(1)
                types.Push(405)

                weightedPicker.Push(1)
                types.Push(409)
        End Select

        Select controller_game.currentZone
            Case 5
                weightedPicker.Push(1)
                types.Push(413)
        End Select

        If minibossesPerNonExit > 0
            For Local i := 0 Until minibossesPerNonExit
                point = Level.GetRandPointInRoomWithOptions(room, True, True, True, True, True, False)
                If point = Null Then Exit

                Local enemyTypeIndex := weightedPicker.PickRandom(True)
                Local enemyType := types.Get(enemyTypeIndex)

                Enemy.MakeEnemy(point.x, point.y, enemyType)
            End For
        End If

        Local sarcsPerRoom := ToughSarcophagus.GetPerRoomCount()
        If sarcsPerRoom > 0
            Local toughSarcophagusEnemyTypes := New StackEx<Int>()

            Select controller_game.currentZone
                Case 1
                    Select controller_game.currentLevel
                        Case 1  toughSarcophagusEnemyTypes.Push(3)
                        Case 2  toughSarcophagusEnemyTypes.Push(4)
                        Default toughSarcophagusEnemyTypes.Push(5)
                    End Select

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyTypes.Push(9)
                    Else
                        toughSarcophagusEnemyTypes.Push(10)
                    End If

                    toughSarcophagusEnemyTypes.Push(11)
                Case 2
                    Select controller_game.currentLevel
                        Case 1
                            toughSarcophagusEnemyTypes.Push(100)
                            toughSarcophagusEnemyTypes.Push(103)
                        Case 2
                            toughSarcophagusEnemyTypes.Push(101)
                            toughSarcophagusEnemyTypes.Push(104)
                        Default
                            toughSarcophagusEnemyTypes.Push(102)
                            toughSarcophagusEnemyTypes.Push(105)
                    End Select

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyTypes.Push(108)
                        toughSarcophagusEnemyTypes.Push(110)
                    Else
                        toughSarcophagusEnemyTypes.Push(109)
                        toughSarcophagusEnemyTypes.Push(111)
                    End If

                    toughSarcophagusEnemyTypes.Push(114)
                Case 3
                    Select controller_game.currentLevel
                        Case 1  toughSarcophagusEnemyTypes.Push(202)
                        Case 2  toughSarcophagusEnemyTypes.Push(203)
                        Default toughSarcophagusEnemyTypes.Push(204)
                    End Select

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyTypes.Push(207)
                    Else
                        toughSarcophagusEnemyTypes.Push(208)
                    End If

                    If controller_game.currentLevel = 1
                        toughSarcophagusEnemyTypes.Push(212)
                    Else
                        toughSarcophagusEnemyTypes.Push(219)
                    End If

                    toughSarcophagusEnemyTypes.Push(205)
                    toughSarcophagusEnemyTypes.Push(211)
                    toughSarcophagusEnemyTypes.Push(209)
                Case 4
                    Select controller_game.currentLevel
                        Case 1  toughSarcophagusEnemyTypes.Push(309)
                        Case 2  toughSarcophagusEnemyTypes.Push(310)
                        Default toughSarcophagusEnemyTypes.Push(311)
                    End Select

                    If Not Util.IsCharacterActive(Character.Dorian)
                        If controller_game.currentLevel <= 2
                            toughSarcophagusEnemyTypes.Push(304)
                        Else
                            toughSarcophagusEnemyTypes.Push(305)
                        End If
                    End If

                    If controller_game.currentLevel = 1
                        toughSarcophagusEnemyTypes.Push(319)
                    Else
                        toughSarcophagusEnemyTypes.Push(320)
                    End If

                    toughSarcophagusEnemyTypes.Push(300)
                    toughSarcophagusEnemyTypes.Push(303)
                    toughSarcophagusEnemyTypes.Push(307)
                    toughSarcophagusEnemyTypes.Push(308)
                    toughSarcophagusEnemyTypes.Push(312)
                    toughSarcophagusEnemyTypes.Push(313)
                Default
                    Select controller_game.currentLevel
                        Case 1
                            toughSarcophagusEnemyTypes.Push(701)
                            toughSarcophagusEnemyTypes.Push(704)
                            toughSarcophagusEnemyTypes.Push(720)
                        Case 2
                            toughSarcophagusEnemyTypes.Push(712)
                            toughSarcophagusEnemyTypes.Push(705)
                            toughSarcophagusEnemyTypes.Push(721)
                        Default
                            toughSarcophagusEnemyTypes.Push(713)
                            toughSarcophagusEnemyTypes.Push(706)
                            toughSarcophagusEnemyTypes.Push(722)
                    End Select

                    If controller_game.currentLevel = 1
                        toughSarcophagusEnemyTypes.Push(717)
                    Else
                        toughSarcophagusEnemyTypes.Push(719)
                    End If

                    If controller_game.currentLevel <= 2
                        toughSarcophagusEnemyTypes.Push(723)
                    Else
                        toughSarcophagusEnemyTypes.Push(724)
                    End If

                    toughSarcophagusEnemyTypes.Push(702)
            End Select

            'AssertImpl(toughSarcophagusEnemyTypes.Length() > 0)

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
                    Case 205 enemyType = Level.GetZone3ElementalType(point.x, point.y)
                    Case 211 enemyType = Level.GetZone3YetiHellhoundType(point.x, point.y)
                    Case 209 enemyType = Level.GetZone3BeetleType(point.x, point.y)
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

        Local width: Int
        Local height: Int

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

        width = Util.RndIntRange(6, 8, True, -1)
        height = Util.RndIntRange(5, 7, True, -1)

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

    Function PlaceRoomZone2: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Debug.TraceNotImplemented("Level.PlaceRoomZone2(Int, RoomData)")
    End Function

    Function PlaceRoomZone3: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Debug.TraceNotImplemented("Level.PlaceRoomZone3(Int, RoomData)")
    End Function

    Function PlaceRoomZone4: RoomData(roomType: Int)
        Debug.TraceNotImplemented("Level.PlaceRoomZone4(Int)")
    End Function

    Function PlaceRoomZone5: RoomData(pseg: PortalSeg, width: Int, height: Int, minEntryDist: Int)
        Debug.TraceNotImplemented("Level.PlaceRoomZone5(PortalSeg, Int, Int, Int)")
    End Function

    Function PlaceRoomZone5: RoomData(portalSegs: StackEx<PortalSeg>, width: Int, height: Int, minEntryDist: Int, roomType: Int)
        Debug.TraceNotImplemented("Level.PlaceRoomZone52(StackEx<PortalSeg>, Int, Int, Int, Int)")
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

        ' TODO: Fix `Item.GetRandomItemInClass`.
        itemName = "ring_regeneration"

        Local itemNode := Item.GetItemXML(itemName)
        Local coinCost := item.GetInt(itemNode, "coinCost", 0)

        Local forceCost := 0.5
        If Not useBloodCost
            forceCost = coinCost / 10
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
                        item1 = New SaleChest(itemsXMid - 1, itemsY, "no_item", False, False, False, chestColor)
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
                        item2 = New SaleChest(itemsXMid + 0, itemsY, "no_item", False, False, False, chestColor)
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
                    item3 = New SaleChest(itemsXMid + 1, itemsY, "no_item", False, False, False, chestColor)
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
        Debug.TraceNotImplemented("Level.PlaceTorchesAnywhere()")
    End Function

    Function PlaceTrapInRoom: Trap(room: RoomData, trapType: Int)
        Return Level.PlaceTrapInRoom(room.x, room.y, room.w, room.h, trapType, -1, Null)
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
                    If Trap.GetTrapTypeAt(point.x, point.y - 1) = TrapType.BounceTrap Then Continue
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
        Debug.TraceNotImplemented("Level.PlaceTrapZone3(Int, Int, Int, Int)")
    End Function

    Function PlaceTrapZone4: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Debug.TraceNotImplemented("Level.PlaceTrapZone4(Int, Int, Int, Int)")
    End Function

    Function PlaceTrapZone5: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Debug.TraceNotImplemented("Level.PlaceTrapZone5(Int, Int, Int, Int)")
    End Function

    Function PlaceWire: Bool(src: Point, dst: Point)
        Debug.TraceNotImplemented("Level.PlaceWire(Point, Point)")
    End Function

    Function PlaceZone3Beetle: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZone3Beetle(Int, Int)")
    End Function

    Function PlaceZone3Cauldron: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZone3Cauldron(Int, Int)")
    End Function

    Function PlaceZone3Elemental: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZone3Elemental(Int, Int)")
    End Function

    Function PlaceZone3Slime: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZone3Slime(Int, Int)")
    End Function

    Function PlaceZone3YetiHellhound: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Level.PlaceZone3YetiHellhound(Int, Int)")
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
        New Crate(x, y, crateType, "no_item")
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
        Debug.TraceNotImplemented("Level.RemoveSomeWallsAwayFromCorridors(Float, Bool, Int)")
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
        Debug.TraceNotImplemented("Level.SetMagicBarrier(Bool)")
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
        Debug.TraceNotImplemented("Level.WantPenaltyBox()")
    End Function

    Function WidenCorridors: Void()
        Debug.TraceNotImplemented("Level.WidenCorridors()")
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
