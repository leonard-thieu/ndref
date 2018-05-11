'Strict

Import monkey.list
Import mojo.graphics
Import controller_game
Import entity
Import level
Import level_object
Import logger
Import player_class
Import renderableobject
Import sprite
Import textsprite
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
        While Tile.pendingTilesList.Count() > 0
            Tile.pendingTilesList.RemoveFirst().Die()
        End While
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
        Debug.TraceNotImplemented("Tile.IsNearNightmare(Int, Int)")
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

        Local existingTileType := TileType.Empty
        If Not pending
            Local existingTile := Level.GetTileAt(xVal, yVal)
            If existingTile <> Null
                existingTileType = existingTile.GetType()
                existingTile.Die()
            End If
        End If

        Self.x = xVal
        Self.y = yVal
        Self.type = typeVal
        Self.tilesetOverride = tilesetOvrd

        If tilesetOvrd = TilesetType.None
            Self.tilesetOverride = Self.CalcTileset()
        End If

        If Self.IsFloor()
            Select Self.type
                Case TileType.Stairs
                    Self.image = New Sprite("level/stairs.png", 0, 0, 1, Image.DefaultFlags)
                Case TileType.LockedStairs
                    Self.image = New Sprite("level/stairs_locked.png", 0, 0, 1, Image.DefaultFlags)
                Case TileType.LockedStairs3Diamonds
                    Self.image = New Sprite("level/stairs_locked_diamond3.png", 0, 0, 1, Image.DefaultFlags)
                Case TileType.LockedStairs9Diamonds
                    Self.image = New Sprite("level/stairs_locked_diamond9.png", 0, 0, 1, Image.DefaultFlags)
                Case TileType.LockedStairsMiniboss
                    Self.image = New Sprite("level/stairs_locked_miniboss.png", 0, 0, 1, Image.DefaultFlags)
                Case TileType.ShopFloor
                    Self.image = New Sprite("level/TEMP_shop_floor.png", 0, 0, 3, Image.XYPadding)
                Case TileType.Water,
                     TileType.DeepWater
                    Self.image = New Sprite("level/TEMP_floor_water.png", 0, 0, 3, Image.XYPadding)
                Case TileType.HotCoal
                    Self.image = New Sprite("level/TEMP_floor_hotcoal.png", 0, 0, 3, Image.XYPadding)
                Case TileType.Ice
                    Self.image = New Sprite("level/TEMP_floor_ice.png", 0, 0, 3, Image.XYPadding)
                Case TileType.Crystal
                    Self.image = New Sprite("level/TEMP_floor_crystal.png", 26, 26, 6, Image.XYPadding)
                Case TileType.Ooze
                    Self.image = New Sprite("level/TEMP_floor_magnetic.png", 26, 26, 3, Image.XYPadding)
                Case TileType.Lava
                    Self.image = New Sprite("level/floor_lava.png", 26, 26, 15, Image.XYPadding)
                    Self.tarAnimCounter = Util.RndIntRangeFromZero(10000, False)
                    Self.tarAnimDelay = Util.RndIntRangeFromZero(200, False)
                Case TileType.Geyser
                    Self.image = New Sprite("level/TEMP_floor_geyser.png", 0, 0, 3, Image.XYPadding)
                Case TileType.Tar
                    Self.image = New Sprite("level/floor_tar.png", 26, 26, 18, Image.XYPadding)
                    Self.tarAnimCounter = Util.RndIntRangeFromZero(10000, False)
                    Self.tarAnimDelay = Util.RndIntRangeFromZero(200, False)
                Case TileType.LobbyUpgradesFloor
                    Self.image = New Sprite("level/TEMP_npc_floor.png", 0, 0, 3, Image.XYPadding)
                Case TileType.RisingFloor
                    Self.image = New Sprite("level/floor_rising.png", 0, 0, 3, Image.XYPadding)
                    Tile.floorRisingList.AddLast(Self)
                Case TileType.RecededFloor
                    Self.image = New Sprite("level/floor_receded.png", 0, 0, 3, Image.XYPadding)
                    Tile.floorRecededList.AddLast(Self)
                Default
                    Self.image = Self.LoadFloor()
            End Select

            Self.image.SetZ(-1001.0)
        Else If Self.IsWall()
            Select Self.type
                Case TileType.ShopWall
                    Self.image = New Sprite("level/wall_shop_crypt.png", 0, 0, 1, Image.DefaultFlags)
                    Self.health = 4
                Case TileType.CrackedShopWall
                    Self.image = New Sprite("level/wall_shop_crypt_cracked.png", 0, 0, 1, Image.DefaultFlags)
                    Self.health = 4
                Case TileType.BossWall
                    If Level.IsFinalBoss()
                        If Level.isConductorLevel
                            Self.image = New Sprite("level/conductor_wall.png", 24, 48, 5, Image.DefaultFlags)
                        Else
                            Self.image = New Sprite("level/necrodancer_wall.png", 24, 48, 5, Image.DefaultFlags)
                        End If
                    Else
                        Self.image = New Sprite("level/boss_wall.png", 24, 48, 5, Image.DefaultFlags)
                    End If

                    Local frame := Util.RndIntRangeFromZero(4, False)
                    Self.image.SetFrame(frame)
                    Self.unbreakable = True
                Case TileType.UnbreakableWall
                    Self.image = New Sprite("level/wall_shop_crypt.png", 0, 0, 1, Image.DefaultFlags)
                    Self.unbreakable = True
                Case TileType.IndestructibleBorder
                    Self.image = New Sprite("level/end_of_world.png", 24, 48, 8, Image.DefaultFlags)
                    Local frame := Util.RndIntRangeFromZero(7, False)
                    Self.image.SetFrame(frame)
                    Self.unbreakable = True
                Case TileType.ConductorWallPipe1
                    Self.image = New Sprite("level/conductor_wall_pipe1.png", 24, 79, 1, Image.DefaultFlags)
                    Self.unbreakable = True
                Case TileType.ConductorWallPipe2
                    Self.image = New Sprite("level/conductor_wall_pipe2.png", 24, 79, 1, Image.DefaultFlags)
                    Self.unbreakable = True
                Case TileType.ConductorWallPipe3
                    Self.image = New Sprite("level/conductor_wall_pipe3.png", 24, 79, 1, Image.DefaultFlags)
                    Self.unbreakable = True
                Case TileType.ConductorWallPipe4
                    Self.image = New Sprite("level/conductor_wall_pipe4.png", 24, 79, 1, Image.DefaultFlags)
                    Self.unbreakable = True
                Case TileType.Door,
                     TileType.WiredDoor
                    Self.image = Self.LoadFloor()

                    If Level.IsWallAt(Self.x - 1, Self.y, False, False) Or
                       Level.IsWallAt(Self.x + 1, Self.y, False, False)
                        Self.image2 = New Sprite("level/door_front.png", 0, 0, 1, Image.DefaultFlags)
                    Else
                        Self.image2 = New Sprite("level/door_side.png", 0, 0, 1, Image.DefaultFlags)
                    End If

                    Self.health = 0
                Case TileType.LockedDoor
                    Self.image = Self.LoadFloor()

                    If Level.IsWallAt(Self.x - 1, Self.y, False, False) Or
                       Level.IsWallAt(Self.x + 1, Self.y, False, False)
                        Self.image2 = New Sprite("level/door_locked_front.png", 0, 0, 1, Image.DefaultFlags)
                    Else
                        Self.image2 = New Sprite("level/door_locked_side.png", 0, 0, 1, Image.DefaultFlags)
                    End If

                    Self.health = 100
                Case TileType.MetalDoor
                    Self.image = Self.LoadFloor()

                    If Level.IsWallAt(Self.x - 1, Self.y, False, False) Or
                       Level.IsWallAt(Self.x + 1, Self.y, False, False)
                        Self.image2 = New Sprite("level/door_metal_front.png", 24, 29, 4, Image.DefaultFlags)
                    Else
                        Self.image2 = New Sprite("level/door_metal_side.png", 11, 39, 2, Image.DefaultFlags)
                    End If

                    Self.health = 0
                Case TileType.StoneWall
                    Self.BecomeStone()
                Case TileType.CatacombWall
                    Self.BecomeHarderStone()
                Case TileType.Earth
                    Self.BecomeDirt()

                    Self.health = 0
                Case TileType.CorridorDirtWall
                    Self.BecomeDirt()

                    Select existingTileType
                        Case TileType.StoneWall
                            Self.BecomeStone()
                        Case TileType.CatacombWall
                            Self.BecomeHarderStone()
                    End Select
                Default
                    If Self.IsNecrodancerPlatform()
                        Self.image = New Sprite("level/necrodancer_stage.png", 24, 61, 6, Image.DefaultFlags)
                        image.SetFrame(Self.type - 112)
                        Self.health = 4
                    Else
                        Self.BecomeDirt()
                    End If
            End Select

            If Not pending
                Self.collides = True
            End If
        End If

        If Self.image <> Null Then Self.image.SetAlphaValue(0.0)
        If Self.image2 <> Null Then Self.image2.SetAlphaValue(0.0)

        If Self.IsWire()
            Self.LoadWireImages("level/wire.png", 0)
        Else
            Select Self.type
                Case TileType.ConductorWirePhase1
                    Self.LoadWireImages("level/wire_phase1_conductor.png", 1)
                Case TileType.ConductorWirePhase2
                    Self.LoadWireImages("level/wire_phase2_conductor.png", 2)
            End Select
        End If

        If Self.IsDoor()
            Self.image.SetZ(-1001.0)
            Self.image2.SetZOff(8.0)
        Else If Self.IsWall()
            Self.image.SetZOff(8.0)
        End If

        Self.xImage = New Sprite("level/floor_x.png", 0, 0, 1, Image.DefaultFlags)
        Self.xImage.SetZ(-901.0)

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
    Field tilesetOverride: Int = TilesetType.None
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

    Method AddFloorOverlayImage: Void(imageName: String)
        Debug.TraceNotImplemented("Tile.AddFloorOverlayImage(String)")
    End Method

    Method AddTextLabel: Void(filename: String, tmpXOff: Int, tmpYOff: Int, displayD: Float, flash: Bool, textString: Bool)
        Debug.TraceNotImplemented("Tile.AddTextLabel(String, Int, Int, Float, Bool, Bool)")
    End Method

    Method AddTorch: Void()
        Self.lightSourceMin = Self.TORCH_LIGHT_MIN
        Self.lightSourceMax = Self.TORCH_LIGHT_MAX
        Self.torchDir = 3
        Self.lightSource = True
        Self.lightSourceBrightness = 1.0
        RenderableObject.lightSourceList.AddLast(Self)

        Local tileset := Self.GetTileset()
        If tileset = TilesetType.Zone2
            Self.torchImage = New Sprite("entities/mushroom_light.png", 24, 24, 4, Image.DefaultFlags)
            Self.torchOffX = Util.RndIntRange(-2, 2, False, -1)
            Self.torchOffY = Util.RndIntRange(-2, 2, False, -1) - 7

            If Util.RndBool(False)
                Self.torchImage.SetFrame(1)
            End If
        Else If tileset = TilesetType.Zone5 Or
                Level.isConductorLevel
            torchImage = New Sprite("level/light_bulb.png", 15, 24, 1, Image.DefaultFlags)
            Self.torchOffX = 4
            Self.torchOffY = -8
            Self.animateTorch = False
        Else
            Self.torchImage = New Sprite("level/wall_torch.png", 0, 0, 4, Image.DefaultFlags)
            Self.torchOffX = 5
            Self.torchOffY = -12
            Self.animateTorch = True
        End If

        If Util.RndBool(False)
            Self.torchImage.FlipX(True, True)
        End If

        Self.torchImage.SetAlphaValue(0.0)
        Self.torchImage.SetZOff(24.0)
    End Method

    Method AddTorch2: Void()
        Debug.TraceNotImplemented("Tile.AddTorch2()")
    End Method

    Method AddWireConnection: Void(dir: Int)
        If 0 <= dir And dir <= 3
            Self.wireMask |= 1 Shl dir
        End If
    End Method

    Method BecomeBombWall: Void()
        Debug.TraceNotImplemented("Tile.BecomeBombWall()")
    End Method

    Method BecomeCracked: Void()
        Local alpha := Self.GetCurrentAlpha()

        Select Self.type
            Case TileType.DirtWall,
                 TileType.CorridorDirtWall,
                 TileType.Earth
                Select Self.GetTileset()
                    Case TilesetType.Zone1
                        Self.image = New Sprite("level/zone1_wall_dirt_cracked.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone2
                        Self.image = New Sprite("level/zone2_wall_dirt_crack.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone3Hot
                        Self.image = New Sprite("level/zone3_wall_dirt_hot_crack.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone3Cold
                        Self.image = New Sprite("level/zone3_wall_dirt_cold_crack.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone4
                        Self.image = New Sprite("level/zone4_wall_dirt_crack.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone5
                        Self.image = New Sprite("level/zone5_wall_dirt_crack.png", 1, Image.DefaultFlags)
                End Select
            Case TileType.ShopWall
                Self.image = New Sprite("level/wall_shop_crypt_cracked.png", 1, Image.DefaultFlags)
            Case TileType.StoneWall
                Select Self.GetTileset()
                    Case TilesetType.Zone1
                        Self.image = New Sprite("level/zone1_wall_stone_cracked.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone2
                        Self.image = New Sprite("level/zone2_wall_stone_crack.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone3Hot
                        Self.image = New Sprite("level/zone3_wall_stone_hot_cracked.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone3Cold
                        Self.image = New Sprite("level/zone3_wall_stone_cold_cracked.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone4
                        Self.image = New Sprite("level/zone4_wall_rock_A_crack.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone5
                        Self.image = New Sprite("level/zone5_wall_stone_crack.png", 1, Image.DefaultFlags)
                End Select
            Case TileType.CatacombWall
                Select Self.GetTileset()
                    Case TilesetType.Zone4
                        Self.image = New Sprite("level/zone4_wall_catacomb_A_crack.png", 1, Image.DefaultFlags)
                    Case TilesetType.Zone5
                        Self.image = New Sprite("level/zone5_wall_catacomb_crack.png", 1, Image.DefaultFlags)
                    Default
                        Self.image = New Sprite("level/zone1_catacomb_cracked.png", 1, Image.DefaultFlags)
                End Select
        End Select

        Self.image.SetAlphaValue(alpha)

        If Self.IsWall() Then Self.image.SetZOff(8.0)

        Self.isCracked = True
    End Method

    Method BecomeDarkShopWall: Void(spritePath: String)
        Self.hasResource = False
        Self.health = 4

        Self.image = New Sprite(spritePath, 1, Image.DefaultFlags)
        Self.image.SetAlphaValue(0.0)
        If Self.IsWall()
            Self.image.SetZOff(8.0)
        End If
    End Method

    Method BecomeDiamond: Void()
        Self.image = Self.LoadDiamond()
        Self.image.SetAlphaValue(0.0)

        If Level.isHardcoreMode
            Self.image2 = New Sprite("items/resource_hoard_gold.png", 24, 24, 2, Image.DefaultFlags)
        Else
            Select controller_game.currentZone
                Case 1
                    Self.image2 = New Sprite("items/resource_diamond.png", 24, 24, 2, Image.DefaultFlags)
                Case 2
                    Self.image2 = New Sprite("items/resource_diamond2.png", 24, 24, 2, Image.DefaultFlags)
                Case 3
                    Self.image2 = New Sprite("items/resource_diamond3.png", 24, 24, 2, Image.DefaultFlags)
                Default
                    Self.image2 = New Sprite("items/resource_diamond4.png", 24, 24, 2, Image.DefaultFlags)
            End Select
        End If

        Self.image2.SetZOff(24.0)

        Self.health = 1
        Self.isStone = False

        If Self.IsWall()
            Self.image.SetZOff(8.0)
        End If
    End Method

    Method BecomeDirt: Void()
        Self.hasResource = False

        Local wall: Sprite
        Select Self.GetTileset()
            Case TilesetType.Zone5
                Self.image = Self.GetZone5Wall()
            Case TilesetType.Zone4
                Self.image = Self.GetZone4Wall()
            Case TilesetType.Zone3Cold,
                 TilesetType.Zone3Hot
                Self.image = Self.GetZone3Wall()
            Case TilesetType.Zone2
                Self.image = Self.GetZone2Wall()
            Default
                Self.image = Self.GetZone1Wall()
        End Select

        Self.image.SetAlphaValue(0.0)

        Self.health = 1
        Self.isStone = False
        Self.unbreakable = False

        If Self.IsWall()
            Self.image.SetZOff(8.0)
        End If
    End Method

    Method BecomeHarderStone: Void()
        Self.hasResource = False

        Select Self.GetTileset()
            Case TilesetType.Zone4
                If Util.RndBool(False)
                    Self.image = New Sprite("level/zone4_wall_catacomb_A.png", 1, Image.DefaultFlags)
                Else
                    Self.image = New Sprite("level/zone4_wall_catacomb_B.png", 1, Image.DefaultFlags)
                End If
            Case TilesetType.Zone5
                Self.image = New Sprite("level/zone5_wall_catacomb.png", 4, Image.DefaultFlags)
            Default
                If Util.RndBool(False)
                    Self.image = New Sprite("level/wall_catacomb_crypt1.png", 1, Image.DefaultFlags)
                Else
                    Self.image = New Sprite("level/wall_catacomb_crypt2.png", 1, Image.DefaultFlags)
                End If
        End Select

        Self.image.SetAlphaValue(0.0)

        Self.health = 3
        Self.isStone = True
        Self.type = TileType.CatacombWall

        If Self.IsWall() Then Self.image.SetZOff(8.0)
    End Method

    Method BecomeStone: Void()
        Self.hasResource = False

        Select Self.GetTileset()
            Case TilesetType.Zone5
                If Util.RndBool(False)
                    Self.image = New Sprite("level/zone5_wall_stone_A.png", 1, Image.DefaultFlags)
                Else
                    Self.image = New Sprite("level/zone5_wall_stone_B.png", 1, Image.DefaultFlags)
                End If
            Case TilesetType.Boss
                If Level.IsFinalBoss()
                    Self.image = New Sprite("level/necrodancer_wall.png", 24, 48, 5, Image.DefaultFlags)
                Else
                    Self.image = New Sprite("level/boss_wall.png", 24, 48, 5, Image.DefaultFlags)
                End If

                Local frame := Util.RndIntRangeFromZero(4, False)
                Self.image.SetFrame(frame)
                Self.unbreakable = True
            Case TilesetType.Zone4
                Self.image = New Sprite("level/zone4_wall_rock_A.png", 1, Image.DefaultFlags)
            Case TilesetType.Zone3Cold
                Self.image = New Sprite("level/zone3_wall_stone_cold.png", 1, Image.DefaultFlags)
            Case TilesetType.Zone3Hot
                Self.image = New Sprite("level/zone3_wall_stone_hot.png", 1, Image.DefaultFlags)
            Case TilesetType.Zone2
                Self.image = New Sprite("level/zone2_wall_stone.png", 1, Image.DefaultFlags)
            Default
                Self.image = New Sprite("level/wall_stone_crypt.png", 1, Image.DefaultFlags)
        End Select

        Self.image.SetAlphaValue(0.0)

        Self.health = 2
        Self.isStone = True
        Self.type = TileType.StoneWall

        If Self.IsWall() Then Self.image.SetZOff(8.0)
    End Method

    Method BecomeUnbreakable: Void()
        Debug.TraceNotImplemented("Tile.BecomeUnbreakable()")
    End Method

    Method CalcTileset: Int()
        If Self.type = TileType.BossFloor Then Return TilesetType.Boss

        If controller_game.currentLevel = 4 Or
           controller_game.currentLevel = 5 Or
           (controller_game.currentLevel >= -500 And controller_game.currentLevel <= -490)
            If Level.bossNumber = 9 Then Return TilesetType.Zone1

            Return TilesetType.Boss
        End If

        Select controller_game.currentZone
            Case 2
                Return TilesetType.Zone2
            Case 3
                If ((Self.x * Level.zone3DividingLineX) - (Self.y * Level.zone3DividingLineY) > 0)
                    Return TilesetType.Zone3Cold
                End If

                Return TilesetType.Zone3Hot
            Case 4
                Return TilesetType.Zone4
            Case 5
                Return TilesetType.Zone5
        End Select

        Return TilesetType.Zone1
    End Method

    Method CalculateTileAlpha: Float()
        Debug.TraceNotImplemented("Tile.CalculateTileAlpha()")
    End Method

    Method CalculateTileLightValue: Float(forVision: Bool)
        Debug.TraceNotImplemented("Tile.CalculateTileLightValue(Bool)")
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
        Select Self.GetType()
            Case TileType.ShopWall
                Self.BecomeDarkShopWall("level/wall_shop_crypt_dark.png")
            Case TileType.CrackedShopWall
                Self.BecomeDarkShopWall("level/wall_shop_crypt_dark_cracked.png")
        End Select
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
        Return Self.image.GetAlphaValue()
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

    Method GetZone1Wall: Sprite()
        Local image := New Sprite("level/wall_dirt_crypt.png", 24, 48, 16, Image.DefaultFlags)
        Local frame := Util.RndIntRangeFromZero(15, False)
        image.SetFrame(frame)

        Local randomValue := Util.RndIntRangeFromZero(10, False)
        If randomValue <= 7
            frame = Util.RndIntRangeFromZero(1, False)
            image.SetFrame(frame)
        End If

        Return image
    End Method

    Method GetZone2Wall: Sprite()
        Local image := New Sprite("level/wall_zone2.png", 24, 48, 8, Image.DefaultFlags)

        Local frameRoll := Util.RndIntRangeFromZero(100, False)
        If frameRoll <= 34
            Local frame := Util.RndIntRangeFromZero(7, False)
            image.SetFrame(frame)
        Else
            If Util.RndBool(False)
                image.SetFrame(3)
            Else
                image.SetFrame(7)
            End If
        End If

        Return image
    End Method

    Method GetZone3Wall: Sprite()
        Local wall: Sprite

        If Self.IsTileset(TilesetType.Zone3Hot)
            wall = New Sprite("level/zone3_wall_dirt_hot.png", 24, 48, 8, Image.DefaultFlags)
        Else
            wall = New Sprite("level/zone3_wall_dirt_cold.png", 24, 48, 8, Image.DefaultFlags)
        End If

        Local frame := Util.RndIntRangeFromZero(7, False)
        wall.SetFrame(frame)

        Return wall
    End Method

    Method GetZone4Wall: Sprite()
        Local zone4Wall := New Sprite("level/zone4_wall_dirt.png", 24, 48, 8, Image.DefaultFlags)

        Local frameRoll := Util.RndIntRangeFromZero(100, False)
        Local frame: Int
        If frameRoll <= 34
            frame = Util.RndIntRangeFromZero(7, False)
        Else
            frame = 7
            If Util.RndBool(False)
                frame = 0
            End If
        End If

        zone4Wall.SetFrame(frame)

        Return zone4Wall
    End Method

    Method GetZone5Wall: Sprite()
        Debug.TraceNotImplemented("Tile.GetZone5Wall()")
    End Method

    Method HasTileBeenSeen: Bool()
        Debug.TraceNotImplemented("Tile.HasTileBeenSeen()")
    End Method

    Method HasTorch: Bool()
        Return Self.torchDir <> 0
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Tile.Hit(String, Int, Int, Entity, Bool, Int)")
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
            Case TileType.WiredDoor,
                 TileType.Door,
                 TileType.LockedDoor
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
            Case TileType.LockedStairs,
                 TileType.Stairs,
                 TileType.LockedStairsMiniboss,
                 TileType.LockedStairs3Diamonds,
                 TileType.LockedStairs9Diamonds
                Return True
        End Select

        Return False
    End Method

    Method IsFloor: Bool()
        If Self.type = TileType.MetalDoor And
           Self.IsMetalDoorOpen()
            Return True
        End If

        Return 0 <= Self.type And Self.type <= 24
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
            Case TileType.NecroDancerStageGreen,
                 TileType.NecroDancerStageTurquoise,
                 TileType.NecroDancerStageCyan,
                 TileType.NecroDancerSpeaker1,
                 TileType.NecroDancerSpeaker2,
                 TileType.NecroDancerSpeaker3
                Return True
        End Select

        Return False
    End Method

    Method IsNormalFloor: Bool()
        Select Self.type
            Case TileType.Floor,
                 TileType.CorridorFloor,
                 TileType.BossFloor,
                 TileType.SecretFloor,
                 TileType.ShopFloor
                Return True
            Case TileType.MetalDoor
                Return Self.IsMetalDoorOpen()
        End Select

        Return False
    End Method

    Method IsShopWall: Bool()
        Select Self.type
            Case TileType.CrackedShopWall,
                 TileType.ShopWall
                Return True
        End Select

        Return False
    End Method

    Method IsStairs: Bool()
        Select Self.type
            Case TileType.LockedStairs,
                 TileType.Stairs,
                 TileType.LockedStairsMiniboss,
                 TileType.LockedStairs3Diamonds,
                 TileType.LockedStairs9Diamonds
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

    Method IsWall: Bool()
        Return Self.IsWall(False, False, False, False)
    End Method

    Method IsWall: Bool(nonCorridor: Bool, destructibleOnly: Bool, forVision: Bool, torchlessOnly: Bool)
        If destructibleOnly
            Select Self.type
                Case TileType.IndestructibleBorder,
                     TileType.Door,
                     TileType.WiredDoor,
                     TileType.LockedDoor,
                     TileType.MetalDoor
                    Return False
                Default
                    If Self.IsShopWall() Then Return False
            End Select
        End If

        If nonCorridor And
           Self.type = TileType.CorridorDirtWall
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
                Case TileType.NecroDancerStageGreen,
                     TileType.NecroDancerStageTurquoise,
                     TileType.NecroDancerStageCyan
                    Return False
            End Select
        End If

        If Self.type = TileType.MetalDoor And
           Self.IsMetalDoorOpen()
            Return False
        End If

        Return 100 <= Self.type And Self.type <= 123
    End Method

    Method IsWire: Bool()
        Select Self.type
            Case TileType.Wire,
                 TileType.WiredDoor
                Return True
        End Select

        Return False
    End Method

    Method IsZone4Dirt: Bool()
        Return Self.IsTileset(TilesetType.Zone4) And Self.IsDirt()
    End Method

    Method LoadDiamond: Sprite()
        Self.hasResource = True

        Select Self.GetTileset()
            Case TilesetType.Zone2
                Const frameCount := 3
                Local index := Util.RndIntRangeFromZero(frameCount, False)

                Return New Sprite("level/wall_dirt_zone2_diamond" + (index + 1) + ".png", frameCount, Image.DefaultFlags)
            Case TilesetType.Zone3Hot
                Const frameCount := 3
                Local index := Util.RndIntRangeFromZero(frameCount, False)

                Return New Sprite("level/wall_dirt_zone3HOT_diamond" + (index + 1) + ".png", frameCount, Image.DefaultFlags)
            Case TilesetType.Zone3Cold
                Const frameCount := 3
                Local index := Util.RndIntRangeFromZero(frameCount, False)

                Return New Sprite("level/wall_dirt_zone3cold_diamond" + (index + 1) + ".png", frameCount, Image.DefaultFlags)
            Case TilesetType.Zone4
                Const frameCount := 3
                Local index := Util.RndIntRangeFromZero(frameCount, False)

                Return New Sprite("level/wall_dirt_zone4_diamond" + (index + 1) + ".png", frameCount, Image.DefaultFlags)
            Case TilesetType.Zone5
                Const frameCount := 3
                Local index := Util.RndIntRangeFromZero(frameCount, False)

                Return New Sprite("level/wall_dirt_zone5_diamond" + (index + 1) + ".png", frameCount, Image.DefaultFlags)
        End Select

        Const frameCount := 3
        Local index := Util.RndIntRangeFromZero(frameCount, False)

        Return New Sprite("level/wall_dirt_crypt_diamond" + (index + 1) + ".png", frameCount, Image.DefaultFlags)
    End Method

    Method LoadFloor: Sprite()
        Self.image1HasBeenLoadedWithFloor = True

        Select Self.GetTileset()
            Case TilesetType.Zone2
                If Util.RndBool(False)
                    Return New Sprite("level/zone2_floorA.png", 26, 26, 12, Image.XYPadding)
                Else
                    Return New Sprite("level/zone2_floorB.png", 26, 26, 12, Image.XYPadding)
                End If
            Case TilesetType.Zone3Hot
                Return New Sprite("level/zone3_floor.png", 26, 26, 6, Image.XYPadding)
            Case TilesetType.Zone3Cold
                Return New Sprite("level/zone3_floorB.png", 26, 26, 6, Image.XYPadding)
            Case TilesetType.Zone4
                Return New Sprite("level/zone4_floor.png", 26, 26, 6, Image.XYPadding)
            Case TilesetType.Boss
                If Level.isConductorLevel
                    Return New Sprite("level/boss_floor_conductor.png", 26, 26, 6, Image.XYPadding)
                Else
                    Return New Sprite("level/boss_floor_A.png", 26, 26, 6, Image.XYPadding)
                End If
            Case TilesetType.Zone5
                Return New Sprite("level/zone5_floor.png", 26, 26, 6, Image.XYPadding)
            Default
                If Util.RndBool(False)
                    Return New Sprite("level/floor_dirt1.png", 26, 26, 12, Image.XYPadding)
                Else
                    Return New Sprite("level/floor_dirt2.png", 26, 26, 12, Image.XYPadding)
                End If
        End Select
    End Method

    Method LoadWireImages: Void(mainImage: String, conductorPhase: Int)
        Debug.TraceNotImplemented("Tile.LoadWireImages(String, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Tile.Render()")
    End Method

    Method RenderImageAs: Void(img: Object, renderAsWall: Bool, extraXOff: Int, extraYOff: Int)
        Debug.TraceNotImplemented("Tile.RenderImageAs(Object, Bool, Int, Int)")
    End Method

    Method SelectWireFlip: Bool()
        Debug.TraceNotImplemented("Tile.SelectWireFlip()")
    End Method

    Method SelectWireFrame: Int()
        Debug.TraceNotImplemented("Tile.SelectWireFrame()")
    End Method

    Method SetDigTrigger: Void(triggerVal: Int)
        Self.triggerDig = triggerVal
    End Method

    Method SetDoorTrigger: Void(triggerVal: Int)
        Self.triggerDoor = triggerVal
    End Method

    Method SetTrigger: Void(triggerVal: Int)
        Self.trigger = triggerVal
    End Method

    Method ToggleDoor: Void()
        Debug.TraceNotImplemented("Tile.ToggleDoor()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Tile.Update()")
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
    Const SecretFloor: Int = 19
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

Class TilesetType

    Const None: Int = -1
    Const Zone1: Int = 0
    Const Zone2: Int = 1
    Const Zone3Hot: Int = 2
    Const Zone3Cold: Int = 3
    Const Zone4: Int = 4
    Const Boss: Int = 5
    Const Zone5: Int = 6

End Class
