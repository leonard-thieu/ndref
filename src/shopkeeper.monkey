'Strict

Import gamedata
Import logger
Import npc

Class Shopkeeper Extends NPC

    Global isMonstrous: Bool
    Global shopkeeperStartX: Int
    Global shopkeeperStartY: Int

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, captv: Bool)
        Super.New()

        If l <= 4 And GameData.GetDaoustVocals()
            Self.NPCInit(x, y, l + 5, "shopkeeper", captv, False)
        Else
            Self.NPCInit(x, y, l, "shopkeeper", captv, False)
        End If

        Self.level = l

        If l = 5 Or l = 1
            Self.isMainShopkeeper = True
            Shopkeeper.shopkeeperStartX = x
            Shopkeeper.shopkeeperStartY = y
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
        Debug.TraceNotImplemented("Shopkeeper.CanBeDamaged()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Shopkeeper.Die()")
    End Method

    Method GetMovementDirection: Object()
        Debug.TraceNotImplemented("Shopkeeper.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Shopkeeper.Hit()")
    End Method

    Method IsSinging: Bool()
        Debug.TraceNotImplemented("Shopkeeper.IsSinging()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Shopkeeper.MoveSucceed()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Shopkeeper.Update()")
    End Method

    Method NoTrim: Void()
        CanBeDamaged(False, False)
        Die()
        GetMovementDirection()
        Hit(0, 0, 0, Null, False, 0)
        IsSinging()
        MoveSucceed(False, False)
        Update()
    End Method

End Class
