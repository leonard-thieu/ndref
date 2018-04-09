Strict

Import chest
Import sprite

Class SaleChest Extends Chest

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, cont: String, invis: Bool, isSecret: Bool, isLocked: Bool, tmpColor: Int)
        Throw New Throwable()
    End Method

    Field cost: Int
    Field digits: Sprite[]
    Field digitVal: Int[]

End Class
