'Strict

Import entity
Import logger
Import trap

Class SpeedUpTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("SpeedUpTrap.New(Int, Int)")
    End Method

    Field speedUpStartBeat: Int
    Field currentMusicSpeed: Float

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("SpeedUpTrap.Trigger(Entity)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SpeedUpTrap.Update()")
    End Method

End Class
