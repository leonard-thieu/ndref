'Strict

Import familiar_fixed
Import logger

Class ShopkeeperFamiliar Extends FamiliarFixed

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int)
        Debug.TraceNotImplemented("ShopkeeperFamiliar.New(Int, Int)")
    End Method

    Method ApplyEffect: Bool(dir: Int)
        Debug.TraceNotImplemented("ShopkeeperFamiliar.ApplyEffect(Int)")
    End Method

    Method TryPickup: Void()
        Debug.TraceNotImplemented("ShopkeeperFamiliar.TryPickup()")
    End Method

End Class
