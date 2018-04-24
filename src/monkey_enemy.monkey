'Strict

Import enemyclamper
Import entity
Import logger
Import player_class

Class Monkey Extends EnemyClamper

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Monkey.New(Int, Int, Int)")
    End Method

    Field startingHealth: Int
    Field startingCoinsToDrop: Int
    Field clampedOnto: Player

    Method AttemptClamp: Void()
        Debug.TraceNotImplemented("Monkey.AttemptClamp()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Monkey.Die()")
    End Method

    Method DislodgeAttempt: Bool()
        Debug.TraceNotImplemented("Monkey.DislodgeAttempt()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Monkey.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Monkey.PerformMovement(Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Monkey.Update()")
    End Method

End Class
