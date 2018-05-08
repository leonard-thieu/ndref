'Strict

Import enemy
Import logger
Import point

Class SleepingGoblin Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "sleeping_goblin")

        Self.animOverride = 4

        Self.overrideAttackSound = "goblinAttack"
        Self.overrideDeathSound = "goblinDeath"
        Self.overrideHitSound = "goblinHit"
    End Method

    Field sleeping: Bool = True
    Field stunnedTime: Int
    Field wakeupTime: Int = 3
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
