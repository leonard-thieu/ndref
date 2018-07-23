'Strict

Import bomb
Import enemy
Import logger
Import point

Class GoblinBomber Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "goblin_bomber")

        Self.isGentle = True

        Self.overrideAttackSound = "goblinAttack"
        Self.overrideDeathSound = "goblinDeath"
    End Method

    Field dropBomb: Bool = True

    Method AfterHitHook2: Void(diffX: Int, diffY: Int)
        Debug.TraceNotImplemented("GoblinBomber.AfterHitHook2(Int, Int)")
    End Method

    Method Die: Void()
        Super.Die()

        If Self.dropBomb
            If Self.health <= 0
                New Bomb(Self.x, Self.y, Null, True, False, "bomb")
            End If
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("GoblinBomber.GetMovementDirection()")
    End Method

    Method Update: Void()
        If Not Self.hasBeenVisible
            Self.currentMoveDelay = 2
        Else If Not Self.wasVisibleLastFrame
            Self.wasVisibleLastFrame = False
            Self.currentMoveDelay = 1
        End If

        Super.Update()
    End Method

End Class
