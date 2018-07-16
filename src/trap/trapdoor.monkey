'Strict

Import entity
Import item
Import logger
Import sprite
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
        Self.image.SetFrame(0)

        If Self.triggered
            Self.image.SetFrame(1)

            Local pickup := Item.GetPickupAt(Self.x, Self.y)
            If pickup <> Null
                pickup.Fall(False)
            End If
        End If

        Super.Update()
    End Method

End Class
