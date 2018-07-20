'Strict

Import monkey.list
Import controller.controller_game
Import enemy
Import level
Import audio2
Import entity
Import logger
Import player_class
Import point
Import shrine
Import sprite
Import tile
Import util

Class KingConga Extends Enemy

    Global theKing: KingConga

    Function DestroyThrone: Void()
        Debug.TraceNotImplemented("KingConga.DestroyThrone()")
    End Function

    Function MissedBeat: Void()
        Debug.TraceNotImplemented("KingConga.MissedBeat()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "king_conga")

        Self.initX = xVal
        Self.initY = yVal

        KingConga.theKing = Self

        Self.overrideAttackSound = "kingCongaAttack"
        Self.overrideHitSound = "kingCongaHit"
        Self.overrideDeathSound = "kingCongaDeath"

        Self.initialXOff = Self.xOff

        Self.image2 = New Sprite("entities/king_conga_throne.png", 1)
        Self.image2.SetZOff(40.0)

        Local healthMaxBonus := controller_game.currentDepth - 1
        If Shrine.warShrineActive
            healthMaxBonus = 4
        End If

        Self.healthMax += healthMaxBonus
        Self.health = Self.healthMax

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Field state: Int
    Field throneDestroyed: Bool
    Field initX: Int
    Field initY: Int
    Field initialXOff: Int = -1
    Field image2: Sprite
    Field zombieFriends: List<Enemy> = New List<Enemy>()
    Field lastBeatNum: Int = -1
    Field lastBeatAnim: Int = -1

    Method AddZombieFriend: Void(z: Enemy)
        Self.zombieFriends.AddLast(z)
    End Method

    Method CheckZombieFriends: Void()
        Debug.TraceNotImplemented("KingConga.CheckZombieFriends()")
    End Method

    Method Die: Void()
        Enemy.SetEnemiesToDropNoCoinsOverride()
        Level.PlaceTileRemovingExistingTiles(Self.initX, Self.initY, TileType.Floor)
        KingConga.theKing = Null
        Super.Die()
        Enemy.KillAllEnemies()
    End Method

    Method EnterFinalState: Void(playCry: Bool)
        Debug.TraceNotImplemented("KingConga.EnterFinalState(Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("KingConga.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("KingConga.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImmuneToFear: Bool()
        Debug.TraceNotImplemented("KingConga.ImmuneToFear()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("KingConga.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("KingConga.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("KingConga.Render()")
    End Method

    Method TeleportBack: Void()
        Debug.TraceNotImplemented("KingConga.TeleportBack()")
    End Method

    Method Update: Void()
        Self.xOff = Self.initialXOff

        If Self.lastX > Self.x
            Self.image.FlipX(False, True)
        Else If Self.lastX < Self.x
            Self.image.FlipX(True, True)
            Self.xOff = Self.initialXOff + 4
        End If

        Select Self.state
            Case 0
                Local currentBeatNumber := Audio.GetCurrentBeatNumber(0, True)
                If (currentBeatNumber Mod 7) = 0
                    Self.animOverride = 4
                Else
                    Self.animOverride = -1
                End If
            Default
                Local timeUntilCurrentBeat := Audio.TimeUntilBeat(0)
                Local nextBeatDuration := Audio.GetNextBeatDuration()
                Local percentDist := Float(timeUntilCurrentBeat) / Float(nextBeatDuration)
                If percentDist > 0.95 And
                   Self.lastBeatNum <> Audio.GetCurrentBeatNumberIncludingLoops(0, True)
                    Self.lastBeatNum = Audio.GetCurrentBeatNumberIncludingLoops(0, True)

                    Select Self.lastBeatAnim
                        Case 5
                            Self.animOverride = 6
                        Default
                            Self.animOverride = 5
                    End Select

                    Self.lastBeatAnim = Self.animOverride
                End If
        End Select

        Super.Update()
    End Method

End Class
