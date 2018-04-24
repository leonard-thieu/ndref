'Strict

Import enemy
Import entity
Import item
Import logger
Import point

Class TrapChest Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "trap", "", -1, -1)

        Self.stealth = True
        Self.containsItem = True
        Self.overrideAttackSound = "mimicAttack"
        Self.overrideDeathSound = "mimicDeath"
        Self.overrideMoveSound = "mimicChase"

        If Level.randSeed <> -1
            Self.DetermineContents()
        End If
    End Method

    Field contents: String = Item.NoItem
    Field hasMoved: Bool
    Field itemDropped: Bool

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("TrapChest.CanBeDamaged(Bool, Bool)")
    End Method

    Method DetermineContents: Void()
        Debug.TraceNotImplemented("TrapChest.DetermineContents()")
    End Method

    Method Die: Void()
        If Not Self.dead
            Self.DropItem2()

            Super.Die()
        End If
    End Method

    Method DropItem2: Void()
        Debug.TraceNotImplemented("TrapChest.DropItem2()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("TrapChest.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("TrapChest.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TrapChest.Update()")
    End Method

End Class
