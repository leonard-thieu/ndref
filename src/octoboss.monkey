'Strict

Import monkey.list
Import enemy
Import entity
Import logger
Import point
Import tentacle

Class Octoboss Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Octoboss.New(Int, Int, Int)")
    End Method

    Field initXOff: Int
    Field tentacle3: Tentacle
    Field tentacle7: Tentacle
    Field tentacle5: Tentacle
    Field tentacle1: Tentacle
    Field tentacle2: Tentacle
    Field tentacle6: Tentacle
    Field tentacle8: Tentacle
    Field tentacle4: Tentacle
    Field phaseOrder: List<Int>
    Field phase: Int
    Field showHeartsDelay: Int
    Field phaseChangeBeat: Int
    Field vibrateCounter: Int
    Field vibrateOffset: Float
    Field runNum: Int

    Method BeginFinalPhase: Void(overrideSound: Bool)
        Debug.TraceNotImplemented("Octoboss.BeginFinalPhase(Bool)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Octoboss.Die()")
    End Method

    Method DoAttackSplash: Void()
        Debug.TraceNotImplemented("Octoboss.DoAttackSplash()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Octoboss.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Octoboss.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Octoboss.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Octoboss.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Octoboss.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Octoboss.Update()")
    End Method

End Class
