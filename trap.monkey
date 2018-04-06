Import monkey.list
Import entity

Class Trap Extends Entity

    Global trapList: TrapList

    Function FindRandomTrap: Trap()
    End Function

    Function GetTrapAt: Trap(xVal: Int, yVal: Int)
        For Local trap := EachIn trapList
            If trap.x = xVal And trap.y = yVal Then Return trap
        End For

        Return Null
    End Function

    Function IsLiveTrapAt: Bool(xVal: Int, yVal: Int)
    End Function

    Function RemoveAll: Void()
    End Function

    Function _EditorFix() End

    Method New()
        Super.New()

        Trap.trapList.AddLast(Self)
    End Method

    Field type: Int
    Field field_F4: Int = -1
    Field field_F8: Int
    Field field_FC: Int
    Field field_100: Bool
    Field field_101: Bool
    Field field_102: Bool
    Field field_103: Bool = True
    Field field_104: Bool = True
    Field field_105: Bool

    Method Die: Void()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
    End Method

    Method IsLive: Bool()
    End Method

    Method Move: Void()
    End Method

    Method Trigger: Void(ent: Entity)
    End Method

    Method Update: Void()
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
