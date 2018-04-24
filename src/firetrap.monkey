'Strict

Import entity
Import logger
Import trap

Class FireTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, d: Int, m: Bool)
        Debug.TraceNotImplemented("FireTrap.New(Int, Int, Int, Bool)")
    End Method

    Field fireDir: Int
    Field manual: Bool
    Field isReady: Bool
    Field vibrateCounter: Int
    Field vibrateOffset: Float
    Field shootBeats: Int
    Field retractBeats: Int

    Method CheckTriggerRadius: Bool(ent: Object)
        Debug.TraceNotImplemented("FireTrap.CheckTriggerRadius(Object)")
    End Method

    Method DoShot: Void()
        Debug.TraceNotImplemented("FireTrap.DoShot()")
    End Method

    Method GetFrameToShow: Int()
        Debug.TraceNotImplemented("FireTrap.GetFrameToShow()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("FireTrap.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Move: Void()
        Debug.TraceNotImplemented("FireTrap.Move()")
    End Method

    Method Ready: Void()
        Debug.TraceNotImplemented("FireTrap.Ready()")
    End Method

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("FireTrap.Trigger(Entity)")
    End Method

    Method Unready: Void()
        Debug.TraceNotImplemented("FireTrap.Unready()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("FireTrap.Update()")
    End Method

End Class
