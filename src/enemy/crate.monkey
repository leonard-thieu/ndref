'Strict

Import monkey.list
Import monkey.math
Import controller.controller_game
Import enemy.gargoyle
Import bouncer
Import chest
Import enemy
Import entity
Import item
Import level
Import logger
Import necrodancergame
Import player_class
Import point
Import sprite
Import tile
Import util

Class Crate Extends Enemy

    Const TYPE_BARREL: Int = 1
    Const TYPE_URN: Int = 2
    Const TYPE_GREEN_GORGON_STATUE: Int = 3
    Const TYPE_GOLD_GORGON_STATUE: Int = 4

    Global crateList: List<Crate> = New List<Crate>()
    Global fallenCrates: List<Crate> = New List<Crate>()
    Global fallenGargoyles: List<Gargoyle> = New List<Gargoyle>()

    Function GetNumCrates: Int()
        Return Crate.crateList.Count()
    End Function

    Function ProcessFallenCrates: Void()
        Local x := -1
        Local y := 0

        While Crate.fallenCrates.Count() > 0
            Local fallenCrate := Crate.fallenCrates.RemoveFirst()

            Local point := Util.FindClosestTrulyUnoccupiedSpace(x, y, False)
            If point <> Null
                x = point.x
                y = point.y
            End If

            fallenCrate.x = x
            fallenCrate.y = y
            fallenCrate.falling = False
            fallenCrate.flaggedForDeath = False
            fallenCrate.collides = True

            If fallenCrate.emptyCoins = -3
                fallenCrate.emptyCoins = -1
            End If

            Select fallenCrate.crateType
                Case Crate.TYPE_URN,
                     Crate.TYPE_GOLD_GORGON_STATUE
                    fallenCrate.health -= 1
                    If fallenCrate.health <= 0
                        fallenCrate.Open(False)
                    End If
                Case Crate.TYPE_GREEN_GORGON_STATUE
                    ' Do nothing
                Default
                    fallenCrate.Open(False)
            End Select

            y += 1
        End While

        While Crate.fallenGargoyles.Count() > 0
            Local fallenGargoyle := Crate.fallenGargoyles.RemoveFirst()

            Local point := Util.FindClosestTrulyUnoccupiedSpace(x, y, False)
            If point <> Null
                x = point.x
                y = point.y
            End If

            fallenGargoyle.x = x
            fallenGargoyle.y = y
            fallenGargoyle.falling = False
            fallenGargoyle.flaggedForDeath = False

            fallenGargoyle.OpenAsCrate(False)

            y += 1
        End While
    End Function

    Function SelectItem: String(itemLevel: Int)
        Local replayConsistencyChannel := 1
        If Level.creatingMap Then replayConsistencyChannel = -1

        Local lockedChestItemRoll := Util.RndIntRange(0, 100, False, replayConsistencyChannel)
        If lockedChestItemRoll > 45
            Return Item.GetRandomItemInClass("", itemLevel, "lockedChestChance")
        End If

        Local foodRoll := Util.RndIntRange(0, 150, False, replayConsistencyChannel)
        If foodRoll <= 40
            If Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfLuck)
                Return ItemType.Ham
            End If

            If Player.DoesAnyPlayerHaveItemOfType(ItemType.LuckyCharm)
                Return ItemType.Cheese
            End If

            Return ItemType.Apple
        End If

        If foodRoll <= 70
            If Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfLuck)
                Return ItemType.Ham
            End If

            If Player.DoesAnyPlayerHaveItemOfType(ItemType.LuckyCharm)
                Return ItemType.Drumstick
            End If

            Return ItemType.Cheese
        End If

        If foodRoll <= 90
            If Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfLuck)
                Return ItemType.Ham
            End If

            Return ItemType.Drumstick
        End If

        If foodRoll <= 100
            Return ItemType.Ham
        End If

        If foodRoll <= 130
            Return ItemType.Carrot
        End If

        Return ItemType.Cookies
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, type: Int, cont: String)
        Super.New()

        Self.isCrate = True
        Self.containsItem = True

        Self.Init(xVal, yVal, type + 1, "crate", "", -1, -1)

        Self.initialYOff = Self.yOff
        Self.crateType = type

        Self.contents = cont
        If Self.contents = ItemType.NoItem And Level.randSeed <> -1
            Self.DetermineContents()
        End If

        Crate.crateList.AddLast(Self)

        Debug.WriteLine("  with " + Item.GetDisplayName(Self.contents))
    End Method

    Field crateType: Int
    Field contents: String = ItemType.NoItem
    Field initialYOff: Int
    Field contents2: String = ItemType.NoItem
    Field contents3: String = ItemType.NoItem
    Field beEmpty: Bool
    Field emptyCoins: Int
    Field determinedContents: Bool
    Field image2: Sprite
    Field bounce2: Bouncer
    Field chargingDir: Int = -1
    Field gorgonFlipX: Bool
    Field gorgonFlashFrames: Int

    Method DecideIfStayingEmpty: Void()
        If Self.beEmpty Then Return
        If Self.contents <> ItemType.NoItem Then Return

        Local replayConsistencyChannel := 1
        If Level.creatingMap Then replayConsistencyChannel = -1

        Local itemRoll := Util.RndIntRange(0, 100, False, replayConsistencyChannel)
        If (Self.crateType = Crate.TYPE_BARREL And itemRoll <= 30) Or
           itemRoll <= 40
            Self.beEmpty = True
        Else If Not Self.beEmpty
            Self.contents = Crate.SelectItem(controller_game.currentLevel)

            Return
        End If

        Local coinsRoll := Util.RndIntRange(0, 100, False, replayConsistencyChannel)

        If coinsRoll <= 10
            Self.emptyCoins = -3
            If Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfLuck)
                Self.emptyCoins = -2
            End If

            Return
        End If

        If coinsRoll <= 15
            Self.emptyCoins = -2

            Return
        End If

        If coinsRoll <= 45
            Self.emptyCoins = -1
            If Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfLuck)
                Self.emptyCoins = -2
            End If

            Return
        End If

        If coinsRoll <= 75
            Self.emptyCoins = 10
            If Player.DoesAnyPlayerHaveItemOfType(ItemType.LuckyCharm)
                Self.emptyCoins = 30
            End If

            If Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfLuck)
                Self.emptyCoins = 50
            End If

            Return
        End If

        If coinsRoll > 98
            Self.emptyCoins = 30
            If Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfLuck)
                Self.emptyCoins = 50
            End If
        End If
    End Method

    Method DetermineContents: Void()
        Select Self.crateType
            Case Crate.TYPE_GOLD_GORGON_STATUE
                Self.beEmpty = True
                Self.emptyCoins = 30
            Case Crate.TYPE_GREEN_GORGON_STATUE
                Self.beEmpty = True
                Self.emptyCoins = -4
            Case Crate.TYPE_URN
                Self.contents = Item.GetRandomItemInClass("", controller_game.currentLevel, "urnChance")

                For Local requestedLevel := controller_game.currentLevel Until 0 Step -1
                    If Self.contents2 <> ItemType.NoItem Then Exit

                    Self.contents2 = Item.GetRandomItemInClass("isSpell", requestedLevel, "chestChance")
                End For

                Self.contents3 = Item.GetRandomItemInClass("isFood", controller_game.currentLevel + 2, "chestChance")
            Default
                Self.DecideIfStayingEmpty()
        End Select

        Self.determinedContents = True
    End Method

    Method DetermineContentsNow_PlayerDoesntOwn: String()
        If Not Self.determinedContents
            Self.DetermineContents()
        End If

        Return Self.contents
    End Method

    Method Die: Void()
        If Not Self.dead
            If Crate.fallenCrates.Contains(Self)
                Self.x = -9999
                Self.y = -9999
            Else
                Crate.crateList.RemoveEach(Self)

                Super.Die()
            End If
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Crate.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Crate.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsGorgonStatue: Bool()
        Select Self.crateType
            Case Crate.TYPE_GREEN_GORGON_STATUE,
                 Crate.TYPE_GOLD_GORGON_STATUE
                Return True
        End Select

        Return False
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("Crate.Knockback(Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Crate.MoveFail()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Crate.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Crate.MoveSucceed(Bool, Bool)")
    End Method

    Method Open: Bool(playSound: Bool)
        Debug.TraceNotImplemented("Crate.Open(Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Crate.Render()")
    End Method

    Method Update: Void()
        If Self.IsVisible()
            If Tile.AnyPlayerHaveMonocle() And
               Self.image2 = Null
                Local contents := Self.DetermineContentsNow_PlayerDoesntOwn()
                If Not Self.beEmpty Or
                   Self.emptyCoins >= -2
                    If Self.beEmpty
                        Select Self.emptyCoins
                            Case -2
                                If Util.IsBomblessCharacterActive()
                                    contents = ItemType.Coin10
                                Else
                                    contents = ItemType.Bomb3
                                End If
                            Case -1
                                If Util.IsBomblessCharacterActive()
                                    contents = ItemType.Coin10
                                Else
                                    contents = ItemType.Bomb
                                End If
                            Case 10
                                contents = ItemType.Coin10
                            Case 30
                                contents = ItemType.SmallGoldHoard
                            Default
                                contents = ItemType.GoldHoard
                        End Select
                    End If

                    Local contentsNode := Item.GetItemXML(contents)
                    Local framePath := "items/" + contentsNode.value
                    Local frameW := contentsNode.GetAttribute("imageW", 24)
                    Local frameH := contentsNode.GetAttribute("imageH", 24)
                    Local numFrames := contentsNode.GetAttribute("numFrames", 1)

                    Self.image2 = New Sprite(framePath, frameW, frameH, 2 * numFrames)
                    Self.image2.SetZ(17.0)
                    Self.image2.SetAlphaValue(0.6)

                    Select contents
                        Case ItemType.Coin10,
                             ItemType.SmallGoldHoard,
                             ItemType.GoldHoard
                            ' Do nothing
                        Default
                            Self.bounce2 = New Bouncer(-2.5, 0.0, 1.5, 40)
                    End Select
                End If
            End If
        End If

        If Self.bounce2 <> Null
            Self.bounce2.Update()
        End If

        Self.image.SetFrame(0)

        Self.yOff = Self.initialYOff

        If Self.crateType = Crate.TYPE_BARREL
            If Self.lastX > Self.x
                Self.image.FlipX(False, True)
            Else If Self.lastX < Self.x
                Self.image.FlipX(True, True)
            End If

            Select Self.chargingDir
                Case Direction.Right,
                     Direction.Left,
                     Direction.UpLeft,
                     Direction.UpRight,
                     Direction.DownLeft,
                     Direction.DownRight
                    Local animOverrideBase := (necrodancergame.globalFrameCounter Mod 16) * 0.25
                    animOverrideBase = math.Floor(animOverrideBase)
                    Self.animOverride = animOverrideBase + 9
                Case Direction.Up
                    Self.yOff += 4.0

                    Local animOverrideBase := (necrodancergame.globalFrameCounter Mod 16) * 0.25
                    animOverrideBase = math.Floor(animOverrideBase)
                    Self.animOverride = animOverrideBase + 5
                Case Direction.Down
                    Local animOverrideBase := (necrodancergame.globalFrameCounter Mod 16) * 0.25
                    animOverrideBase = math.Floor(animOverrideBase)
                    Self.animOverride = animOverrideBase + 1
                Case Direction.None
                    Self.animOverride = 0
            End Select
        End If

        If Self.IsGorgonStatue()
            Self.image.FlipX(Self.gorgonFlipX, True)

            If Self.gorgonFlashFrames <= 0
                Self.animOverride = -1
            Else
                Self.gorgonFlashFrames -= 1
                Self.animOverride = 4
            End If
        End If

        Super.Update()
    End Method

End Class
