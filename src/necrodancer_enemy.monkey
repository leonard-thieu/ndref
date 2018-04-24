'Strict

Import enemy
Import entity
Import item
Import logger
Import point
Import sprite

Class Necrodancer Extends Enemy

    Global necrodancer: Object
    Global wallsStep: Int

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Necrodancer.New(Int, Int, Int)")
    End Method

    Field bombStep: Int
    Field saidLutePhrase: Bool
    Field iceBlast: Sprite
    Field shieldImage: Sprite
    Field origXOff: Int
    Field actionTime: Int
    Field theLute: Item
    Field doingTransition: Bool
    Field lastAction: Int
    Field actionDelay: Int
    Field phase: Int
    Field summonCount: Int
    Field didCry: Bool
    Field actionDelayTime: Int
    Field spellNum: Int
    Field iceBlastDuration: Int
    Field lastSpell: Int
    Field vibrateCounter: Int
    Field vibrateOffset: Float
    Field madeLava: Bool

    Method CastIce: Void()
        Debug.TraceNotImplemented("Necrodancer.CastIce()")
    End Method

    Method ChooseSpell: Void()
        Debug.TraceNotImplemented("Necrodancer.ChooseSpell()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Necrodancer.Die()")
    End Method

    Method GetEnemyTypeFromBombStep: Int()
        Debug.TraceNotImplemented("Necrodancer.GetEnemyTypeFromBombStep()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Necrodancer.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Necrodancer.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IceAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Necrodancer.IceAt(Int, Int)")
    End Method

    Method InitFinalForm: Void()
        Debug.TraceNotImplemented("Necrodancer.InitFinalForm()")
    End Method

    Method MakeLava: Void()
        Debug.TraceNotImplemented("Necrodancer.MakeLava()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Necrodancer.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Necrodancer.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Necrodancer.Render()")
    End Method

    Method SummonAndTeleport: Void(doTeleport: Bool)
        Debug.TraceNotImplemented("Necrodancer.SummonAndTeleport(Bool)")
    End Method

    Method SummonEnemy: Void(enemyType: Int)
        Debug.TraceNotImplemented("Necrodancer.SummonEnemy(Int)")
    End Method

    Method SummonMiniboss: Void()
        Debug.TraceNotImplemented("Necrodancer.SummonMiniboss()")
    End Method

    Method SummonSarcophagi: Void()
        Debug.TraceNotImplemented("Necrodancer.SummonSarcophagi()")
    End Method

    Method TakeAction: Void()
        Debug.TraceNotImplemented("Necrodancer.TakeAction()")
    End Method

    Method Teleport: Void()
        Debug.TraceNotImplemented("Necrodancer.Teleport()")
    End Method

    Method TriggeredWalls: Void()
        Debug.TraceNotImplemented("Necrodancer.TriggeredWalls()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Necrodancer.Update()")
    End Method

End Class
