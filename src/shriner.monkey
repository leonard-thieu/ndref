Strict

Import level
Import npc
Import shrine

Class Shriner Extends NPC

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        Self.NPCInit(xVal, yVal, l, "shriner", captv, False)

        Self.speechX = xVal
        Self.speechY = yVal - 1

        Local tile := Level.GetTileAt(xVal, yVal - 1)
        tile.AddTextLabel("|123|USE A SHRINE?|", 0, 16, 0.0, False, True)
    End Method

    Field preventShrineDeath: Bool = True
    Field speechX: Int
    Field speechY: Int
    Field shrine1: Shrine
    Field shrine2: Shrine
    Field shrine3: Shrine
    Field hasSummoned: Bool

End Class
