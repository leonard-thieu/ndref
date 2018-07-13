'Strict

Import monkey.list
Import monkey.math
Import controller.controller_game
Import enemy
Import enemy.npc.conjurer
Import enemy.npc.pawnbroker
Import enemy.npc.shopkeeper
Import enemy.npc.shriner
Import enemy.npc.transmogrifier
Import gui.flyaway
Import level
Import gamedata
Import logger
Import player_class
Import sprite
Import util

Class NPC Extends Enemy Abstract

    Global npcList: List<NPC> = New List<NPC>()

    Function GetCaptiveNPCAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("NPC.GetCaptiveNPCAt(Int, Int)")
    End Function

    Function GetDistFromClosestNPC: Float(xVal: Int, yVal: Int)
        Local closestDist := 99999.0

        For Local npc := EachIn NPC.npcList
            If npc.dead Then Continue

            Local location := npc.GetLocation()
            Local dist := Util.GetDist(location.x, location.y, xVal, yVal)

            closestDist = math.Min(closestDist, dist)
        End For

        Return closestDist
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
        If Not Self.dead
            NPC.npcList.RemoveEach(Self)

            Super.Delete()
        End If
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
                Self.cageFrontImage = New Sprite("level/cage_glass_front.png", 1)
            Else
                Self.cageFrontImage = New Sprite("level/cage_front.png", 1)
            End If

            Self.cageBackImage = New Sprite("level/cage_back.png", 1)
        End If

        Self.Init(xVal, yVal, l, name)

        NPC.npcList.AddLast(Self)
    End Method

    Method ReleaseFromCage: Void()
        Debug.TraceNotImplemented("NPC.ReleaseFromCage()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("NPC.Render()")
    End Method

    Method Update: Void()
        If Shopkeeper(Self) = Null And
           Transmogrifier(Self) = Null And
           Conjurer(Self) = Null And
           Shriner(Self) = Null And
           Pawnbroker(Self) = Null
            Self.health = Self.healthMax
        End If

        If Self.IsVisible()
            Self.flyawayDelay += 1

            Select Self.flyawayDelay
                Case 120
                    If Self.captive
                        Local flyaway := New Flyaway("|211|HELP ME!|", Self.x, Self.y, -1, -14, True, 0.0, 0.2, True, -1)
                        flyaway.CenterX()
                    Else If Self.wasCaptive
                        Local flyaway := New Flyaway("|212|THANK YOU!!!|", Self.x, Self.y, -8, -6, True, 0.0, 0.2, True, -1)
                        flyaway.CenterX()
                    End If
                Case 210
                    If Self.captive
                        Select Self.xmlName
                            Case "merlin"
                                Local flyaway := New Flyaway("|213|DIG FOR THE GOLDEN KEY!|", Self.x, Self.y, 0, -14, True, 0.0, 0.2, True, -1)
                                flyaway.CenterX()
                            Case "diamonddealer"
                                Local flyaway := New Flyaway("|214|DID YOU BRING THE GLASS KEY?|", Self.x, Self.y, 0, -14, True, 0.0, 0.2, True, -1)
                                flyaway.CenterX()
                            Default
                                Local flyaway := New Flyaway("|215|BUY THE GOLDEN KEY!|", Self.x, Self.y, 0, -14, True, 0.0, 0.2, True, -1)
                                flyaway.CenterX()
                        End Select
                    Else If Self.wasCaptive
                        Local flyaway := New Flyaway("|216|SEE YOU IN THE LOBBY|", Self.x, Self.y, -20, -6, True, 0.0, 0.2, True, -1)
                        flyaway.CenterX()
                    End If

                    Self.flyawayDelay = 0
            End Select
        End If

        If Not Self.saidHi And
           controller_game.currentLevel = LevelType.Lobby And
           Util.GetDistFromClosestPlayer(Self.x, Self.y, False) <= 4.0 And
           Not Level.GetTileAt(Self.x, Self.y).IsInAnyPlayerTrueLineOfSight()
            If Self.saysHi
                Local player := controller_game.players[0]
                Player.ActuallyPlayVO("Hi", player)
            End If

            Self.saidHi = True

            GameData.SetNPCVisited(Self.xmlName, True)
        End If

        Super.Update()
    End Method

End Class
