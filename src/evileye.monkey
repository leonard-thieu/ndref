'Strict

Import enemy
Import logger
Import point

Class EvilEye Extends Enemy

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int, l: Int)
        Debug.TraceNotImplemented("EvilEye.New(Int, Int, Int)")
    End Method

    Field dashDir: Int

    Method CheckDash: Void()
        Debug.TraceNotImplemented("EvilEye.CheckDash()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("EvilEye.GetMovementDirection()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("EvilEye.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("EvilEye.Update()")
    End Method

End Class
