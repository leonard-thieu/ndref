'Strict

Import familiar_fixed
Import logger

Class Dove Extends FamiliarFixed

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int)
        Debug.TraceNotImplemented("Dove.New(Int, Int)")
    End Method

    Method ApplyEffect: Bool(dir: Int)
        Debug.TraceNotImplemented("Dove.ApplyEffect(Int)")
    End Method

End Class
