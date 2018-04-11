Strict

Import npc

Class Pawnbroker Extends NPC

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        Self.NPCInit(xVal, yVal, l, "pawnbroker", captv, False)
    End Method

End Class
