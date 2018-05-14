'Strict

Import enemy.lute_dragon
Import enemy
Import entity
Import logger
Import point

Class LuteHead Extends Enemy

    Function _EditorFix: Void() End

    Method New(d: Object, xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("LuteHead.New(Object, Int, Int, Int)")
    End Method

    Field dragon: LuteDragon
    Field angryUntil: Int
    Field wasAngry: Bool
    Field spellNum: Int
    Field summonCount: Int
    Field darkFrames: Int
    Field attackState: Int
    Field lastFireballBeat: Int
    Field facingLeft: Bool
    Field justHit: Bool

    Method CastSpell2: Void()
        Debug.TraceNotImplemented("LuteHead.CastSpell2()")
    End Method

    Method ClearShot: Object()
        Debug.TraceNotImplemented("LuteHead.ClearShot()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("LuteHead.Die()")
    End Method

    Method DoShot: Void()
        Debug.TraceNotImplemented("LuteHead.DoShot()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("LuteHead.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("LuteHead.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsAngry: Bool()
        Debug.TraceNotImplemented("LuteHead.IsAngry()")
    End Method

    Method IsValidMove: Bool(dir: Int)
        Debug.TraceNotImplemented("LuteHead.IsValidMove(Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("LuteHead.MoveSucceed(Bool, Bool)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("LuteHead.PerformMovement(Int, Int)")
    End Method

    Method PerformTween: Void(xVal: Int, yVal: Int, oldX: Int, oldY: Int, tweenType: Int, shadowTweenType: Int, bufferTween: Bool)
        Debug.TraceNotImplemented("LuteHead.PerformTween(Int, Int, Int, Int, Int, Int, Bool)")
    End Method

    Method SummonEnemy: Object(enemyType: Int)
        Debug.TraceNotImplemented("LuteHead.SummonEnemy(Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("LuteHead.Update()")
    End Method

End Class
