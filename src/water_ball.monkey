'Strict

Import audio2
Import enemy
Import logger
Import point

Class WaterBall Extends Enemy

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int, l: Int)
        Super.New()

        Self.Init(x_, y_, l, "water_ball")

        Self.isGentle = True

        If Self.level = 1
            Self.overrideDeathSound = "waterballDeath"
            Self.overrideCrySound = "waterballCry"
        Else If Audio.debugEnablePlaceholders
            Self.overrideAttackSound = "tarOut"
            Self.overrideDeathSound = "tarIn"
        End If
    End Method

    Method AfterHitPlayer: Void(p: Object)
        Debug.TraceNotImplemented("WaterBall.AfterHitPlayer(Object)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("WaterBall.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("WaterBall.GetMovementDirection()")
    End Method

    Method PlaceTileAt: Void(tileX: Int, tileY: Int)
        Debug.TraceNotImplemented("WaterBall.PlaceTileAt(Int, Int)")
    End Method

End Class
