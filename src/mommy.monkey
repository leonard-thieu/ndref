'Strict

Import enemy
Import logger
Import mummy

Class Mommy Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Mommy.New(Int, Int, Int)")
    End Method

    Field readyToSpawn: Bool
    Field theMummy: Mummy

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Mommy.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Mommy.Update()")
    End Method

End Class
