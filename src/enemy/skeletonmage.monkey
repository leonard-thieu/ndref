'Strict

Import mojo.graphics
Import enemy
Import logger
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
        Debug.TraceNotImplemented("SkeletonMage.Update()")
    End Method

End Class
