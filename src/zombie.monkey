'Strict

Import enemy
Import logger
Import point
Import util

Class Zombie Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "zombie")

        Self.movesRegardlessOfDistance = True
        Self.facing = Util.RndIntRangeFromZero(3, True)

        Self.overrideAttackSound = "zombieAttack"
        Self.overrideDeathSound = "zombieDeath"
    End Method

    Field facing: Int = -1

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
