'Strict

Import enemy
Import logger

Class ShopkeeperGhost Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("ShopkeeperGhost.New(Int, Int, Int)")
    End Method

    Field soundPlaying: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("ShopkeeperGhost.Die()")
    End Method

    Method FindPan: Float()
        Debug.TraceNotImplemented("ShopkeeperGhost.FindPan()")
    End Method

    Method FindVolume: Float()
        Debug.TraceNotImplemented("ShopkeeperGhost.FindVolume()")
    End Method

    Method IsVisible: Bool()
        Debug.TraceNotImplemented("ShopkeeperGhost.IsVisible()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("ShopkeeperGhost.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ShopkeeperGhost.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ShopkeeperGhost.Update()")
    End Method

End Class
