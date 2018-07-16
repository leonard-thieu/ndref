Strict

Import controller.controller_game
Import enemy
Import entity
Import logger
Import necrodancergame
Import player_class
Import point
Import util

Class Ghost Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "ghost")

        Self.image.SetAlphaTweenFromCurrent(0.4, 5)

        For Local i := 0 Until Self.lastDist.Length
            Self.lastDist[i] = 9999.0
        End For

        Self.overrideAttackSound = "ghostAttack"
        Self.overrideDeathSound = "ghostDeath"
    End Method

    Field lastDist: Float[necrodancergame.MAX_NUM_PLAYERS]
    Field movingAway: Bool

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Ghost.CanBeDamaged(Bool, Bool)")
    End Method

    Method GetMovementDirection: Point()
        If Self.movingAway
            Return Self.BasicSeek()
        End If

        Return New Point(0, 0)
    End Method

    Method Move: Int()
        Self.ProcessDistanceChanges()

        If Not Self.flaggedForDeath
            If Self.currentMoveDelay <= 1 Or
               (Enemy.enemiesFearfulDuration > 0 And
                Not Self.isCrate)
                Return Super.Move()
            End If
        End If

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            Self.lastDist[i] = Util.GetDist(Self.x, Self.y, player.x, player.y)
        End For

        If Not Self.flaggedForDeath
            Return 3
        End If

        Return 0
    End Method

    Method ProcessDistanceChanges: Void()
        Local dist := 999999.0
        Local v44: Bool[necrodancergame.MAX_NUM_PLAYERS]

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If Not player.Perished
                Local distToPlayer := Util.GetDist(Self.x, Self.y, player.x, player.y)
                Local lastDistToPlayer := Util.GetDist(Self.x, Self.y, player.lastX, player.lastY)

                If distToPlayer * 1000.0 < dist * 1000.0
                    dist = distToPlayer
                End If

                If Not player.IsStandingStill()
                    If lastDistToPlayer * 1000.0 < dist * 1000.0
                        dist = lastDistToPlayer
                    End If
                End If
            End If
        End For

        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If Not player.Perished
                Local distToPlayer := Util.GetDist(Self.x, Self.y, player.x, player.y)
                Local lastDistToPlayer := Util.GetDist(Self.x, Self.y, player.lastX, player.lastY)

                If distToPlayer * 1000.0 > dist * 1000.0
                    If Not player.IsStandingStill()
                        If lastDistToPlayer * 1000.0 <= dist * 1000.0
                            v44[i] = True
                        End If
                    End If
                Else
                    v44[i] = True
                End If
            End If
        End For

        Local v43 := False
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            Local distToPlayer := Util.GetDist(Self.x, Self.y, player.x, player.y)

            If v44[i]
                If distToPlayer * 1000.0 > Self.lastDist[i] * 1000.0
                    v43 = True
                Else If distToPlayer * 1000.0 < Self.lastDist[i] * 1000.0
                    Self.movingAway = False
                End If
            End If

            Self.lastDist[i] = distToPlayer
        End For

        If v43
            Self.movingAway = True
        End If
    End Method

    Method Update: Void()
        If Util.IsCharacterActive(Character.Mary)
            Self.coinsToDrop = 0
            Self.Die()
        End If

        If Self.frozenDuration <= 0 And
           Not Self.movingAway And
           Enemy.enemiesFearfulDuration <= 0
            Self.image.SetAlphaTweenFromCurrent(0.4, 5)
        Else
            Self.image.SetAlphaTweenFromCurrent(1.0, 5)
        End If

        If Self.renderSilhouette And
           Not Self.IsInAnyPlayerLineOfSight() And
           Not Entity.AnyPlayerHaveCircletOrGlassTorch()
            Self.image.SetAlphaTweenFromCurrent(1.0, 5)
        End If

        If Self.bounce <> Null
            Self.yOff = Self.bounce.GetVal() - 4.0
        End If

        Self.ProcessDistanceChanges()

        Super.Update()
    End Method

End Class
