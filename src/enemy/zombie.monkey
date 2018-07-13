Strict

Import enemy
Import audio2
Import logger
Import point
Import util

Class Zombie Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "zombie")

        Self.movesRegardlessOfDistance = True
        Self.facing = Util.RndIntRangeFromZero(3, True)

        Self.overrideAttackSound = "zombieAttack"
        Self.overrideDeathSound = "zombieDeath"
    End Method

    Field facing: Int = Direction.None

    Method GetMovementDirection: Point()
        Return Util.GetPointFromDir(Self.facing)
    End Method

    Method MoveFail: Void()
        Super.MoveFail()

        Self.currentMoveDelay = 2
        Self.facing = Util.InvertDir(Self.facing)
    End Method

    Method Update: Void()
        Local animOffset: Int

        Select Self.facing
            Case Direction.Left
                Self.image.FlipX(False, True)
                animOffset = 0
            Case Direction.Right
                Self.image.FlipX(True, True)
                animOffset = 8
            Case Direction.Down
                animOffset = 16
        End Select

        If Self.currentMoveDelay >= 2
            animOffset += 4
        End If

        Self.animOverride = Audio.GetBeatAnimFrame4() + animOffset

        Super.Update()
    End Method

End Class
