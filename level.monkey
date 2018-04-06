Import monkey.map
Import monkey.random
Import chest
Import controller_game
Import crate
Import entity
Import exitmap
import gamedata
Import level_object
Import particles
Import portal_seg
Import rect
Import renderable_object
Import room_with_door
Import roomdata
Import saleitem
Import slowdowntrap
Import speeduptrap
Import spells
Import spiketrap
Import stack_ex
Import swarm_sarcophagus
Import tile
Import trap
Import util
Import xml

Class Level
    
    Global addKeyInSecretChest: Bool
    Global allCharsCompletion: Int
    Global allCharsCompletionDLC: Int
    Global arenaNum: Int
    Global bossNumber: Int
    Global carveX: Int
    Global carveY: Int
    Global charactersJustUnlocked: Int
    Global chestsStillToPlace: Int
    Global conjurer: Object
    Global constMapLightValues: Int
    Global continuedRunCoinScore: Int
    Global creatingMap: Int
    Global currentFloorRNG: Int
    Global dailyChallengeX: Int
    Global dailyChallengeY: Int
    Global deathlessWinCount: Int
    Global debugForceMonstrousShop: Int
    Global enemiesDropSingleCoinForThisLevel: Bool
    Global exitArrow: Int
    Global exitArrowX: Int
    Global exitArrowY: Int
    Global exits: ExitMap
    Global firstRoom: RoomData
    Global flawlessVictory: Int
    Global forceBoss: Int
    Global hallwayZone5: Int
    Global isAllCharactersDLCMode: Bool
    Global isAllCharactersMode: Bool
    Global isAllCharsRunNoItemsNoShrines: Bool
    Global isAnyTar: Bool
    Global isBeastmaster: Bool
    Global isConductorLevel: Bool
    Global isDailyChallenge: Bool
    Global isDDRMode: Bool
    Global isDeathlessMode: Bool
    Global isFloorIsLavaMode: Bool
    Global isHardcoreMode: Bool
    Global isHardMode: Bool
    Global isLevelEditor: Bool
    Global isLevelEnding: Bool
    Global isMysteryMode: Bool
    Global isNoReturnMode: Bool
    Global isPhasingMode: Bool
    Global isRandomizerMode: Bool
    Global isReplaying: Bool
    Global isRunNoItemsNoShrines: Bool
    Global isSeededMode: Bool
    Global isSoulMode: Bool
    Global isStoryMode: Bool
    Global isSwarmMode: Bool
    Global isTrainingMode: Bool
    Global justUnlocked: Int
    Global lastCreatedRoomType: Int
    Global lastTileCount: Int
    Global levelConstraintH: Int
    Global levelConstraintNum: Int
    Global levelConstraintW: Int
    Global levelConstraintX: Int
    Global levelConstraintY: Int
    Global levelJustStarted: Bool
    Global lockedShopPlaced: Int
    Global mapLightValues: Int
    Global mapLightValuesCachedFrame: Int
    Global mapLightValuesInitialized: Int
    Global maxLevelMinimapX: Int
    Global maxLevelMinimapY: Int
    Global maxLevelX: Int
    Global maxLevelY: Int
    Global mentorLevel: Int
    Global minibossFormerWall: List<MinibossTileData>
    Global minimap: Int
    Global minLevelMinimapX: Int
    Global minLevelMinimapY: Int
    Global minLevelX: Int
    Global minLevelY: Int
    Global nonDeterministicMSStart: Int
    Global outsideBossChamber: Int
    Global pacifismModeOn: Int
    Global pawnbroker: Object
    Global pendingTiles: IntMap<IntMap<Tile>> = New IntMap<IntMap<Tile>>
    Global placeArenaOnDepth: Int
    Global placeArenaOnLevel: Int
    Global placeBloodShopOnDepth: Int
    Global placeBloodShopOnLevel: Int
    Global placeConjurerOnDepth: Int
    Global placeConjurerOnLevel: Int
    Global placedAdditionalBlackChest: Int
    Global placedAdditionalRedChest: Int
    Global placedAdditionalWhiteChest: Int
    Global placedArena: Int
    Global placedUrnThisRun: Int
    Global placeFoodShopOnDepth: Int
    Global placeFoodShopOnLevel: Int
    Global placeGlassShopOnDepth: Int
    Global placeGlassShopOnLevel: Int
    Global placeLordOnLevel: Int
    Global placePawnbrokerOnDepth: Int
    Global placePawnbrokerOnLevel: Int
    Global placeShrineOnLevel: Int
    Global placeShrinerOnDepth: Int
    Global placeShrinerOnLevel: Int
    Global placeTransmogrifierOnDepth: Int
    Global placeTransmogrifierOnLevel: Int
    Global playedVictoryCutscene: Int
    Global popUpController: Int
    Global popUpType: Int
    Global practiceEnemyNum: Int
    Global previousLevelMinibosses: StackEx<Int>
    Global previousLevelUnkilledStairLockingMinibosses: StackEx<Int>
    Global quickRestart: Int
    Global randSeed: Int
    Global randSeedString: String
    Global replay: Int
    Global rooms: List<RoomData>
    Global secretAtX: Int
    Global secretAtY: Int
    Global secretRockRoomPlaced: Int
    Global shopH: Int
    Global shopkeeperDead: Int
    Global shopkeeperFell: Bool
    Global shopkeeperGhostDepth: Int
    Global shopkeeperGhostLevel: Int
    Global shopW: Int
    Global shopX: Int
    Global shopY: Int
    Global shriner: Object
    Global skipNextPenaltyBox: Int
    Global specialRoomEntranceX: Int
    Global specialRoomEntranceY: Int
    Global startedShrinerFight: Bool
    Global tempTileWalk: Int
    Global tileObstructionList: Int
    Global tiles: IntMap<IntMap<Tile>> = New IntMap<IntMap<Tile>>
    Global todaysRandSeedString: String
    Global transmogrifier: Object
    Global triggerList: List<Int>
    Global usedBosses: Int
    Global usedCustomMusic: Int
    Global wasMinibossLockedInBattle: Bool
    Global wholeRunRNG: Int
    Global zone3DividingLineX: Int
    Global zone3DividingLineY: Int
    Global zoneOrder: Int

    Function ActivateTrigger: Int(triggerNum: Int, ent: Entity, target: RenderableObject)
    End Function

    Function ActuallyGetMapTileLightValue: Float(xVal: Int, yVal: Int, forVision: Bool)
    End Function

    Function AddCrackedWall: Void(roomType: Int)
    End Function

    Function AddExit: Void(xVal: Int, yVal: Int, levelPointer: Int, zonePointer: Int)
        Local location := New Point(xVal, yVal)
        Local floor := New Point(levelPointer, zonePointer)
        Level.exits.Set(location, floor)
    End Function

    Function AddHarderStone: Void()
    End Function

    Function AddMinibossWall: Void(xVal: Int, yVal: Int, wallType: Int)
        Local tile := Level.GetTileAt(xVal, yVal)
        If tile
            If tile.field_FC Then Return

            Local tileData := new MinibossTileData()
            tileData.x = xVal
            tileData.y = yVal
            tileData.type = tile.type
            tileData.field_1C = tile.field_C0

            Level.minibossFormerWall.AddLast(tileData)
        End If

        Level.PlaceTileRemovingExistingTiles(xVal, yVal, wallType, False, -1, False)
        Level.wasMinibossLockedInBattle = True
    End Function

    Function AddSomePillarsInOpenSpace: Void()
    End Function

    Function AddSpecialRoom: Void(roomType: Int, addCrack: Bool)
    End Function

    Function AddStone: Void()
    End Function

    Function AdvanceLevel: Void()
    End Function

    Function AllowSpirit: Bool()
    End Function

    Function BossMaybeMinibossesAt: Void(x1: Int, y1: Int, x2: Int, y2: Int)
    End Function

    Function BreakIce: Void(xVal: Int, yVal: Int)
    End Function

    Function CarveCorridorTile: Void(xVal: Int, yVal: Int, horiz: Bool, pending: Bool, skipWalls: Bool, roomType: Int, wideCorridor: Bool)
        If roomType = 5 Or roomType = 7
            New Tile(xVal, yVal, TileType.DirtWall2, pending, -1)
        Else
            New Tile(xVal, yVal, TileType.Floor2, pending, -1)

            If wideCorridor
                If horiz
                    New Tile(xVal, yVal + 1, TileType.Floor2, pending, -1)
                Else
                    New Tile(xVal + 1, yVal, TileType.Floor2, pending, -1)
                End If
            End If
        End If

        If Not skipWalls
            If horiz
                Local tileAbove := Level.GetTileAt(xVal, yVal - 1)
                If tileAbove Or Not tileAbove.IsFloor()
                    New Tile(xVal, yVal - 1, TileType.DirtWall2, pending, -1)
                End If

                If wideCorridor
                    yVal = yVal + 2
                Else
                    yVal = yVal + 1
                End If
            Else
                Local tileLeft := Level.GetTileAt(xVal - 1, yVal)
                If tileLeft Or Not tileLeft.IsFloor()
                    new Tile(xVal - 1, yVal, TileType.DirtWall2, pending, -1)
                End If

                If wideCorridor
                    xVal = xVal + 2
                Else
                    xVal = xVal + 1
                End If
            End If

            Local tileAt := Level.GetTileAt(xVal, yVal)
            If tileAt Or Not tileAt.IsFloor()
                New Tile(xVal, yVal, TileType.DirtWall2, pending, -1)
            End If
        End If
    End Function

    Function CarveNewCorridor: Bool(moveX: Int, moveY: Int, horiz: Bool, pending: Bool, secondaryCarve: Bool, roomType: Int, wideCorridor: Bool)
    End Function

    Function CheckLOS: Bool(x1: Int, y1: Int, x2: Int, y2: Int, includeOffscreen: Bool)
    End Function

    Function CheckMapConsistency: Void()
    End Function

    Function ClearMinibossWall: Void()
    End Function

    Function ClearTextLabelAt: Void(xVal: Int, yVal: Int)
    End Function

    Function CloseInOuterWalls: Void()
    End Function

    Function ConjureSlot: Void(slotName: String, ent: Entity)
    End Function

    Function CreateAllCharsDLCSelect: Void()
    End Function

    Function CreateAllCharsSelect: Void()
    End Function

    Function CreateBeastmaster: Void()
    End Function

    Function CreateBeastmasterZone1: Void()
    End Function

    Function CreateBeastmasterZone2: Void()
    End Function

    Function CreateBeastmasterZone3: Void()
    End Function

    Function CreateBeastmasterZone4: Void()
    End Function

    Function CreateBeastmasterZone5: Void()
    End Function

    Function CreateBossBattle: Void()
    End Function

    Function CreateBossBattle1: Void()
    End Function

    Function CreateBossBattle2: Void()
    End Function

    Function CreateBossBattle3: Void()
    End Function

    Function CreateBossBattle4: Void()
    End Function

    Function CreateBossBattle5: Void()
    End Function

    Function CreateBossBattle9: Void()
    End Function

    Function CreateBossBattleFrankensteinway: Void()
    End Function

    Function CreateBossmaster: Void()
    End Function

    Function CreateBossmasterBosses: Void()
    End Function

    Function CreateBossmasterMinibosses: Void()
    End Function

    Function CreateCharSelect: Void()
    End Function

    Function CreateDiamondDealer: Void()
    End Function

    Function CreateDungeonMaster: Void()
    End Function

    Function CreateExit: Void(exitX: Int, exitY: Int)
        Level.GetTileAt(exitX, exitY).Die()

        Local exitTile := new Tile(exitX, exitY, 9, False, -1)
        exitTile.flyaway_ = "|198|DEFEAT THE MINIBOSS!|"

        Level.exits.Set(new Point(exitX, exitY), new Point(-6, -6))
    End Function

    Function CreateExtraModesSelect: Void()
    End Function

    Function CreateFinalBossBattle: Void()
    End Function

    Function CreateFinalBossBattle2: Void()
    End Function

    Function CreateFinalBossBattle3: Void()
    End Function

    Function CreateFinalBossBattleConductor: Void()
    End Function

    Function CreateHephaestus: Void()
    End Function

    Function CreateIndestructibleBorder: Void()
    End Function

    Function CreateJanitor: Void()
    End Function

    Function CreateLobby: Void()
    End Function

    Function CreateMap: Bool(levelObj: LevelObject)
        If currentLevel = 1
            Level.previousLevelMinibosses.Clear()
            Level.previousLevelUnkilledStairLockingMinibosses.Clear()
            Level.skipNextPenaltyBox = False

            If currentDepth = 1
                SaleItem.lastSaleItemClass1 = ""
                SaleItem.lastSaleItemClass2 = ""
                Item.lastChestItemClass1 = ""
                Item.lastChestItemClass2 = ""
                Chest.lastChestColor = Chest.CHEST_COLOR_NONE
                Chest.lastChestColor2 = Chest.CHEST_COLOR_NONE
                Crate.fallenCrates = new List<Crate>()
                Crate.fallenGargoyles = new List<Gargoyle>()
                SaleItem.randomSaleItemList = new List<String>()
                Spells.spellCoolKills = new StringMap<Int>()
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
        End If

        If Level.placeArenaOnLevel = -1 And Not Util.IsCharacterActive(6)
            Local level: Int = -1
            Local depth: Int = -1

            While Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placeArenaOnLevel = level
            Level.placeArenaOnDepth = depth
            Level.arenaNum = Util.RndIntRange(0, 2, True, -1)
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
        End If

        If Level.placePawnbrokerOnLevel = -1 And Not Util.IsCharacterActive(5)
            Local level: Int = -1
            Local depth: Int = -1

            While Level.IsFreeLevelForSpecialRoom(level, depth)
                level = Util.RndIntRange(1, 3, True, -1)
                depth = Util.RndIntRange(1, 5, True, -1)
            End While

            Level.placePawnbrokerOnLevel = level
            Level.placePawnbrokerOnDepth = depth
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

        Select currentZone
            Case 5 If Not Level.CreateMapZone5(False) Then Return False
            Case 4 If Not Level.CreateMapZone4(False) Return False
            Case 3 If Not Level.CreateMapZone3() Then Return False
            Case 2 If Not Level.CreateMapZone2() Then Return False
            Default If Not Level.CreateMapZone1() Then Return False
        End Select

        If currentZone = 4
            For Local trap := EachIn Trap.trapList
                If trap.type = TrapType.TrapDoor
                    new SpikeTrap(trap.x, trap.y)
                    trap.Die()
                End If
            End For
        End If

        If Not Level.IsPassable()
            Level.CreateMap(Null)

            Return False
        End If

        If Level.pacifismModeOn Or (Level.isHardMode And Level.GetHardModeXML().GetAttribute("disableTrapdoors", False))
            For Local trap := EachIn Trap.trapList
                If trap.type = TrapType.TrapDoor
                    new SpikeTrap(trap.x, trap.y)
                    trap.Die()
                End If
            End For
        End If

        If Level.previousLevelUnkilledStairLockingMinibosses.Length > 0 And Not Level.skipNextPenaltyBox
            Level.PlacePenaltyBoxEnemies()

            Level.minibossFormerWall = new List<MinibossTileData>()

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
                Level.previousLevelMinibosses.Push(enemy.type)
            End If
        End For

        Return True
    End Function

    Function CreateMapZone1: Bool()
        ' NOTE: A check is performed in each loop to see if `limit` has been exceeded but is omitted here.
        '       If limit is reached, the current map is failed and restarts the map creation process.
        '
        '       If limit <= 0
        '           Level.CreateMap(Null)
        '           Return False
        '       End If

        Local limit := 4999
        Local room1: RoomData
        Local room2: RoomData
        Local room3: RoomData
        Local room4: RoomData
        Local room5: RoomData
        Local room6: RoomData
        Local room7: RoomData

        Level.InitNewMap(True)

        room1 = Level.PlaceFirstRoom()

        For Local i := limit To 0 Step -1
            room2 = Level.PlaceRoomZone1(-1, room1)
            If room2 Then Exit
        End For

        limit -= 1

        For Local i := limit To 0 Step -1
            room3 = Level.PlaceRoomZone1(-1, room2)
            If room3 Then Exit
        End For

        limit -= 1

        For Local i := limit To 0 Step -1
            room4 = Level.PlaceRoomZone1(-1, room3)
            If room4 Then Exit
        End For

        limit -= 1

        Local v112: Int

        ' TODO: Double check this section
        While Util.RndIntRange(0, 50, True, -1)
            room5 = Level.PlaceRoomZone1(-1, room4)
            If room5
                v112 = 4

                Exit
            End If
        End While

        ' TODO: Double check this section
        If Not room5
            If Util.RndBool(True)
                room5 = Level.PlaceRoomZone1(-1, room3)
            Else
                room5 = Level.PlaceRoomZone1(-1, room1)
            End If
        End If

        limit -= 1

        For Local i := limit To 0 Step -1
            If Util.RndIntRange(0, 50, True, -1)
                room6 = Level.PlaceRoomZone1(-1, room1)
            Else If Util.RndIntRange(0, 10, True, -1)
                room6 = Level.PlaceRoomZone1(-1, room4)

                If room6 And v112 = 3
                    v112 = 5
                End If
            Else
                room6 = Level.PlaceRoomZone1(-1, room5)

                If room6 And v112 = 4
                    v112 = 5
                End If
            End If

            If room6 Then Exit
        End For

        If Shrine.spaceShrineActive
            limit -= 1

            For Local i = limit To 0 Step -1
                If Util.RndBool(True)
                    If Util.RndBool(True)
                        room7 = Level.PlaceRoomZone1(-1, room1)
                    Else
                        room7 = Level.PlaceRoomZone1(-1, room3)
                    End If
                Else
                    If Util.RndBool(True)
                        room7 = Level.PlaceRoomZone1(-1, room2)
                    Else
                        room7 = Level.PlaceRoomZone1(-1, room4)

                        If room7 And v112 = 3
                            v112 = 6
                        End If
                    End If
                End If

                If room7 Then Exit
            End For
        End If

        ' TODO: limit check here?

        Local lastRoom: RoomData = room4
        Select v112
            Case 4 lastRoom = room5
            Case 5 lastRoom = room6
            Case 6 lastRoom = room7
        End Select
        lastRoom.field_24 = True

        If Level.PlaceExit(lastRoom)
            ' TODO: Place NPCs
            Local v25: Bool = False
            Select controller_game.currentLevel
                Case 1
                    If Not GameData.GetNPCUnlock("beastmaster")
                        v25 = Not Level.isLevelEditor
                    End If
                Case 2
                    If Not GameData.GetNPCUnlock("merlin")
                        v25 = Not Level.isLevelEditor
                    End If
                Case 3
                    If Not GameData.GetNPCUnlock("bossmaster")
                        v25 = Not Level.isLevelEditor
                    End If
            End Select

            If Not Level.isHardcoreMode And Not Level.isDDRMode And v25
                ' TODO: Verify limit check here
                For Local i := limit To 0 Step -1
                    Local x := room3.x + Util.RndIntRange(0, room3.width - 1, False, -1)
                    Local y := room3.y + Util.RndIntRange(0, room3.height - 1, False, -1)

                    Local tile := Level.GetTileAt(x, y)
                    If tile
                        If Not tile.GetType() And Not Level.IsCorridorFloorOrDoorAdjacent(x, y)
                            tile = GetTileAt(x, y + 1)
                            If tile And Not tile.IsWall(False, False, False, False) Then Exit
                        End If
                    End If
                End For
            End If

            ' TODO: Place shop

            ' TODO: Fill out walls surrounding all

            Level.PadWalls()
            Level.ProcessSpecialRoom()
            Level.CreateIndestructibleBorder()

            If Level.isHardcoreMode
                Level.chestsStillToPlace = 1
            Else
                Level.chestsStillToPlace = Util.RndIntRange(1, 2, True, -1)
            End If

            Level.PlaceSecretRooms(-1) ' Decompiler showing wrong value for t_numRooms

            Local secretRoomsFilled: Bool
            Select currentZone
                Case 4
                    secretRoomsFilled = Level.FillSecretRoomsZone4()
                Case 2
                    secretRoomsFilled = Level.FillSecretRoomsZone2()
                Default
                    secretRoomsFilled = Level.FillSecretRoomsZone1()
            End Select

            If secretRoomsFilled
                ' TODO: chestsStillToPlace related

                Level.AddStone()
                Level.PlaceTraps()
                Level.PlaceEnemies()

                ' TODO: Double check this section
                For Local i := 0 Until 500
                    Local numTraps := Trap.trapList.Count()
                    If numTraps > 0
                        Local trapIndex := Util.RndIntRange(0, numTraps - 1, True, -1)
                        Local traps := Trap.trapList.ToArray()
                        Local trap := traps[trapIndex]
                        If trap
                            If trap.field_103 And trap.type = TrapType.BounceTrap
                                If Util.RndBool(True)
                                    New SpeedUpTrap(trap.x, trap.y)
                                Else
                                    New SlowDownTrap(trap.x, trap.y)
                                End If

                                Exit
                            End If
                        End If
                    End If
                End For

                ' TODO: Place torches

                Level.PlaceCrateOrBarrel()
                Level.PlaceChests(currentLevel = 1)
                Level.PlaceResourceWall()
                Level.PlaceLockedChests()
                Level.PlaceShrine()
                Tile.CleanUpPendingTiles()
                Level.PlaceNocturnaArea()

                Return True
            End If
        End If

        Level.CreateMap(Null)

        Return False
    End Function

    Function CreateMapZone2: Bool()
    End Function

    Function CreateMapZone3: Bool()
    End Function

    Function CreateMapZone4: Bool(recursive: Bool)
    End Function

    Function CreateMapZone5: Bool(recursive: Bool)
    End Function

    Function CreateMerlin: Void()
    End Function

    Function CreateRoom: Bool(xVal: Int, yVal: Int, wVal: Int, hVal: Int, pending: Bool, roomType: Int, originX: Int, originY: Int, originX2: Int, originY2: Int, wideCorridor: Bool, wallType: Int, allowWallOverlap: Bool, allowWaterTarOoze: Bool)
        Local exceedsConstraints: Bool = True
        
        If currentZone = 1 Or currentZone = 2 Or currentZone = 3
            If xVal < Level.levelConstraintX Then exceedsConstraints = False
            If yVal < Level.levelConstraintY Then exceedsConstraints = False
            If xVal + wVal > Level.levelConstraintX + Level.levelConstraintW Then exceedsConstraints = False
            If hVal + yVal > Level.levelConstraintY + Level.levelConstraintH Then exceedsConstraints = False

            If Not exceedsConstraints And currentLevel <> 0
                If ++Level.levelConstraintNum > 100
                    Level.levelConstraintW += 2
                    Level.levelConstraintH += 2
                    Level.levelConstraintNum = 0
                    Level.levelConstraintX -= 1
                    Level.levelConstraintY -= 1
                End If
                Return False
            End If
        End If

        Local v21: Float = 0.0
        Select currentLevel
            Case 2
                v21 = 0.1
            Case 3
                v21 = 0.13
            Case 4
                v21 = 0.16
            Default
                If currentLevel >= 5
                    v21 = currentLevel * 0.04
                    If v21 > 0.4
                        v21 = 0.4
                    End If
                End If
        End Select

        Local seed: Int
        If Util.storedSeed = -1
            seed = Seed
        Else
            Util.storedSeed = -1
        End If
        
    End Function

    Function CreateRoomZone5: Void(rm: RoomWithDoor, roomType: Int)
    End Function

    Function CreateSwarmMap: Void()
        Level.InitNewMap(True)
        Level.levelConstraintX = -1000
        Level.levelConstraintY = -1000
        Level.levelConstraintW = 2000
        Level.levelConstraintH = 2000
        Level.levelConstraintNum = 0

        Level.CreateRoom(-9, -5, 18, 10, False, 4, -1, -1, -1, -1, False, 100, False, True)
        new SwarmSarcophagus(-7, -3)
        new SwarmSarcophagus(-7, -1)
        new SwarmSarcophagus(-7, 1)
        new SwarmSarcophagus(-7, 3)
        new SwarmSarcophagus(7, -3)
        new SwarmSarcophagus(7, -1)
        new SwarmSarcophagus(7, 1)
        new SwarmSarcophagus(7, 3)

        Level.CreateIndestructibleBorder()
    End Function

    Function CreateTestMap: Void()
    End Function

    Function CreateTrainer: Void()
    End Function

    Function CreateTrainingMap: Void()
    End Function

    Function CreateTutorialMap: Void()
    End Function

    Function CreateWeaponmaster: Void()
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

        For Local i := 0 To numPlayers
            Local player := players[i]
            If player.characterID <> 1
                If player.HasItemOfType("weapon_golden_lute", False)
                    player.AddItemOfType("weapon_dagger", Null, True, True)
                End If
            End If

            If player.field_110
                player.AddItemOfType("weapon_dagger", Null, True, True)
            End If
        End For

        RenderableObject.DeleteAll(True)
        ParticleSystem.systems.Clear()

        For Local i := 0 To numPlayers
            Local player := players[i]
            player.field_58 = Null
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
    End Function

    Function DoQuickRestart: Void(continuedRun: Bool, showPopups: Bool, playIntroCutscene: Bool)
    End Function

    Function DoRestart: Void()
    End Function

    Function DoRestart: Void(continuedRun: Bool, cancelFade: Bool)
    End Function

    Function DoWePlaceAdditionalChestThisLevel: Bool()
    End Function

    Function DryUpAllWater: Void(replacementFloor: Int)
    End Function

    Function DumpMap: Void()
    End Function

    Function Earthquake: Void(xVal: Int, yVal: Int)
    End Function

    Function EnsureBossTraining: Void(name: String)
    End Function

    Function FillSecretRooms: Bool()
    End Function

    Function FillSecretRoomsZone1: Bool()
    End Function

    Function FillSecretRoomsZone2: Bool()
    End Function

    Function FillSecretRoomsZone4: Bool()
    End Function

    Function FillTiles: Void(rect: Rect, tileType: Int, tileTypeEdge: Int)
    End Function

    Function FillVault: Void(tmpRoom: RoomData)
    End Function

    Function FindTileOfType: Tile(tileType: Int, ignoreCrackedWalls: Bool)
    End Function

    Function FreezeTilesNear: Void(xVal: Int, yVal: Int, allTiles: Bool)
    End Function

    Function GenerateHardcoreZoneOrder: Void()
    End Function

    Function GenerateJanitorItems: Void()
    End Function

    Function GetAdjustedZoneForAllChars: Int()
    End Function

    Function GetAdjustedZoneForAllCharsDLC: Int()
    End Function

    Function GetAdjustedZoneForStoryMode: Int()
    End Function

    Function GetDistanceToNearestTorch: Float(r: RenderableObject)
    End Function

    Function GetExitValue: Point(xVal: Int, yVal: Int)
        For Local node := EachIn Level.exits
            Local ex := node.Key
            If ex.x = xVal And ex.y = yVal
                Return node.Value
            End If
        End For

        Return New Point(-4, -4)
    End Function

    Function GetExtraEnemiesBase: Int()
    End Function

    Function GetHardModeExtraEnemies: Int()
    End Function

    Function GetHardModeXML: XMLNode()
    End Function

    Function GetInitialZone: Int()
    End Function

    Function GetMapTileLightValue: Float(xVal: Int, yVal: Int, forVision: Bool)
    End Function

    Function GetNPCSaleItem: Int(npcNum: Int, slotNum: Int, exclude1: String, exclude2: String)
    End Function

    Function GetRandomOffsetPoint: Point()
    End Function

    Function GetRandomWallInRoom: Object(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
    End Function

    Function GetRandPointInRoomOfTileType: Point(room: RoomBase, tileType: Int, skipCollisions: Bool)
    End Function

    Function GetRandPointInRoomOfTileType: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, tileType: Int, skipCollisions: Bool)
    End Function

    Function GetRandPointInRoomWithOptions: Point(room: RoomBase, skipCollisions: Bool, skipExit: Bool, skipTraps: Bool, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
    End Function

    Function GetRandPointInRoomWithOptions: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, skipCollisions: Bool, skipExit: Bool, skipTraps: Bool, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
    End Function

    Function GetShrinePoint: Point()
    End Function

    Function GetSingleZoneModeFinalBossZone: Int()
    End Function

    Function GetStandardExitCoords: Object()
    End Function

    Function GetTileAt: Tile(xVal: Int, yVal: Int)
        If Level.tiles.Contains(xVal)
            Local tilesOnX := Level.tiles.Get(xVal)
            If tilesOnX.Contains(yVal)
                Return tilesOnX.Get(yVal)
            End If
        End If
    End Function

    Function GetTileFlyawayAt: Int(xVal: Int, yVal: Int)
    End Function

    Function GetTileObstructionList: Object(includeOffscreen: Bool)
    End Function

    Function GetTileTypeAt: Int(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)
        If tile <> Null
            Return tile.GetType()
        End If

        Return -1
    End Function

    Function HaveFinalBoss: Bool()
    End Function

    Function InitNewMap: Void(saveGameData: Bool)
        For Local player := EachIn players
            player.ResetStateAfterLevel()
        End For

        Level.DeleteMap()
        Level.isAnyTar = False
        Level.isConductorLevel = False
        Level.levelJustStarted = True
    End Function

    Function IsAnyPlayerWithinShop: Bool()
    End Function

    Function IsAnyWallAt: Bool(r: Rect)
    End Function

    Function IsAnyWaterAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsBossLevel: Bool()
    End Function

    Function IsCorridorFloorAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsCorridorFloorOrDoorAdjacent: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsCrackedWallAdjacent: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsCrackedWallAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsDoorAdjacent: Bool(x: Int, y: Int)
    End Function

    Function IsDoorAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsExitAt: Bool(x: Int, y: Int)
    End Function

    Function IsFinalBoss: Bool()
    End Function

    Function IsFinalBossZone: Bool()
    End Function

    Function IsFloorAt: Bool(xVal: Int, yVal: Int)
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

    Function IsIcePartOfLevel: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsLockedExit: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsNormalFloorAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsPassable: Bool()
        Local points := New List<Point>()

    End Function

    Function IsPeaceful: Bool()
    End Function

    Function IsSecretRoom: Bool(rmType: Int)
    End Function

    Function IsSeededMode: Bool(mode: Int)
    End Function

    Function IsSurroundedByDestructibleWalls: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsTileTypeAdjacent: Bool(xVal: Int, yVal: Int, tempType: Int)
    End Function

    Function IsTrapAdjacent: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsTrapOrExitAbove: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsVisibleTileAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsWallAdjacent: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsWallAdjacent8: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsWallAt: Bool(xVal: Int, yVal: Int, destructibleOnly: Bool, torchlessOnly: Bool)
    End Function

    Function IsWaterOrTarAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function IsWireLikeAt: Bool(x: Int, y: Int)
    End Function

    Function IsZone5RoomLegal: Bool(loc: Rect)
    End Function

    Function JanitorReset: Void()
    End Function

    Function LoadLevelSong: Void(levelObj: LevelObject)
    End Function

    Function MakeAllWallsUnbreakable: Void()
    End Function

    Function MakeHelper: Void()
    End Function

    Function MakeInvisibleChestAt: Void(tmpX: Int, tmpY: Int)
    End Function

    Function MarkAllTilesAsSeen: Void()
    End Function

    Function MaybeForbidTrapdoor: Bool()
    End Function

    Function NewLevel: Void(level: Int, zone: Int, playerID: Int, inEditor: Bool, levelObj: LevelObject, continuedRun: Bool)
    End Function

    Function PadWalls: Void()
    End Function

    Function PaintTriggerInterior: Void(x: Int, y: Int, w: Int, h: Int, trigger: Int)
    End Function

    Function PawnSlot: Void(slotName: String, ent: Entity)
    End Function

    Function PlaceAdditionalChestAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function PlaceAppropriateMinibosses: Void(room: RoomBase)
    End Function

    Function PlaceChests: Void(freeBroadSword: Bool)
    End Function

    Function PlaceConnectedWireDoor: Void(p: Point)
    End Function

    Function PlaceCrateOrBarrel: Void()
    End Function

    Function PlaceEnemies: Void()
    End Function

    Function PlaceEnemiesZone1: Void()
    End Function

    Function PlaceEnemiesZone2: Void()
    End Function

    Function PlaceEnemiesZone3: Void()
    End Function

    Function PlaceEnemiesZone4: Void()
    End Function

    Function PlaceEnemiesZone5: Void()
    End Function

    Function PlaceExit: Bool(rdExit: RoomData)
        For Local i := 0 To 500
            Local x := rdExit.x + Util.RndIntRange(0, rdExit.width - 1, True, -1)
            Local y := rdExit.y + Util.RndIntRange(0, rdExit.height - 1, True, -1)
            Local tile := Level.GetTileAt(x, y)
            If tile <> Null
                If Not tile.GetType() And Not Level.IsCorridorFloorOrDoorAdjacent(x, y)
                    Local tileBelow := Level.GetTileAt(x, y + 1)
                    If tileBelow <> Null
                        If Not tileBelow.IsWall(False, False, False, False)
                            Level.CreateExit(x, y)

                            Return True
                        End If
                    End If
                End If
            End If
        End For

        Level.CreateMap(Null)

        Return False
    End Function

    Function PlaceFirstRoom: RoomData()
        Const xVal := -3
        Const yVal := -3
        Const width := 6
        Const height := 6
        Const type := 4

        Level.CreateRoom(xVal, yVal, width, height, False, type, -1, -1, -1, -1, False, 100, False, True)

        Local roomData := new RoomData(xVal, yVal, width, height, type, False)
        Level.firstRoom = roomData

        Return roomData
    End Function

    Function PlaceGargoyle: Object(xVal: Int, yVal: Int, l: Int)
    End Function

    Function PlaceHotCoalTileAt: Void(xVal: Int, yVal: Int)
    End Function

    Function PlaceIceTileAt: Void(xVal: Int, yVal: Int)
    End Function

    Function PlaceLockedChests: Void()
    End Function

    Function PlaceMinibossOfShapeAt: Object(newMiniboss: Int, xVal: Int, yVal: Int)
    End Function

    Function PlaceNocturnaArea: Void()
    End Function

    Function PlacePenaltyBoxEnemies: Void()
    End Function

    Function PlaceRandomEnemyForTempo: Void(xVal: Int, yVal: Int)
    End Function

    Function PlaceRareEnemies: Void(room: RoomBase, hasExit: Bool)
    End Function

    Function PlaceResourceWall: Void()
    End Function

    Function PlaceRoomZone1: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Level.pendingTiles.Clear()

        While Tile.pendingTilesList.Count() > 0
            Tile.pendingTilesList.RemoveFirst().Die()
        End While

        ' TODO: horiz part

        Local point := New Point() ' This doesn't get used. Decompilation issue?
        ' TODO: This section

        Local tile: Tile

        tile = Level.GetTileAt(0, 0)
        If tile
        
        End If
    End Function

    Function PlaceRoomZone2: RoomData(roomType: Int, roomToAttachTo: RoomData)
    End Function

    Function PlaceRoomZone3: RoomData(roomType: Int, roomToAttachTo: RoomData)
    End Function

    Function PlaceRoomZone4: RoomData(roomType: Int)
    End Function

    Function PlaceRoomZone5: RoomData(pseg: PortalSeg, width: Int, height: Int, minEntryDist: Int)
    End Function

    Function PlaceRoomZone5: RoomData(portalSegs: StackEx<PortalSeg>, width: Int, height: Int, minEntryDist: Int, roomType: Int)
    End Function

    Function PlaceSecondarySpecialShop: Void(useBloodCost: Bool, isFoodShop: Bool)
    End Function

    Function PlaceSecretRooms: Void(numRooms: Int)
    End Function

    Function PlaceShopItemsAt: Void(tmpX: Int, tmpY: Int, door: Rect)
    End Function

    Function PlaceShopkeeperGhostIfNeededAt: Void(xVal: Int, yVal: Int)
    End Function

    Function PlaceShrine: Void()
    End Function

    Function PlaceTileRemovingExistingTiles: Tile(xVal: Int, yVal: Int, tileType: Int, pending: Bool, tilesetOverride: Int, fromEarthSpell: Bool)
    End Function

    Function PlaceTileTypeAt: Void(xVal: Int, yVal: Int, tileType: Int)
    End Function

    Function PlaceTorchesAnywhere: Void()
    End Function

    Function PlaceTrapInRoom: Object(xVal: Int, yVal: Int, wVal: Int, hVal: Int, trapType: Int, bounceDir: Int, twoAwayTrap: Trap)
    End Function

    Function PlaceTraps: Void()
    End Function

    Function PlaceTrapsZone1: Void()
    End Function

    Function PlaceTrapsZone2: Void()
    End Function

    Function PlaceTrapsZone3: Void()
    End Function

    Function PlaceTrapsZone4: Void()
    End Function

    Function PlaceTrapsZone5: Void()
    End Function

    Function PlaceTrapZone3: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
    End Function

    Function PlaceTrapZone4: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
    End Function

    Function PlaceTrapZone5: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
    End Function

    Function PlaceWire: Bool(src: Point, dst: Point)
    End Function

    Function PlaceZone3Beetle: Object(xVal: Int, yVal: Int)
    End Function

    Function PlaceZone3Cauldron: Object(xVal: Int, yVal: Int)
    End Function

    Function PlaceZone3Elemental: Object(xVal: Int, yVal: Int)
    End Function

    Function PlaceZone3Slime: Object(xVal: Int, yVal: Int)
    End Function

    Function PlaceZone3YetiHellhound: Object(xVal: Int, yVal: Int)
    End Function

    Function PlaceZoneAppropriateNumberOfDiamondsAt: Void(xVal: Int, yVal: Int)
    End Function

    Function ProcessSpecialRoom: Void()
    End Function

    Function PutBeastmasterStairs: Void(x: Int, y: Int, stairName: String, enemyName: String, enemyType: Int, enemyId: Int, stairNamePrefix: String)
    End Function

    Function PutBossStair: Void(x: Int, y: Int, bossName: String, enemyType: Int, zone: Int, label: String, labelXOff: Int)
    End Function

    Function PutCrateOrBarrel: Void(x: Int, y: Int)
    End Function

    Function PutEnemyZone5: Void(x: Int, y: Int)
    End Function

    Function PutFutureStair: Void(x: Int, y: Int)
    End Function

    Function PutMinibossStair: Void(x: Int, y: Int, minibossName: String, enemyType: Int, label: String, labelXOff: Int)
    End Function

    Function PutRoomEnemiesZone5: Void(room: RoomBase, hasExit: Bool)
    End Function

    Function PutVariedEnemiesZone5: Void(pts: StackEx<Point>)
    End Function

    Function QueryHarderBosses: Bool()
    End Function

    Function RandomFood: Int()
    End Function

    Function RandomWalkOfTempTiles: Void(xVal: Int, yVal: Int, distCounter: Int)
    End Function

    Function RecalcLevelBoundaries: Void()
    End Function

    Function RefreshLineOfSightTiles: Void()
    End Function

    Function RemoveExit: Void(xVal: Int, yVal: Int)
    End Function

    Function RemoveSomeWallsAwayFromCorridors: Void(percentToRemove: Float, includeCorridors: Bool, maxHealth: Int)
    End Function

    Function RemoveTileAt: Void(xVal: Int, yVal: Int)
    End Function

    Function RenderAll: Void()
    End Function

    Function RenderExitArrow: Void()
    End Function

    Function ResetCosts: Void()
    End Function

    Function ResetSpecialRoomVariables: Void()
    End Function

    Function SetMagicBarrier: Void(on: Bool)
    End Function

    Function ShopkeeperMissing: Bool()
    End Function

    Function ShowModPopup: Void(imageName: String)
    End Function

    Function SplashWater: Void(xVal: Int, yVal: Int, destroyWater: Bool)
    End Function

    Function StartReplayPlayback: Void()
    End Function

    Function TakeActionAfterAllCharsScoreSubmit: Void()
    End Function

    Function TransmogrifySlot: Void(slotName: String, ent: Entity)
    End Function

    Function TransmogrifyWeaponToType: Void(ent: Entity, type: Int)
    End Function

    Function TrySpawnBossMinibossAt: Void(x: Int, y: Int, etype: Int)
    End Function

    Function UnlockChar: Void(characterID: Int)
    End Function

    Function Update: Void()
    End Function

    Function WantPenaltyBox: Bool()
    End Function

    Function WidenCorridors: Void()
    End Function

    Function _EditorFix() End

    Method NoTrim()
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
        IsCrackedWallAdjacent(0, 0)
        IsCrackedWallAt(0, 0)
        IsDoorAdjacent(0, 0)
        IsDoorAt(0, 0)
        IsExitAt(0, 0)
        IsFinalBoss()
        IsFinalBossZone()
        IsFloorAt(0, 0)
        IsFreeLevelForSpecialRoom(0, 0)
        IsIcePartOfLevel(0, 0)
        IsLockedExit(0, 0)
        IsNormalFloorAt(0, 0)
        IsPassable()
        IsPeaceful()
        IsSecretRoom(0)
        IsSeededMode(0)
        IsSurroundedByDestructibleWalls(0, 0)
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
    Field field_1C: Int

End Class
