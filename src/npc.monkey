'Strict

Import monkey.list
Import enemy
Import logger
Import sprite

Class NPC Extends Enemy Abstract

    Global npcList: List<NPC> = New List<NPC>()

    Function GetCaptiveNPCAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("NPC.GetCaptiveNPCAt()")
    End Function

    Function GetDistFromClosestNPC: Float(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("NPC.GetDistFromClosestNPC()")
    End Function

    Function _EditorFix: Void() End

    Method New()
        Super.New()

        Self.isNPC = True
    End Method

    Field attackedByPlayer: Bool
    Field captive: Bool
    Field glassCage: Bool
    Field flyawayDelay: Int
    Field wasCaptive: Bool
    Field cageFrontImage: Sprite
    Field cageBackImage: Sprite
    Field isMainShopkeeper: Bool
    Field saysHi: Bool = True
    Field saidHi: Bool

    Method Delete: Void()
        Debug.TraceNotImplemented("NPC.Delete()")
    End Method

    Method Die: Void()
        If Not Self.dead
            NPC.npcList.RemoveEach(Self)
            
            Super.Die()
        End If
    End Method

    Method NPCInit: Void(xVal: Int, yVal: Int, l: Int, name: String, captv: Bool, glCage: Bool)
        Debug.TraceNotImplemented("NPC.NPCInit()")
    End Method

    Method ReleaseFromCage: Void()
        Debug.TraceNotImplemented("NPC.ReleaseFromCage()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("NPC.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("NPC.Update()")
    End Method

    Method NoTrim: Void()
        GetCaptiveNPCAt(0, 0)
        GetDistFromClosestNPC(0, 0)
        Delete()
        Die()
        NPCInit(0, 0, 0, "", False, False)
        ReleaseFromCage()
        Render()
        Update()
    End Method

End Class
