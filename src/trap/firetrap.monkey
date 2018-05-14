'Strict

Import mojo.graphics
Import entity
Import logger
Import sprite
Import trap

Class FireTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, d: Int, m: Bool)
        Super.New(xVal, yVal, TrapType.FireTrap)

        Self.xOff = 12.0
        Self.yOff = 7.0

        Self.fireDir = d

        Self.image = New Sprite("traps/firetrap.png", 34, 23, 6, Image.MidHandle)
        Self.image.SetZOff(10.0)

        Self.manual = m
    End Method

    Field fireDir: Int
    Field manual: Bool
    Field isReady: Bool
    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 0.7
    Field shootBeats: Int = -1
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
