'Strict

Import monkey.math
Import enemy
Import level
Import audio2
Import camera
Import entity
Import logger
Import player_class
Import point
Import tile
Import util

Class Wight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "wight")

        Self.invisible = True
        Self.collides = False
        Self.blink_MIN = 120
        Self.blink_MAX = 240
        Self.blink_DUR = 10

        Self.overrideAttackSound = "wightAttack"
        Self.overrideDeathSound = "wightDeath"

        Self.image.SetZOff(18.0)

        Self.isWraithLike = True

        If Util.IsCharacterActive(Character.Eli)
            Self.coinsToDrop = 0
            Self.Die()
        End If
    End Method

    Field seeking: Bool
    Field hasRoared: Bool

    Method BecomeCorporeal: Void(force: Bool)
        If Player.AllPlayersPerished() Or
           Not Self.invisible
            Return
        End If

        If Not force
            If Enemy.lastWraithSpawnBeat + 14 >= Audio.GetClosestBeatNum(True) And
               Not Tile.AnyPlayerHaveMonocle() And
               Not Entity.AnyPlayerHaveCircletOrGlassTorch() And
               Not Self.earthquaked
                Return
            End If

            If Player.AnyPlayerInSpecialRoom() Or
               Util.GetDistFromClosestPlayer(Self.x, Self.y, False) <= 3.0 Or
               Util.IsGlobalCollisionAt(Self.x, Self.y, False, True, False, False)
                Self.coinsToDrop = 0
                Self.Die()

                Return
            End If
        End If

        Self.invisible = False
        Self.seeking = False
        
        Self.collides = True
        Self.currentMoveDelay = 0

        Enemy.lastWraithSpawnBeat = Audio.GetClosestBeatNum(True)
    End Method

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Wight.CanBeDamaged(Bool, Bool)")
    End Method

    Method CheckCorporeality: Void()
        If Self.IsVisible() Or
           Self.earthquaked Or
           Tile.AnyPlayerHaveMonocle() Or
           Entity.AnyPlayerHaveCircletOrGlassTorch()
            Self.BecomeCorporeal(False)
        End If

        Local closestPlayer := Util.GetClosestPlayer(Self.x, Self.y)
        Local distFronClosestPlayer := Util.GetDist(Self.x, Self.y, closestPlayer.x, closestPlayer.y)
        If Self.seeking Or
           (distFronClosestPlayer < 3.0 And Self.invisible)
            Self.seeking = True

            Local xDiff := closestPlayer.lastX - closestPlayer.x
            Local yDiff := closestPlayer.lastX - closestPlayer.x
            Local xOff := math.Sgn(xDiff) * 5
            Local yOff := math.Sgn(yDiff) * 5

            If Audio.GetClosestBeatNum(True) <> 0
                Local tempOff := xOff
                xOff = yOff
                yOff = tempOff
            End If

            Local x := closestPlayer.x + xOff
            Local y := closestPlayer.y + yOff
            
            If Not Util.IsGlobalCollisionAt(x, y, False, Self.ignoreWalls, False, False) And
               Util.GetDistFromClosestPlayer(x, y, False) >= 5.0
                Local tile := Level.GetTileAt(x, y)
                If tile <> Null And
                   tile.IsFloor() And
                   tile.IsVisible()
                    Self.seeking = False
                    Self.x = x
                    Self.y = y
                    Self.BecomeCorporeal(False)
                End If
            End If
        End If
    End Method

    Method GetMovementDirection: Point()
        Self.CheckCorporeality()

        If Not Self.invisible
            Return Self.BasicSeek()
        End If

        Return New Point(0, 0)
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int = Direction.None, hitter: Entity = Null, hitAtLastTile: Bool = False, hitType: Int = 0)
        Debug.TraceNotImplemented("Wight.Hit(String, Int, Int, Entity, Bool, Int)")
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

        If Not Self.invisible And
           Self.IsVisible() And
           Camera.IsOnScreen(Self.x, Self.y) And
           Not Self.hasRoared And
           Not Level.isLevelEditor
            Audio.PlayGameSoundAt("wightCry", Self.x, Self.y, True, -1, False)
            Self.hasRoared = True
        End If

        Super.Update()
    End Method

End Class
