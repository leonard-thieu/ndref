'Strict

Import entity
Import logger
Import npc

Class Pawnbroker Extends NPC

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        Self.NPCInit(xVal, yVal, l, "pawnbroker", captv, False)
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Pawnbroker.Die()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Pawnbroker.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

End Class
