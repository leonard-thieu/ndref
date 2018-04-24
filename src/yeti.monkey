'Strict

Import enemy
Import logger

Class Yeti Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Yeti.New(Int, Int, Int)")
    End Method

    Field lastNonVisibleBeat: Int
    Field animState: Int

    Method Die: Void()
        Debug.TraceNotImplemented("Yeti.Die()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Yeti.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Yeti.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Yeti.Update()")
    End Method

End Class
