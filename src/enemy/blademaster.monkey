'Strict

Import enemy
Import entity
Import logger
Import player_class
Import point
Import shrine
Import util

Class Blademaster Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            If l = 1
                l = 2
            End If
        End If

        Self.Init(xVal, yVal, l, "blademaster")

        Self.overrideHitSound = "blademasterHit"
        Self.overrideAttackSound = "blademasterAttackNear"
        Self.overrideDeathSound = "blademasterDeath"
    End Method

    Field charging: Bool
    Field hitDir: Int = Direction.None
    Field vulnerable: Bool

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("ArmoredSkeleton.CanBeLord()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Blademaster.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Blademaster.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Blademaster.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Blademaster.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        If Util.IsCharacterActive(Character.Mary)
            Self.coinsToDrop = 0
            Super.Die()
        End If

        If Self.charging
            If Self.GetBeatNum() Mod 2 = 1
                Self.animOverride = Audio.GetBeatAnimFrame4() + 12
            Else
                Self.animOverride = Audio.GetBeatAnimFrame4() + 8
            End If
        Else
            If Self.vulnerable
                Self.animOverride = Audio.GetBeatAnimFrame4() + 16
            Else
                Self.animOverride = -1
            End If
        End If

        Super.Update()

        If Not Self.isMysteried
            If Self.image.flipX
                Self.xOff = -2.0
            Else
                Self.xOff = -13.0
            End If
        End If
    End Method

End Class
