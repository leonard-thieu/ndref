'Strict

Import enemy
Import entity
Import logger
Import necrodancergame
Import point
Import shrine
Import util

Class Goblin Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "goblin")

        For Local i := 0 Until Self.lastDist.Length
            Self.lastDist[i] = 9999.0
        End For

        Self.overrideAttackSound = "goblinAttack"
        Self.overrideDeathSound = "goblinDeath"
        Self.overrideHitSound = "goblinHit"

        Self.swarmCulprit = True
    End Method

    Field lastDist: Float[necrodancergame.MAX_NUM_PLAYERS]
    Field movingAway: Bool
    Field lastVocalization: Int = -1

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Goblin.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int = Direction.None, hitter: Entity = Null, hitAtLastTile: Bool = False, hitType: Int = 0)
        Debug.TraceNotImplemented("Goblin.Hit(String, Int, Int, Entity, Bool, Int)")
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
