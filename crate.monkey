Import monkey.list
Import enemy
Import gargoyle

Class Crate Extends Enemy

    Const TYPE_BARREL: Int = 1
    Const TYPE_URN: Int = 2
    Const TYPE_GREEN_GORGON_STATUE: Int = 3
    Const TYPE_GOLD_GORGON_STATUE: Int = 4

    Global fallenCrates: List<Crate>
    Global fallenGargoyles: List<Gargoyle>
    Global crateList: List<Crate>

    Method New(xVal: Int, yVal: Int, type: Int, cont: String)
    End Method

    Field cont: String

End Class
