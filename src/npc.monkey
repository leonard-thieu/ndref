Strict

Import monkey.list
Import enemy
Import sprite

Class NPC Extends Enemy Abstract

    Global npcList: List<NPC> = New List<NPC>()

    Function GetCaptiveNPCAt: Object(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function GetDistFromClosestNPC: Float(xVal: Int, yVal: Int)
        Throw New Throwable()
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
        Throw New Throwable()
    End Method

    Method Die: Void()
        If Not Self.dead
            NPC.npcList.RemoveEach(Self)
            
            Super.Die()
        End If
    End Method

    Method NPCInit: Void(xVal: Int, yVal: Int, l: Int, name: String, captv: Bool, glCage: Bool)
        Throw New Throwable()
    End Method

    Method ReleaseFromCage: Void()
        Throw New Throwable()
    End Method

    Method Render: Void()
        Throw New Throwable()
    End Method

    Method Update: Void()
        Throw New Throwable()
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
