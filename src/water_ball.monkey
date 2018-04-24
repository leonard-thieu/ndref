'Strict

Import enemy
Import logger
Import point

Class WaterBall Extends Enemy

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int, l: Int)
        Debug.TraceNotImplemented("WaterBall.New(Int, Int, Int)")
    End Method

    Method AfterHitPlayer: Void(p: Object)
        Debug.TraceNotImplemented("WaterBall.AfterHitPlayer(Object)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("WaterBall.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("WaterBall.GetMovementDirection()")
    End Method

    Method PlaceTileAt: Void(tileX: Int, tileY: Int)
        Debug.TraceNotImplemented("WaterBall.PlaceTileAt(Int, Int)")
    End Method

End Class
