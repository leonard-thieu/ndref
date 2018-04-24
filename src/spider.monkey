'Strict

Import enemy
Import logger
Import point

Class Spider Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Spider.New(Int, Int, Int)")
    End Method

    Field onWall: Bool
    Field deathCounter: Int
    Field attemptedMoveX: Int
    Field attemptedMoveY: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Spider.GetMovementDirection()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Spider.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Spider.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Spider.Update()")
    End Method

End Class
