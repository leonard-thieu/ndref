'Strict

Import monkey.list
Import enemy
Import logger
Import sprite

Class NPC Extends Enemy Abstract

    Global npcList: List<NPC> = New List<NPC>()

    Function GetCaptiveNPCAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("NPC.GetCaptiveNPCAt(Int, Int)")
    End Function

    Function GetDistFromClosestNPC: Float(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("NPC.GetDistFromClosestNPC(Int, Int)")
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
        Self.captive = captv
        Self.wasCaptive = captv
        Self.glassCage = glCage

        If captv
            If glCage
                Self.cageFrontImage = New Sprite("level/cage_glass_front.png", 1, Image.DefaultFlags)
            Else
                Self.cageFrontImage = New Sprite("level/cage_front.png", 1, Image.DefaultFlags)
            End If

            Self.cageBackImage = New Sprite("level/cage_back.png", 1, Image.DefaultFlags)
        End If

        Self.Init(xVal, yVal, l, name, "", -1, -1)

        NPC.npcList.AddLast(Self)
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

End Class
