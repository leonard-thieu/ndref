'Strict

Import enemy
Import logger
Import point

Class Wight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Wight.New(Int, Int, Int)")
    End Method

    Field seeking: Bool
    Field hasRoared: Bool

    Method BecomeCorporeal: Void(force: Bool)
        Debug.TraceNotImplemented("Wight.BecomeCorporeal(Bool)")
    End Method

    Method CheckCorporeality: Void()
        Debug.TraceNotImplemented("Wight.CheckCorporeality()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Wight.GetMovementDirection()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Wight.Update()")
    End Method

End Class
