'Strict

Import enemy.conductor_battery
Import audio2
Import enemy
Import level
Import logger
Import player_class
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

    Method AfterHitPlayer: Void(p: Player)
        Debug.TraceNotImplemented("WaterBall.AfterHitPlayer(Player)")
    End Method

    Method Die: Void()
        Super.Die()

        ConductorBattery.WaterBallDeath(Self)

        If Self.enableDeathEffects
            Self.PlaceTileAt(Self.x, Self.y)
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("WaterBall.GetMovementDirection()")
    End Method

    Method PlaceTileAt: Void(tileX: Int, tileY: Int)
        Select Self.level
            Case 1
                Level.PlaceTileTypeAt(Self.x, Self.y, TileType.Water)
            Default
                Level.PlaceTileTypeAt(Self.x, Self.y, TileType.Tar)
        End Select
    End Method

End Class
