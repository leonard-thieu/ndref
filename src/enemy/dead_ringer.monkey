'Strict

Import mojo.graphics
Import enemy.bell
Import audio2
Import enemy
Import entity
Import logger
Import point
Import sprite

Class DeadRinger Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, b1: Bell, b2: Bell, b3: Bell, b4: Bell)
        Super.New()

        Self.Init(xVal, yVal, l, "dead_ringer")

        Self.overrideHitSound = "deadRingerHit"
        Self.overrideDeathSound = "deadRingerDeath"

        If xVal > 0
            Self.seekingBell = True
        End If

        Self.bells[0] = b1
        Self.bells[1] = b2
        Self.bells[2] = b3
        Self.bells[3] = b4

        Self.imageStandard = Self.image
        Self.imageSmash = New Sprite("entities/dead_ringer_hammer.png", 35, 54, 28)
        Self.imageCharge = New Sprite("entities/dead_ringer_charge.png", 50, 43, 6)
        Self.imageChargeSwipe = New Sprite("swipes/swipe_dead_ringer.png", 24, 20, 4, Image.MidHandle)
    End Method

    Field seekingBell: Int
    Field bells: Bell[5]
    Field imageStandard: Sprite
    Field imageSmash: Sprite
    Field imageCharge: Sprite
    Field imageChargeSwipe: Sprite
    Field smashing: Bool
    Field phase: Int
    Field justSmashed: Bool
    Field smashCounter: Int
    Field chargingDir: Int = -1
    Field chargedDir: Int = -1
    Field chargeCounter: Int
    Field justGotHit: Bool
    Field readyToCharge: Bool
    Field chargedOriginX: Int
    Field chargedOriginY: Int
    Field chargedLength: Int

    Method Die: Void()
        If Not Self.dead
            Enemy.SetEnemiesToDropNoCoinsOverride()

            If Not RenderableObject.deletingAll
                Audio.PlayGameSoundAt("deadRingerDeath", Self.x, Self.y, False, -1, False)
            End If

            Super.Die()
            Enemy.KillAllEnemies()

            Local bigBell := Self.bells[4]
            If bigBell <> Null
                bigBell.Die()
            End If
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("DeadRinger.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("DeadRinger.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Move: Int()
        Debug.TraceNotImplemented("DeadRinger.Move()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("DeadRinger.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("DeadRinger.MoveSucceed(Bool, Bool)")
    End Method

    Method PossiblyStartCharge: Void()
        Debug.TraceNotImplemented("DeadRinger.PossiblyStartCharge()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("DeadRinger.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("DeadRinger.Update()")
    End Method

End Class
