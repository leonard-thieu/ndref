'Strict

Import familiar_fixed
Import logger

Class IceSpirit Extends FamiliarFixed

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int)
        Debug.TraceNotImplemented("IceSpirit.New(Int, Int)")
    End Method

    Method ApplyEffect: Bool(dir: Int)
        Debug.TraceNotImplemented("IceSpirit.ApplyEffect(Int)")
    End Method

End Class
