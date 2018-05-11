'Strict

Import enemy
Import logger
Import shrine

Class Gorgon Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "gorgon")

        Self.isGentle = True

        Self.overrideHitSound = "gorgonHit"
        Self.overrideDeathSound = "gorgonDeath"
    End Method

    Field statueFlashFrames: Int

    Method AfterHitPlayer: Void(p: Object)
        Debug.TraceNotImplemented("Gorgon.AfterHitPlayer(Object)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Gorgon.Die()")
    End Method

End Class
