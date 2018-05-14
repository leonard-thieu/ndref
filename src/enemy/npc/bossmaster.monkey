Strict

Import enemy.npc

Class Bossmaster Extends NPC

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        Self.NPCInit(xVal, yVal, l, "bossmaster", captv, False)
    End Method

End Class
