'Strict

Import enemy
Import enemy.crate
Import item
Import logger
Import player_class
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

    Method AfterHitPlayer: Void(p: Player)
        Debug.TraceNotImplemented("Gorgon.AfterHitPlayer(Player)")
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

            Local crate := New Crate(Self.x, Self.y, type, ItemType.NoItem)
            crate.gorgonFlipX = flipX
            crate.gorgonFlashFrames = Self.statueFlashFrames
        End If
    End Method

End Class
