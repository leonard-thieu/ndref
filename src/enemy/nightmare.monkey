'Strict

Import enemy
Import level
Import audio2
Import camera
Import entity
Import logger
Import point
Import shrine
Import util

Class Nightmare Extends Enemy

    Global nightmare: Nightmare

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "nightmare")

        If l > 1
            Self.NIGHTMARE_DARKNESS_RADIUS = 3.5
        End If

        Self.ActivateLight(0.1, Self.NIGHTMARE_DARKNESS_RADIUS)
        Self.lightSourceBrightness = -15.0

        Nightmare.nightmare = Self

        Self.overrideAttackSound = "nightmareAttack"
        Self.overrideDeathSound = "nightmareDeath"
        Self.overrideHitSound = "nightmareHit"
        Self.overrideCrySound = "nightmareCry"
    End Method

    Field NIGHTMARE_DARKNESS_RADIUS: Float = 2.5
    Field seekDistance: Int = 9
    Field failedLastMove: Bool

    Method Die: Void()
        Super.Die()

        Nightmare.nightmare = Null
    End Method

    Method GetMovementDirection: Point()
        If Self.failedLastMove And
           Not Self.hasBeenVisible
            Return Self.RandomSeek(True, False)
        End If

        Return Self.BasicSeek()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Nightmare.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsVisible: Bool()
        Local tile := Level.GetTileAt(Self.x, Self.y)
        If tile <> Null And
           tile.IsInAnyPlayerLineOfSight()
            Return True
        End If

        Return Super.IsVisible()
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Nightmare.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        If Not moveDelayed
            Self.failedLastMove = False

            Camera.Shake(1, Self.x, Self.y)

            Audio.PlayGameSoundAt("dragonWalk", Self.x, Self.y, False, -1, False)
        End If

        Super.MoveSucceed(hitPlayer, moveDelayed)
    End Method

    Method Update: Void()
        If Self.seekDistance >= Util.GetDistFromClosestPlayer(Self.x, Self.y, False) Or
           Self.executedCry
            Self.movesRegardlessOfDistance = True
            Self.dontMove = False
        End If

        If Self.lastX > Self.x
            Self.image.FlipX(False, True)
            Self.xOff = -19.0
        End If

        If Self.lastX < Self.x
            Self.image.FlipX(True, True)
            Self.xOff = -15.0
        End If

        Super.Update()
    End Method

End Class
