'Strict

Import monkey.list
Import chest
Import logger
Import sprite

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
        Debug.TraceNotImplemented("SaleChest.SetCost()")
    End Method

    Method SkipNextDraw: Void()
        Debug.TraceNotImplemented("SaleChest.SkipNextDraw()")
    End Method

End Class
