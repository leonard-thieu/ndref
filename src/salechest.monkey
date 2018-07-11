'Strict

Import monkey.list
Import controller.controller_game
Import level
Import chest
Import item
Import logger
Import player_class
Import saleitem
Import sprite
Import util

Class SaleChest Extends Chest

    Global currentSaleChests: List<SaleChest> = New List<SaleChest>()

    Function ResetCosts: Void()
        Debug.TraceNotImplemented("SaleChest.ResetCosts()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, cont: String, invis: Bool, isLocked: Bool, isSecret: Bool, tmpColor: Int)
        Super.New(xVal, yVal, cont, invis, isLocked, isSecret, tmpColor)

        Self.saleChest = True

        SaleChest.currentSaleChests.AddLast(Self)

        Self.SetCost()
    End Method

    Field cost: Int = 999
    Field digits: Sprite[4]
    Field digitVal: Int[4]

    Method CanSteal: Bool()
        Debug.TraceNotImplemented("SaleChest.CanSteal()")
    End Method

    Method Die: Void()
        SaleChest.currentSaleChests.RemoveEach(Self)

        Super.Die()
    End Method

    Method Open: Bool(player: Object)
        Debug.TraceNotImplemented("SaleChest.Open(Object)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("SaleChest.Render()")
    End Method

    Method SetCost: Void()
        Select Self.chestColor
            Case Chest.CHEST_COLOR_BLUE,
                 Chest.CHEST_COLOR_BLACK
                Self.cost = 40
            Case Chest.CHEST_COLOR_WHITE
                Self.cost = 30
            Default
                Self.cost = 20
        End Select

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Dove) Or
           Util.IsCharacterActive(Character.Coda)
            Self.cost = 0
        End If

        If Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfCharisma) Or
           Player.DoesAnyPlayerHaveItemOfType(ItemType.RingOfWonder)
            Self.cost *= SaleItem.CHARISMA_DISCOUNT
        End If

        If Level.isHardcoreMode
            Self.cost *= (controller_game.currentDepth * 0.5) + 2.0
        End If

        Debug.TraceNotImplemented("SaleChest.SetCost() (digit sprites)")
    End Method

    Method SkipNextDraw: Void()
        Debug.TraceNotImplemented("SaleChest.SkipNextDraw()")
    End Method

End Class
