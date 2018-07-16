'Strict

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
        Debug.TraceNotImplemented("Ghost.GetMovementDirection()")
    End Method

    Method Move: Int()
        Debug.TraceNotImplemented("Ghost.Move()")
    End Method

    Method ProcessDistanceChanges: Void()
        Debug.TraceNotImplemented("Ghost.ProcessDistanceChanges()")
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
