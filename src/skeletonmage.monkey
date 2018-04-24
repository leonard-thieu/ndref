'Strict

Import enemy
Import logger
Import player_class
Import point
Import sprite

Class SkeletonMage Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("SkeletonMage.New(Int, Int, Int)")
    End Method

    Field gustImage: Sprite
    Field playerGusted: Player
    Field animStartAt: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("SkeletonMage.GetMovementDirection()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("SkeletonMage.MoveImmediate(Int, Int, String)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("SkeletonMage.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SkeletonMage.Update()")
    End Method

End Class
