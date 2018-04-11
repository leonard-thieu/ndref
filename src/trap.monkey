'Strict

Import monkey.list
Import entity
Import logger

Class Trap Extends Entity Abstract

    Global trapList: TrapList = New TrapList()

    Function FindRandomTrap: Trap()
        Debug.TraceNotImplemented("Trap.FindRandomTrap()")
    End Function

    Function GetTrapAt: Trap(xVal: Int, yVal: Int)
        For Local trap := EachIn trapList
            If trap.x = xVal And trap.y = yVal Then Return trap
        End For

        Return Null
    End Function

    Function IsLiveTrapAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Trap.IsLiveTrapAt()")
    End Function

    Function RemoveAll: Void()
        Debug.TraceNotImplemented("Trap.RemoveAll()")
    End Function

    Function _EditorFix: Void() End

    Method New()
        Super.New()

        Trap.trapList.AddLast(Self)
    End Method

    Field trapType: Int
    Field triggeredOnBeat: Int = -1
    Field willTriggerOn: Entity
    Field triggeredOn: Entity
    Field triggered: Bool
    Field isRune: Bool
    Field indestructible: Bool
    Field canBeReplacedByTempoTrap: Bool = True
    Field newTrap: Bool = True
    Field playerWasClose: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("Trap.Die()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Trap.Hit()")
    End Method

    Method IsLive: Bool()
        Debug.TraceNotImplemented("Trap.IsLive()")
    End Method

    Method Move: Void()
        Debug.TraceNotImplemented("Trap.Move()")
    End Method

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("Trap.Trigger()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Trap.Update()")
    End Method

    Method NoTrim: Void()
        FindRandomTrap()
        GetTrapAt(0, 0)
        IsLiveTrapAt(0, 0)
        RemoveAll()
        Die()
        Hit("", 0, 0, Null, False, 0)
        IsLive()
        Move()
        Trigger(Null)
        Update()
    End Method

End Class

Class TrapType

    Const BounceTrap: Int = 1
    Const SpikeTrap: Int = 2
    Const TrapDoor: Int = 3
    Const ConfuseTrap: Int = 4
    Const TeleportTrap: Int = 5
    Const SlowDownTrap: Int = 6
    Const SpeedUpTrap: Int = 7
    Const TravelRune: Int = 8
    Const BombTrap: Int = 9
    Const FireTrap: Int = 10
    Const ScatterTrap: Int = 14

End Class

Class TrapList Extends List<Trap>

End Class
