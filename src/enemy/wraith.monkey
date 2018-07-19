'Strict

Import controller.controller_game
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

Class Wraith Extends Enemy

    Global theCursedWraith: Wraith

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "wraith", "", -1, -1)

        If l = 2 Then Self.isGentle = True
        Self.invisible = True
        Self.collides = False
        Self.blink_MIN = 120
        Self.blink_MAX = 240
        Self.blink_DUR = 10

        Select l
            Case 1
                Self.overrideAttackSound = "wraithAttack"
                Self.overrideDeathSound = "wraithDeath"
                Self.crySound = "wraithCry"
            Default
                Self.overrideDeathSound = "cursewraithDeath"
                Self.crySound = "cursewraithCry"
        End Select

        Self.image.SetZOff(18.0)
        Self.isWraithLike = True

        If l = 2 Then Wraith.theCursedWraith = Self

        If Util.IsCharacterActive(Character.Eli)
            Self.coinsToDrop = 0
            Self.Die()
        End If
    End Method

    Field crySound: String
    Field seeking: Bool
    Field hasRoared: Bool

    Method AfterHitPlayer: Void(p: Player)
        Debug.TraceNotImplemented("Wraith.AfterHitPlayer(Player)")
    End Method

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

            If Player.AnyPlayerInSpecialRoom()
                Self.coinsToDrop = 0
                Self.Die()

                Return
            End If

            If Util.GetDistFromClosestPlayer(Self.x, Self.y, False) <= 3.0 Or
               Util.IsGlobalCollisionAt(Self.x, Self.y, False, False, False, False)
                Return
            End If
        End If

        Self.invisible = False
        Self.collides = True
        Self.seeking = False
        Self.currentMoveDelay = 0

        Enemy.lastWraithSpawnBeat = Audio.GetClosestBeatNum(True)
    End Method

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Wraith.CanBeDamaged(Bool, Bool)")
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

    Method Die: Void()
        If Wraith.theCursedWraith = Self
            Wraith.theCursedWraith = Null
        End If

        Super.Die()
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Wraith.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Wraith.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Wraith.Render()")
    End Method

    Method Update: Void()
        If controller_game.gamePaused Or
           Audio.songPaused
            Return
        End If

        If Not Self.dead
            If Entity.AnyPlayerHaveNazarCharm()
                Self.coinsToDrop = 0
                Self.Die()
            End If
        End If

        If Enemy.EnemiesMovingThisFrame()
            Self.CheckCorporeality()
        End If

        If Not Self.invisible And
           Self.IsVisible() And
           Camera.IsOnScreen(Self.x, Self.y) And
           Not Self.hasRoared And
           Not Level.isLevelEditor
            Audio.PlayGameSoundAt(Self.crySound, Self.x, Self.y, True, -1, False)
            Self.hasRoared = True
        End If

        Super.Update()
    End Method

End Class
