'Strict

Import controller.controller_game
Import enemy
Import audio2
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
        Local v43 := False
        
        Local distFromClosestPlayer := Util.GetDistFromClosestPlayer(Self.x, Self.y, False)
        If distFromClosestPlayer * 1000.0 <= 1000
            v43 = True
        Else
            For Local i := 0 Until controller_game.numPlayers
                Local player := controller_game.players[i]
                Local distToPlayer := Util.GetDist(Self.x, Self.y, player.x, player.y)

                If distToPlayer * 1000.0 > Self.lastDist[i] * 1000.0
                    v43 = True
                Else If distToPlayer * 1000.0 < Self.lastDist[i] * 1000.0
                    Self.movingAway = False
                End If

                Self.lastDist[i] = distToPlayer
            End For
        End If

        If v43
            Self.movingAway = True
        End If
    End Method

    Method Update: Void()
        Self.ProcessDistanceChanges()

        Local closestPlayer := Util.GetClosestPlayerIncludeItemEffects(Self.x, Self.y, False)
        If closestPlayer <> Null
            If closestPlayer.x > Self.x
                Self.image.FlipX(True, True)
            Else If closestPlayer.x < Self.x
                Self.image.FlipX(False, True)
            End If
        End If

        If Self.movingAway
            Self.animOverride = Audio.GetBeatAnimFrame4() + 4
        Else
            Self.animOverride = -1
        End If

        Super.Update()
    End Method

End Class
