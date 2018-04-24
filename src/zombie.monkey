'Strict

Import enemy
Import logger
Import point

Class Zombie Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Zombie.New(Int, Int, Int)")
    End Method

    Field facing: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Zombie.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Zombie.MoveFail()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Zombie.Update()")
    End Method

End Class
