'Strict

Import entity
Import level
Import logger
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

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Shriner.CanBeDamaged(Bool, Bool)")
    End Method

    Method Die: Void()
        Self.shrine1.cost = 0
        Self.shrine1.SetCost()
        Self.shrine2.cost = 0
        Self.shrine2.SetCost()
        Self.shrine3.cost = 0
        Self.shrine3.SetCost()

        Super.Die()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Shriner.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method SummonDragons: Void()
        Debug.TraceNotImplemented("Shriner.SummonDragons()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Shriner.Update()")
    End Method

End Class
