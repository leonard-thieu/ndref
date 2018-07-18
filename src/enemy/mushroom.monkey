'Strict

Import enemy
Import logger
Import shrine

Class Mushroom Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "mushroom")

        Self.overrideHitSound = "mushroomHit"
        Self.overrideDeathSound = "mushroomDeath"
    End Method

    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 0.7

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Mushroom.MoveFail()")
    End Method

    Method Update: Void()
        If Self.currentMoveDelay <= 1
            Self.vibrateCounter -= 1
            If Self.vibrateCounter = 0
                Self.xOff = Self.vibrateOffset

                If Self.isLord
                    Self.xOff = Self.vibrateOffset - (Self.image.Width() / 4)
                End If

                Self.vibrateOffset = -Self.vibrateOffset
                Self.vibrateCounter = 3
            End If
        Else
            Self.xOff = 0.0
            If Self.isLord
                Self.xOff = Self.xOff - (Self.image.Width() / 4)
            End If
        End If

        Super.Update()
    End Method

End Class
