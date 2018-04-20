'Strict

Import enemy
Import logger

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

    Field contents: String = "no_item"
    Field hasMoved: Bool
    Field itemDropped: Bool

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("TrapChest.CanBeDamaged()")
    End Method

    Method DetermineContents: Void()
        Debug.TraceNotImplemented("TrapChest.DetermineContents()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("TrapChest.Die()")
    End Method

    Method DropItem2: Void()
        Debug.TraceNotImplemented("TrapChest.DropItem2()")
    End Method

    Method GetMovementDirection: Object()
        Debug.TraceNotImplemented("TrapChest.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entiy, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("TrapChest.Hit()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TrapChest.Update()")
    End Method

    Method NoTrim: Void()
        CanBeDamaged(False, False)
        DetermineContents()
        Die()
        DropItem2()
        GetMovementDirection()
        Hit(0, 0, 0, Null, False, 0)
        Update()
    End Method

End Class
