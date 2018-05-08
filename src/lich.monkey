'Strict

Import mojo.graphics
Import enemy
Import logger
Import player_class
Import shrine
Import sprite

Class Lich Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 3
        End If

        Self.Init(xVal, yVal, l, "lich")

        Self.gustImage = New Sprite("particles/wind_gust.png", 7, Image.MidHandle)

        Self.overrideHitSound = "skeletonHit"
        Self.overrideDeathSound = "skeletonDeath"
        Self.overrideAttackSound = "skeletonAttack"
    End Method

    Field gustImage: Sprite
    Field playerGusted: Player
    Field animStartAt: Int

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Lich.MoveImmediate(Int, Int, String)")
    End Method

End Class
