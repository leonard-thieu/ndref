'Strict

Import monkey.list
Import enemy
Import enemy.conductor
Import enemy.water_ball
Import entity
Import logger

Class ConductorBattery Extends Enemy

    Global allBatteries: List<ConductorBattery> = New List<ConductorBattery>()

    Function GetBatteryAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("ConductorBattery.GetBatteryAt(Int, Int)")
    End Function

    Function WaterBallDeath: Void(enemy: WaterBall)
        For Local battery := EachIn ConductorBattery.allBatteries
            If enemy.enableDeathEffects
                If battery.x <> enemy.x Or
                   battery.y >= enemy.y
                    Continue
                End If
            Else
                Local player := Util.GetClosestPlayer(enemy.x, enemy.y)
                If battery.x <> player.x Or
                   battery.y >= player.y
                    Continue
                End If
            End If

            If enemy.y >= -7
                Continue
            End If

            battery.AddKills(8)
        End For
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, bNum: Int)
        Super.New()

        Self.isCrate = True

        Self.Init(xVal, yVal, 1, "conductor_battery")

        Self.origXOff = Self.xOff
        Self.neverSilhouette = True
        Self.batteryNum = bNum

        ConductorBattery.allBatteries.AddLast(Self)
    End Method

    Field batteryNum: Int
    Field parent: Conductor
    Field vibrateCounter: Int = 3
    Field origXOff: Int
    Field vibrateOffset: Float = 0.7
    Field killCount: Int

    Method AddKills: Void(num: Int)
        Debug.TraceNotImplemented("ConductorBattery.AddKills(Int)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("ConductorBattery.Die()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("ConductorBattery.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImmuneToEarth: Bool()
        Debug.TraceNotImplemented("ConductorBattery.ImmuneToEarth()")
    End Method

    Method ImmuneToFear: Bool()
        Debug.TraceNotImplemented("ConductorBattery.ImmuneToFear()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ConductorBattery.Update()")
    End Method

End Class
