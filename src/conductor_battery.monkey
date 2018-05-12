'Strict

Import conductor
Import enemy
Import entity
Import logger
Import water_ball

Class ConductorBattery Extends Enemy

    Global allBatteries: Object

    Function GetBatteryAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("ConductorBattery.GetBatteryAt(Int, Int)")
    End Function

    Function WaterBallDeath: Void(enemy: WaterBall)
        Debug.TraceNotImplemented("ConductorBattery.WaterBallDeath(WaterBall)")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, bNum: Int)
        Debug.TraceNotImplemented("ConductorBattery.New(Int, Int, Int)")
    End Method

    Field batteryNum: Int
    Field parent: Conductor
    Field vibrateCounter: Int
    Field origXOff: Int
    Field vibrateOffset: Float
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

    Method Update: Void()
        Debug.TraceNotImplemented("ConductorBattery.Update()")
    End Method

End Class
