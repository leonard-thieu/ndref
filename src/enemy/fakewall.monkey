'Strict

Import controller.controller_game
Import enemy
Import audio2
Import item
Import level
Import logger
Import point
Import util

Class FakeWall Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "fakewall")

        Self.stealth = True

        If Self.level = 2
            Self.containsItem = True
        End If

        Self.overrideMoveSound = "wallMonsterChase"
        Self.overrideDeathSound = "wallMonsterDeath"
        Self.overrideHitSound = "wallMonsterHit"
        Self.overrideAttackSound = "wallMonsterAttack"
    End Method

    Field hasMoved: Bool
    Field goldDropped: Bool

    Method Die: Void()
        Self.DropItem()

        Super.Die()
    End Method

    Method DropItem: Void()
        If Not Level.isTrainingMode Or
           Self.level = 2 And
           Not Self.goldDropped
            Self.goldDropped = True

            New Item(Self.x, Self.y, "resource_coin10", False, -1, False)
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("FakeWall.GetMovementDirection()")
    End Method

    Method Update: Void()
        Local distSqFromClosestPlayer := Util.GetDistSqFromClosestPlayer(Self.x, Self.y, True, False)
        
        Local maxDist := 1.0
        If Self.level = 2
            maxDist = 2.0
        End If

        If maxDist >= distSqFromClosestPlayer And
           Self.stealth
            Self.currentMoveDelay = 2

            If Enemy.EnemiesHaveMovedClosestBeat() Or
               (Audio.IsFixedBeatSet() And
                Not controller_game.incrementFixedBeatNum)
                Self.currentMoveDelay = 1
            End If

            Self.stealth = False

            Audio.PlayGameSoundAt("wallMonsterCry", Self.x, Self.y, False, -1, False)
        End If

        If Not Self.stealth
            Self.animOverride = -1
        Else If distSqFromClosestPlayer <= 29.0 And
                Audio.IsBeatAnimTime(False, False)
            Self.animOverride = 1
        Else
            Self.animOverride = 0
        End If

        Super.Update()
    End Method

End Class
