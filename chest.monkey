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
    End Function

    Function GetChestAt: Object(xVal: Int, yVal: Int)
    End Function

    Function GetEmptyNonSecretChest: Object()
    End Function

    Function GetEmptySecretChest: Object()
    End Function

    Function GetNumEmptyNonSecretChests: Int()
    End Function

    Function GetNumEmptySecretChests: Int()
    End Function

    Function IsItemAppropriateForChestColor: Bool(cont: Int, tmpColor: Int)
    End Function

    Function _EditorFix() End

    Method New(xVal: Int, yVal: Int, cont: String, invis: Bool, isLocked: Bool, isSecret: Bool, tmpColor: Int)
    End Method

    Field color: Int
    Field cont: String
    Field field_F8: Bool
    Field field_FA: Bool
    Field isLocked: Bool
    
    Field singleChoice_: Bool

    Method AddKeyToContents: Void()
    End Method

    Method BecomeLocked: Void()
    End Method

    Method DetermineContentsNow_PlayerDoesntOwn: Int()
    End Method

    Method Die: Void()
    End Method

    Method Open: Bool(player: Object)
    End Method

    Method Render: Void()
    End Method

    Method Update: Void()
    End Method

    Method NoTrim: Void()
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
