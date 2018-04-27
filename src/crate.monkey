'Strict

Import monkey.list
Import bouncer
Import chest
Import controller_game
Import enemy
Import entity
Import gargoyle
Import item
Import level
Import logger
Import point
Import sprite

Class Crate Extends Enemy

    Const TYPE_BARREL: Int = 1
    Const TYPE_URN: Int = 2
    Const TYPE_GREEN_GORGON_STATUE: Int = 3
    Const TYPE_GOLD_GORGON_STATUE: Int = 4

    Global crateList: List<Crate> = New List<Crate>()
    Global fallenCrates: List<Crate> = New List<Crate>()
    Global fallenGargoyles: List<Gargoyle> = New List<Gargoyle>()

    Function ProcessFallenCrates: Void()
        Debug.TraceNotImplemented("Crate.ProcessFallenCrates()")
    End Function

    Function SelectItem: Int(itemLevel: Int)
        Debug.TraceNotImplemented("Crate.SelectItem(Int)")
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
        If Self.contents = "no_item" And Level.randSeed <> -1
            Self.DetermineContents()
        End If

        Crate.crateList.AddLast(Self)
    End Method

    Field crateType: Int
    Field contents: String = Item.NoItem
    Field initialYOff: Int
    Field contents2: String = Item.NoItem
    Field contents3: String = Item.NoItem
    Field beEmpty: Bool
    Field emptyCoins: Int
    Field determinedContents: Bool
    Field image2: Sprite
    Field bounce2: Bouncer
    Field chargingDir: Int = -1
    Field gorgonFlipX: Bool
    Field gorgonFlashFrames: Int

    Method DecideIfStayingEmpty: Void()
        Debug.TraceNotImplemented("Crate.DecideIfStayingEmpty()")
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
                    If Self.contents2 <> Item.NoItem Then Exit

                    Self.contents2 = Item.GetRandomItemInClass("isSpell", requestedLevel, "chestChance")
                End For

                Self.contents3 = Item.GetRandomItemInClass("isFood", controller_game.currentLevel + 2, "chestChance")
            Default
                Self.DecideIfStayingEmpty()
        End Select

        Self.determinedContents = True
    End Method

    Method DetermineContentsNow_PlayerDoesntOwn: Int()
        Debug.TraceNotImplemented("Crate.DetermineContentsNow_PlayerDoesntOwn()")
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
        Debug.TraceNotImplemented("Crate.IsGorgonStatue()")
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
        Debug.TraceNotImplemented("Crate.Update()")
    End Method

End Class
