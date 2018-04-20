'Strict

Import monkey.list
Import entity
Import logger

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
        Debug.TraceNotImplemented("Chest.ClearAllSingleChoiceChests()")
    End Function

    Function GetChestAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Chest.GetChestAt()")
    End Function

    Function GetEmptyNonSecretChest: Object()
        Debug.TraceNotImplemented("Chest.GetEmptyNonSecretChest()")
    End Function

    Function GetEmptySecretChest: Object()
        Debug.TraceNotImplemented("Chest.GetEmptySecretChest()")
    End Function

    Function GetNumEmptyNonSecretChests: Int()
        Debug.TraceNotImplemented("Chest.GetNumEmptyNonSecretChests()")
    End Function

    Function GetNumEmptySecretChests: Int()
        Debug.TraceNotImplemented("Chest.GetNumEmptySecretChests()")
    End Function

    Function IsItemAppropriateForChestColor: Bool(cont: String, tmpColor: Int)
        Local slot := Item.GetSlot(cont)

        If slot = "body" Or
           slot = "weapon" Or
           slot = "feet"
            Return tmpColor = Chest.CHEST_COLOR_BLACK
        End If

        If slot = "spell" Or
           slot = "ring" Or
           Item.IsItemOfType(cont, "isScroll")
            Return tmpColor = Chest.CHEST_COLOR_WHITE
        End If

        Return tmpColor = Chest.CHEST_COLOR_RED
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, cont: String, invis: Bool, isLocked: Bool, isSecret: Bool, tmpColor: Int)
        Debug.TraceNotImplemented("Chest.New()")
    End Method

    Field chestColor: Int
    Field contents: String
    Field singleChoiceChest: Bool
    Field secretChest: Bool
    Field saleChest: Bool
    Field locked: Bool
    Field lockChest: Bool
    Field image2: Sprite
    Field image2XOff: Int
    Field image2YOff: Int
    Field bounce2: Bouncer
    
    Field singleChoice_: Bool

    Method AddKeyToContents: Void()
        Debug.TraceNotImplemented("Chest.AddKeyToContents()")
    End Method

    Method BecomeLocked: Void()
        Debug.TraceNotImplemented("Chest.BecomeLocked()")
    End Method

    Method DetermineContentsNow_PlayerDoesntOwn: Int()
        Debug.TraceNotImplemented("Chest.DetermineContentsNow_PlayerDoesntOwn()")
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
        Debug.TraceNotImplemented("Chest.Open()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Chest.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Chest.Update()")
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
