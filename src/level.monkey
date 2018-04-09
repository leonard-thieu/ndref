Strict

Import monkey.map
Import monkey.math
Import monkey.random
Import monkey.set
Import beastmaster
Import bossmaster
Import chest
Import controller_game
Import crate
Import entity
Import exitmap
import gamedata
Import intpointlist
Import intpointset
Import level_object
Import merlin
Import npc
Import particles
Import player_class
Import portal_seg
Import rect
Import renderable_object
Import rng
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
Import tiledata
Import trap
Import util
Import xml

Class Level

    Global addKeyInSecretChest: Bool
    Global allCharsCompletion: Bool[] = []
    Global allCharsCompletionDLC: Bool[] = []
    Global arenaNum: Int = -1
    Global bossNumber: Int = 1
    Global carveX: Int
    Global carveY: Int
    Global charactersJustUnlocked: List<Int> = New List<Int>()
    Global chestsStillToPlace: Int
    Global conjurer: Object
    Global constMapLightValues: Float[]
    Global continuedRunCoinScore: Int
    Global creatingMap: Int
    Global currentFloorRNG: RNG
    Global dailyChallengeX: Int
    Global dailyChallengeY: Int
    Global deathlessWinCount: Int
    Global debugForceMonstrousShop: Int
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
    Global isRunNoItemsNoShrines: Bool = True
    Global isSeededMode: Bool
    Global isSoulMode: Bool
    Global isStoryMode: Bool
    Global isSwarmMode: Bool
    Global isTrainingMode: Bool
    Global justUnlocked: Int
    Global lastCreatedRoomType: Int = -1
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
    Global minibossFormerWall: List<MinibossTileData> = New List<MinibossTileData>()
    Global minimap: Int
    Global minLevelMinimapX: Int
    Global minLevelMinimapY: Int
    Global minLevelX: Int
    Global minLevelY: Int
    Global nonDeterministicMSStart: Int = -1
    Global outsideBossChamber: Int
    Global pacifismModeOn: Int
    Global pawnbroker: Object
    Global pendingTiles: IntMap<IntMap<Tile>> = New IntMap<IntMap<Tile>>
    Global placeArenaOnDepth: Int = -1
    Global placeArenaOnLevel: Int = -1
    Global placeBloodShopOnDepth: Int = -1
    Global placeBloodShopOnLevel: Int = -1
    Global placeConjurerOnDepth: Int = -1
    Global placeConjurerOnLevel: Int = -1
    Global placedAdditionalBlackChest: Int
    Global placedAdditionalRedChest: Int
    Global placedAdditionalWhiteChest: Int
    Global placedArena: Int
    Global placedUrnThisRun: Int
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
    Global playedVictoryCutscene: Int
    Global popUpController: Int
    Global popUpType: Int = -1
    Global practiceEnemyNum: Int = -1
    Global previousLevelMinibosses: StackEx<Int> = New StackEx<Int>()
    Global previousLevelUnkilledStairLockingMinibosses: StackEx<Int> = New StackEx<Int>()
    Global quickRestart: Int
    Global randSeed: Int = -1
    Global randSeedString: String
    Global replay: Int
    Global rooms: List<RoomData> = New List<RoomData>()
    Global secretAtX: Int
    Global secretAtY: Int
    Global secretRockRoomPlaced: Int
    Global shopH: Int
    Global shopkeeperDead: Int
    Global shopkeeperFell: Bool
    Global shopkeeperGhostDepth: Int = -1
    Global shopkeeperGhostLevel: Int = -1
    Global shopW: Int
    Global shopX: Int
    Global shopY: Int
    Global shriner: Object
    Global skipNextPenaltyBox: Bool
    Global specialRoomEntranceX: Int
    Global specialRoomEntranceY: Int
    Global startedShrinerFight: Bool
    Global tempTileWalk: List<Point> = New List<Point>()
    Global tileObstructionList: IntPointList  = New IntPointList()
    Global tiles: IntMap<IntMap<Tile>> = New IntMap<IntMap<Tile>>
    Global todaysRandSeedString: String
    Global transmogrifier: Object
    Global triggerList: List<Int> = New List<Int>()
    Global usedBosses: IntSet = New IntSet()
    Global usedCustomMusic: Int
    Global wasMinibossLockedInBattle: Bool
    Global wholeRunRNG: RNG
    Global zone3DividingLineX: Float
    Global zone3DividingLineY: Float
    Global zoneOrder: Int

    Function ActivateTrigger: Int(triggerNum: Int, ent: Entity, target: RenderableObject)
        Throw New Throwable()
    End Function

    Function ActuallyGetMapTileLightValue: Float(xVal: Int, yVal: Int, forVision: Bool)
        Throw New Throwable()
    End Function

    Function AddCrackedWall: Void(roomType: Int)
        Throw New Throwable()
    End Function

    Function AddExit: Void(xVal: Int, yVal: Int, levelPointer: Int, zonePointer: Int)
        Local location := New Point(xVal, yVal)
        Local floor := New Point(levelPointer, zonePointer)
        Level.exits.Set(location, floor)
    End Function

    Function AddHarderStone: Void()
        Throw New Throwable()
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
        Throw New Throwable()
    End Function

    Function AddSpecialRoom: Void(roomType: Int, addCrack: Bool)
        Throw New Throwable()
    End Function

    Function AddStone: Void()
        Throw New Throwable()
    End Function

    Function AdvanceLevel: Void()
        Throw New Throwable()
    End Function

    Function AllowSpirit: Bool()
        Throw New Throwable()
    End Function

    Function BossMaybeMinibossesAt: Void(x1: Int, y1: Int, x2: Int, y2: Int)
        Throw New Throwable()
    End Function

    Function BreakIce: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
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
                If Not tileAbove Or Not tileAbove.IsFloor()
                    New Tile(xVal, yVal - 1, TileType.DirtWall2, pending, -1)
                End If

                If wideCorridor
                    yVal = yVal + 2
                Else
                    yVal = yVal + 1
                End If
            Else
                Local tileLeft := Level.GetTileAt(xVal - 1, yVal)
                If Not tileLeft Or Not tileLeft.IsFloor()
                    new Tile(xVal - 1, yVal, TileType.DirtWall2, pending, -1)
                End If

                If wideCorridor
                    xVal = xVal + 2
                Else
                    xVal = xVal + 1
                End If
            End If

            Local tileAt := Level.GetTileAt(xVal, yVal)
            If Not tileAt Or Not tileAt.IsFloor()
                New Tile(xVal, yVal, TileType.DirtWall2, pending, -1)
            End If
        End If
    End Function

    Function CarveNewCorridor: Bool(moveX: Int, moveY: Int, horiz: Bool, pending: Bool, secondaryCarve: Bool, roomType: Int, wideCorridor: Bool)
        Local doSecondaryCarve := True
        Local i := 0
        Local iMax := True

        If (roomType = 5) Or (roomType = 7)
            iMax = False
        End If

        While True
            Local tileAt := Level.GetTileAt(Level.carveX, Level.carveY)
            If tileAt And tileAt.GetType() And Not doSecondaryCarve
                Return False
            End If

            If wideCorridor
                If horiz
                    Local tileBelow := Level.GetTileAt(Level.carveX, Level.carveY + 1)
                    If tileBelow And tileBelow.GetType() And Not doSecondaryCarve
                        Return False
                    End If
                Else
                    Local tileRight := Level.GetTileAt(Level.carveX + 1, Level.carveY)
                    If tileRight And tileRight.GetType() And Not doSecondaryCarve
                        Return False
                    End If
                End If
            End If

            Level.CarveCorridorTile(Level.carveX, Level.carveY, horiz, True, secondaryCarve, roomType, wideCorridor)

            If Not secondaryCarve Then doSecondaryCarve = False

            i += 1

            Level.carveX += moveX
            Level.carveY += moveY

            If i > iMax Then Exit

            secondaryCarve = False
        End While

        Return True
    End Function

    Function CheckLOS: Bool(x1: Int, y1: Int, x2: Int, y2: Int, includeOffscreen: Bool)
        Throw New Throwable()
    End Function

    Function CheckMapConsistency: Void()
        Throw New Throwable()
    End Function

    Function ClearMinibossWall: Void()
        Throw New Throwable()
    End Function

    Function ClearTextLabelAt: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function CloseInOuterWalls: Void()
        Throw New Throwable()
    End Function

    Function ConjureSlot: Void(slotName: String, ent: Entity)
        Throw New Throwable()
    End Function

    Function CreateAllCharsDLCSelect: Void()
        Throw New Throwable()
    End Function

    Function CreateAllCharsSelect: Void()
        Throw New Throwable()
    End Function

    Function CreateBeastmaster: Void()
        Throw New Throwable()
    End Function

    Function CreateBeastmasterZone1: Void()
        Throw New Throwable()
    End Function

    Function CreateBeastmasterZone2: Void()
        Throw New Throwable()
    End Function

    Function CreateBeastmasterZone3: Void()
        Throw New Throwable()
    End Function

    Function CreateBeastmasterZone4: Void()
        Throw New Throwable()
    End Function

    Function CreateBeastmasterZone5: Void()
        Throw New Throwable()
    End Function

    Function CreateBossBattle: Void()
        Throw New Throwable()
    End Function

    Function CreateBossBattle1: Void()
        Throw New Throwable()
    End Function

    Function CreateBossBattle2: Void()
        Throw New Throwable()
    End Function

    Function CreateBossBattle3: Void()
        Throw New Throwable()
    End Function

    Function CreateBossBattle4: Void()
        Throw New Throwable()
    End Function

    Function CreateBossBattle5: Void()
        Throw New Throwable()
    End Function

    Function CreateBossBattle9: Void()
        Throw New Throwable()
    End Function

    Function CreateBossBattleFrankensteinway: Void()
        Throw New Throwable()
    End Function

    Function CreateBossmaster: Void()
        Throw New Throwable()
    End Function

    Function CreateBossmasterBosses: Void()
        Throw New Throwable()
    End Function

    Function CreateBossmasterMinibosses: Void()
        Throw New Throwable()
    End Function

    Function CreateCharSelect: Void()
        Throw New Throwable()
    End Function

    Function CreateDiamondDealer: Void()
        Throw New Throwable()
    End Function

    Function CreateDungeonMaster: Void()
        Throw New Throwable()
    End Function

    Function CreateExit: Void(exitX: Int, exitY: Int)
        Level.GetTileAt(exitX, exitY).Die()

        Local exitTile := new Tile(exitX, exitY, 9, False, -1)
        exitTile.flyaway_ = "|198|DEFEAT THE MINIBOSS!|"

        Level.exits.Set(new Point(exitX, exitY), new Point(-6, -6))
    End Function

    Function CreateExtraModesSelect: Void()
        Throw New Throwable()
    End Function

    Function CreateFinalBossBattle: Void()
        Throw New Throwable()
    End Function

    Function CreateFinalBossBattle2: Void()
        Throw New Throwable()
    End Function

    Function CreateFinalBossBattle3: Void()
        Throw New Throwable()
    End Function

    Function CreateFinalBossBattleConductor: Void()
        Throw New Throwable()
    End Function

    Function CreateHephaestus: Void()
        Throw New Throwable()
    End Function

    Function CreateIndestructibleBorder: Void()
        'Throw New Throwable()
        ' TODO: Skipping this for testing purposes.
    End Function

    Function CreateJanitor: Void()
        Throw New Throwable()
    End Function

    Function CreateLobby: Void()
        Throw New Throwable()
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

        If Level.placePawnbrokerOnLevel = -1 And Not Util.IsCharacterActive(Character.Monk)
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

        For Local i := limit Until 0 Step -1
            room2 = Level.PlaceRoomZone1(-1, room1)
            If room2 Then Exit
        End For

        limit -= 1

        For Local i := limit Until 0 Step -1
            room3 = Level.PlaceRoomZone1(-1, room2)
            If room3 Then Exit
        End For

        limit -= 1

        For Local i := limit Until 0 Step -1
            room4 = Level.PlaceRoomZone1(-1, room3)
            If room4 Then Exit
        End For

        limit -= 1

        Local v112: Int

        ' TODO: Double check this section
        While Util.RndIntRangeFromZero(50, True)
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

        For Local i := limit Until 0 Step -1
            If Util.RndIntRangeFromZero(50, True)
                room6 = Level.PlaceRoomZone1(-1, room1)
            Else If Util.RndIntRangeFromZero(10, True)
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

            For Local i := limit Until 0 Step -1
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
                For Local i := limit Until 0 Step -1
                    Local x := room3.x + Util.RndIntRangeFromZero(room3.width - 1, False)
                    Local y := room3.y + Util.RndIntRangeFromZero(room3.height - 1, False)

                    Local tile := Level.GetTileAt(x, y)
                    If tile
                        If Not tile.GetType() And Not Level.IsCorridorFloorOrDoorAdjacent(x, y)
                            tile = GetTileAt(x, y + 1)
                            If tile And Not tile.IsWall(False, False, False, False) Then Exit
                        End If
                    End If
                End For

                Local npc: NPC
                Select controller_game.currentLevel
                    Case 1
                        npc = New Beastmaster()
                        npc.Init(0, 0, 0, "", "", 0, 0) ' TODO: Determine args
                    Case 2
                        npc = New Merlin()
                        npc.Init(0, 0, 0, "", "", 0, 0) ' TODO: Determine args
                    Case 3
                        npc = New Bossmaster()
                        npc.Init(0, 0, 0, "", "", 0, 0) ' TODO: Determine args
                End Select
            End If

            ' TODO: Place shop

            ' TODO: Fill out walls surrounding all

            Level.PadWalls()
            Level.ProcessSpecialRoom()

            If Not Level.isLevelEditor Then Level.CreateIndestructibleBorder()

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
                        Local trapIndex := Util.RndIntRangeFromZero(numTraps - 1, True)
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
        Throw New Throwable()
    End Function

    Function CreateMapZone3: Bool()
        Throw New Throwable()
    End Function

    Function CreateMapZone4: Bool(recursive: Bool)
        Throw New Throwable()
    End Function

    Function CreateMapZone5: Bool(recursive: Bool)
        Throw New Throwable()
    End Function

    Function CreateMerlin: Void()
        Throw New Throwable()
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
           roomType = -1 And
           controller_game.currentZone = 1
            wallType = TileType.CatacombWall
        End If

        Local lastCreatedRoomType := roomType
        Local tiles: List<TileData>
        Select roomType
            Case -1
                If controller_game.currentZone = 1
                    If controller_game.currentLevel = 1
                        If Not Util.RndBool(True)
                            lastCreatedRoomType = 0
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 0, originX, originY, originX2, originY2, wideCorridor, wallType)
                        End If

                        lastCreatedRoomType = 2
                        tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 2, originX, originY, originX2, originY2, wideCorridor, wallType)
                    End If

                    Select Util.RndIntRangeFromZero(2, True)
                        Case 0
                            lastCreatedRoomType = 0
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 0, originX, originY, originX2, originY2, wideCorridor, wallType)
                        Case 1
                            lastCreatedRoomType = 1
                            ' No room?
                        Case 2
                            lastCreatedRoomType = 1
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 1, originX, originY, originX2, originY2, wideCorridor, wallType)
                    End Select
                Else
                    If controller_game.currentZone = 4
                        lastCreatedRoomType = 0
                        ' Substitute with `RndBool`?
                        If Not Util.RndIntRangeFromZero(1, True) Then lastCreatedRoomType = -1

                        tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 0, originX, originY, originX2, originY2, wideCorridor, wallType)
                    End If

                    Select Util.RndIntRangeFromZero(3, True)
                        Case 0
                            lastCreatedRoomType = 0
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 0, originX, originY, originX2, originY2, wideCorridor, wallType)
                        Case 1
                            lastCreatedRoomType = 2
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 2, originX, originY, originX2, originY2, wideCorridor, wallType)
                        Case 2
                            lastCreatedRoomType = 1
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 1, originX, originY, originX2, originY2, wideCorridor, wallType)
                        Case 3
                            lastCreatedRoomType = 0
                            tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 8, originX, originY, originX2, originY2, wideCorridor, wallType)
                    End Select
                End If
            Case 1
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 1, originX, originY, originX2, originY2, wideCorridor, wallType)
            Case 2
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 2, originX, originY, originX2, originY2, wideCorridor, wallType)
            Case 3
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 3, originX, originY, originX2, originY2, wideCorridor, wallType)
            Case 5
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 5, originX, originY, originX2, originY2, wideCorridor, wallType)
            Case 6
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 6, originX, originY, originX2, originY2, wideCorridor, wallType)
            Case 7
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 7, originX, originY, originX2, originY2, wideCorridor, wallType)
            Case 8
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 8, originX, originY, originX2, originY2, wideCorridor, wallType)
            Case 10
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 10, originX, originY, originX2, originY2, wideCorridor, wallType)
            Default
                tiles = Level._CreateRoom(xVal, yVal, wVal, hVal, 0, originX, originY, originX2, originY2, wideCorridor, wallType)
        End Select

        If allowWaterTarOoze
            Local chanceWaterTarOoze := Util.RndIntRangeFromZero(100, True)
            Local levelIndex := math.Max(controller_game.currentLevel - 1, 5)

            Local floorCountMaxPart1 := Util.RndIntRange(2, 7, True, -1)
            Local floorCountMaxPart2 := Util.RndIntRangeFromZero(levelIndex, True)
            Local floorCountMax := floorCountMaxPart1 + floorCountMaxPart2

            Local tileType: Int
            Select controller_game.currentZone
                Case 2
                    floorCountMaxPart1 = Util.RndIntRange(2, 7, True, -1)
                    floorCountMaxPart2 = Util.RndIntRangeFromZero(levelIndex, True)
                    floorCountMax = floorCountMaxPart1 + floorCountMaxPart2

                    tileType = TileType.Tar
                Case 4
                    tileType = TileType.Ooze
                Default
                    tileType = TileType.Water
            End Select

            Local placeWaterTarOoze := False
            If (controller_game.currentLevel = 1) And (chanceWaterTarOoze <=  5) Then placeWaterTarOoze = True
            If (controller_game.currentLevel = 2) And (chanceWaterTarOoze <= 25) Then placeWaterTarOoze = True
            If (controller_game.currentLevel = 3) And (chanceWaterTarOoze <= 45) Then placeWaterTarOoze = True
            If (controller_game.currentLevel > 3) And (chanceWaterTarOoze <= 65) Then placeWaterTarOoze = True

            Local floorCount := 0
            Local v70: Int
            If placeWaterTarOoze
                Select lastCreatedRoomType
                    Case 0
                    Case 1
                    Case 2
                        For Local tile := EachIn tiles
                            ' Can be simplified to `tile.type = TileType.Floor` if `tile.type` can be guaranteed to be non-negative.
                            If tile.type < 1 Then floorCount += 1
                        End For

                        floorCount = math.Max(floorCount, floorCountMax)
                        v70 = Util.RndIntRangeFromZero(floorCount - 1, True)
                End Select
            End If

            If floorCount > 0
                Local x := 0
                Local y := 0
                Local i := 999
                Local j := floorCount
                Local v224 := False
                Repeat
                    If v224
                        For Local tile := EachIn tiles
                            Local tileX := tile.x
                            Local tileY := tile.y

                            If tile.type = TileType.Floor And
                               Util.GetDist(x, y, tileX, tileY) <= 1.01 And
                               Not Util.RndIntRangeFromZero(3, True)
                                x = tileX
                                y = tileY
                                tile.type = tileType
                                j -= 1
                                Exit
                           End If
                        End For
                    Else
                        For Local tile := EachIn tiles
                            Local tileX := tile.x
                            Local tileY := tile.y

                            If tile.type = TileType.Floor
                                v70 -= 1
                                If v70 < 0
                                    x = tileX
                                    y = tileY
                                    tile.type = tileType
                                    j -= 1
                                    v224 = True

                                    If j <= 0
                                        'goto LABEL_71
                                    End If

                                    i -= 1
                                End If
                            End If
                        End For
                    End If

                    If j <= 0
                        'goto LABEL_71
                    End If

                    i -= 1
                Until i = 0

                Return False
            End If
        End If

        'LABEL_71
        For Local tile := EachIn tiles
            Local tileX := tile.x
            Local tileY := tile.y
            Local tileType := tile.type

            If pending And Not (Level.GetTileTypeAt(tileX, tileY) = TileType.None)
                If Not allowWallOverlap Then Return False
                If Not Level.IsWallAt(tileX, tileY, False, False) Then Return False

                New Tile(tileX, tileY, tileType, True, -1)
            Else
                Level.PlaceTileRemovingExistingTiles(tileX, tileY, tileType, pending, -1, False)
            End If
        End For

        Level.lastCreatedRoomType = lastCreatedRoomType

        Return True
    End Function

    Function _CreateRoom: List<TileData>(xVal: Int, yVal: Int, wVal: Int, hVal: Int, roomType: Int, originX: Int, originY: Int, originX2: Int, originY2: Int, wideCorridor: Bool, wallType: Int)
        Local tiles := New List<TileData>()

        Local xMax := xVal + wVal
        Local yMax := yVal + hVal

        Select roomType
            Case 0
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, wallType)
                Level._CreateFloor(tiles, xVal, yVal, xMax, yMax, TileType.Floor)
            Case 1
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, wallType)

                Local wallChance := Util.RndIntRangeFromZero(6, True)

                If xVal + 1 < xMax
                    Local x: Int
                    Local xOff := 1
                    Local xRem := xMax - xVal - 1
                    While True
                        x = xVal + xOff

                        If yVal + 1 < yMax Then Exit

                        'LABEL_127
                        xOff += 1
                        xRem -= 1
                        If Not xRem
                            'Break out of select
                        End If
                    End While

                    Local y: Int
                    Local yOff := 1
                    Local yRem := yMax - yVal - 1
                    While True
                        While True
                            y = yOff + yVal

                            If (xOff = 2 Or xRem = 2) And (yOff = 2 Or yRem = 2) Then Exit

                            tiles.AddLast(New TileData(x, y, TileType.Floor))

                            'LABEL_121
                            yOff += 1
                            yRem -= 1
                            If Not yRem
                                'goto LABEL_127
                            End If
                        End While

                        If wallChance
                            tiles.AddLast(New TileData(x, y, wallType))
                            'goto LABEL_121
                        End If

                        tiles.AddLast(New TileData(x, y, TileType.CatacombWall))

                        yOff += 1
                        yRem -= 1
                        If Not yRem
                            'goto LABEL_127
                        End If
                    End While
                End If
            Case 2
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, wallType)

                Local xMin := xVal + 1
                Local xRem := originX - xVal - 1
                For Local x := xMin Until xMax
                    Local yMin := yVal + 1
                    Local yRem := originY - yVal - 1
                    For Local y := yMin Until yMax
                        While True
                            If (x = xMin Or x = xMax - 1) And
                               ((y = yMin) Or
                                (x = xMin And y = yMax - 1) Or
                                (x = xMax - 1 And y = yMax - 1))
                                If (Not wideCorridor Or Util.GetDist(originX, originY, xRem + originX2, yRem + originY2) > 1.0) And
                                   (Util.GetDist(0, 0, xRem, yRem) > 1.0)
                                    Exit
                               End If
                            End If

                            tiles.AddLast(New TileData(x, y, TileType.Floor))
                            y += 1
                            yRem -= 1

                            If y = yMax
                                'goto LABEL_169
                            End If
                        End While

                        tiles.AddLast(New TileData(x, y, wallType))
                        yRem -= 1
                    End For

                    'LABEL_169
                    xRem -= 1
                End For
            Case 3
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, TileType.ShopWall)

                ' Floor
                Local xMid := (wVal / 2) + xVal
                Local xMidLeft := xMid - 1
                Local xMidRight := xMid + 1

                Local yMid := (hVal / 2) + yVal
                Local yMidAbove := yMid - 1

                For Local x := xVal + 1 Until xMax
                    Local y := yVal + 1
                    If y < yMax
                        If x = xMidLeft
                            Repeat
                                While Not (y = yMidAbove)
                                    tiles.AddLast(New TileData(xMidLeft, y, TileType.Floor))
                                    y += 1

                                    If y = yMax
                                        'goto LABEL_212
                                    End If
                                End While

                                tiles.AddLast(New TileData(xMidLeft, yMidAbove, TileType.ShopFloor))
                                y += 1
                            Until y = yMax
                        Else
                            If Not (x = xMidRight)
                                Repeat
                                    tiles.AddLast(New TileData(x, y, TileType.Floor))
                                    y += 1
                                Until y = yMax
                                'goto LABEL_206
                            End If

                            Repeat
                                If y = yMidAbove
                                    tiles.AddLast(New TileData(xMidRight, yMidAbove, TileType.ShopFloor))
                                Else
                                    tiles.AddLast(New TileData(xMidRight, y, TileType.Floor))
                                End If
                                y += 1
                            Until y = yMax
                        End If

                        'LABEL_212
                    End If

                    'LABEL_206
                End For

                Level.shopX = xVal
                Level.shopY = yVal
                Level.shopW = wVal
                Level.shopH = hVal
            Case 5
                Level._CreateFloor(tiles, xVal, yVal, xMax, yMax, TileType.Floor4)
            Case 6
                Level._CreateWalls(tiles, xVal, yVal, xMax, yMax, TileType.BossWall)
                Level._CreateFloor(tiles, xVal, yVal, xMax, yMax, TileType.Floor3)
            Case 7
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
            Case 8
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
            Case 10
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
        Throw New Throwable()
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
        Throw New Throwable()
    End Function

    Function CreateTrainer: Void()
        Throw New Throwable()
    End Function

    Function CreateTrainingMap: Void()
        Throw New Throwable()
    End Function

    Function CreateTutorialMap: Void()
        Throw New Throwable()
    End Function

    Function CreateWeaponmaster: Void()
        Throw New Throwable()
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

            If player.field_110
                player.AddItemOfType("weapon_dagger", Null, True, True)
            End If
        End For

        RenderableObject.DeleteAll(True)
        ParticleSystem.systems.Clear()

        For Local i := 0 Until numPlayers
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
        Throw New Throwable()
    End Function

    Function DoQuickRestart: Void(continuedRun: Bool, showPopups: Bool, playIntroCutscene: Bool)
        Throw New Throwable()
    End Function

    Function DoRestart: Void()
        Throw New Throwable()
    End Function

    Function DoRestart: Void(continuedRun: Bool, cancelFade: Bool)
        Throw New Throwable()
    End Function

    Function DoWePlaceAdditionalChestThisLevel: Bool()
        Throw New Throwable()
    End Function

    Function DryUpAllWater: Void(replacementFloor: Int)
        Throw New Throwable()
    End Function

    Function DumpMap: Void()
        ' Max and Min might be backwards.
        Local yMax := 100
        Local xMax := 100
        Local yMin := -100
        Local xMin := -100

        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If (tile.x >= -100 And tile.x <= 100) And
                   (tile.y >= -100 And tile.y <= 100)
                   If xMax > tile.x Then xMax = tile.x
                   If yMax > tile.y Then yMax = tile.y
                   If xMin >= tile.x Then xMin = tile.x
                   If yMin > tile.y Then yMin = tile.y
               End If
            End For
        End For

        Local v37: Int
        If yMax <= yMin
            Repeat
                Local dump := New StringStack()
                If xMax <= xMin
                    Local x := xMax
                    Repeat
                        Local tile := Level.GetTileAt(x, yMax)
                        Local val := " "
                        If tile
                            If tile.type = TileType.Wire
                                val = "w"
                            Else If tile.IsFloor()
                                val = "."
                            Else If tile.IsDoor()
                                val = "\"
                            Else If tile.IsWall(False, False, False, False)
                                val = "#"
                            Else
                                val = "?"
                            End If
                        End If

                        dump.Push(val)
                        x += 1
                    Until x <= xMin
                End If

                ' TODO: Looks like some copying happens here?
                ' TODO: Print

                yMax += 1
            Until yMax <= v37
        End If
    End Function

    Function Earthquake: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function EnsureBossTraining: Void(name: String)
        Throw New Throwable()
    End Function

    Function FillSecretRooms: Bool()
        Throw New Throwable()
    End Function

    Function FillSecretRoomsZone1: Bool()
        Throw New Throwable()
    End Function

    Function FillSecretRoomsZone2: Bool()
        Throw New Throwable()
    End Function

    Function FillSecretRoomsZone4: Bool()
        Throw New Throwable()
    End Function

    Function FillTiles: Void(rect: Rect, tileType: Int, tileTypeEdge: Int)
        Throw New Throwable()
    End Function

    Function FillVault: Void(tmpRoom: RoomData)
        Throw New Throwable()
    End Function

    Function FindTileOfType: Point(tileType: Int, ignoreCrackedWalls: Bool)
        Throw New Throwable()
    End Function

    Function FreezeTilesNear: Void(xVal: Int, yVal: Int, allTiles: Bool)
        Throw New Throwable()
    End Function

    Function GenerateHardcoreZoneOrder: Void()
        Throw New Throwable()
    End Function

    Function GenerateJanitorItems: Void()
        Throw New Throwable()
    End Function

    Function GetAdjustedZoneForAllChars: Int()
        Throw New Throwable()
    End Function

    Function GetAdjustedZoneForAllCharsDLC: Int()
        Throw New Throwable()
    End Function

    Function GetAdjustedZoneForStoryMode: Int()
        Throw New Throwable()
    End Function

    Function GetDistanceToNearestTorch: Float(r: RenderableObject)
        Throw New Throwable()
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
        Throw New Throwable()
    End Function

    Function GetHardModeExtraEnemies: Int()
        Throw New Throwable()
    End Function

    Function GetHardModeXML: XMLNode()
        Throw New Throwable()
    End Function

    Function GetInitialZone: Int()
        Throw New Throwable()
    End Function

    Function GetMapTileLightValue: Float(xVal: Int, yVal: Int, forVision: Bool)
        Throw New Throwable()
    End Function

    Function GetMaxDepth: Int()
        Return 5
    End Function

    Function GetNPCSaleItem: Int(npcNum: Int, slotNum: Int, exclude1: String, exclude2: String)
        Throw New Throwable()
    End Function

    Function GetRandomOffsetPoint: Point()
        Throw New Throwable()
    End Function

    Function GetRandomWallInRoom: Object(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Throw New Throwable()
    End Function

    Function GetRandPointInRoomOfTileType: Point(room: RoomBase, tileType: Int, skipCollisions: Bool)
        Throw New Throwable()
    End Function

    Function GetRandPointInRoomOfTileType: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, tileType: Int, skipCollisions: Bool)
        Throw New Throwable()
    End Function

    Function GetRandPointInRoomWithOptions: Point(room: RoomBase, skipCollisions: Bool, skipExit: Bool, skipTraps: Bool, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Throw New Throwable()
    End Function

    Function GetRandPointInRoomWithOptions: Point(xVal: Int, yVal: Int, wVal: Int, hVal: Int, skipCollisions: Bool, skipExit: Bool, skipTraps: Bool, skipWater: Bool, nearWallIsOk: Bool, secretRoomOK: Bool)
        Throw New Throwable()
    End Function

    Function GetShrinePoint: Point()
        Throw New Throwable()
    End Function

    Function GetSingleZoneModeFinalBossZone: Int()
        Throw New Throwable()
    End Function

    Function GetStandardExitCoords: Object()
        Throw New Throwable()
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
        Throw New Throwable()
    End Function

    Function GetTileObstructionList: Object(includeOffscreen: Bool)
        Throw New Throwable()
    End Function

    Function GetTileTypeAt: Int(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)
        If tile Then Return tile.GetType()

        Return -1
    End Function

    Function HaveFinalBoss: Bool()
        Throw New Throwable()
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
        Throw New Throwable()
    End Function

    Function IsAnyWallAt: Bool(r: Rect)
        Throw New Throwable()
    End Function

    Function IsAnyWaterAt: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsBossLevel: Bool()
        Throw New Throwable()
    End Function

    Function IsCorridorFloorAt: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsCorridorFloorOrDoorAdjacent: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsCorridorOrRoomWallAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.IsWall(False, True, False, False)
    End Function

    Function IsCrackedWallAdjacent: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsCrackedWallAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And tile.isCracked
    End Function

    Function IsDoorAdjacent: Bool(x: Int, y: Int)
        Throw New Throwable()
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
        Throw New Throwable()
    End Function

    Function IsFinalBossZone: Bool()
        Throw New Throwable()
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
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And (tile.GetType() = TileType.HotCoals)
    End Function

    Function IsIceAt: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And (tile.GetType() = TileType.Ice)
    End Function

    Function IsIcePartOfLevel: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsLockedExit: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
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
            Local dir := 0

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
                           tile.type = TileType.DirtWall2 Or 
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
        Throw New Throwable()
    End Function

    Function IsSecretRoom: Bool(rmType: Int)
        Throw New Throwable()
    End Function

    Function IsSeededMode: Bool(mode: Int)
        Throw New Throwable()
    End Function

    Function IsSurroundedByDestructibleWalls: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsTileEmpty: Bool(xVal: Int, yVal: Int)
        Local tile := Level.GetTileAt(xVal, yVal)

        Return tile And (tile.GetType() = TileType.None)
    End Function

    Function IsTileTypeAdjacent: Bool(xVal: Int, yVal: Int, tempType: Int)
        Throw New Throwable()
    End Function

    Function IsTrapAdjacent: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsTrapOrExitAbove: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsVisibleTileAt: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsWallAdjacent: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsWallAdjacent8: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsWallAt: Bool(xVal: Int, yVal: Int, destructibleOnly: Bool, torchlessOnly: Bool)
        Throw New Throwable()
    End Function

    Function IsWaterOrTarAt: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function IsWireLikeAt: Bool(x: Int, y: Int)
        Throw New Throwable()
    End Function

    Function IsZone5RoomLegal: Bool(loc: Rect)
        Throw New Throwable()
    End Function

    Function JanitorReset: Void()
        Throw New Throwable()
    End Function

    Function LoadLevelSong: Void(levelObj: LevelObject)
        Throw New Throwable()
    End Function

    Function MakeAllWallsUnbreakable: Void()
        Throw New Throwable()
    End Function

    Function MakeHelper: Void()
        Throw New Throwable()
    End Function

    Function MakeInvisibleChestAt: Void(tmpX: Int, tmpY: Int)
        Throw New Throwable()
    End Function

    Function MarkAllTilesAsSeen: Void()
        Throw New Throwable()
    End Function

    Function MaybeForbidTrapdoor: Bool()
        Throw New Throwable()
    End Function

    Function NewLevel: Void(level: Int, zone: Int, playerID: Int, inEditor: Bool, levelObj: LevelObject, continuedRun: Bool)
        Throw New Throwable()
    End Function

    Function PadWalls: Void()
        Throw New Throwable()
    End Function

    Function PaintTriggerInterior: Void(x: Int, y: Int, w: Int, h: Int, trigger: Int)
        Throw New Throwable()
    End Function

    Function PawnSlot: Void(slotName: String, ent: Entity)
        Throw New Throwable()
    End Function

    Function PlaceAdditionalChestAt: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceAppropriateMinibosses: Void(room: RoomBase)
        Throw New Throwable()
    End Function

    Function PlaceChests: Void(freeBroadSword: Bool)
        Throw New Throwable()
    End Function

    Function PlaceConnectedWireDoor: Void(p: Point)
        Throw New Throwable()
    End Function

    Function PlaceCrateOrBarrel: Void()
        Throw New Throwable()
    End Function

    Function PlaceEnemies: Void()
        Throw New Throwable()
    End Function

    Function PlaceEnemiesZone1: Void()
        Throw New Throwable()
    End Function

    Function PlaceEnemiesZone2: Void()
        Throw New Throwable()
    End Function

    Function PlaceEnemiesZone3: Void()
        Throw New Throwable()
    End Function

    Function PlaceEnemiesZone4: Void()
        Throw New Throwable()
    End Function

    Function PlaceEnemiesZone5: Void()
        Throw New Throwable()
    End Function

    Function PlaceExit: Bool(rdExit: RoomData)
        For Local i := 0 Until 500
            Local x := rdExit.x + Util.RndIntRangeFromZero(rdExit.width - 1, True)
            Local y := rdExit.y + Util.RndIntRangeFromZero(rdExit.height - 1, True)
            Local tile := Level.GetTileAt(x, y)
            If tile And Not tile.GetType() And Not Level.IsCorridorFloorOrDoorAdjacent(x, y)
                Local tileBelow := Level.GetTileAt(x, y + 1)
                If tileBelow And Not tileBelow.IsWall(False, False, False, False)
                    Level.CreateExit(x, y)

                    Return True
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
        Throw New Throwable()
    End Function

    Function PlaceHotCoalTileAt: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceIceTileAt: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceLockedChests: Void()
        Throw New Throwable()
    End Function

    Function PlaceMinibossOfShapeAt: Object(newMiniboss: Int, xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceNocturnaArea: Void()
        Throw New Throwable()
    End Function

    Function PlacePenaltyBoxEnemies: Void()
        Throw New Throwable()
    End Function

    Function PlaceRandomEnemyForTempo: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceRareEnemies: Void(room: RoomBase, hasExit: Bool)
        Throw New Throwable()
    End Function

    Function PlaceResourceWall: Void()
        Throw New Throwable()
    End Function

    Function PlaceRoomZone1: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Level.pendingTiles.Clear()

        While Tile.pendingTilesList.Count() > 0
            Tile.pendingTilesList.RemoveFirst().Die()
        End While

        Local rndVal := Util.RndIntRangeFromZero(100, True)
        Local wideCorridor: Bool
        If (controller_game.currentLevel = 2) And (rndVal <= 30) Then wideCorridor = True
        If (controller_game.currentLevel = 3) And (rndVal <= 60) Then wideCorridor = True
        If (controller_game.currentLevel = 4) And (rndVal <= 80) Then wideCorridor = True
        If (controller_game.currentLevel > 4) And (rndVal <= 90) Then wideCorridor = True

        ' Overwrites `wideCorridor` but cannot skip the call to `RndIntRange` because it has side effects.
        Select roomType
            Case RoomType.Shop
            Case 5
            Case 7
                wideCorridor = False
        End Select

        Local point := New Point(0, 0) ' This doesn't get used. Decompilation issue?

        Local x: Int
        Local y: Int

        Local xLeft: Int
        Local xRight: Int

        Local yAbove: Int
        Local yBelow: Int

        If roomToAttachTo
            If roomToAttachTo.x And
               roomToAttachTo.x + roomToAttachTo.width And
               roomToAttachTo.y And
               roomToAttachTo.y + roomToAttachTo.height
                While True
                    x = 1 + roomToAttachTo.x + Util.RndIntRangeFromZero(roomToAttachTo.width - 1, True)
                    y = 1 + roomToAttachTo.y + Util.RndIntRangeFromZero(roomToAttachTo.height - 1, True)

                    If roomToAttachTo.x = x Then Exit
                    If (roomToAttachTo.x + roomToAttachTo.width) = x Then Exit
                    If roomToAttachTo.y = y Then Exit
                    If (roomToAttachTo.y + roomToAttachTo.height) = y Then Exit
                End While
            Else
                x = 0
                y = 0
            End If

            Local point := New Point(x, y) ' This doesn't get used. Decompilation issue?
        Else
            Local tileLocation := Level.FindTileOfType(TileType.Unknown98, False)
            x = tileLocation.x
            y = tileLocation.y
        End If

        xLeft = x - 1
        xRight = x + 1

        yAbove = y - 1
        yBelow = y + 1

        Local tile: Tile

        Local dunno3 := 4
        Local dunno2 := 3
        Local dunno1 := 2
        Local dunno0 := 1

        tile = Level.GetTileAt(xRight, y)
        If tile And Not tile.GetType()
            dunno3 = 3
            dunno2 = 2
            dunno1 = 1
            dunno0 = 0
        End If

        tile = Level.GetTileAt(x, yBelow)
        If tile And Not tile.GetType()
            dunno2 += 1
            dunno1 += 1
            dunno0 += 1
        End If

        tile = Level.GetTileAt(xLeft, y)
        If tile And Not tile.GetType()
            dunno1 += 1
            dunno0 += 1
        End If

        tile = Level.GetTileAt(x, yAbove)
        If tile And Not tile.GetType()
            dunno0 += 1
        End If

        Local horiz: Bool
        Local moveX: Int ' Possible values: -1, 0, 1
        Local moveY: Int ' Possible values: -1, 0, 1

        If dunno0 = 1
            horiz = False
            moveX = 0

            tile = Level.GetTileAt(xRight, y)
            If tile And Not tile.GetType()
                horiz = True
                moveX = -1
            End If

            tile = Level.GetTileAt(x, yBelow)
            If tile And Not tile.GetType()
                moveY = -1
            Else
                moveY = 0
            End If

            tile = Level.GetTileAt(xLeft, y)
            If tile And Not tile.GetType()
                horiz = True
                moveX = 1
            End If

            tile = Level.GetTileAt(x, yAbove)
            If Not (tile And Not tile.GetType())
                moveY = 1
            End If

            Level.carveX = x
            Level.carveY = y

            Local width: Int
            Local height: Int

            If Level.CarveNewCorridor(moveX, moveY, horiz, True, False, roomType, wideCorridor)
                If (roomType = 5) Or (roomType = 7)
                    ' `width` and `height` are overwritten but `RndIntRange` has side effects. Do not remove.
                    width = Util.RndIntRange(6, 8, True, -1)
                    height = Util.RndIntRange(5, 7, True, -1)

                    width = 4
                    height = 3
                Else
                    For Local i := 0 Until 2
                        If Util.RndBool(True)
                            tile = Level.GetTileAt(Level.carveX, Level.carveY)
                            If Not (tile And tile.IsFloor())
                                New Tile(Level.carveX, Level.carveY, TileType.DirtWall2, True, -1)
                            End If

                            If horiz
                                tile = Level.GetTileAt(Level.carveX, Level.carveY - 1)
                                If Not (tile And tile.IsFloor())
                                    New Tile(Level.carveX, Level.carveY - 1, TileType.DirtWall2, True, -1)
                                End If

                                tile = Level.GetTileAt(Level.carveX, Level.carveY + 1)
                                If Not (tile And tile.IsFloor())
                                    New Tile(Level.carveX, Level.carveY + 1, TileType.DirtWall2, True, -1)
                                End If

                                Level.carveX -= moveX
                                Level.carveY -= moveY

                                moveX = 0
                                moveY = -1
                                If Util.RndBool(True)
                                    moveY = 1
                                End If
                            Else
                                tile = Level.GetTileAt(Level.carveX - 1, Level.carveY)
                                If Not (tile And tile.IsFloor())
                                    New Tile(Level.carveX - 1, Level.carveY, TileType.DirtWall2, True, -1)
                                End If

                                tile = Level.GetTileAt(Level.carveX + 1, Level.carveY)
                                If Not (tile And tile.IsFloor())
                                    New Tile(Level.carveX + 1, Level.carveY, TileType.DirtWall2, True, -1)
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
                Local originX: Int
                Local originY: Int

                Local yOff: Int

                If moveX = -1
                    xVal = Level.carveX - width
                    yOff = Util.RndIntRangeFromZero(height - 2, True)
                    originY = Level.carveY

                    If wideCorridor
                        yVal = Level.carveY - Util.RndIntRangeFromZero(height - 3, True) - 1
                        originX = Level.carveX
                        'goto LABEL_95
                    End If
                Else
                    If Not (moveX = 1)
                        ' moveX = 0
                        If Not (moveY = -1)
                            ' `RndIntRange` has side effects. Must stay outside of the following If-block.
                            Local xOff := Util.RndIntRangeFromZero(width - 2, True)
                            originX = Level.carveX
                            originY = Level.carveY
                            yVal = Level.carveY

                            If wideCorridor
                                xVal = Level.carveX - Util.RndIntRangeFromZero(width - 3, True) - 1
                            Else
                                xVal = Level.carveX - xOff - 1
                            End If

                            'goto LABEL_95
                        End If

                        Local xOff2 := Util.RndIntRangeFromZero(width - 2, True)
                        originX = Level.carveX
                        originY = Level.carveY
                        yVal = Level.carveY - height

                        If wideCorridor
                            xVal = Level.carveX - Util.RndIntRangeFromZero(width - 3, True) - 1
                        Else
                            xVal = Level.carveX - xOff2 - 1
                        End If

                        'LABEL_95
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

                        If (roomType = 5) Or (roomType = 7)
                            Return Level._PlaceRoom(xVal, yVal, width, height)
                        End If

                        Local rndVal := Util.RndIntRangeFromZero(100, True)
                        Local addDoor: Bool
                        If (controller_game.currentLevel = 1) And (rndVal <= 80) Then addDoor = True
                        If (controller_game.currentLevel = 2) And (rndVal <= 70) Then addDoor = True
                        If (controller_game.currentLevel = 3) And (rndVal <= 60) Then addDoor = True
                        If (controller_game.currentLevel > 3) And (rndVal <= 50) Then addDoor = True

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
                            New Tile(Level.carveX, Level.carveY, TileType.Floor2, False, -1)

                            tileType = TileType.Floor2
                        End If

                        If wideCorridor
                            New Tile(originX2, originY2, tileType, False, -1)
                        End If

                        Return Level._PlaceRoom(xVal, yVal, width, height)
                    End If

                    xVal = Level.carveX
                    yOff = Util.RndIntRangeFromZero(height - 2, True)
                    originY = Level.carveY

                    If wideCorridor
                        yOff = Util.RndIntRangeFromZero(height - 3, True)
                        originY = Level.carveY
                    End If
                End If

                yVal = originY - yOff - 1
                originX = Level.carveX
                'goto LABEL_95
            End If
        End If

        Return Null
    End Function

    Function _PlaceRoom: RoomData(xVal: Int, yVal: Int, width: Int, height: Int)
        Local room := New RoomData(xVal, yVal, width, height, Level.lastCreatedRoomType, False)
        Level.rooms.AddLast(room)

        Return room
    End Function

    Function PlaceRoomZone2: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Throw New Throwable()
    End Function

    Function PlaceRoomZone3: RoomData(roomType: Int, roomToAttachTo: RoomData)
        Throw New Throwable()
    End Function

    Function PlaceRoomZone4: RoomData(roomType: Int)
        Throw New Throwable()
    End Function

    Function PlaceRoomZone5: RoomData(pseg: PortalSeg, width: Int, height: Int, minEntryDist: Int)
        Throw New Throwable()
    End Function

    Function PlaceRoomZone5: RoomData(portalSegs: StackEx<PortalSeg>, width: Int, height: Int, minEntryDist: Int, roomType: Int)
        Throw New Throwable()
    End Function

    Function PlaceSecondarySpecialShop: Void(useBloodCost: Bool, isFoodShop: Bool)
        Throw New Throwable()
    End Function

    Function PlaceSecretRooms: Void(numRooms: Int)
        Throw New Throwable()
    End Function

    Function PlaceShopItemsAt: Void(tmpX: Int, tmpY: Int, door: Rect)
        Throw New Throwable()
    End Function

    Function PlaceShopkeeperGhostIfNeededAt: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceShrine: Void()
        Throw New Throwable()
    End Function

    Function PlaceTileRemovingExistingTiles: Tile(xVal: Int, yVal: Int, tileType: Int, pending: Bool, tilesetOverride: Int, fromEarthSpell: Bool)
        Throw New Throwable()
    End Function

    Function PlaceTileTypeAt: Void(xVal: Int, yVal: Int, tileType: Int)
        Throw New Throwable()
    End Function

    Function PlaceTorchesAnywhere: Void()
        Throw New Throwable()
    End Function

    Function PlaceTrapInRoom: Object(xVal: Int, yVal: Int, wVal: Int, hVal: Int, trapType: Int, bounceDir: Int, twoAwayTrap: Trap)
        Throw New Throwable()
    End Function

    Function PlaceTraps: Void()
        Throw New Throwable()
    End Function

    Function PlaceTrapsZone1: Void()
        Throw New Throwable()
    End Function

    Function PlaceTrapsZone2: Void()
        Throw New Throwable()
    End Function

    Function PlaceTrapsZone3: Void()
        Throw New Throwable()
    End Function

    Function PlaceTrapsZone4: Void()
        Throw New Throwable()
    End Function

    Function PlaceTrapsZone5: Void()
        Throw New Throwable()
    End Function

    Function PlaceTrapZone3: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceTrapZone4: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceTrapZone5: Void(xVal: Int, yVal: Int, wVal: Int, hVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceWire: Bool(src: Point, dst: Point)
        Throw New Throwable()
    End Function

    Function PlaceZone3Beetle: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceZone3Cauldron: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceZone3Elemental: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceZone3Slime: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceZone3YetiHellhound: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function PlaceZoneAppropriateNumberOfDiamondsAt: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function ProcessSpecialRoom: Void()
        Throw New Throwable()
    End Function

    Function PutBeastmasterStairs: Void(x: Int, y: Int, stairName: String, enemyName: String, enemyType: Int, enemyId: Int, stairNamePrefix: String)
        Throw New Throwable()
    End Function

    Function PutBossStair: Void(x: Int, y: Int, bossName: String, enemyType: Int, zone: Int, label: String, labelXOff: Int)
        Throw New Throwable()
    End Function

    Function PutCrateOrBarrel: Void(x: Int, y: Int)
        Throw New Throwable()
    End Function

    Function PutEnemyZone5: Void(x: Int, y: Int)
        Throw New Throwable()
    End Function

    Function PutFutureStair: Void(x: Int, y: Int)
        Throw New Throwable()
    End Function

    Function PutMinibossStair: Void(x: Int, y: Int, minibossName: String, enemyType: Int, label: String, labelXOff: Int)
        Throw New Throwable()
    End Function

    Function PutRoomEnemiesZone5: Void(room: RoomBase, hasExit: Bool)
        Throw New Throwable()
    End Function

    Function PutVariedEnemiesZone5: Void(pts: StackEx<Point>)
        Throw New Throwable()
    End Function

    Function QueryHarderBosses: Bool()
        Throw New Throwable()
    End Function

    Function RandomFood: Int()
        Throw New Throwable()
    End Function

    Function RandomWalkOfTempTiles: Void(xVal: Int, yVal: Int, distCounter: Int)
        Throw New Throwable()
    End Function

    Function RecalcLevelBoundaries: Void()
        Throw New Throwable()
    End Function

    Function RefreshLineOfSightTiles: Void()
        Throw New Throwable()
    End Function

    Function RemoveExit: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function RemoveSomeWallsAwayFromCorridors: Void(percentToRemove: Float, includeCorridors: Bool, maxHealth: Int)
        Throw New Throwable()
    End Function

    Function RemoveTileAt: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function RenderAll: Void()
        Throw New Throwable()
    End Function

    Function RenderExitArrow: Void()
        Throw New Throwable()
    End Function

    Function ResetCosts: Void()
        Throw New Throwable()
    End Function

    Function ResetSpecialRoomVariables: Void()
        Throw New Throwable()
    End Function

    Function SetMagicBarrier: Void(on: Bool)
        Throw New Throwable()
    End Function

    Function ShopkeeperMissing: Bool()
        Throw New Throwable()
    End Function

    Function ShowModPopup: Void(imageName: String)
        Throw New Throwable()
    End Function

    Function SplashWater: Void(xVal: Int, yVal: Int, destroyWater: Bool)
        Throw New Throwable()
    End Function

    Function StartReplayPlayback: Void()
        Throw New Throwable()
    End Function

    Function TakeActionAfterAllCharsScoreSubmit: Void()
        Throw New Throwable()
    End Function

    Function TransmogrifySlot: Void(slotName: String, ent: Entity)
        Throw New Throwable()
    End Function

    Function TransmogrifyWeaponToType: Void(ent: Entity, type: Int)
        Throw New Throwable()
    End Function

    Function TrySpawnBossMinibossAt: Void(x: Int, y: Int, etype: Int)
        Throw New Throwable()
    End Function

    Function UnlockChar: Void(characterID: Int)
        Throw New Throwable()
    End Function

    Function Update: Void()
        Throw New Throwable()
    End Function

    Function WantPenaltyBox: Bool()
        Throw New Throwable()
    End Function

    Function WidenCorridors: Void()
        Throw New Throwable()
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
    Field field_1C: Int

End Class

Class RoomType

    Const Shop: Int = 3
    Const Start: Int = 4

End Class
