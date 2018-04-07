Strict

Import monkey.list
Import entity

Class Chest Extends Entity

    Const CHEST_COLOR_BLACK: Int = 2
    Const CHEST_COLOR_BLUE: Int = 4
    Const CHEST_COLOR_NONE: Int = 0
    Const CHEST_COLOR_RED: Int = 1
    Const CHEST_COLOR_WHITE: Int = 3

    Global chestList: List<Chest>
    Global lastChestColor: Int
    Global lastChestColor2: Int

    Function ClearAllSingleChoiceChests: Void(except: Object)
        Throw New Throwable()
    End Function

    Function GetChestAt: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function GetEmptyNonSecretChest: Object()
        Throw New Throwable()
    End Function

    Function GetEmptySecretChest: Object()
        Throw New Throwable()
    End Function

    Function GetNumEmptyNonSecretChests: Int()
        Throw New Throwable()
    End Function

    Function GetNumEmptySecretChests: Int()
        Throw New Throwable()
    End Function

    Function IsItemAppropriateForChestColor: Bool(cont: Int, tmpColor: Int)
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, cont: String, invis: Bool, isLocked: Bool, isSecret: Bool, tmpColor: Int)
        Throw New Throwable()
    End Method

    Field color: Int
    Field cont: String
    Field field_F8: Bool
    Field field_FA: Bool
    Field isLocked: Bool
    
    Field singleChoice_: Bool

    Method AddKeyToContents: Void()
        Throw New Throwable()
    End Method

    Method BecomeLocked: Void()
        Throw New Throwable()
    End Method

    Method DetermineContentsNow_PlayerDoesntOwn: Int()
        Throw New Throwable()
    End Method

    Method Die: Void()
        Throw New Throwable()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Return False
    End Method

    Method Open: Bool(player: Object)
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
        ClearAllSingleChoiceChests(Null)
        GetChestAt(0, 0)
        GetEmptyNonSecretChest()
        GetEmptySecretChest()
        GetNumEmptyNonSecretChests()
        GetNumEmptySecretChests()
        IsItemAppropriateForChestColor(0, 0)
        AddKeyToContents()
        BecomeLocked()
        DetermineContentsNow_PlayerDoesntOwn()
        Die()
        Open(Null)
        Render()
        Update()
    End Method

End Class
