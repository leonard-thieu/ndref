'Strict

Import monkey.list
Import controller_game
Import image
Import level_object
Import renderable_object
Import tile

Class Tile Extends RenderableObject

    Global anyPlayerHaveCompassCached: Bool
    Global anyPlayerHaveCompassCachedFrame: Int
    Global anyPlayerHaveMonocleCached: Bool
    Global anyPlayerHaveMonocleCachedFrame: Int
    Global anyPlayerHaveRingOfLuckCached: Bool
    Global anyPlayerHaveRingOfLuckCachedFrame: Int
    Global anyPlayerHaveRingOfShadowsCached: Int
    Global anyPlayerHaveRingOfShadowsCachedFrame: Int
    Global anyPlayerHaveSunglassesCached: Bool
    Global anyPlayerHaveSunglassesCachedFrame: Int
    Global anyPlayerHaveZoneMapCached: Bool
    Global anyPlayerHaveZoneMapCachedFrame: Int
    Global floorRecededList: List<Tile> = New List<Tile>()
    Global floorRisingList: List<Tile> = New List<Tile>()
    Global ignoreFailSounds: Bool
    Global pendingTilesList: List<Tile> = New List<Tile>()
    Global playSounds: Bool
    Global totalTilesCreatedOrDestroyed: Int

    Function AnyPlayerHaveCompass: Bool()
        Debug.TraceNotImplemented("Tile.AnyPlayerHaveCompass()")
    End Function

    Function AnyPlayerHaveMonocle: Bool()
        Debug.TraceNotImplemented("Tile.AnyPlayerHaveMonocle()")
    End Function

    Function AnyPlayerHaveRingOfLuck: Bool()
        Debug.TraceNotImplemented("Tile.AnyPlayerHaveRingOfLuck()")
    End Function

    Function AnyPlayerHaveSunglasses: Bool()
        Debug.TraceNotImplemented("Tile.AnyPlayerHaveSunglasses()")
    End Function

    Function AnyPlayerHaveZoneMap: Bool()
        Debug.TraceNotImplemented("Tile.AnyPlayerHaveZoneMap()")
    End Function

    Function CheckRingOfShadows: Bool()
        Debug.TraceNotImplemented("Tile.CheckRingOfShadows()")
    End Function

    Function CleanUpPendingTiles: Void()
        Debug.TraceNotImplemented("Tile.CleanUpPendingTiles()")
    End Function

    Function GenerateWireConnections: Void()
        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsWire()
                    tile.wireMask = 0

                    For Local i := 0 To 4
                        Local adjacentLocation := tile.GetLocation().Add(Util.GetPointFromDir(i))
                        Local adjacentTile := Level.GetTileAt(adjacentLocation.x, adjacentLocation.y)
                        If adjacentTile
                            Local adjacentTileType := adjacentTile.GetType()
                            If adjacentTileType = TileType.Wire Or
                               adjacentTileType = TileType.WiredDoor Or
                               adjacentTile.IsExit()
                               tile.AddWireConnection(i)
                            End If
                        End If
                    End For
                End If
            End For
        End For
    End Function

    Function IsNearNightmare: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Tile.IsNearNightmare()")
    End Function

    Function MoveAll: Void()
        Debug.TraceNotImplemented("Tile.MoveAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, typeVal: Int, pending: Bool, tilesetOvrd: Int)
        Super.New()

        Tile.totalTilesCreatedOrDestroyed += 1

        If typeVal = TileType.Tar
            Level.isAnyTar = True
        End If

        Local type := -1
        If Not pending
            Local existingTile := Level.GetTileAt(xVal, yVal)
            If existingTile
                type = existingTile.GetType()
                existingTile.Die()
            End If
        End If

        Self.type = typeVal
        Self.tilesetOverride = tilesetOvrd
        Self.x = xVal
        Self.y = yVal

        If tilesetOvrd = -1
            Self.tilesetOverride = Self.CalcTileset()
        End If

        Local image := New Sprite()
        Local image2: Sprite

        If Not Self.IsWall(False, False, False, False)
            If Self.IsFloor()
                Select Self.type
                    Case TileType.Stairs
                        image.InitSprite("level/stairs.png", 0, 0, 1, Image.DefaultFlags)
                    Case TileType.LockedStairs
                        image.InitSprite("level/stairs_locked.png", 0, 0, 1, Image.DefaultFlags)
                    Case TileType.LockedStairs3Diamonds
                        image.InitSprite("level/stairs_locked_diamond3.png", 0, 0, 1, Image.DefaultFlags)
                    Case TileType.LockedStairs9Diamonds
                        image.InitSprite("level/stairs_locked_diamond9.png", 0, 0, 1, Image.DefaultFlags)
                    Case TileType.LockedStairsMiniboss
                        image.InitSprite("level/stairs_locked_miniboss.png", 0, 0, 1, Image.DefaultFlags)
                    Case TileType.ShopFloor
                        image.InitSprite("level/TEMP_shop_floor.png", 0, 0, 3, 6)
                    Default
                        If Self.type <= 5
                            image.InitSprite("level/TEMP_floor_water.png", 0, 0, 3, 6)
                        Else
                            Select Self.type
                                Case TileType.HotCoal
                                    image.InitSprite("level/TEMP_floor_hotcoal.png", 0, 0, 3, 6)
                                Case TileType.Ice
                                    image.InitSprite("level/TEMP_floor_ice.png", 0, 0, 3, 6)
                                Case TileType.Crystal
                                    image.InitSprite("level/TEMP_floor_crystal.png", 26, 26, 6, 6)
                                Case TileType.Ooze
                                    image.InitSprite("level/TEMP_floor_magnetic.png", 26, 26, 3, 6)
                                Case TileType.Lava
                                    image.InitSprite("level/floor_lava.png", 26, 26, 15, 6)
                                    Self.tarAnimCounter = Util.RndIntRange(0, 10000, False, -1)
                                    Self.tarAnimDelay = Util.RndIntRange(0, 200, False, -1)
                                Case TileType.Geyser
                                    image.InitSprite("level/TEMP_floor_geyser.png", 0, 0, 3, 6)
                                Case TileType.Tar
                                    image.InitSprite("level/floor_tar.png", 26, 26, 18, 6)
                                    Self.tarAnimCounter = Util.RndIntRange(0, 10000, False, -1)
                                    Self.tarAnimDelay = Util.RndIntRange(0, 200, False, -1)
                                Default
                                    Select Self.type
                                        Case TileType.LobbyUpgradesFloor
                                            image.InitSprite("level/TEMP_npc_floor.png", 0, 0, 3, 6)
                                        Case TileType.RisingFloor
                                            image.InitSprite("level/floor_rising.png", 0, 0, 3, 6)
                                            Tile.floorRisingList.AddLast(Self)
                                        Case TileType.RecededFloor
                                            image.InitSprite("level/floor_receded.png", 0, 0, 3, 6)
                                            Tile.floorRecededList.AddLast(Self)
                                        Default
                                            image = Self.LoadFloor()
                                    End Select
                            End Select
                        End If
                End Select

                image.SetZ(-1001.0)
            Else
                'Goto LABEL_29
            End If
        End If

        Select Self.type
            Case TileType.ShopWall
                image.InitSprite("level/wall_shop_crypt.png", 0, 0, 1, Image.DefaultFlags)
                Self.health = 4
            Case TileType.CrackedShopWall
                image.InitSprite("level/wall_shop_crypt_cracked.png", 0, 0, 1, Image.DefaultFlags)
                Self.health = 4
            Case TileType.BossWall
                Select currentLevel
                    Case -490
                    Case -492
                    Case -493
                    Case -494
                    Case 5
                        If Level.isConductorLevel
                            image.InitSprite("level/conductor_wall.png", 24, 48, 5, Image.DefaultFlags)
                        Else
                            image.InitSprite("level/necrodancer_wall.png", 24, 48, 5, Image.DefaultFlags)
                        End If
                    Default
                        image.InitSprite("level/boss_wall.png", 24, 48, 5, Image.DefaultFlags)
                End Select

                Local frame := Util.RndIntRange(0, 4, False, -1)
                image.SetFrame(frame)
                Self.unbreakable = True
            Case TileType.UnbreakableWall
                image.InitSprite("level/wall_shop_crypt.png", 0, 0, 1, Image.DefaultFlags)
                Self.unbreakable = True
            Case TileType.IndestructibleBorder
                image.InitSprite("level/end_of_world.png", 24, 48, 8, Image.DefaultFlags)
                Local frame := Util.RndIntRange(0, 7, False, -1)
                image.SetFrame(frame)
                Self.unbreakable = True
            ' All of these goto LABEL_87
        End Select

        If Self.IsNecrodancerPlatform()
            image.InitSprite("level/necrodancer_stage.png", 24, 61, 6, Image.DefaultFlags)
            image.SetFrame(Self.type - 112)
            Self.health = 4
            ' goto LABEL_87
        End If

        Select Self.type
            Case TileType.ConductorWallPipe1
                image.InitSprite("level/conductor_wall_pipe1.png", 24, 79, 1, Image.DefaultFlags)
                Self.unbreakable = True
            Case TileType.ConductorWallPipe2
                image.InitSprite("level/conductor_wall_pipe2.png", 24, 79, 1, Image.DefaultFlags)
                Self.unbreakable = True
            Case TileType.ConductorWallPipe3
                image.InitSprite("level/conductor_wall_pipe3.png", 24, 79, 1, Image.DefaultFlags)
                Self.unbreakable = True
            Case TileType.ConductorWallPipe4
                image.InitSprite("level/conductor_wall_pipe4.png", 24, 79, 1, Image.DefaultFlags)
                Self.unbreakable = True
            ' All of these goto LABEL_87
        End Select

        Select Self.type
            Case TileType.MetalDoor
                image2 = image
                image = Self.LoadFloor()

                Local tileLeft := Level.GetTileAt(Self.x - 1, Self.y)
                Local tileRight := Level.GetTileAt(Self.x + 1, Self.y)
                If (tileLeft And tileLeft.IsWall(False, False, False, False)) Or
                   (tileRight And tileRight.IsWall(False, False, False, False))
                    image2.InitSprite("level/door_metal_front.png", 24, 29, 4, Image.DefaultFlags)
                Else
                    image2.InitSprite("level/door_metal_side.png", 11, 39, 2, Image.DefaultFlags)
                End If
            Case TileType.WiredDoor
            Case TileType.Door
                image2 = image
                image = Self.LoadFloor()

                Local tileLeft := Level.GetTileAt(Self.x - 1, Self.y)
                Local tileRight := Level.GetTileAt(Self.x + 1, Self.y)
                If (tileLeft And tileLeft.IsWall(False, False, False, False)) Or
                   (tileRight And tileRight.IsWall(False, False, False, False))
                    image2.InitSprite("level/door_front.png", 0, 0, 1, Image.DefaultFlags)
                Else
                    image2.InitSprite("level/door_side.png", 0, 0, 1, Image.DefaultFlags)
                End If
            Case TileType.LockedDoor
                Self.health = 100

                image2 = image
                image = Self.LoadFloor()

                Local tileLeft := Level.GetTileAt(Self.x - 1, Self.y)
                Local tileRight := Level.GetTileAt(Self.x + 1, Self.y)
                If (tileLeft And tileLeft.IsWall(False, False, False, False)) Or
                   (tileRight And tileRight.IsWall(False, False, False, False))
                    image2.InitSprite("level/door_locked_front.png", 0, 0, 1, Image.DefaultFlags)
                Else
                    image2.InitSprite("level/door_locked_side.png", 0, 0, 1, Image.DefaultFlags)
                End If
            Case TileType.StoneWall
                Self.BecomeStone()
            Case TileType.CatacombWall
                Self.BecomeHarderStone()
            Default
                Self.BecomeDirt()
                ' TODO: Missing stuff here
        End Select

        Self.image = image
        Self.image2 = image2

        ' TODO: Missing stuff here

        'LABEL_118
        Self.health = False

        'LABEL_87
        If Not pending Then Self.collides = True

        'LABEL_29
        If image Then image.SetAlphaValue(0.0)
        If image2 Then image2.SetAlphaValue(0.0)

        ' TODO: Missing stuff here

        If Self.type = TileType.ConductorWirePhase1
            Self.LoadWireImages("level/wire_phase1_conductor.png", 1)
        End If

        'LABEL_35
        If Self.type = TileType.ConductorWirePhase2
            Self.LoadWireImages("level/wire_phase2_conductor.png", 2)
        End If

        'LABEL_37
        If Self.IsDoor()
            Self.image.SetZ(-1001.0)
            Self.image2.SetZOff(8.0)
        Else
            Self.image.SetZOff(8.0)
        End If

        Local xImage := New Sprite()
        xImage.InitSprite("level/floor_x.png", 0, 0, 1, Image.DefaultFlags)
        xImage.SetZ(-901.0)
        Self.xImage = image

        Local tiles := Level.tiles
        If pending
            tiles = Level.pendingTiles
            Tile.pendingTilesList.AddLast(Self)
        End If

        If Not tiles.Contains(Self.x)
            tiles.Set(Self.x, New IntMap<Tile>())
        End If
        tiles.Get(Self.x).Set(Self.y, Self)
    End Method

    Field type: Int
    Field tilesetOverride: Int = -1
    Field isCracked: Bool
    Field torchDir: Int
    Field image: Sprite
    Field textLabel: Sprite
    Field textLabel2: TextSprite
    Field textLabelText: String
    Field metalDoorOpenedBeat: Int = -1
    Field health: Int = 1
    Field unbreakable: Bool
    Field image1HasBeenLoadedWithFloor: Bool
    Field image2: Sprite
    Field hasResource: Int
    Field isStone: Bool
    Field tarAnimCounter: Int
    Field tarAnimDelay: Int
    Field imageWireSilhouette: Sprite
    Field imageWire: Sprite
    Field imageWireFlash: Sprite
    Field wireFlashDelay: Int = -1
    Field wireFlashAnimDelay: Int = -1
    Field xImage: Sprite
    Field textLabelOffX: Int
    Field textLabelOffY: Int
    Field textLabelDisplayDistance: Float
    Field textLabelFlash: Bool
    Field wireMask: Int
    Field activatedConductorWire: Bool
    Field magicBarrier: Bool
    Field constAlpha: Float
    Field trigger: Int
    Field lightValueCached: Float = -1.0
    Field lightValueFrameNum: Int = -1
    Field hasBeenSeen: Bool
    Field TORCH_LIGHT_MIN: Int = 0
    Field TORCH_LIGHT_MAX: Int = 3
    Field torchImage: Sprite
    Field animateTorch: Bool
    Field torchOffX: Int
    Field torchOffY: Int
    Field triggerDoor: Int
    Field pickaxedNumTimes: Int
    Field triggerDig: Int
    Field wasInLOS: Bool
    Field flyawayText: String
    Field floorOverlayImage: Sprite
    Field playerWasOnTileAtBeat: Int = -1
    Field cachedLOS: Bool
    Field cachedLOSFrame: Int = -1
    Field cachedTrueLOS: Bool
    Field cachedTrueLOSFrame: Int = -1
    Field risingTriggered: Bool
    Field recedeTimer: Int = 2
    Field textLabelFlashDuration: Int
    Field extraImage: Sprite
    Field extraImageOffX: Int
    Field extraImageOffY: Int
    Field grassValue: Float
    Field diamondSparkleDelay: Int = -1
    Field image2XOff: Int
    Field image2YOff: Int
    Field floorOverlayImageXOff: Int
    Field floorOverlayImageYOff: Int
    Field playerWasOnTileLastFrame: Bool
    Field wireXOff: Int
    Field wireYOff: Int
    Field doorHorizontal: Bool = True
    Field nextEruptionBeat: Int
    Field triggerPlayer: Player
    Field torchFlickerNext: Int
    Field constLightValueCached: Float = -1.0

    Field hasTorch: Bool

    Method AddFloorOverlayImage: Void(imageName: String)
        Debug.TraceNotImplemented("Tile.AddFloorOverlayImage()")
    End Method

    Method AddTextLabel: Void(filename: String, tmpXOff: Int, tmpYOff: Int, displayD: Float, flash: Bool, textString: Bool)
        Debug.TraceNotImplemented("Tile.AddTextLabel()")
    End Method

    Method AddTorch: Void()
        Debug.TraceNotImplemented("Tile.AddTorch()")
    End Method

    Method AddTorch2: Void()
        Debug.TraceNotImplemented("Tile.AddTorch2()")
    End Method

    Method AddWireConnection: Void(dir: Int)
        Debug.TraceNotImplemented("Tile.AddWireConnection()")
    End Method

    Method BecomeBombWall: Void()
        Debug.TraceNotImplemented("Tile.BecomeBombWall()")
    End Method

    Method BecomeCracked: Void()
        Debug.TraceNotImplemented("Tile.BecomeCracked()")
    End Method

    Method BecomeDarkShopWall: Void(spritePath: Int)
        Debug.TraceNotImplemented("Tile.BecomeDarkShopWall()")
    End Method

    Method BecomeDiamond: Void()
        Debug.TraceNotImplemented("Tile.BecomeDiamond()")
    End Method

    Method BecomeDirt: Void()
        Debug.TraceNotImplemented("Tile.BecomeDirt()")
    End Method

    Method BecomeHarderStone: Void()
        Debug.TraceNotImplemented("Tile.BecomeHarderStone()")
    End Method

    Method BecomeStone: Void()
        Debug.TraceNotImplemented("Tile.BecomeStone()")
    End Method

    Method BecomeUnbreakable: Void()
        Debug.TraceNotImplemented("Tile.BecomeUnbreakable()")
    End Method

    Method CalcTileset: Int()
        If Self.type = TileType.BossFloor Then Return 5

        If controller_game.currentLevel = 4 Or
           controller_game.currentLevel = 5 Or
           (controller_game.currentLevel >= -500 And controller_game.currentLevel <= -490)
            If Level.bossNumber = 9 Then Return 0

            Return 5
        End If

        Select controller_game.currentZone
            Case 2
                Return controller_game.currentZone - 1
            Case 3
                If ((Self.x * Level.zone3DividingLineX) - (Self.y * Level.zone3DividingLineY) > 0)
                    Return 3
                End If

                Return 2
            Case 4
                Return 4
            Case 5
                Return 6
        End Select

        Return 0
    End Method

    Method CalculateTileAlpha: Float()
        Debug.TraceNotImplemented("Tile.CalculateTileAlpha()")
    End Method

    Method CalculateTileLightValue: Float(forVision: Bool)
        Debug.TraceNotImplemented("Tile.CalculateTileLightValue()")
    End Method

    Method ClearTextLabel: Void()
        If Self.textLabel
            Self.textLabel.DiscardTempImage()
            Self.textLabel = Null
        End If

        If Self.textLabel2
            Self.textLabel2.Discard()
            Self.textLabel2 = Null
        End If

        Self.textLabelText = ""
    End Method

    Method DarkenShopWall: Void()
        Debug.TraceNotImplemented("Tile.DarkenShopWall()")
    End Method

    Method Die: Void()
        Tile.floorRisingList.RemoveEach(Self)
        Tile.floorRecededList.RemoveEach(Self)

        If Not Self.dead
            Tile.totalTilesCreatedOrDestroyed += 1
            Self.collides = False
            Self.ClearTextLabel()

            Super.Die()
        End If
    End Method

    Method GetCurrentAlpha: Float()
        Debug.TraceNotImplemented("Tile.GetCurrentAlpha()")
    End Method

    Method GetNumWireConnections: Int()
        Debug.TraceNotImplemented("Tile.GetNumWireConnections()")
    End Method

    Method GetTileset: Int()
        Return Self.tilesetOverride
    End Method

    Method GetType: Int()
        Return Self.type
    End Method

    Method GetZone2Wall: Object()
        Debug.TraceNotImplemented("Tile.GetZone2Wall()")
    End Method

    Method GetZone3Wall: Object()
        Debug.TraceNotImplemented("Tile.GetZone3Wall()")
    End Method

    Method GetZone4Wall: Object()
        Debug.TraceNotImplemented("Tile.GetZone4Wall()")
    End Method

    Method GetZone5Wall: Object()
        Debug.TraceNotImplemented("Tile.GetZone5Wall()")
    End Method

    Method HasTileBeenSeen: Bool()
        Debug.TraceNotImplemented("Tile.HasTileBeenSeen()")
    End Method

    Method HasTorch: Bool()
        Return Not (Self.torchDir = 0)
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Tile.Hit()")
    End Method

    Method IsConductorWall: Bool()
        Return (TileType.ConductorWallPipe1 <= Self.type) And (Self.type <= TileType.ConductorWallPipe4)
    End Method

    Method IsDirt: Bool()
        If Self.IsDoor() Then Return False

        Return Not Self.isStone
    End Method

    Method IsDoor: Bool()
        Select Self.type
            Case TileType.WiredDoor
            Case TileType.Door
            Case TileType.LockedDoor
                Return True
            Case TileType.MetalDoor
                Return Not Self.IsMetalDoorOpen()
        End Select

        Return False
    End Method

    Method IsEarth: Bool()
        Return Self.type = TileType.Earth
    End Method

    Method IsExit: Bool()
        Select Self.type
            Case TileType.LockedStairs
            Case TileType.Stairs
            Case TileType.LockedStairsMiniboss
            Case TileType.LockedStairs3Diamonds
            Case TileType.LockedStairs9Diamonds
                Return True
        End Select

        Return False
    End Method

    Method IsFloor: Bool()
        If Self.type = TileType.MetalDoor And Self.IsMetalDoorOpen()
            Return True
        End If

        Return Self.type <= 24 ' Max index of floor tiles
    End Method

    Method IsInAnyPlayerLineOfSight: Bool()
        Debug.TraceNotImplemented("Tile.IsInAnyPlayerLineOfSight()")
    End Method

    Method IsInAnyPlayerTrueLineOfSight: Bool()
        Debug.TraceNotImplemented("Tile.IsInAnyPlayerTrueLineOfSight()")
    End Method

    Method IsMetalDoorOpen: Bool()
        Return Self.metalDoorOpenedBeat <> -1
    End Method

    Method IsNearNightmare: Bool()
        Debug.TraceNotImplemented("Tile.IsNearNightmare()")
    End Method

    Method IsNecrodancerPlatform: Bool()
        Select Self.type
            Case TileType.NecroDancerStageGreen
            Case TileType.NecroDancerStageTurquoise
            Case TileType.NecroDancerStageCyan
            Case TileType.NecroDancerSpeaker1
            Case TileType.NecroDancerSpeaker2
            Case TileType.NecroDancerSpeaker3
                Return True
        End Select

        Return False
    End Method

    Method IsNormalFloor: Bool()
        Select Self.type
            Case TileType.Floor
            Case TileType.CorridorFloor
            Case TileType.BossFloor
            Case TileType.Floor4
            Case TileType.ShopFloor
                Return True
            Case TileType.MetalDoor
                Return Self.IsMetalDoorOpen()
        End Select

        Return False
    End Method

    Method IsShopWall: Bool()
        Select Self.type
            Case TileType.CrackedShopWall
            Case TileType.ShopWall
                Return True
        End Select

        Return False
    End Method

    Method IsStairs: Bool()
        Select Self.type
            Case TileType.LockedStairs
            Case TileType.Stairs
            Case TileType.LockedStairsMiniboss
            Case TileType.LockedStairs3Diamonds
            Case TileType.LockedStairs9Diamonds
                Return True
        End Select

        Return False
    End Method

    Method IsTileset: Bool(t: Int)
        Return Self.GetTileset() = t
    End Method

    Method IsVisible: Bool()
        Debug.TraceNotImplemented("Tile.IsVisible()")
    End Method

    Method IsWall: Bool(nonCorridor: Bool, destructibleOnly: Bool, forVision: Bool, torchlessOnly: Bool)
        If destructibleOnly
            Select Self.type
                Case TileType.IndestructibleBorder
                Case TileType.Door
                Case TileType.WiredDoor
                Case TileType.LockedDoor
                Case TileType.MetalDoor
                    Return False
                Default
                    If Self.IsShopWall() Then Return False
            End Select
        End If

        If nonCorridor And Self.type = TileType.CorridorDirtWall
            Return False
        End If

        If torchlessOnly
            If Self.HasTorch() Or
               Self.IsDoor() Or
               Trap.GetTrapAt(Self.x, Self.y)
                Return False
            End If
        End If

        If forVision
            Select Self.type
                Case TileType.NecroDancerStageGreen
                Case TileType.NecroDancerStageTurquoise
                Case TileType.NecroDancerStageCyan
                    Return False
            End Select
        End If

        If Self.type = TileType.MetalDoor And Self.IsMetalDoorOpen()
            Return False
        End If

        Return 100 <= Self.type And Self.type <= 123
    End Method

    Method IsWire: Bool()
        Select Self.type
            Case TileType.Wire
            Case TileType.WiredDoor
                Return True
        End Select

        Return False
    End Method

    Method IsZone4Dirt: Bool()
        Return Self.IsTileset(4) And Self.IsDirt()
    End Method

    Method LoadDiamond: Object()
        Debug.TraceNotImplemented("Tile.LoadDiamond()")
    End Method

    Method LoadFloor: Sprite()
        Debug.TraceNotImplemented("Tile.LoadFloor()")
    End Method

    Method LoadWireImages: Void(mainImage: String, conductorPhase: Int)
        Debug.TraceNotImplemented("Tile.LoadWireImages()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Tile.Render()")
    End Method

    Method RenderImageAs: Void(img: Object, renderAsWall: Bool, extraXOff: Int, extraYOff: Int)
        Debug.TraceNotImplemented("Tile.RenderImageAs()")
    End Method

    Method SelectWireFlip: Bool()
        Debug.TraceNotImplemented("Tile.SelectWireFlip()")
    End Method

    Method SelectWireFrame: Int()
        Debug.TraceNotImplemented("Tile.SelectWireFrame()")
    End Method

    Method SetDigTrigger: Void(triggerVal: Int)
        Debug.TraceNotImplemented("Tile.SetDigTrigger()")
    End Method

    Method SetDoorTrigger: Void(triggerVal: Int)
        Debug.TraceNotImplemented("Tile.SetDoorTrigger()")
    End Method

    Method SetTrigger: Void(triggerVal: Int)
        Debug.TraceNotImplemented("Tile.SetTrigger()")
    End Method

    Method ToggleDoor: Void()
        Debug.TraceNotImplemented("Tile.ToggleDoor()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Tile.Update()")
    End Method

    Method NoTrim: Void()
        Super.NoTrim()
        AnyPlayerHaveCompass()
        AnyPlayerHaveMonocle()
        AnyPlayerHaveRingOfLuck()
        AnyPlayerHaveSunglasses()
        AnyPlayerHaveZoneMap()
        CheckRingOfShadows()
        CleanUpPendingTiles()
        GenerateWireConnections()
        IsNearNightmare(0, 0)
        MoveAll()
        AddFloorOverlayImage(0)
        AddTextLabel(0, 0, 0, 0, False, False)
        AddTorch()
        AddTorch2()
        AddWireConnection(0)
        BecomeBombWall()
        BecomeCracked()
        BecomeDarkShopWall(0)
        BecomeDiamond()
        BecomeDirt()
        BecomeHarderStone()
        BecomeStone()
        BecomeUnbreakable()
        CalcTileset()
        CalculateTileAlpha()
        CalculateTileLightValue(False)
        ClearTextLabel()
        DarkenShopWall()
        Die()
        GetCurrentAlpha()
        GetNumWireConnections()
        GetTileset()
        GetType()
        GetZone2Wall()
        GetZone3Wall()
        GetZone4Wall()
        GetZone5Wall()
        HasTileBeenSeen()
        HasTorch()
        Hit(0, 0, 0, Null, False, 0)
        IsConductorWall()
        IsDirt()
        IsDoor()
        IsEarth()
        IsFloor()
        IsInAnyPlayerLineOfSight()
        IsInAnyPlayerTrueLineOfSight()
        IsMetalDoorOpen()
        IsNearNightmare()
        IsNecrodancerPlatform()
        IsNormalFloor()
        IsShopWall()
        IsStairs()
        IsTileset(0)
        IsVisible()
        IsWall(False, False, False, False)
        IsWire()
        IsZone4Dirt()
        LoadDiamond()
        LoadFloor()
        LoadWireImages(0, 0)
        Render()
        RenderImageAs(Null, False, 0, 0)
        SelectWireFlip()
        SelectWireFrame()
        SetDigTrigger(0)
        SetDoorTrigger(0)
        SetTrigger(0)
        ToggleDoor()
        Update()
    End Method

End Class

Class TileType

    Const Empty: Int = -1
    Const Floor: Int = 0
    Const CorridorFloor: Int = 1
    Const Stairs: Int = 2
    Const ShopFloor: Int = 3
    Const Water: Int = 4
    Const DeepWater: Int = 5
    Const LockedStairs: Int = 6
    Const LobbyUpgradesFloor: Int = 7
    Const Tar: Int = 8
    Const LockedStairsMiniboss: Int = 9
    Const HotCoal: Int = 10
    Const Ice: Int = 11
    Const Crystal: Int = 12
    Const Geyser: Int = 13
    Const BossFloor: Int = 14
    Const LockedStairs3Diamonds: Int = 15
    Const LockedStairs9Diamonds: Int = 16
    Const Ooze: Int = 17
    Const Lava: Int = 18
    Const Floor4: Int = 19
    Const Wire: Int = 20
    Const RisingFloor: Int = 21
    Const RecededFloor: Int = 22
    Const ConductorWirePhase1: Int = 23
    Const ConductorWirePhase2: Int = 24
    Const Unknown98: Int = 98
    Const DirtWall: Int = 100
    Const CorridorDirtWall: Int = 101
    Const IndestructibleBorder: Int = 102
    Const Door: Int = 103
    Const ShopWall: Int = 104
    Const UnbreakableWall: Int = 105
    Const LockedDoor: Int = 106
    Const StoneWall: Int = 107
    Const CatacombWall: Int = 108
    Const BossWall: Int = 109
    Const CrackedShopWall: Int = 110
    Const MetalDoor: Int = 111
    Const NecroDancerStageGreen: Int = 112
    Const NecroDancerStageTurquoise: Int = 113
    Const NecroDancerStageCyan: Int = 114
    Const NecroDancerSpeaker1: Int = 115
    Const NecroDancerSpeaker2: Int = 116
    Const NecroDancerSpeaker3: Int = 117
    Const WiredDoor: Int = 118
    Const Earth: Int = 119
    Const ConductorWallPipe1: Int = 120
    Const ConductorWallPipe2: Int = 121
    Const ConductorWallPipe3: Int = 122
    Const ConductorWallPipe4: Int = 123

End Class
