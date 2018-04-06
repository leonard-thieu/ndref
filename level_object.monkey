Import monkey.list
Import bouncetrap
Import chest
Import controller_game
Import crate
Import enemy
Import firetrap
Import item
Import level
Import point
Import salechest
Import saleitem
Import shrine
Import tile
Import trap
Import travelrune

Class LevelObject

    Method New(num: Int, music: Int, boss: Int, loadFromCurrent: Bool, fromXML: Object)
        Self.num = num
        Self.music = music
        Self.boss = boss

        If Not loadFromCurrent
            If fromXML
                ' Load from XML
            End If
        Else
            For Local tilesOnX := EachIn Level.tiles
                For Local tileNode := EachIn tilesOnX.Value()
                    Local tile := tileNode.Value()
                    Local tileObj := New TileObject(tile.x, tile.y, tile.type, tile.tileset, tile.isCracked, tile.hasTorch)
                    Self.tiles.AddLast(tileObj)
                End For
            End For

            For Local trap := EachIn Trap.trapList
                Local trapObj := New TrapObject(trap.x, trap.y, trap.type)

                Select trap.type
                    Case 1
                        Local bounceTrap := BounceTrap(trap)
                        If bounceTrap.field_106 Or bounceTrap.field_107
                            trapObj.subtype = 9
                        End If
                    Case 8
                        Local travelRune := TravelRune(trap)
                        trapObj.subtype = travelRune.subtype
                    Case 10
                        Local fireTrap := FireTrap(trap)
                        trapObj.subtype = fireTrap.subtype
                End Select

                Self.traps.AddLast(trapObj)
            End For

            For Local enemy := EachIn Enemy.enemyList
                If Crate(enemy) = Null
                    Local enemyObj := New EnemyObject(enemy.x, enemy.y, enemy.type, enemy.field_114, enemy.isLord)
                    Self.enemies.AddLast(enemyObj)
                End If
            End For

            For Local item := EachIn Item.pickupList
                Local itemObj := New ItemObject(item.x, item.y, item.type, item.field_F4, 0, 0)

                If item.bldCost
                    Local saleItem := SaleItem(item)
                    itemObj.field_24 = saleItem.field_144
                Else If item.field_F6
                    Local saleItem := SaleItem(item)
                    itemObj.field_20 = saleItem.field_148
                End If

                Self.items.AddLast(itemObj)
            End For

            For Local chest := EachIn Chest.chestList
                Local chestObj := New ChestObject(chest.x, chest.y, chest.color, chest.cont, chest.field_F8, chest.isLocked, 0)

                If chest.field_FA
                    Local saleChest := SaleChest(chest)
                    chestObj.field_24 = saleChest.field_110
                End If

                Self.chests.AddLast(chestObj)
            End For

            For Local crate := EachIn Crate.crateList
                Local crateObj := New CrateObject(crate.x, crate.y, crate.type, crate.cont)
                Self.crates.AddLast(crateObj)
            End For

            For Local shrine := EachIn Shrine.shrineList
                Local shrineObj := New ShrineObject(shrine.x, shrine.y, shrine.cType)
                Self.shrines.AddLast(shrineObj)
            End For
        End If
    End Method

    Field num: Int = 1
    Field music: Int = 0
    Field boss: Int = -1
    Field tiles: List<TileObject> = New List<TileObject>()
    Field traps: List<TrapObject> = New List<TrapObject>()
    Field enemies: List<EnemyObject> = New List<EnemyObject>()
    Field items: List<ItemObject> = New List<ItemObject>()
    Field chests: List<ChestObject> = New List<ChestObject>()
    Field crates: List<CrateObject> = New List<CrateObject>()
    Field shrines: List<ShrineObject> = New List<ShrineObject>()

    Method CreateMap: Void()
        ' LABEL_5
        For Local tileObj := EachIn tiles
            Local tile := Level.PlaceTileRemovingExistingTiles(tileObj.x, tileObj.y, tileObj.type, False, tileObj.tileset, False)
            
            If tileObj.isCracked Then tile.BecomeCracked()
                
            If Not tileObj.hasTorch
                If tile.type = TileType.Stairs
                    ' goto LABEL_9
                Else
                    ' goto LABEL_4
                End If
            End If
            
            tile.AddTorch()

            If tile.type = TileType.Stairs
                ' LABEL_9
                Local exit_p1 := New Point(tile.x, tile.y)
                Local exit_p2 := New Point(-3, currentZone)
                Level.exits.Set(exit_p1, exit_p2)

                If tile.type <> TileType.LockedStairsMiniboss
                    ' goto LABEL_5
                End If
                ' goto LABEL_10
            End If

            ' LABEL_4
            If tile.type <> TileType.LockedStairsMiniboss
                ' goto LABEL_5
            End If

            ' LABEL_10
            Level.CreateExit(tile.x, tile.y)
        End For

        Tile.GenerateWireConnections()

        ' LABEL_12
        For Local trapObj := EachIn traps
            While True
                Select trapObj.type
                    Case TrapType.BounceTrap
                        ' BounceTrap
                    Case TrapType.SpikeTrap
                        ' SpikeTrap
                    Case TrapType.TrapDoor
                        ' TrapDoor
                    Case TrapType.ConfuseTrap
                        ' ConfuseTrap
                    Case TrapType.TeleportTrap
                        ' TeleportTrap
                    Case TrapType.SlowDownTrap
                        ' SlowDownTrap
                    Case TrapType.SpeedUpTrap
                        ' SpeedUpTrap
                    Case TrapType.BombTrap
                        ' BombTrap
                    Case TrapType.ScatterTrap
                        ' ScatterTrap
                End Select

                If trapObj.type = TrapType.FireballTrap
                    Exit
                End If

                If trapObj.type <> TrapType.TravelRune
                    ' goto LABEL_12
                End If

                If Not Level.isLevelEditor
                    Level.secretAtX = trapObj.x
                    Level.secretAtY = trapObj.y
                    Level.AddSpecialRoom(trapObj.subtype, False)
                End If

                ' TravelRune

                ' TODO: Translate if statement that appears here                
            End While

            ' FireTrap
        End For

        For Local enemyObj := EachIn enemies
            Local enemy := Enemy.MakeEnemy(enemyObj.x, enemyObj.y, enemyObj.type)

            If enemyObj.field_1C <> -1
                enemy.field_114 = enemyObj.field_1C
            End If
            
            If enemyObj.isLord
                enemy.MakeLord()
            Else If enemy.field_121
                enemy.isMiniboss = True
            End If
        End For

        For Local itemObj := EachIn items
            Local item: Item

            If itemObj.field_24 <= 0.0
                If itemObj.field_20 <= 0
                    item = New Item(itemObj.x, itemObj.y, itemObj.type, False, -1, False)
                Else
                    item = New SaleItem(itemObj.x, itemObj.y, itemObj.type, False, Null, -1.0, Null)
                End If
            Else
                item = New SaleItem(itemObj.x, itemObj.y, itemObj.type, True, Null, -1.0, Null)
            End If

            item.field_F4 = itemObj.field_1C
        End For

        For Local chestObj := EachIn chests
            Local chest: Chest

            If chestObj.field_24 <= 0
                chest = New Chest(chestObj.x, chestObj.y, chestObj.cont, chestObj.isLocked, False, chestObj.isLocked, chestObj.color)
            Else
                chest = New SaleChest()
            End If
        End For

        For Local crateObj := EachIn crates
            New Crate()
        End For

        For Local shrineObj := EachIn shrines
            New Shrine(shrineObj.x, shrineObj.y, shrineObj.cType, Null, False, False)
        End For
    End Method

    Method ToXML: Object()
    End Method

    Method NoTrim()
        CreateMap()
        ToXML()
    End Method

End Class

Class TileObject

    Method New(xVal: Int, yVal: Int, type: Int, tileset: Int, isCracked: Bool, hasTorch: Bool)
        Self.x = xVal
        Self.y = yVal
        Self.type = type
        Self.tileset = tileset
        Self.isCracked = isCracked
        Self.hasTorch = hasTorch
    End Method

    Field x: Int
    Field y: Int
    Field type: Int
    Field tileset: Int
    Field isCracked: Bool
    Field hasTorch: Bool

End Class

Class TrapObject

    Method New(xVal: Int, yVal: Int, type: Int)
        Self.x = xVal
        Self.y = yVal
        Self.type = type
    End Method

    Field x: Int
    Field y: Int
    Field type: Int
    Field subtype: Int = -1

End Class

Class EnemyObject

    Method New(xVal: Int, yVal: Int, type: Int, field_1C: Int, isLord: Bool)
        Self.x = xVal
        Self.y = yVal
        Self.type = type
        Self.field_1C = field_1C
        Self.isLord = isLord
    End Method

    Field x: int
    Field y: int
    Field type: int
    Field field_1C: int = -1
    Field isLord: bool

End Class

Class ItemObject

    Method New(xVal: Int, yVal: Int, type: String, field_1C: Bool, field_20: Int, field_24: Int)
        Self.x = xVal
        Self.y = yVal
        Self.type = type
        Self.field_1C = field_1C
        Self.field_20 = field_20
        Self.field_24 = field_24
    End Method

    Field x: Int
    Field y: Int
    Field type: String
    Field field_1C: Bool
    Field field_20: Int
    Field field_24: Int

End Class

Class ChestObject

    Method New(xVal: Int, yVal: Int, color: Int, cont: String, field_20: Bool, isLocked: Bool, field_24: Int)
        Self.x = xVal
        Self.y = yVal
        Self.color = color
        Self.cont = cont
        Self.field_20 = field_20
        Self.isLocked = isLocked
        Self.field_24 = field_24
    End Method

    Field x: Int
    Field y: Int
    Field color: Int
    Field cont: String
    Field field_20: Bool
    Field isLocked: Bool
    Field field_24: Int

End Class

Class CrateObject

    Method New(xVal: Int, yVal: Int, type: Int, cont: String)
        Self.x = xVal
        Self.y = yVal
        Self.type = type
        Self.cont = cont
    End Method

    Field x: Int
    Field y: Int
    Field type: Int
    Field cont: String

End Class

Class ShrineObject

    Method New(xVal: Int, yVal: Int, cType: Int)
        Self.x = xVal
        Self.y = yVal
        Self.cType = cType
    End Method

    Field x: Int
    Field y: Int
    Field cType: Int

End Class
