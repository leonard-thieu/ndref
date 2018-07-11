'Strict

Import monkey.list
Import monkey.math
Import mojo.graphics
Import controller.controller_game
Import gui.flyaway
Import gui.minimap
Import enemy
Import enemy.nightmare
Import enemy.sarcophagus
Import familiar
Import level
Import audio2
Import camera
Import entity
Import item
Import logger
Import necrodancergame
Import particles
Import player_class
Import point
Import renderableobject
Import shrine
Import sprite
Import textsprite
Import tile
Import util

Class Tile Extends RenderableObject

    Global anyPlayerHaveCompassCached: Bool
    Global anyPlayerHaveCompassCachedFrame: Int
    Global anyPlayerHaveMonocleCached: Bool
    Global anyPlayerHaveMonocleCachedFrame: Int
    Global anyPlayerHaveRingOfLuckCached: Bool
    Global anyPlayerHaveRingOfLuckCachedFrame: Int
    Global anyPlayerHaveRingOfShadowsCached: Bool
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
        If Tile.anyPlayerHaveCompassCachedFrame <> necrodancergame.globalFrameCounter
            Tile.anyPlayerHaveCompassCachedFrame = necrodancergame.globalFrameCounter
            Tile.anyPlayerHaveCompassCached = Player.DoesAnyPlayerHaveItemOfType(ItemType.Compass, False)
        End If

        Return Tile.anyPlayerHaveCompassCached
    End Function

    Function AnyPlayerHaveMonocle: Bool()
        If Tile.anyPlayerHaveMonocleCachedFrame <> necrodancergame.globalFrameCounter
            Tile.anyPlayerHaveMonocleCachedFrame = necrodancergame.globalFrameCounter
            Tile.anyPlayerHaveMonocleCached = Player.DoesAnyPlayerHaveItemOfType(ItemType.Monocle, False)
        End If

        Return Tile.anyPlayerHaveMonocleCached
    End Function

    Function AnyPlayerHaveRingOfLuck: Bool()
        Debug.TraceNotImplemented("Tile.AnyPlayerHaveRingOfLuck()")
    End Function

    Function AnyPlayerHaveSunglasses: Bool()
        Debug.TraceNotImplemented("Tile.AnyPlayerHaveSunglasses()")
    End Function

    Function AnyPlayerHaveZoneMap: Bool()
        If Tile.anyPlayerHaveZoneMapCachedFrame <> necrodancergame.globalFrameCounter
            Tile.anyPlayerHaveZoneMapCachedFrame = necrodancergame.globalFrameCounter
            Tile.anyPlayerHaveZoneMapCached = Player.DoesAnyPlayerHaveItemOfType(ItemType.Map, False)
        End If

        Return Tile.anyPlayerHaveZoneMapCached
    End Function

    Function CheckRingOfShadows: Bool()
        If Tile.anyPlayerHaveRingOfShadowsCachedFrame <> necrodancergame.globalFrameCounter
            Tile.anyPlayerHaveRingOfShadowsCachedFrame = necrodancergame.globalFrameCounter
            Tile.anyPlayerHaveRingOfShadowsCached = Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfShadows, False)
        End If

        Return Tile.anyPlayerHaveRingOfShadowsCached
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
        If Nightmare.nightmare = Null
            Return False
        End If

        Return Nightmare.nightmare.NIGHTMARE_DARKNESS_RADIUS > Util.GetDist(xVal, yVal, Nightmare.nightmare.x, Nightmare.nightmare.y)
    End Function

    Function MoveAll: Void()
        Local floorsToRaise := New List<Tile>()

        For Local floorRising := EachIn Tile.floorRisingList
            If floorRising.risingTriggered
                If Not Util.IsGlobalCollisionAt(floorRising.x, floorRising.y, False, False, False, False) And
                   Not Util.IsAnyPlayerAt(floorRising.x, floorRising.y)
                    floorsToRaise.AddLast(floorRising)
                End If
            End If

            If Util.IsAnyPlayerAt(floorRising.x, floorRising.y)
                floorRising.risingTriggered = True
            End If
        End For

        For Local floorToRaise := EachIn floorsToRaise
            Audio.PlayGameSoundAt("floorRise", floorToRaise.x, floorToRaise.y, False, -1, False)
            Level.PlaceTileRemovingExistingTiles(floorToRaise.x, floorToRaise.y, TileType.StoneWall, False, TilesetType.Zone5, False)
        End For

        Local floorsToRecede := New List<Tile>()

        For Local floorReceded := EachIn Tile.floorRecededList
            If floorReceded.recedeTimer <= 0
                If Not Util.IsGlobalCollisionAt(floorReceded.x, floorReceded.y, False, False, False, False) And
                   Not Util.IsAnyPlayerAt(floorReceded.x, floorReceded.y)
                    floorsToRecede.AddLast(floorReceded)
                End If
            Else
                floorReceded.recedeTimer -= 1
            End If
        End For

        For Local floorToRecede := EachIn floorsToRecede
            Audio.PlayGameSoundAt("floorRise", floorToRecede.x, floorToRecede.y, False, -1, False)
            Level.PlaceTileRemovingExistingTiles(floorToRecede.x, floorToRecede.y, TileType.DirtWall, False, TilesetType.Zone5, False)

            Local pickup := Item.GetPickupAt(floorToRecede.x, floorToRecede.y)
            If pickup <> Null And
               Not pickup.IsItemOfType("isCoin")
                pickup.Die()
            End If
        End For
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
                    Self.image = New Sprite("level/stairs.png", 0, 0, 1)
                Case TileType.LockedStairs
                    Self.image = New Sprite("level/stairs_locked.png", 0, 0, 1)
                Case TileType.LockedStairs3Diamonds
                    Self.image = New Sprite("level/stairs_locked_diamond3.png", 0, 0, 1)
                Case TileType.LockedStairs9Diamonds
                    Self.image = New Sprite("level/stairs_locked_diamond9.png", 0, 0, 1)
                Case TileType.LockedStairsMiniboss
                    Self.image = New Sprite("level/stairs_locked_miniboss.png", 0, 0, 1)
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
                    Self.image = New Sprite("level/wall_shop_crypt.png", 0, 0, 1)
                    Self.health = 4
                Case TileType.CrackedShopWall
                    Self.image = New Sprite("level/wall_shop_crypt_cracked.png", 0, 0, 1)
                    Self.health = 4
                Case TileType.BossWall
                    If Level.IsFinalBoss()
                        If Level.isConductorLevel
                            Self.image = New Sprite("level/conductor_wall.png", 24, 48, 5)
                        Else
                            Self.image = New Sprite("level/necrodancer_wall.png", 24, 48, 5)
                        End If
                    Else
                        Self.image = New Sprite("level/boss_wall.png", 24, 48, 5)
                    End If

                    Local frame := Util.RndIntRangeFromZero(4, False)
                    Self.image.SetFrame(frame)
                    Self.unbreakable = True
                Case TileType.UnbreakableWall
                    Self.image = New Sprite("level/wall_shop_crypt.png", 0, 0, 1)
                    Self.unbreakable = True
                Case TileType.IndestructibleBorder
                    Self.image = New Sprite("level/end_of_world.png", 24, 48, 8)
                    Local frame := Util.RndIntRangeFromZero(7, False)
                    Self.image.SetFrame(frame)
                    Self.unbreakable = True
                Case TileType.ConductorWallPipe1
                    Self.image = New Sprite("level/conductor_wall_pipe1.png", 24, 79, 1)
                    Self.unbreakable = True
                Case TileType.ConductorWallPipe2
                    Self.image = New Sprite("level/conductor_wall_pipe2.png", 24, 79, 1)
                    Self.unbreakable = True
                Case TileType.ConductorWallPipe3
                    Self.image = New Sprite("level/conductor_wall_pipe3.png", 24, 79, 1)
                    Self.unbreakable = True
                Case TileType.ConductorWallPipe4
                    Self.image = New Sprite("level/conductor_wall_pipe4.png", 24, 79, 1)
                    Self.unbreakable = True
                Case TileType.Door,
                     TileType.WiredDoor
                    Self.image = Self.LoadFloor()

                    If Level.IsWallAt(Self.x - 1, Self.y, False, False) Or
                       Level.IsWallAt(Self.x + 1, Self.y, False, False)
                        Self.image2 = New Sprite("level/door_front.png", 0, 0, 1)
                    Else
                        Self.image2 = New Sprite("level/door_side.png", 0, 0, 1)
                    End If

                    Self.health = 0
                Case TileType.LockedDoor
                    Self.image = Self.LoadFloor()

                    If Level.IsWallAt(Self.x - 1, Self.y, False, False) Or
                       Level.IsWallAt(Self.x + 1, Self.y, False, False)
                        Self.image2 = New Sprite("level/door_locked_front.png", 0, 0, 1)
                    Else
                        Self.image2 = New Sprite("level/door_locked_side.png", 0, 0, 1)
                    End If

                    Self.health = 100
                Case TileType.MetalDoor
                    Self.image = Self.LoadFloor()

                    If Level.IsWallAt(Self.x - 1, Self.y, False, False) Or
                       Level.IsWallAt(Self.x + 1, Self.y, False, False)
                        Self.image2 = New Sprite("level/door_metal_front.png", 24, 29, 4)
                    Else
                        Self.image2 = New Sprite("level/door_metal_side.png", 11, 39, 2)
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
                        Self.image = New Sprite("level/necrodancer_stage.png", 24, 61, 6)
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

        Self.xImage = New Sprite("level/floor_x.png", 0, 0, 1)
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

    Method AddTextLabel: Void(filename: String, tmpXOff: Int, tmpYOff: Int, displayD: Float = 3.0, flash: Bool = False, textString: Bool = True)
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
            Self.torchImage = New Sprite("entities/mushroom_light.png", 24, 24, 4)
            Self.torchOffX = Util.RndIntRange(-2, 2, False, -1)
            Self.torchOffY = Util.RndIntRange(-2, 2, False, -1) - 7

            If Util.RndBool(False)
                Self.torchImage.SetFrame(1)
            End If
        Else If tileset = TilesetType.Zone5 Or
                Level.isConductorLevel
            torchImage = New Sprite("level/light_bulb.png", 15, 24, 1)
            Self.torchOffX = 4
            Self.torchOffY = -8
            Self.animateTorch = False
        Else
            Self.torchImage = New Sprite("level/wall_torch.png", 0, 0, 4)
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
        Self.TORCH_LIGHT_MAX *= 1.6
        
        Self.AddTorch()
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
                        Self.image = New Sprite("level/zone1_wall_dirt_cracked.png", 1)
                    Case TilesetType.Zone2
                        Self.image = New Sprite("level/zone2_wall_dirt_crack.png", 1)
                    Case TilesetType.Zone3Hot
                        Self.image = New Sprite("level/zone3_wall_dirt_hot_crack.png", 1)
                    Case TilesetType.Zone3Cold
                        Self.image = New Sprite("level/zone3_wall_dirt_cold_crack.png", 1)
                    Case TilesetType.Zone4
                        Self.image = New Sprite("level/zone4_wall_dirt_crack.png", 1)
                    Case TilesetType.Zone5
                        Self.image = New Sprite("level/zone5_wall_dirt_crack.png", 1)
                End Select
            Case TileType.ShopWall
                Self.image = New Sprite("level/wall_shop_crypt_cracked.png", 1)
            Case TileType.StoneWall
                Select Self.GetTileset()
                    Case TilesetType.Zone1
                        Self.image = New Sprite("level/zone1_wall_stone_cracked.png", 1)
                    Case TilesetType.Zone2
                        Self.image = New Sprite("level/zone2_wall_stone_crack.png", 1)
                    Case TilesetType.Zone3Hot
                        Self.image = New Sprite("level/zone3_wall_stone_hot_cracked.png", 1)
                    Case TilesetType.Zone3Cold
                        Self.image = New Sprite("level/zone3_wall_stone_cold_cracked.png", 1)
                    Case TilesetType.Zone4
                        Self.image = New Sprite("level/zone4_wall_rock_A_crack.png", 1)
                    Case TilesetType.Zone5
                        Self.image = New Sprite("level/zone5_wall_stone_crack.png", 1)
                End Select
            Case TileType.CatacombWall
                Select Self.GetTileset()
                    Case TilesetType.Zone4
                        Self.image = New Sprite("level/zone4_wall_catacomb_A_crack.png", 1)
                    Case TilesetType.Zone5
                        Self.image = New Sprite("level/zone5_wall_catacomb_crack.png", 1)
                    Default
                        Self.image = New Sprite("level/zone1_catacomb_cracked.png", 1)
                End Select
        End Select

        Self.image.SetAlphaValue(alpha)

        If Self.IsWall() Then Self.image.SetZOff(8.0)

        Self.isCracked = True
    End Method

    Method BecomeDarkShopWall: Void(spritePath: String)
        Self.hasResource = False
        Self.health = 4

        Self.image = New Sprite(spritePath, 1)
        Self.image.SetAlphaValue(0.0)
        If Self.IsWall()
            Self.image.SetZOff(8.0)
        End If
    End Method

    Method BecomeDiamond: Void()
        Self.image = Self.LoadDiamond()
        Self.image.SetAlphaValue(0.0)

        If Level.isHardcoreMode
            Self.image2 = New Sprite("items/resource_hoard_gold.png", 24, 24, 2)
        Else
            Select controller_game.currentZone
                Case 1
                    Self.image2 = New Sprite("items/resource_diamond.png", 24, 24, 2)
                Case 2
                    Self.image2 = New Sprite("items/resource_diamond2.png", 24, 24, 2)
                Case 3
                    Self.image2 = New Sprite("items/resource_diamond3.png", 24, 24, 2)
                Default
                    Self.image2 = New Sprite("items/resource_diamond4.png", 24, 24, 2)
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
                    Self.image = New Sprite("level/zone4_wall_catacomb_A.png", 1)
                Else
                    Self.image = New Sprite("level/zone4_wall_catacomb_B.png", 1)
                End If
            Case TilesetType.Zone5
                Self.image = New Sprite("level/zone5_wall_catacomb.png", 4)
            Default
                If Util.RndBool(False)
                    Self.image = New Sprite("level/wall_catacomb_crypt1.png", 1)
                Else
                    Self.image = New Sprite("level/wall_catacomb_crypt2.png", 1)
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
                    Self.image = New Sprite("level/zone5_wall_stone_A.png", 1)
                Else
                    Self.image = New Sprite("level/zone5_wall_stone_B.png", 1)
                End If
            Case TilesetType.Boss
                If Level.IsFinalBoss()
                    Self.image = New Sprite("level/necrodancer_wall.png", 24, 48, 5)
                Else
                    Self.image = New Sprite("level/boss_wall.png", 24, 48, 5)
                End If

                Local frame := Util.RndIntRangeFromZero(4, False)
                Self.image.SetFrame(frame)
                Self.unbreakable = True
            Case TilesetType.Zone4
                Self.image = New Sprite("level/zone4_wall_rock_A.png", 1)
            Case TilesetType.Zone3Cold
                Self.image = New Sprite("level/zone3_wall_stone_cold.png", 1)
            Case TilesetType.Zone3Hot
                Self.image = New Sprite("level/zone3_wall_stone_hot.png", 1)
            Case TilesetType.Zone2
                Self.image = New Sprite("level/zone2_wall_stone.png", 1)
            Default
                Self.image = New Sprite("level/wall_stone_crypt.png", 1)
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
        If controller_game.DEBUG_ALL_TILES_VISIBLE
            Return 1.0
        End If

        If Level.isLevelEditor
            Return 1.0
        End If

        If Self.IsNecrodancerPlatform()
            Return 1.0
        End If

        If Self.hasResource = 1 And
           Tile.AnyPlayerHaveMonocle()
            Return 1.0
        End If

        If Self.isCracked And
           Tile.AnyPlayerHaveMonocle() And
           Level.secretAtX = Self.x And
           Level.secretAtY = Self.y
            Return 1.0
        End If

        Local alpha := 0.36
        If Self.IsNearNightmare()
            alpha = 0.1
        End If

        If Not Self.IsInAnyPlayerLineOfSight()
            If Tile.CheckRingOfShadows() Or
               Not Self.HasTileBeenSeen()
                Return 0.0
            End If

            Return alpha
        End If

        ' TODO: Double check these.
        Local lightValue := Self.CalculateTileLightValue(False)
        Self.constAlpha = Self.CalculateTileLightValue(True)

        lightValue = math.Min(1.0, lightValue)

        If lightValue >= 0.36
            Self.hasBeenSeen = True

            Minimap.AddDirty(Self.x, Self.y)
        End If

        If alpha > lightValue And
           Self.HasTileBeenSeen()
            Return alpha
        End If

        Return lightValue
    End Method

    Method CalculateTileLightValue: Float(forVision: Bool)
        If Self.lightValueFrameNum <> necrodancergame.globalFrameCounter
            Self.lightValueFrameNum = necrodancergame.globalFrameCounter
            Self.constLightValueCached = Level.GetMapTileLightValue(Self.x, Self.y, True)
            Self.lightValueCached = Level.GetMapTileLightValue(Self.x, Self.y, False)
        End If

        If forVision
            Return Self.constLightValueCached
        End If

        Return Self.lightValueCached
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
        Local image := New Sprite("level/wall_dirt_crypt.png", 24, 48, 16)
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
        Local image := New Sprite("level/wall_zone2.png", 24, 48, 8)

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
            wall = New Sprite("level/zone3_wall_dirt_hot.png", 24, 48, 8)
        Else
            wall = New Sprite("level/zone3_wall_dirt_cold.png", 24, 48, 8)
        End If

        Local frame := Util.RndIntRangeFromZero(7, False)
        wall.SetFrame(frame)

        Return wall
    End Method

    Method GetZone4Wall: Sprite()
        Local zone4Wall := New Sprite("level/zone4_wall_dirt.png", 24, 48, 8)

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
        Local zone5Wall := New Sprite("level/zone5_wall_dirt.png", 24, 48, 13)

        Local frame: Int

        Local frameRoll := Util.RndIntRangeFromZero(100, False)
        If frameRoll <= 34
            frame = Util.RndIntRange(3, 12, False, -1)
        Else
            frame = Util.RndIntRangeFromZero(2, False)
        End If

        zone5Wall.SetFrame(frame)

        Return zone5Wall
    End Method

    Method HasTileBeenSeen: Bool()
        If Tile.AnyPlayerHaveZoneMap()
            Return True
        End If

        If Player.AnyPlayerTemporaryMapSight()
            Return True
        End If

        If Self.IsWall() And
           Entity.AnyPlayerHaveWallsTorch() And
           Self.type <> TileType.IndestructibleBorder
            Return True
        End If

        If Self.type = TileType.Stairs And
           Tile.AnyPlayerHaveCompass()
            Return True
        End If

        Return Self.hasBeenSeen
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
        If (Self.hasResource = 1 And Tile.AnyPlayerHaveMonocle()) Or
           (Self.isCracked And Level.secretAtX = Self.x And Level.secretAtY = Self.y)
            Return True
        End If

        Local hasRingOfShadows := Tile.CheckRingOfShadows()

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            
            If Not player.Perished()
                Local minVisibilitySq := 6.25
                If Not hasRingOfShadows
                    Local minVisibility := player.GetMinVisibility()
                    minVisibilitySq = minVisibility * minVisibility
                End If

                If Util.GetDistSqFromObject(Self.x, Self.y, player) <= minVisibilitySq
                    Self.cachedLOS = True
                    Self.cachedLOSFrame = necrodancergame.globalFrameCounter

                    Return True
                End If
            End If
        End For

        If Not hasRingOfShadows 
            Local isInAnyPlayerTrueLineOfSight := Self.IsInAnyPlayerTrueLineOfSight()
            Self.cachedLOS = isInAnyPlayerTrueLineOfSight
            Self.cachedLOSFrame = necrodancergame.globalFrameCounter

            Return isInAnyPlayerTrueLineOfSight
        End If

        Return False
    End Method

    Method IsInAnyPlayerTrueLineOfSight: Bool()
        Level.RefreshLineOfSightTiles()

        Return Self.cachedTrueLOS
    End Method

    Method IsMetalDoorOpen: Bool()
        Return Self.metalDoorOpenedBeat <> -1
    End Method

    Method IsNearNightmare: Bool()
        Return Tile.IsNearNightmare(Self.x, Self.y)
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
        If controller_game.DEBUG_ALL_TILES_VISIBLE
            Return True
        End If

        If Level.isLevelEditor
            Return True
        End If

        If Self.IsNecrodancerPlatform()
            Return True
        End If

        If Self.hasResource = 1 And
           Tile.AnyPlayerHaveMonocle()
            Return True
        End If

        If Self.isCracked And
           Tile.AnyPlayerHaveMonocle() And
           Level.secretAtX = Self.x And
           Level.secretAtY = Self.y
            Return True
        End If

        Return Self.constAlpha > 0.3
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

                Return New Sprite("level/wall_dirt_zone2_diamond" + (index + 1) + ".png", frameCount)
            Case TilesetType.Zone3Hot
                Const frameCount := 3
                Local index := Util.RndIntRangeFromZero(frameCount, False)

                Return New Sprite("level/wall_dirt_zone3HOT_diamond" + (index + 1) + ".png", frameCount)
            Case TilesetType.Zone3Cold
                Const frameCount := 3
                Local index := Util.RndIntRangeFromZero(frameCount, False)

                Return New Sprite("level/wall_dirt_zone3cold_diamond" + (index + 1) + ".png", frameCount)
            Case TilesetType.Zone4
                Const frameCount := 3
                Local index := Util.RndIntRangeFromZero(frameCount, False)

                Return New Sprite("level/wall_dirt_zone4_diamond" + (index + 1) + ".png", frameCount)
            Case TilesetType.Zone5
                Const frameCount := 3
                Local index := Util.RndIntRangeFromZero(frameCount, False)

                Return New Sprite("level/wall_dirt_zone5_diamond" + (index + 1) + ".png", frameCount)
        End Select

        Const frameCount := 3
        Local index := Util.RndIntRangeFromZero(frameCount, False)

        Return New Sprite("level/wall_dirt_crypt_diamond" + (index + 1) + ".png", frameCount)
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
        Select conductorPhase
            Case 0
                Self.imageWireSilhouette = New Sprite("level/wire_silhouette.png", 24, 24, 16)
                Self.imageWireSilhouette.SetZ(-1000.0)

                Self.imageWire = New Sprite(mainImage, 24, 24, 128)

                Select Util.RndIntRangeFromZero(2, False)
                    Case 0
                        Self.imageWireFlash = New Sprite("level/elec_flash_1.png", 16, 10, 6)
                    Case 1
                        Self.imageWireFlash = New Sprite("level/elec_flash_2.png", 13, 12, 6)
                    Case 2
                        Self.imageWireFlash = New Sprite("level/elec_flash_3.png", 12, 13, 6)
                End Select

                Self.imageWireFlash.SetZ(-998.0)
                Self.wireFlashAnimDelay = 3
                Self.wireFlashDelay = Util.RndIntRangeFromZero(1800, False)
            Case 1
                Self.imageWire = New Sprite(mainImage, 24, 24, 35)
            Case 2
                Self.imageWire = New Sprite(mainImage, 24, 24, 15)
        End Select

        Self.imageWire.SetAlphaValue(0.0)
        Self.imageWire.SetZ(-999.0)
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
        ' Is this value actually shared by all these branches?
        Local lightValue: Float

        Select Self.type
            Case TileType.LockedStairsMiniboss
                If Enemy.GetNumStairLockingMinibosses() = 0 Or
                   Level.pacifismModeOn
                    If Sarcophagus.sarcophagi.Count() > 0
                        ' Seems backwards?
                        If Not Util.IsCharacterActive(Character.Aria) And
                           Not Util.IsCharacterActive(Character.Coda)
                            Self.flyawayText = "|180|DESTROY THE SARCOPHAGUS!|"
                        Else
                            Level.RemoveExit(Self.x, Self.y)
                            Level.AddExit(Self.x, Self.y, LevelType.NextLevel, controller_game.currentZone)
                            
                            Self.image = New Sprite("level/stairs.png", 1)
                            Self.image.SetZ(-1001.0)
                            Self.image.SetAlphaValue(0.0)

                            Audio.PlayGameSoundAt("mini", Self.x, Self.y, False, -1, False)

                            Camera.overlayWhiteDuration = 5
                            Camera.Shake(1, Self.x, Self.y)

                            Local player1 := controller_game.players[controller_game.player1]
                            Local exitStairsUnlockedFlyaway := New Flyaway("|234|EXIT STAIRS UNLOCKED!|", player1.x, player1.y, 0, -6, True, 0.0, 0.2, True, 120)
                            exitStairsUnlockedFlyaway.CenterX()
                        End If
                    End If
                End If
            Case TileType.Geyser
                If Self.nextEruptionBeat <= Audio.GetClosestBeatNum(True)
                    lightValue = 24.0 * (Self.x + 0.5)
                    Local particleSystemY := 24.0 * (Self.y + 0.75)
                    New ParticleSystem(lightValue, particleSystemY, ParticleSystemData.GEYSER, -1, "")

                    RenderableObject.HitTile("geyser", Self.x, Self.y, 2, Direction.None, Null, False, False, False, False, False)

                    Self.nextEruptionBeat = Audio.GetClosestBeatNum(True) + 4
                End If
            Case TileType.MetalDoor
                If Self.IsMetalDoorOpen() And
                   (Self.metalDoorOpenedBeat + 2 < controller_game.lastEnemyMoveBeat) And
                   Not Util.IsGlobalCollisionAt(Self.x, Self.y, False, False, False, False) And
                   Not Util.IsAnyPlayerAt(Self.x, Self.y) And
                   Not Familiar.IsAnyAt(Self.x, Self.y)
                    Self.metalDoorOpenedBeat = -1
                    Self.collides = True

                    Tile.totalTilesCreatedOrDestroyed += 1

                    Audio.PlayGameSoundAt("metalDoorClose", Self.x, Self.y, False, -1, False)
                End If
        End Select

        If Shrine.noReturnShrineActive Or
           Self.type = TileType.Crystal
            If Shrine.noReturnShrinePlayer <> Null And
               Shrine.noReturnShrinePlayer.x = Self.x And
               Shrine.noReturnShrinePlayer.y = Self.y
                If Self.playerWasOnTileAtBeat = Audio.GetClosestBeatNum(True) - 1 And
                   Not Self.playerWasOnTileLastFrame And
                   Self.playerWasOnTileLastFrame > 0 And
                   Shrine.noReturnShrineActive
                    Shrine.noReturnShrinePlayer.Hit("SHRINE OF NO RETURN", 1, -1, Null, False, 0)
                    Shrine.noReturnShrineActive = False
                End If

                Self.playerWasOnTileAtBeat = Audio.GetClosestBeatNum(True)
                Self.playerWasOnTileLastFrame = True
            Else
                Self.playerWasOnTileLastFrame = False
            End If
        End If

        If Level.isNoReturnMode
            Local playersAt := Util.GetPlayersAt(Self.x, Self.y)
            For Local player := EachIn playersAt
                If Self.playerWasOnTileAtBeat = Audio.GetClosestBeatNum(True) - 1 And
                   Not Self.playerWasOnTileLastFrame And
                   Self.playerWasOnTileLastFrame > 0 And
                   Shrine.noReturnShrineActive
                    Shrine.noReturnShrinePlayer.Hit("NO RETURN MODE", 1, -1, Null, False, 0)
                    Shrine.noReturnShrineActive = False
                End If
            End for

            If Not playersAt.IsEmpty()
                Self.playerWasOnTileAtBeat = Audio.GetClosestBeatNum(True)
                Self.playerWasOnTileLastFrame = True
            Else
                Self.playerWasOnTileLastFrame = False
            End If
        End If

        If Self.trigger <> 0
            Local playersAt := Util.GetPlayersAt(Self.x, Self.y)
            For Local player := EachIn playersAt
                If player <> Self.triggerPlayer
                    Level.ActivateTrigger(Self.trigger, player, Null)
                End If

                Self.triggerPlayer = player
            End for

            If playersAt.IsEmpty()
                Self.triggerPlayer = Null
            End If
        End If

        If Self.torchDir <> 0
            If Self.animateTorch
                Self.torchImage.SetFrame(Audio.GetBeatAnimFrame4())
            End If

            If Shrine.darknessShrineActive
                Self.lightSourceMin = 0.01
                Self.lightSourceMax = 0.01
            Else
                If Tile.CheckRingOfShadows()
                    Self.lightSourceMin = 0.01
                    Self.lightSourceMax = 0.01
                Else
                    If Self.torchFlickerNext > necrodancergame.globalFrameCounter
                        Return
                    End If

                    Local flickerRandom := Util.RndIntRangeFromZero(11, False)
                    Self.torchFlickerNext = necrodancergame.globalFrameCounter + flickerRandom + 8

                    Local lightSourceBrightnessRandom := Util.RndFloatRange(0.0, 0.4, False)
                    Self.lightSourceBrightness = lightSourceBrightnessRandom + 0.8
                    Self.lightSourceBrightness = math.Min(1.0, Self.lightSourceBrightness)

                    Self.lightSourceMin = Self.TORCH_LIGHT_MIN

                    Local lightSourceMaxRandom := Util.RndFloatRange(0.0, 2.5, False)
                    Self.lightSourceMax = lightSourceMaxRandom + Self.TORCH_LIGHT_MAX

                    lightValue = Self.TORCH_LIGHT_MAX + 1.25
                    Self.constLightSourceMax = lightValue
                End If
            End If
        End If

        If Self.IsTileset(TilesetType.Zone2) And
           Self.image1HasBeenLoadedWithFloor
            ' TODO: Clean this up.
            If Self.wasInLOS Or
               Not Self.IsInAnyPlayerLineOfSight()
                If Self.IsInAnyPlayerLineOfSight()
                    Local grassValueBase := 1.0 * Self.grassValue
                    Self.CalculateTileLightValue(False)
                    lightValue = 1.0001 * grassValueBase
                    Self.grassValue = lightValue
                End If
            Else
                Self.CalculateTileLightValue(False)
                Self.grassValue = lightValue
            End If
        End If

        Self.wasInLOS = Self.IsInAnyPlayerLineOfSight()
        Self.CalculateTileAlpha()

        Local finalAlpha := lightValue

        If Self.IsNearNightmare() And
           Self.IsWall() And
           Self.hasBeenSeen
            finalAlpha = 0.36
        End If

        Self.image.SetAlphaTweenFromCurrent(finalAlpha, 10)

        If Self.image2 <> Null
            Self.image2.SetAlphaTweenFromCurrent(finalAlpha, 10)
        End If

        If Self.imageWire <> Null
            Local wireFrame := Self.SelectWireFrame()

            If Self.imageWireSilhouette <> Null
                Self.imageWireSilhouette.SetFrame(wireFrame)
            End If

            If Self.imageWireFlash <> Null
                Self.wireFlashDelay -= 1
                If Self.wireFlashDelay <= 0
                    Self.wireFlashAnimDelay -= 1
                    If Self.wireFlashAnimDelay <= 0
                        Self.wireFlashAnimDelay = 3

                        Local nextFrame := Self.imageWireFlash.GetFrame() + 1
                        If nextFrame < Self.imageWireFlash.GetNumFrames()
                            Self.imageWireFlash.SetFrame(nextFrame)
                        Else
                            Self.imageWireFlash.SetFrame(0)
                            Self.wireFlashDelay = Util.RndIntRange(1800, 3600, False)
                        End If
                    End If
                End If
            End If

            Local imageWireFrameFactor := 1
            Select Audio.GetBeatAnimFrame4()
                Case 1
                    imageWireFrameFactor = 2
                Case 2
                    imageWireFrameFactor = 3
                Case 3
                    imageWireFrameFactor = 0
            End Select

            Local imageWireFrame := 16 * imageWireFrameFactor + wireFrame
            Select Self.type
                Case TileType.ConductorWirePhase1
                    imageWireFrame = 28 + wireFrame
                    If Self.activatedConductorWire
                        imageWireFrame = 7 * imageWireFrameFactor + wireFrame
                    End If

                    Local wireFlip := Self.SelectWireFlip()
                    Self.imageWire.FlipX(wireFlip, True)
                Case TileType.ConductorWirePhase2
                    imageWireFrame = 3 * imageWireFrameFactor + imageWireFrameFactor
            End Select

            Self.imageWire.SetFrame(imageWireFrame)
            Self.imageWire.SetAlphaTweenFromCurrent(finalAlpha, 10)
        End If

        If Self.torchDir <> 0
            Self.torchImage.SetAlphaTweenFromCurrent(lightValue, 10)
        End If
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
