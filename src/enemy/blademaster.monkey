'Strict

Import enemy
Import familiar
Import audio2
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
        Debug.TraceNotImplemented("Blademaster.CanBeLord()")
    End Method

    Method GetMovementDirection: Point()
        If Not Self.charging
            Return Self.BasicSeek()
        End If

        Local dir := Util.InvertDir(Self.hitDir)
        local dirPoint := Util.GetPointFromDir(dir)

        If Util.IsGlobalCollisionAt(Self.x + dirPoint.x, Self.y + dirPoint.y, False, False, False, False)
            Return Self.BasicSeek()
        End If

        If dirPoint.x > 0
            Self.image.FlipX(True, True)
        End If

        If dirPoint.x < 0
            Self.image.FlipX(False, True)
        End If

        Return dirPoint
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Blademaster.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Blademaster.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Local xDiff := Self.x - Self.lastX
        Local yDiff := Self.y - Self.lastY
        Local nextX := Self.x + xDiff
        Local nextY := Self.y + yDiff

        Local players := Util.GetPlayersAt(nextX, nextY)
        Local familiar := Familiar.GetFamiliarAt(nextX, nextY)

        If Not moveDelayed And
           Not hitPlayer And
           Self.charging
            If Util.InvertDir(Self.hitDir) = Util.GetDirFromDiff(Self.x - Self.lastX, Self.y - Self.lastY)
                Audio.PlayGameSoundAt("blademasterAttackFar", Self.x, Self.y, False, -1, False)

                For Local player := EachIn players
                    Local hitDir := Util.GetDirFromDiff(nextX - Self.x, nextY - Self.y)
                    player.Hit(Self.friendlyName, 2 * Self.damagePerHit, hitDir, Self)
                End For

                If familiar <> Null
                    Local hitDir := Util.GetDirFromDiff(nextX - Self.x, nextY - Self.y)
                    familiar.Hit(Self.friendlyName, 2 * Self.damagePerHit, hitDir, Self)
                End If

                Local moveTween := Self.moveTween
                Local moveShadowTween := Self.moveShadowTween

                Self.moveTween = 12
                Self.moveShadowTween = 12

                If Util.IsGlobalCollisionAt(nextX, nextY, False, False, False, False) Or
                   Not players.IsEmpty()
                    Self.PerformTween(Self.x, Self.y, Self.lastX, Self.lastY, Self.moveTween, Self.moveShadowTween, False)
                Else
                    Self.PerformTween(nextX, nextY, Self.lastX, Self.lastY, Self.moveTween, Self.moveShadowTween, False)

                    Self.x = nextX
                    Self.y = nextY

                    Local hitDir := Util.GetDirFromDiff(nextX - Self.x, nextY - Self.y)
                    Self.CheckFamiliarTouch(hitDir)
                End If

                Self.moveTween = moveTween
                Self.moveShadowTween = moveShadowTween
                Self.vulnerable = True
                Self.charging = False
                Self.hitDir = Direction.None

                Super.MoveSucceed(hitPlayer, moveDelayed)
            End If
        End If

        If Self.vulnerable
            Self.vulnerable = False
        End If

        If Not moveDelayed
            Self.charging = False
            Self.hitDir = Direction.None
        End If

        Super.MoveSucceed(hitPlayer, moveDelayed)
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
