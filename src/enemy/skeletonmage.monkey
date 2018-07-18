'Strict

Import monkey.math
Import mojo.graphics
Import enemy
Import logger
Import necrodancergame
Import player_class
Import point
Import shrine
Import sprite

Class SkeletonMage Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 3
        End If

        Self.Init(xVal, yVal, l, "skeletonmage")

        Self.gustImage = New Sprite("particles/wind_gust.png", 7, Image.MidHandle)

        Self.overrideHitSound = "skeletonHit"
        Self.overrideDeathSound = "skeletonDeath"
        Self.overrideAttackSound = "skeletonAttack"
    End Method

    Field gustImage: Sprite
    Field playerGusted: Player
    Field animStartAt: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("SkeletonMage.GetMovementDirection()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("SkeletonMage.MoveImmediate(Int, Int, String)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("SkeletonMage.Render()")
    End Method

    Method Update: Void()
        If Not Self.wasVisibleLastFrame And
           Self.hasBeenVisible
            Self.wasVisibleLastFrame = True
            Self.currentMoveDelay = 1
        Else
            Self.currentMoveDelay = 2
        End If

        If Self.animOverride <> -1
            Local animOverride := 1 + math.Floor((necrodancergame.globalFrameCounter - Self.animStartAt) / 5.0)
            If animOverride > 4
                animOverride = -1
            End If

            Self.animOverride = animOverride
        End If

        Super.Update()
    End Method

End Class
