'Strict

Import enemy
Import logger
Import point

Class Goblin Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Goblin.New(Int, Int, Int)")
    End Method

    Field lastDist: Float[]
    Field movingAway: Bool
    Field lastVocalization: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Goblin.GetMovementDirection()")
    End Method

    Method Move: Int()
        Debug.TraceNotImplemented("Goblin.Move()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Goblin.MoveImmediate(Int, Int, String)")
    End Method

    Method ProcessDistanceChanges: Void()
        Debug.TraceNotImplemented("Goblin.ProcessDistanceChanges()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Goblin.Update()")
    End Method

End Class
