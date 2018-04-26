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
            If trap.x = xVal And
               trap.y = yVal
                Return trap
            End If
        End For

        Return Null
    End Function

    Function GetTrapTypeAt: Int(xVal: Int, yVal: Int)
        Local trap := Trap.GetTrapAt(xVal, yVal)
        If trap <> Null Then Return trap.trapType

        Return TrapType.None
    End Function

    Function IsLiveTrapAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Trap.IsLiveTrapAt(Int, Int)")
    End Function

    Function RemoveAll: Void()
        Debug.TraceNotImplemented("Trap.RemoveAll()")
    End Function

    Function _EditorFix: Void() End

    Method New()
        Super.New()

        Self.isTrap = True

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
        If Not Self.dead
            Trap.trapList.RemoveEach(Self)

            Super.Die()
        End If
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Trap.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsLive: Bool()
        Debug.TraceNotImplemented("Trap.IsLive()")
    End Method

    Method Move: Void()
        Debug.TraceNotImplemented("Trap.Move()")
    End Method

    Method Trigger: Void(ent: Entity)
        Self.willTriggerOn = Null
        Self.triggeredOn = ent
        Self.triggered = True
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Trap.Update()")
    End Method

End Class

Class TrapList Extends List<Trap>

    Function _EditorFix: Void() End

    Method Compare: Int(a: Object, b: Object)
        Debug.TraceNotImplemented("TrapList.Compare(Object, Object)")
    End Method

End Class

Class TrapType

    Const None: Int = 0
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
    Const ABTeleportTrap: Int = 11
    Const ScatterTrap: Int = 14

End Class
