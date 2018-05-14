'Strict

Import enemy.crate
Import enemy
Import item
Import logger
Import shrine
Import util

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
        Local flipX := Self.image.flipX

        Super.Die()

        If Self.enableDeathEffects And
           Not Self.falling And
           Not Util.IsGlobalCollisionAt(Self.x, Self.y, False, False, False, False) And
           Not Util.IsAnyPlayerAt(Self.x, Self.y)
            Local type := Crate.TYPE_GREEN_GORGON_STATUE
            If Self.level = 2
                type = Crate.TYPE_GOLD_GORGON_STATUE
            End If

            Local crate := New Crate(Self.x, Self.y, type, Item.NoItem)
            crate.gorgonFlipX = flipX
            crate.gorgonFlashFrames = Self.statueFlashFrames
        End If
    End Method

End Class
