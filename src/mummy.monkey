'Strict

Import enemy
Import logger
Import point

Class Mummy Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Mummy.New(Int, Int, Int)")
    End Method

    Field animNum: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Mummy.GetMovementDirection()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Mummy.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Mummy.Update()")
    End Method

End Class
