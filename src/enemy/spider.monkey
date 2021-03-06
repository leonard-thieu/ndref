'Strict

Import controller.controller_game
Import enemy
Import level
Import audio2
Import logger
Import player_class
Import point
Import util

Class Spider Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "spider")

        Self.overrideDeathSound = "spiderDeath"
        Self.overrideAttackSound = "spiderAttack"

        Self.image.SetZOff(18.0)

        If Util.IsCharacterActive(Character.Aria) Or
           Util.IsCharacterActive(Character.Coda)
            If controller_game.currentZone >= 2
                Self.coinsToDrop = 0
                Self.Die()
            End If
        End If
    End Method

    Field onWall: Bool = True
    Field deathCounter: Int = -1
    Field attemptedMoveX: Int = -1
    Field attemptedMoveY: Int = -1

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Spider.GetMovementDirection()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Spider.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Spider.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        If Self.currentMoveDelay <= 1
            Self.animOverride = 4
        Else
            Self.animOverride = 1
        End If

        If Self.deathCounter > 0
            Self.deathCounter -= 1
        End If

        If Self.deathCounter = 0
            Self.Die()
        End If

        If Self.onWall And
           Not Level.IsWallAt(Self.x, Self.y)
            Self.onWall = False
            Self.beatsPerMove = 1
            Self.currentMoveDelay = 2
            Self.yOff += 8.0
            Self.ignoreWalls = False

            Audio.PlayGameSoundAt("spiderFall", Self.x, Self.y, False, -1, False)
        End If

        Super.Update()
    End Method

End Class
