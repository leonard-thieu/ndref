'Strict

Import enemyclamper
Import logger
Import player_class
Import point
Import sprite

Class TarMonster Extends EnemyClamper

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("TarMonster.New(Int, Int, Int)")
    End Method

    Field image2: Sprite
    Field homeX: Int
    Field homeY: Int
    Field startingCoinsToDrop: Int
    Field hasMoved: Bool
    Field clampedOnto: Player

    Method AttemptClamp: Void()
        Debug.TraceNotImplemented("TarMonster.AttemptClamp()")
    End Method

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("TarMonster.CanBeDamaged(Bool, Bool)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("TarMonster.Die()")
    End Method

    Method DislodgeAttempt: Bool()
        Debug.TraceNotImplemented("TarMonster.DislodgeAttempt()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("TarMonster.GetMovementDirection()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("TarMonster.MoveSucceed(Bool, Bool)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("TarMonster.PerformMovement(Int, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("TarMonster.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TarMonster.Update()")
    End Method

End Class
