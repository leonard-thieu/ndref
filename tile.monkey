Import monkey.list
Import image
Import level_object
Import renderable_object
Import tile

Class Tile Extends RenderableObject

    Global anyPlayerHaveSunglassesCached: Bool
    Global anyPlayerHaveRingOfLuckCached: Bool
    Global anyPlayerHaveRingOfShadowsCached: Int
    Global anyPlayerHaveSunglassesCachedFrame: Int
    Global anyPlayerHaveRingOfLuckCachedFrame: Int
    Global anyPlayerHaveRingOfShadowsCachedFrame: Int
    Global ignoreFailSounds: Int
    Global playSounds: Int
    Global anyPlayerHaveCompassCached: Bool
    Global anyPlayerHaveCompassCachedFrame: Int
    Global anyPlayerHaveZoneMapCached: Bool
    Global anyPlayerHaveZoneMapCachedFrame: Int
    Global anyPlayerHaveMonocleCached: Bool
    Global anyPlayerHaveMonocleCachedFrame: Int
    Global pendingTilesList: List<Tile>
    Global totalTilesCreatedOrDestroyed: Int
    Global floorRecededList: List<Tile>
    Global floorRisingList: List<Tile>

    Function AnyPlayerHaveCompass: Bool()
    End Function

    Function AnyPlayerHaveMonocle: Bool()
    End Function

    Function AnyPlayerHaveRingOfLuck: Bool()
    End Function

    Function AnyPlayerHaveSunglasses: Bool()
    End Function

    Function AnyPlayerHaveZoneMap: Bool()
    End Function

    Function CheckRingOfShadows: Bool()
    End Function

    Function CleanUpPendingTiles: Void()
    End Function

    Function GenerateWireConnections: Void()
        For Local tilesOnXNode := EachIn Level.tiles
            For Local tileNode := EachIn tilesOnXNode.Value()
                Local tile := tileNode.Value()
                If tile.IsWire()
                    tile.field_C0 = 0

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
    End Function

    Function MoveAll: Void()
    End Function

    Function _EditorFix() End

    Method New(xVal: Int, yVal: Int, typeVal: Int, pending: Bool, tilesetOvrd: Int)
        Super.New()

        Tile.totalTilesCreatedOrDestroyed += 1

        If typeVal = 8
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
        Self.tileset = tilesetOvrd
        Self.x = xVal
        Self.y = yVal

        If tilesetOvrd = -1
            Self.tileset = Self.CalcTileset()
        End If

        Local sprite := New Sprite()
        Local sprite2: Sprite

        If Not Self.IsWall(False, False, False, False)
            If Self.IsFloor()
                Select Self.type
                    Case TileType.Stairs
                        sprite.InitSprite("level/stairs.png", 0, 0, 1, Image.DefaultFlags)
                    Case TileType.LockedStairs
                        sprite.InitSprite("level/stairs_locked.png", 0, 0, 1, Image.DefaultFlags)
                    Case TileType.LockedStairs3Diamonds
                        sprite.InitSprite("level/stairs_locked_diamond3.png", 0, 0, 1, Image.DefaultFlags)
                    Case TileType.LockedStairs9Diamonds
                        sprite.InitSprite("level/stairs_locked_diamond9.png", 0, 0, 1, Image.DefaultFlags)
                    Case TileType.LockedStairsMiniboss
                        sprite.InitSprite("level/stairs_locked_miniboss.png", 0, 0, 1, Image.DefaultFlags)
                    Case TileType.ShopFloor
                        sprite.InitSprite("level/TEMP_shop_floor.png", 0, 0, 3, 6)
                    Default
                        If Self.type <= 5
                            sprite.InitSprite("level/TEMP_floor_water.png", 0, 0, 3, 6)
                        Else
                            Select Self.type
                                Case TileType.HotCoals 
                                    sprite.InitSprite("level/TEMP_floor_hotcoal.png", 0, 0, 3, 6)
                                Case TileType.Ice
                                    sprite.InitSprite("level/TEMP_floor_ice.png", 0, 0, 3, 6)
                                Case TileType.Crystal
                                    sprite.InitSprite("level/TEMP_floor_crystal.png", 26, 26, 6, 6)
                                Case TileType.Ooze
                                    sprite.InitSprite("level/TEMP_floor_magnetic.png", 26, 26, 3, 6)
                                Case TileType.Lava
                                    sprite.InitSprite("level/floor_lava.png", 26, 26, 15, 6)
                                    Self.field_90 = Util.RndIntRange(0, 10000, False, -1)
                                    Self.field_94 = Util.RndIntRange(0, 200, False, -1)
                                Case TileType.Geyser
                                    sprite.InitSprite("level/TEMP_floor_geyser.png", 0, 0, 3, 6)
                                Case TileType.Tar
                                    sprite.InitSprite("level/floor_tar.png", 26, 26, 18, 6)
                                    Self.field_90 = Util.RndIntRange(0, 10000, False, -1)
                                    Self.field_94 = Util.RndIntRange(0, 200, False, -1)
                                Default
                                    Select Self.type
                                        Case TileType.LobbyUpgradesFloor
                                            sprite.InitSprite("level/TEMP_npc_floor.png", 0, 0, 3, 6)
                                        Case TileType.FloorRising
                                            sprite.InitSprite("level/floor_rising.png", 0, 0, 3, 6)
                                            Tile.floorRisingList.AddLast(Self)
                                        Case TileType.FloorReceding
                                            sprite.InitSprite("level/floor_receded.png", 0, 0, 3, 6)
                                            Tile.floorRecededList.AddLast(Self)
                                        Default
                                            sprite = Self.LoadFloor()
                                    End Select
                            End Select
                        End If
                End Select

                sprite.SetZ(-1001.0)
            Else
                'Goto LABEL_29
            End If
        End If

        Select Self.type
            Case TileType.ShopWall 
                sprite.InitSprite("level/wall_shop_crypt.png", 0, 0, 1, Image.DefaultFlags)
                Self.field_7C = 4
            Case TileType.CrackedShopWall 
                sprite.InitSprite("level/wall_shop_crypt_cracked.png", 0, 0, 1, Image.DefaultFlags)
                Self.field_7C = 4
            Case TileType.BossWall 
                Select currentLevel
                    Case -494
                    Case 5
                    Case -493
                    Case -492
                    Case -490
                        If Level.isConductorLevel
                            sprite.InitSprite("level/conductor_wall.png", 24, 48, 5, Image.DefaultFlags)
                        Else
                            sprite.InitSprite("level/necrodancer_wall.png", 24, 48, 5, Image.DefaultFlags)
                        End If
                    Default
                        sprite.InitSprite("level/boss_wall.png", 24, 48, 5, Image.DefaultFlags)
                End Select

                Local frame := Util.RndIntRange(0, 4, False, -1)
                sprite.SetFrame(frame)
                Self.field_80 = True
            Case TileType.UnbreakableWall 
                sprite.InitSprite("level/wall_shop_crypt.png", 0, 0, 1, Image.DefaultFlags)
                Self.field_80 = True
            Case TileType.LevelBorder
                sprite.InitSprite("level/end_of_world.png", 24, 48, 8, Image.DefaultFlags)
                Local frame := Util.RndIntRange(0, 7, False, -1)
                sprite.SetFrame(frame)
                Self.field_80 = True
            ' All of these goto LABEL_87
        End Select

        If Self.IsNecrodancerPlatform()
            sprite.InitSprite("level/necrodancer_stage.png", 24, 61, 6, Image.DefaultFlags)
            sprite.SetFrame(Self.type - 112)
            Self.field_7C = 4
            ' goto LABEL_87
        End If

        Select Self.type
            Case TileType.ConductorWallPipe1
                sprite.InitSprite("level/conductor_wall_pipe1.png", 24, 79, 1, Image.DefaultFlags)
                Self.field_80 = True
            Case TileType.ConductorWallPipe2
                sprite.InitSprite("level/conductor_wall_pipe2.png", 24, 79, 1, Image.DefaultFlags)
                Self.field_80 = True
            Case TileType.ConductorWallPipe3
                sprite.InitSprite("level/conductor_wall_pipe3.png", 24, 79, 1, Image.DefaultFlags)
                Self.field_80 = True
            Case TileType.ConductorWallPipe4
                sprite.InitSprite("level/conductor_wall_pipe4.png", 24, 79, 1, Image.DefaultFlags)
                Self.field_80 = True
            ' All of these goto LABEL_87
        End Select

        Select Self.type
            Case TileType.MetalDoor
                sprite2 = sprite
                sprite = Self.LoadFloor()

                Local tileLeft := Level.GetTileAt(Self.x - 1, Self.y)
                Local tileRight := Level.GetTileAt(Self.x + 1, Self.y)
                If (tileLeft And tileLeft.IsWall(False, False, False, False)) Or 
                   (tileRight And tileRight.IsWall(False, False, False, False))
                    sprite2.InitSprite("level/door_metal_front.png", 24, 29, 4, Image.DefaultFlags)
                Else
                    sprite2.InitSprite("level/door_metal_side.png", 11, 39, 2, Image.DefaultFlags)
                End If                
            Case TileType.WiredDoor
            Case TileType.Door
                sprite2 = sprite
                sprite = Self.LoadFloor()

                Local tileLeft := Level.GetTileAt(Self.x - 1, Self.y)
                Local tileRight := Level.GetTileAt(Self.x + 1, Self.y)
                If (tileLeft And tileLeft.IsWall(False, False, False, False)) Or 
                   (tileRight And tileRight.IsWall(False, False, False, False))
                    sprite2.InitSprite("level/door_front.png", 0, 0, 1, Image.DefaultFlags)
                Else
                    sprite2.InitSprite("level/door_side.png", 0, 0, 1, Image.DefaultFlags)
                End If
            Case TileType.LockedDoor
                Self.field_7C = 100

                sprite2 = sprite
                sprite = Self.LoadFloor()

                Local tileLeft := Level.GetTileAt(Self.x - 1, Self.y)
                Local tileRight := Level.GetTileAt(Self.x + 1, Self.y)
                If (tileLeft And tileLeft.IsWall(False, False, False, False)) Or 
                   (tileRight And tileRight.IsWall(False, False, False, False))
                    sprite2.InitSprite("level/door_locked_front.png", 0, 0, 1, Image.DefaultFlags)
                Else
                    sprite2.InitSprite("level/door_locked_side.png", 0, 0, 1, Image.DefaultFlags)
                End If
            Case TileType.StoneWall
                Self.BecomeStone()
            Case TileType.CatacombWall
                Self.BecomeHarderStone()
            Default
                Self.BecomeDirt()
                ' TODO: Missing stuff here
        End Select

        Self.sprite = sprite
        Self.sprite2 = sprite2
        
        ' TODO: Missing stuff here

        'LABEL_118
        Self.field_7C = False

        'LABEL_87
        If Not pending Then Self.field_1C = True

        'LABEL_29
        If sprite Then sprite.SetAlphaValue(0.0)
        If sprite2 Then sprite2.SetAlphaValue(0.0)

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
            Self.sprite.SetZ(-1001.0)
            Self.sprite2.SetZOff(8.0)
        Else
            Self.sprite.SetZOff(8.0)
        End If

        Local sprite3 := New Sprite()
        sprite3.InitSprite("level/floor_x.png", 0, 0, 1, Image.DefaultFlags)
        sprite3.SetZ(-901.0)
        Self.sprite3 = sprite

        If pending
            If Not Level.pendingTiles.Contains(Self.x)
                Level.pendingTiles.Set(Self.x, New IntMap<Tile>())
            End If

            Local pendingTilesOnX := Level.pendingTiles.Get(Self.x)
            pendingTilesOnX.Set(Self.y, Self)

            Tile.pendingTilesList.AddLast(Self)
        Else
            If Not Level.tiles.Contains(Self.x)
                Level.tiles.Set(Self.x, New IntMap<Tile>())
            End If

            Local tilesOnX := Level.tiles.Get(Self.x)
            tilesOnX.Set(Self.y, Self)
        End If
    End Method

    Field type: Int
    Field tileset: Int = -1
    Field isCracked: Bool
    Field field_64: Int
    Field sprite: Sprite
    Field field_6C: Object
    Field field_70: Object
    Field field_74: String
    Field field_78: Int = -1
    Field field_7C: Int = 1
    Field field_80: Bool
    Field field_81: Bool
    Field sprite2: Sprite
    Field field_88: Int
    Field field_8C: Bool
    Field field_90: Int
    Field field_94: Int
    Field field_98: Int
    Field field_9C: Int
    Field field_A0: Int
    Field field_A4: Int = -1
    Field field_A8: Int = -1
    Field sprite3: Sprite
    Field field_B0: Int
    Field field_B4: Int
    Field field_B8: Int
    Field field_BC: Bool
    Field field_C0: Int
    Field field_C4: Bool
    Field field_C5: Bool
    Field field_C8: Int
    Field field_CC: Int
    Field field_D0: Float = -1.0
    Field field_D4: Int = -1
    Field field_D8: Bool
    Field field_DC: Int
    Field field_E0: Int = 3
    Field field_E4: Int
    Field field_E8: Bool
    Field field_EC: Int
    Field field_F0: Int
    Field field_F4: Int
    Field field_F8: Int
    Field field_FC: Int
    Field field_100: Bool
    Field flyaway_: String
    Field field_108: Int
    Field field_10C: Int = -1
    Field field_110: Bool
    Field field_114: Int = -1
    Field field_118: Bool
    Field field_11C: Int = -1
    Field field_120: Bool
    Field field_124: Int = 2
    Field field_128: Int
    Field field_12C: Int
    Field field_130: Int
    Field field_134: Int
    Field field_138: Int
    Field field_13C: Int = -1
    Field field_140: Int
    Field field_144: Int
    Field field_148: Int
    Field field_14C: Int
    Field field_150: Bool
    Field field_154: Int
    Field field_158: Int
    Field field_15C: Bool = True
    Field field_160: Int
    Field field_164: Int
    Field field_168: Int
    Field field_16C: Float = -1.0
    
    Field hasTorch: Bool

    Method AddFloorOverlayImage: Void(imageName: Int)
    End Method

    Method AddTextLabel: Void(filename: Int, tmpXOff: Int, tmpYOff: Int, displayD: Float, flash: Bool, textString: Bool)
    End Method

    Method AddTorch: Void()
    End Method

    Method AddTorch2: Void()
    End Method

    Method AddWireConnection: Void(dir: Int)
    End Method

    Method BecomeBombWall: Void()
    End Method

    Method BecomeCracked: Void()
    End Method

    Method BecomeDarkShopWall: Void(spritePath: Int)
    End Method

    Method BecomeDiamond: Void()
    End Method

    Method BecomeDirt: Void()
    End Method

    Method BecomeHarderStone: Void()
    End Method

    Method BecomeStone: Void()
    End Method

    Method BecomeUnbreakable: Void()
    End Method

    Method CalcTileset: Int()
    End Method

    Method CalculateTileAlpha: Float()
    End Method

    Method CalculateTileLightValue: Float(forVision: Bool)
    End Method

    Method ClearTextLabel: Void()
    End Method

    Method DarkenShopWall: Void()
    End Method

    Method Die: Void()
    End Method

    Method GetCurrentAlpha: Float()
    End Method

    Method GetNumWireConnections: Int()
    End Method

    Method GetTileset: Int()
        Return Self.tileset
    End Method

    Method GetType: Int()
        Return Self.type
    End Method

    Method GetZone2Wall: Object()
    End Method

    Method GetZone3Wall: Object()
    End Method

    Method GetZone4Wall: Object()
    End Method

    Method GetZone5Wall: Object()
    End Method

    Method HasTileBeenSeen: Bool()
    End Method

    Method HasTorch: Bool()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
    End Method

    Method IsConductorWall: Bool()
    End Method

    Method IsDirt: Bool()
    End Method

    Method IsDoor: Bool()
        Select Self.type
            Case TileType.WiredDoor
            Case TileType.Door
            Case TileType.LockedDoor
                Return True
            Default
                If Self.type = TileType.MetalDoor
                    Return Not Self.IsMetalDoorOpen()
                End If

                Return False
        End Select
    End Method

    Method IsEarth: Bool()
    End Method

    Method IsExit: Bool()
    End Method

    Method IsFloor: Bool()
        If Self.type = TileType.MetalDoor And Self.IsMetalDoorOpen()
            Return True
        End If

        Return Self.type <= 24
    End Method

    Method IsInAnyPlayerLineOfSight: Bool()
    End Method

    Method IsInAnyPlayerTrueLineOfSight: Bool()
    End Method

    Method IsMetalDoorOpen: Bool()
        Return Self.field_78 <> -1
    End Method

    Method IsNearNightmare: Bool()
    End Method

    Method IsNecrodancerPlatform: Bool()
    End Method

    Method IsNormalFloor: Bool()
    End Method

    Method IsShopWall: Bool()
    End Method

    Method IsStairs: Bool()
    End Method

    Method IsTileset: Bool(t: Int)
    End Method

    Method IsVisible: Bool()
    End Method

    Method IsWall: Bool(nonCorridor: Bool, destructibleOnly: Bool, forVision: Bool, torchlessOnly: Bool)
    End Method

    Method IsWire: Bool()
    End Method

    Method IsZone4Dirt: Bool()
    End Method

    Method LoadDiamond: Object()
    End Method

    Method LoadFloor: Sprite()
    End Method

    Method LoadWireImages: Void(mainImage: String, conductorPhase: Int)
    End Method

    Method Render: Void()
    End Method

    Method RenderImageAs: Void(img: Object, renderAsWall: Bool, extraXOff: Int, extraYOff: Int)
    End Method

    Method SelectWireFlip: Bool()
    End Method

    Method SelectWireFrame: Int()
    End Method

    Method SetDigTrigger: Void(triggerVal: Int)
    End Method

    Method SetDoorTrigger: Void(triggerVal: Int)
    End Method

    Method SetTrigger: Void(triggerVal: Int)
    End Method

    Method ToggleDoor: Void()
    End Method

    Method Update: Void()
    End Method

    Method NoTrim: Void()
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

    Const None: Int = -1
    Const Floor: Int = 0
    Const Floor2: Int = 1
    Const Stairs: Int = 2
    Const ShopFloor: Int = 3
    Const Water: Int = 4
    Const DeepWater: Int = 5
    Const LockedStairs: Int = 6
    Const LobbyUpgradesFloor: Int = 7
    Const Tar: Int = 8
    Const LockedStairsMiniboss: Int = 9
    Const HotCoals: Int = 10
    Const Ice: Int = 11
    Const Crystal: Int = 12
    Const Geyser: Int = 13
    Const Floor3: Int = 14
    Const LockedStairs3Diamonds: Int = 15
    Const LockedStairs9Diamonds: Int = 16
    Const Ooze: Int = 17
    Const Lava: Int = 18
    Const Floor4: Int = 19
    Const Wire: Int = 20
    Const FloorRising: Int = 21
    Const FloorReceding: Int = 22
    Const ConductorWirePhase1: Int = 23
    Const ConductorWirePhase2: Int = 24
    Const DirtWall: Int = 100
    Const DirtWall2: Int = 101
    Const LevelBorder: Int = 102
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
    Const Unknown119: Int = 119
    Const ConductorWallPipe1: Int = 120
    Const ConductorWallPipe2: Int = 121
    Const ConductorWallPipe3: Int = 122
    Const ConductorWallPipe4: Int = 123

End Class
