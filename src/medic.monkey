'Strict

Import logger
Import npc

Class Medic Extends NPC

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        Self.NPCInit(xVal, yVal, l, "medic", captv, False)
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Medic.Update()")
    End Method

End Class
