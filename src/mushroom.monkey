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
        Debug.TraceNotImplemented("Mushroom.Update()")
    End Method

End Class
