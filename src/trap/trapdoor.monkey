'Strict

Import entity
Import logger
Import trap

Class TrapDoor Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New(xVal, yVal, TrapType.TrapDoor)

        Self.xOff = 0.0
        Self.yOff = 15.0

        Self.image = New Sprite("traps/trapdoor.png", 25, 20, 4)
        Self.image.SetZ(-995.0)
    End Method

    Field keepMultiplier: Bool

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("TrapDoor.Trigger(Entity)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TrapDoor.Update()")
    End Method

End Class
