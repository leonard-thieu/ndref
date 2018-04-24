'Strict

Import enemy
Import logger
Import point

Class SleepingGoblin Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("SleepingGoblin.New(Int, Int, Int)")
    End Method

    Field sleeping: Bool
    Field stunnedTime: Int
    Field wakeupTime: Int
    Field haveReslept: Bool

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("SleepingGoblin.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("SleepingGoblin.MoveFail()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SleepingGoblin.Update()")
    End Method

End Class
