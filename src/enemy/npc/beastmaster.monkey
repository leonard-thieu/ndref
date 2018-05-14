Strict

Import enemy.npc

Class Beastmaster Extends NPC

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        Self.NPCInit(xVal, yVal, l, "beastmaster", captv, False)
    End Method

End Class
