'Strict

Import enemy
Import logger
Import point

Class Minotaur Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Minotaur.New(Int, Int, Int)")
    End Method

    Field initalYOff: Int
    Field hasRoared: Bool
    Field chargingDir: Int
    Field stunnedTime: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Minotaur.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Minotaur.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Minotaur.MoveSucceed(Bool, Bool)")
    End Method

    Method TryChargeAt: Int(targetX: Int, targetY: Int)
        Debug.TraceNotImplemented("Minotaur.TryChargeAt(Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Minotaur.Update()")
    End Method

End Class
