'Strict

Import controller.controller_game
Import enemy.npc
Import level
Import entity
Import item
Import logger
Import player_class
Import point

Class Transmogrifier Extends NPC

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        Self.NPCInit(xVal, yVal, l, "transmogrifier", captv, False)

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]

            Select player.characterID
                Case Character.Monk,
                     Character.Dove,
                     Character.Coda
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
        Debug.TraceNotImplemented("Transmogrifier.CanBeDamaged(Bool, Bool)")
    End Method

    Method Die: Void()
        If Not Self.dead
            If Not Self.falling
                New Item(Self.x, Self.y, ItemType.TransmuteScroll, False, -1, False)
            End If

            Super.Die()
        End If
    End Method

    Method DisplayCost: Void()
        Debug.TraceNotImplemented("Transmogrifier.DisplayCost()")
    End Method

    Method GetCost: Int()
        Debug.TraceNotImplemented("Transmogrifier.GetCost()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Transmogrifier.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Transmogrifier.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IncreaseCost: Void()
        Debug.TraceNotImplemented("Transmogrifier.IncreaseCost()")
    End Method

End Class
