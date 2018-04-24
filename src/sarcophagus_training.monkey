'Strict

Import enemy
Import entity
Import logger
Import point

Class TrainingSarcophagus Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, eNum: Int)
        Debug.TraceNotImplemented("TrainingSarcophagus.New(Int, Int, Int)")
    End Method

    Field enemyNum: Int
    Field vibrateCounter: Int
    Field vibrateOffset: Float

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("TrainingSarcophagus.CanBeDamaged(Bool, Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("TrainingSarcophagus.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("TrainingSarcophagus.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("TrainingSarcophagus.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("TrainingSarcophagus.MoveSucceed(Bool, Bool)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("TrainingSarcophagus.PerformMovement(Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TrainingSarcophagus.Update()")
    End Method

End Class
