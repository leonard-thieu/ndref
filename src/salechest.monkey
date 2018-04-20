'Strict

Import monkey.list
Import chest
Import logger
Import sprite

Class SaleChest Extends Chest

    Global currentSaleChests: List<SaleChest> = New List<SaleChest>()

    Function ResetCosts: Void()
        Debug.TraceNotImplemented("ParticleSystem.ResetCosts()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, cont: String, invis: Bool, isSecret: Bool, isLocked: Bool, tmpColor: Int)
        Debug.TraceNotImplemented("SaleChest.New()")
    End Method

    Field cost: Int = 999
    Field digits: Sprite[4]
    Field digitVal: Int[4]

    Method CanSteal: Bool()
        Debug.TraceNotImplemented("ParticleSystem.CanSteal()")
    End Method

    Method Die: Void()
        SaleChest.currentSaleChests.RemoveEach(Self)

        Super.Die()
    End Method

    Method Open: Bool(player: Object)
        Debug.TraceNotImplemented("ParticleSystem.Open()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ParticleSystem.Render()")
    End Method

    Method SetCost: Void()
        Debug.TraceNotImplemented("ParticleSystem.SetCost()")
    End Method

    Method SkipNextDraw: Void()
        Debug.TraceNotImplemented("ParticleSystem.SkipNextDraw()")
    End Method

    Method NoTrim: Void()
        ResetCosts()
        CanSteal()
        Die()
        Open(Null)
        Render()
        SetCost()
        SkipNextDraw()
    End Method

End Class
