'Strict

Import controller_game
Import logger
Import npc
Import thing

Class Conjurer Extends NPC

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        Self.NPCInit(xVal, yVal, l, "conjurer", captv, False)

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]

            Select player.characterID
                Case Character.Monk
                Case Character.Dove
                Case Character.Coda
                    Self.actionCost = 0
                    Exit
            End Select
        End For

        Self.speechX = xVal + 1
        Self.speechY = yVal + 2

        Local tile := Level.GetTileAt(xVal + 1, yVal + 1)
        tile.AddTextLabel("|121|TRANSMOGRIFY ONE OF YOUR ITEMS?|", 0, 16, 0.0, False, True)

        Self.DisplayCost()

        ' TOdO: Args for `Thing`.
        Self.box = New Thing()
    End Method

    Field actionCost: Int = 40
    Field speechX: Int
    Field speechY: Int
    Field box: Thing

    Method Die: Void()
        Debug.TraceNotImplemented("Conjurer.Die()")
    End Method

    Method DisplayCost: Void()
        Debug.TraceNotImplemented("Conjurer.DisplayCost()")
    End Method

    Method IncreaseCost: Void()
        Debug.TraceNotImplemented("Conjurer.IncreaseCost()")
    End Method

    Method NoTrim: Void()
        Die()
        DisplayCost()
        IncreaseCost()
    End Method

End Class
