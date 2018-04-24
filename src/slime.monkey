'Strict

Import enemy
Import logger
Import point

Class Slime Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Slime.New(Int, Int, Int)")
    End Method

    Field moveCount: Int

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Slime.CanBeLord()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Slime.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Slime.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Slime.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Slime.MoveSucceed(Bool, Bool)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Slime.PerformMovement(Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Slime.Update()")
    End Method

End Class
