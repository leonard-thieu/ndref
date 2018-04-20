'Strict

Import monkey.list
Import enemy
Import gargoyle
Import level
Import logger

Class Crate Extends Enemy

    Const TYPE_BARREL: Int = 1
    Const TYPE_URN: Int = 2
    Const TYPE_GREEN_GORGON_STATUE: Int = 3
    Const TYPE_GOLD_GORGON_STATUE: Int = 4

    Global fallenCrates: List<Crate> = New List<Crate>()
    Global fallenGargoyles: List<Gargoyle> = New List<Gargoyle>()
    Global crateList: List<Crate> = New List<Crate>()

    Function ProcessFallenCrates: Void()
        Debug.TraceNotImplemented("Crate.ProcessFallenCrates()")
    End Function

    Function SelectItem: Int(itemLevel: Int)
        Debug.TraceNotImplemented("Crate.SelectItem()")
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
    Field contents: String = "no_item"
    Field initialYOff: Int
    Field contents2: String = "no_item"
    Field contents3: String = "no_item"
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
        Debug.TraceNotImplemented("Crate.DetermineContents()")
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

    Method GetMovementDirection: Object()
        Debug.TraceNotImplemented("Crate.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Crate.Hit()")
    End Method

    Method IsGorgonStatue: Bool()
        Debug.TraceNotImplemented("Crate.IsGorgonStatue()")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("Crate.Knockback()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Crate.MoveFail()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Crate.MoveImmediate()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Crate.MoveSucceed()")
    End Method

    Method Open: Bool(playSound: Bool)
        Debug.TraceNotImplemented("Crate.Open()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Crate.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Crate.Update()")
    End Method

    Method NoTrim: Void()
        Super.NoTrim()
        ProcessFallenCrates()
        SelectItem(0)
        DecideIfStayingEmpty()
        DetermineContents()
        DetermineContentsNow_PlayerDoesntOwn()
        Die()
        GetMovementDirection()
        Hit(0, 0, 0, Null, False, 0)
        IsGorgonStatue()
        Knockback(0)
        MoveFail()
        MoveImmediate(0, 0, 0)
        MoveSucceed(False, False)
        Open(False)
        Render()
        Update()
    End Method

End Class
