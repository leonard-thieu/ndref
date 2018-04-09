Strict

Import monkey.list
Import enemy
Import gargoyle
Import level

Class Crate Extends Enemy

    Const TYPE_BARREL: Int = 1
    Const TYPE_URN: Int = 2
    Const TYPE_GREEN_GORGON_STATUE: Int = 3
    Const TYPE_GOLD_GORGON_STATUE: Int = 4

    Global fallenCrates: List<Crate>
    Global fallenGargoyles: List<Gargoyle>
    Global crateList: List<Crate>

    Function ProcessFallenCrates: Void()
        Throw New Throwable()
    End Function

    Function SelectItem: Int(itemLevel: Int)
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, type: Int, cont: String)
        Super.New()

        Self.isCrate = True
        Self.field_1E4 = True

        Self.Init(xVal, yVal, type + 1, "crate", "", -1, -1)

        Self.field_23C = Self.yOff ' WARN: This might be xOff.
        Self.subtype = type
        
        Self.cont = cont
        If Self.cont = "no_item" And Level.randSeed <> -1
            Self.DetermineContents()
        End If

        Crate.crateList.AddLast(Self)
    End Method

    Field subtype: Int
    Field cont: String = "no_item"
    Field field_23C: Int
    Field itemSlot: String = "no_item"
    Field item: String = "no_item"
    Field field_248: Bool
    Field field_24C: Int
    Field field_250: Bool
    Field field_254: Int
    Field field_258: Int
    Field field_25C: Int = -1
    Field field_260: Bool
    Field field_264: Int

    Method DecideIfStayingEmpty: Void()
        Throw New Throwable()
    End Method

    Method DetermineContents: Void()
        Throw New Throwable()
    End Method

    Method DetermineContentsNow_PlayerDoesntOwn: Int()
        Throw New Throwable()
    End Method

    Method Die: Void()
        Throw New Throwable()
    End Method

    Method GetMovementDirection: Object()
        Throw New Throwable()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Throw New Throwable()
    End Method

    Method IsGorgonStatue: Bool()
        Throw New Throwable()
    End Method

    Method Knockback: Void(dir: Int)
        Throw New Throwable()
    End Method

    Method MoveFail: Void()
        Throw New Throwable()
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Throw New Throwable()
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Throw New Throwable()
    End Method

    Method Open: Bool(playSound: Bool)
        Throw New Throwable()
    End Method

    Method Render: Void()
        Throw New Throwable()
    End Method

    Method Update: Void()
        Throw New Throwable()
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
