'Strict

Import controller_game
Import logger
Import npc

Class Transmogrifier Extends NPC

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        Self.NPCInit(xVal, yVal, l, "transmogrifier", captv, False)

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

        Self.speechX = xVal
        Self.speechY = yVal - 1

        Local tile := Level.GetTileAt(xVal, yVal - 2)
        tile.AddTextLabel("|121|TRANSMOGRIFY ONE OF YOUR ITEMS?|", 0, 16, 0.0, False, True)

        Self.DisplayCost()
    End Method

    Field actionCost: Int = 10
    Field speechX: Int
    Field speechY: Int

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Transmogrifier.CanBeDamaged()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Transmogrifier.Die()")
    End Method

    Method DisplayCost: Void()
        Debug.TraceNotImplemented("Transmogrifier.DisplayCost()")
    End Method

    Method GetCost: Int()
        Debug.TraceNotImplemented("Transmogrifier.GetCost()")
    End Method

    Method GetMovementDirection: Object()
        Debug.TraceNotImplemented("Transmogrifier.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Transmogrifier.Hit()")
    End Method

    Method IncreaseCost: Void()
        Debug.TraceNotImplemented("Transmogrifier.IncreaseCost()")
    End Method

    Method NoTrim: Void()
        CanBeDamaged(False, False)
        Die()
        DisplayCost()
        GetCost()
        GetMovementDirection()
        Hit(0, 0, 0, Null, False, 0)
        IncreaseCost()
    End Method

End Class
