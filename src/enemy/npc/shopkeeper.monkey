'Strict

Import enemy.npc
Import level
Import audio2
Import entity
Import fmod
Import gamedata
Import item
Import logger
Import point

Class Shopkeeper Extends NPC

    Global isMonstrous: Bool
    Global shopkeeperStartX: Int
    Global shopkeeperStartY: Int

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        If l <= 4 And
           GameData.GetDaoustVocals()
            Self.NPCInit(xVal, yVal, l + 5, "shopkeeper", captv, False)
        Else
            Self.NPCInit(xVal, yVal, l, "shopkeeper", captv, False)
        End If

        Self.level = l

        If l = 1 Or
           l = 5
            Self.isMainShopkeeper = True
            Shopkeeper.shopkeeperStartX = xVal
            Shopkeeper.shopkeeperStartY = yVal
        End If

        Self.overrideHitSound = "shopkeeperHit"
        Self.overrideDeathSound = "shopkeeperDeath"

        If l = 1
            Shopkeeper.isMonstrous = False
        Else If l = 5
            Shopkeeper.isMonstrous = True
            Self.overrideAttackSound = "shopkeeperMonstrousAttack"
            Self.overrideHitSound = "shopkeeperMonstrousHit"
            Self.overrideDeathSound = "shopkeeperMonstrousDeath"
        End If
    End Method

    Field hasRoared: Bool
    Field singingStopped: Bool
    Field lastBeatSFX: Int = -1

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Shopkeeper.CanBeDamaged(Bool, Bool)")
    End Method

    Method Die: Void()
        If Not Self.dead
            If Not Self.falling
                Local itemName: String

                Select Self.level
                    Case 4  itemName = ItemType.GluttonyCharm
                    Case 3  itemName = ItemType.GlassJaw
                    Case 2  itemName = ItemType.BloodDrum
                    Default itemName = ItemType.CrownOfGreed
                End Select

                New Item(Self.x, Self.y, itemName, False, -1, False)
            End If

            Super.Die()

            ' SKIPPED: Audio stuff.

            If Self.health <= 0 And
               Self.level <= 1
                Level.shopkeeperDead = True

                ' SKIPPED: Steam stats.

                If Level.isHardcoreMode
                    If controller_game.currentDepth >= 5
                        Level.shopkeeperGhostDepth = controller_game.currentDepth
                        Level.shopkeeperGhostLevel = controller_game.currentLevel + 1
                    Else
                        Level.shopkeeperGhostDepth = controller_game.currentDepth + 1
                        Level.shopkeeperGhostLevel = controller_game.currentLevel
                    End If
                Else
                    Level.shopkeeperGhostDepth = controller_game.currentDepth
                    Level.shopkeeperGhostLevel = 3
                End If
            End If

            Shopkeeper.isMonstrous = False
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Shopkeeper.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Shopkeeper.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsSinging: Bool()
        Debug.TraceNotImplemented("Shopkeeper.IsSinging()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Shopkeeper.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        ' Not equivalent to field `isMainShopkeeper`.
        Local isMainShopShopkeeper := False
        If Self.level = 5 Or
           Self.level <= 1
            isMainShopShopkeeper = True
        End If

        If Not Self.singingStopped And
           isMainShopShopkeeper
            If Self.health < Self.healthMax Or
               Self.hasRoared Or
               Self.falling
                If Audio.songShopkeeper <> -1
                    fmod.StopSoundFMOD(Audio.songShopkeeper)
                End If

                Audio.songShopkeeper = -1
                Self.singingStopped = True
            End If
        End If

        If Self.falling
            Level.shopkeeperFell = True
        End If

        If isMainShopShopkeeper
            ' SKIPPED: Audio
            ' SKIPPED: Musical note flyaway
        End If

        Super.Update()
    End Method

End Class
