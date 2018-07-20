'Strict

Import enemy
Import level
Import audio2
Import camera
Import entity
Import logger
Import player_class
Import point
Import util

Class Ghast Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "ghast")

        Self.invisible = True
        Self.collides = False
        Self.blink_MIN = 120
        Self.blink_MAX = 240
        Self.blink_DUR = 10

        Self.overrideAttackSound = "ghastAttack"
        Self.overrideDeathSound = "ghastDeath"

        Self.image.SetZOff(18.0)

        Self.isWraithLike = True

        If Util.IsCharacterActive(Character.Eli)
            Self.coinsToDrop = 0
            Self.Die()
        End If
    End Method

    Field seeking: Bool
    Field teleporting: Bool
    Field hitDir: Int = Direction.None
    Field hitPlayer: Entity
    Field skippedMove: Bool
    Field hasRoared: Bool
    Field beenHit: Bool

    Method BecomeCorporeal: Void(force: Bool)
        Debug.TraceNotImplemented("Ghast.BecomeCorporeal(Bool)")
    End Method

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Ghast.CanBeDamaged(Bool, Bool)")
    End Method

    Method CheckCorporeality: Void()
        Debug.TraceNotImplemented("Ghast.CheckCorporeality()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Ghast.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Ghast.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Ghast.Render()")
    End Method

    Method Update: Void()
        If Not Self.dead And
           Entity.AnyPlayerHaveNazarCharm()
            Self.coinsToDrop = 0
            Self.Die()
        End If

        If Not Enemy.EnemiesMovingThisFrame()
            Self.CheckCorporeality()
        End If

        If Self.frozenDuration <= 0 And
           Self.teleporting
            Self.teleporting = False

            Local teleportDir := Util.InvertDir(Self.hitDir)
            Local teleportDirPoint := Util.GetPointFromDir(teleportDir)

            If teleportDirPoint.x = 0 And
               teleportDirPoint.y = 0
                Local closestUnoccupiedSpace := Util.FindClosestUnoccupiedSpace(Self.hitPlayer.x, Self.hitPlayer.y, True)

                teleportDirPoint.x = closestUnoccupiedSpace.x - Self.hitPlayer.x
                teleportDirPoint.y = closestUnoccupiedSpace.y - Self.hitPlayer.y
            End If

            Local x := teleportDirPoint.x + Self.hitPlayer.x
            Local y := teleportDirPoint.y + Self.hitPlayer.y

            Const MAX_TELEPORT_DISTANCE: Int = 10
            For Local i := 0 Until MAX_TELEPORT_DISTANCE
                If Not Util.IsGlobalCollisionAt(x, y, False, True, False, False)
                    Exit
                End If

                If i <> MAX_TELEPORT_DISTANCE - 1
                    x += teleportDirPoint.x
                    y += teleportDirPoint.y
                Else
                    x = Self.x
                    y = Self.y
                End IF
            End For

            Local xDiff := x - Self.x
            Local yDiff := y - Self.y
            Self.MoveImmediate(xDiff, yDiff, "self")

            Self.currentMoveDelay = 2
            If Self.skippedMove
                Self.currentMoveDelay = 1
            End If

            Audio.PlayGameSoundAt("teleport", x, y, False, -1, False)
            Audio.PlayGameSoundAt("ghastTeleport", x, y, False, -1, False)
        End If

        If Not Self.invisible And
           Self.IsVisible() And
           Camera.IsOnScreen(Self.x, Self.y) And
           Not Self.hasRoared And
           Not Level.isLevelEditor
            Audio.PlayGameSoundAt("ghastCry", Self.x, Self.y, True, -1, False)
            Self.hasRoared = True
        End If

        Super.Update()
    End Method

End Class
