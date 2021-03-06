'Strict

Import monkey.list
Import controller.controller_game
Import controller.controller_level_editor
Import bouncer
Import entity
Import item
Import logger
Import player_class
Import sprite
Import util

Class Chest Extends Entity

    Const CHEST_COLOR_NONE: Int = 0
    Const CHEST_COLOR_RED: Int = 1
    Const CHEST_COLOR_BLACK: Int = 2
    Const CHEST_COLOR_WHITE: Int = 3 ' Purple
    Const CHEST_COLOR_BLUE: Int = 4

    Global chestList: List<Chest> = New List<Chest>()
    Global lastChestColor: Int
    Global lastChestColor2: Int

    Function ClearAllSingleChoiceChests: Void(except: Object)
        Debug.TraceNotImplemented("Chest.ClearAllSingleChoiceChests(Object)")
    End Function

    Function GetChestAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Chest.GetChestAt(Int, Int)")
    End Function

    Function GetEmptyNonSecretChest: Chest()
        For Local chest := EachIn Chest.chestList
            If Not chest.saleChest And
               Not chest.secretChest And
               chest.contents = ItemType.NoItem And
               Not chest.invisible
                Return chest
            End If
        End For

        Return Null
    End Function

    Function GetEmptySecretChest: Chest()
        For Local chest := EachIn Chest.chestList
            If Not chest.saleChest And
               chest.secretChest And
               chest.contents = ItemType.NoItem And
               Not chest.invisible
                Return chest
            End If
        End For

        Return Null
    End Function

    Function GetNumEmptyNonSecretChests: Int()
        Local numEmptyNonSecretChests := 0

        For Local chest := EachIn Chest.chestList
            If Not chest.saleChest And
               Not chest.secretChest And
               chest.contents = ItemType.NoItem And
               Not chest.invisible
                numEmptyNonSecretChests += 1
            End If
        End For

        Return numEmptyNonSecretChests
    End Function

    Function GetNumEmptySecretChests: Int()
        Local numEmptySecretChests := 0

        For Local chest := EachIn Chest.chestList
            If Not chest.saleChest And
               chest.secretChest And
               chest.contents = ItemType.NoItem And
               Not chest.invisible
                numEmptySecretChests += 1
            End If
        End For

        Return numEmptySecretChests
    End Function

    Function IsItemAppropriateForChestColor: Bool(cont: String, tmpColor: Int)
        Select Item.GetSlot(cont)
            Case "body",
                 "weapon",
                 "feet"
                Return tmpColor = Chest.CHEST_COLOR_BLACK
            Case "spell",
                 "ring"
                Return tmpColor = Chest.CHEST_COLOR_WHITE
        End Select

        If Item.IsItemOfType(cont, "isScroll")
            Return tmpColor = Chest.CHEST_COLOR_WHITE
        End If

        Return tmpColor = Chest.CHEST_COLOR_RED
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, cont: String, invis: Bool, isLocked: Bool, isSecret: Bool, tmpColor: Int)
        Super.New()

        Self.isChest = True

        Self.x = xVal
        Self.y = yVal
        Self.invisible = invis
        Self.contents = cont

        If Self.contents = ItemType.NoItem And
           Level.randSeed <> -1
            If Not Self.lockChest
                Self.contents = Item.GetRandomItemInClass("", controller_game.currentLevel, "chestChance", tmpColor)
            Else
                Self.contents = Item.GetRandomItemInClass("", controller_game.currentLevel, "lockedChestChance")
            End If
        End If

        If tmpColor <> Chest.CHEST_COLOR_NONE
            Self.chestColor = tmpColor
        Else
            If isLocked
                Self.chestColor = Chest.CHEST_COLOR_BLUE
            Else
                If Self.contents <> ItemType.NoItem
                    If Chest.IsItemAppropriateForChestColor(Self.contents, Chest.CHEST_COLOR_BLACK)
                        Self.chestColor = Chest.CHEST_COLOR_BLACK
                    Else If Chest.IsItemAppropriateForChestColor(Self.contents, Chest.CHEST_COLOR_WHITE)
                        Self.chestColor = Chest.CHEST_COLOR_WHITE
                    Else
                        Self.chestColor = Chest.CHEST_COLOR_RED
                    End If
                Else
                    Local chestColor: Int

                    Repeat
                        chestColor = Util.RndIntRange(1, 3, True)
                    Until chestColor = Chest.lastChestColor Or
                          chestColor = Chest.lastChestColor2
                End If
            End If
        End If

        Chest.lastChestColor2 = Chest.lastChestColor
        Chest.lastChestColor = Self.chestColor

        Select Self.chestColor
            Case Chest.CHEST_COLOR_BLUE
                Self.image = New Sprite("entities/chest_locked.png", 24, 24, 2)
            Case Chest.CHEST_COLOR_BLACK
                Self.image = New Sprite("entities/chest_black.png", 24, 24, 2)
            Case Chest.CHEST_COLOR_WHITE
                Self.image = New Sprite("entities/chest_white.png", 24, 24, 2)
            Default
                Self.image = New Sprite("entities/chest.png", 24, 24, 2)
        End Select

        Self.locked = isLocked
        Self.lockChest = isLocked
        Self.yOff = 6.0
        Self.collides = True
        Self.secretChest = isSecret

        Chest.chestList.AddLast(Self)

        Debug.WriteLine("Placed " + ChestColor.ToString(Self.chestColor) + " Chest at " + New Point(Self.x, Self.y))
        Debug.WriteLine("    with " + Item.GetDisplayName(Self.contents))
    End Method

    Field chestColor: Int = Chest.CHEST_COLOR_NONE
    Field contents: String = ItemType.NoItem
    Field singleChoiceChest: Bool
    Field secretChest: Bool
    Field saleChest: Bool
    Field locked: Bool
    Field lockChest: Bool
    Field image2: Sprite
    Field image2XOff: Int
    Field image2YOff: Int
    Field bounce2: Bouncer

    Method AddKeyToContents: Void()
        New Item(Self.x, Self.y, ItemType.Key, False, -1, False)

        Self.Die()
    End Method

    Method BecomeLocked: Void()
        Self.image = New Sprite("entities/chest_locked.png", 24, 24, 2)
        Self.locked = True
        Self.lockChest = True
    End Method

    Method DetermineContentsNow_PlayerDoesntOwn: String()
        If Self.contents = ItemType.NoItem
            If Self.lockChest
                Self.contents = Item.GetRandomItemInClass("", controller_game.currentLevel, "lockedChestChance")
            Else If ControllerLevelEditor.playingLevel <> -1
                Self.contents = Item.GetRandomItemInClass("", ControllerLevelEditor.playingLevel, "chestChance", Self.chestColor)
            Else
                Self.contents = Item.GetRandomItemInClass("", controller_game.currentLevel, "chestChance", Self.chestColor)
            End If
        End If

        Return Self.contents
    End Method

    Method Die: Void()
        If Not Self.dead
            Chest.chestList.RemoveEach(Self)

            Super.Die()
        End If
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Return False
    End Method

    Method Open: Bool(player: Object)
        Debug.TraceNotImplemented("Chest.Open(Object)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Chest.Render()")
    End Method

    Method Update: Void()
        If Util.IsCharacterActive(Character.Ghost) Or
           (Item.GetSlot(Self.contents) = "weapon" And
            Util.IsWeaponlessCharacterActive()) Or
           (Item.GetSlot(Self.contents) = "shovel" And
            Util.IsCharacterActive(Character.Eli))
            Self.Die()
        End If

        If Self.IsVisible() And
           (Tile.AnyPlayerHaveMonocle() Or
            (Level.isLevelEditor And Self.contents <> ItemType.NoItem)) And
           Self.image2 = Null
            Local contents := Self.DetermineContentsNow_PlayerDoesntOwn()
            Local contentsNode := Item.GetItemXML(contents)
            Local itemData := New ItemData(contentsNode)

            Self.image2XOff = itemData.xOff
            Self.image2YOff = itemData.yOff

            Self.image2 = New Sprite("items/" + contentsNode.value, itemData.imageW, itemData.imageH, itemData.imageFrames)
            Self.image2.SetZOff(17 - itemData.yOff)
            Self.image2.SetAlphaValue(0.6)

            Self.bounce2 = New Bouncer(-2.5, 0.0, 1.5, 40)
        End If

        If Self.bounce2 <> Null
            Self.bounce2.Update()
        End If

        Self.image.SetFrame(0)

        Super.Update()
    End Method

End Class

Class ChestColor

    Const None: Int = 0
    Const Red: Int = 1
    Const Black: Int = 2
    Const White: Int = 3
    Const Blue: Int = 4

    Function ToString: String(color: Int)
        Select color
            Case ChestColor.Red Return "Red"
            Case ChestColor.Black Return "Black"
            Case ChestColor.White Return "Purple"
            Case ChestColor.Blue Return "Blue"
        End Select

        Return "None"
    End Function

End Class
