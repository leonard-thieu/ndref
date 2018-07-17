'Strict

Import mojo.graphics
Import enemy
Import level
Import audio2
Import camera
Import entity
Import logger
Import player_class
Import point
Import shrine
Import sprite
Import util

Class Dragon Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        If Shrine.warShrineActive And
           l = 1
            l = Util.RndIntRange(2, 3, False, -1)
        End If

        Self.Init(xVal, yVal, l, "dragon")

        Self.overrideAttackSound = "dragonAttack"
        Self.overrideDeathSound = "dragonDeath"
        Self.overrideHitSound = "dragonHit"

        If l = 3
            Self.iceBlast = New Sprite("spells/ice_blast.png", 8, Image.MidHandle)
            Self.iceBlast.SetHandle(-2, 59)
            Self.iceBlast.SetZOff(1000.0)
        End If
    End Method

    Field iceBlast: Sprite
    Field seekDistance: Int = 7
    Field lastFireballBeat: Int
    Field firstFrame: Bool = True
    Field hasRoared: Bool
    Field playerMoveOverride: Bool
    Field attackState: Int
    Field facingLeft: Bool = True
    Field iceBlastDuration: Int
    Field iceBlastFaceLeft: Bool
    Field failedLastMove: Bool
    Field hasEarthed: Bool

    Method ClearShot: Player()
        Debug.TraceNotImplemented("Dragon.ClearShot()")
    End Method

    Method DoShot: Void()
        Debug.TraceNotImplemented("Dragon.DoShot()")
    End Method

    Method GetMovementDirection: Point()
        If Self.failedLastMove And
           Not Self.hasBeenVisible
            Return Self.RandomSeek(True, False)
        End If

        If Not Self.Shoots() Or
           Self.attackState = 0
            Return Self.BasicSeek()
        End If

        Return New Point(0, 0)
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Dragon.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IceBall: Void()
        Debug.TraceNotImplemented("Dragon.IceBall()")
    End Method

    Method IceBy: Void(dx: Int, dy: Int)
        Debug.TraceNotImplemented("Dragon.IceBy(Int, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Dragon.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        If Not moveDelayed
            Camera.Shake(1, Self.x, Self.y)
            Audio.PlayGameSoundAt("dragonWalk", Self.x, Self.y, False, -1, False)
        End If

        If Self.Shoots() And
           Self.frozenDuration <= 0 And
           Enemy.enemiesFearfulDuration < 0 And
           Not hitPlayer
            If Self.attackState > 0 And
               Self.animOverride <= 6
                Self.DoShot()
                Self.animOverride = 7
                Self.attackState = 2
            End If

            Local clearShotPlayer := Self.ClearShot()
            If clearShotPlayer <> Null And
               Self.attackState = 0 And
               Self.hasRoared And
               Self.lastFireballBeat < Audio.GetClosestBeatNum(True) - 2 And
               Camera.IsOnScreenStandardized(Self.x, Self.y)
                Self.attackState = 1
                Self.animOverride = 4

                Audio.PlayGameSound("dragonPrefire", -1, 1.0)

                If clearShotPlayer.x > Self.x
                    Self.image.FlipX(True, True)
                    Self.facingLeft = False
                Else If clearShotPlayer.x < Self.x
                    Self.image.FlipX(False, True)
                    Self.facingLeft = True
                End If
            End If
        End If

        Super.MoveSucceed(hitPlayer, moveDelayed)
    End Method

    Method RaiseWallAt: Void(xWall: Int, yWall: Int)
        Debug.TraceNotImplemented("Dragon.RaiseWallAt(Int, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Dragon.Render()")
    End Method

    ' This appears in Windows symbols but not in Windows decompilation.
    Method Shoots: Bool()
        Select Self.level
            Case 2,
                 3
                Return True
        End Select

        Return False
    End Method

    Method Update: Void()
        Self.firstFrame = False

        If Self.IsVisible() And
           Not Self.hasRoared And
           Not Level.isLevelEditor
            Audio.PlayGameSoundAt("dragonRoar", Self.x, Self.y, True, -1, False)
            Self.hasRoared = True
            Self.lastFireballBeat = Audio.GetClosestBeatNum(True)
        End If

        If Self.seekDistance >= Util.GetDistFromClosestPlayer(Self.x, Self.y, False) Or
           Self.hasRoared
            Self.movesRegardlessOfDistance = True
            Self.dontMove = False
        End If

        If Self.Shoots() And
           Self.frozenDuration <= 0 And
           Enemy.enemiesFearfulDuration < 0
            ' Linux version only?
            'Local v6 := controller_game.incrementFixedBeatNum
            'If Audio.IsFixedBeatSet()
            '    v6 = Player.PlayersHaveMovedThisBeat()
            'End If

            Local v6 = Player.PlayersHaveMovedThisBeat()

            If Self.playerMoveOverride
                Self.playerMoveOverride = False
                v6 = True
            End If

            Select Self.attackState
                Case 1
                    Select Self.animOverride
                        Case 4
                            If Audio.GetPercentDistanceFromNextBeat() <= 0.5 And
                               Not v6
                                Self.animOverride = 5
                            End If
                        Case 5
                            If Audio.GetPercentDistanceFromNextBeat() > 0.5 Or
                                Self.animOverride = 6
                            End If
                        Case 6
                            If v6
                                Self.attackState = 2
                            End If
                    End Select
                Case 2
                    Select Self.animOverride
                        Case 8
                            If Not v6
                                Self.attackState = 0
                                Self.currentMoveDelay = 2
                            End If
                    End Select

                    If Self.animOverride > 6
                        If Audio.GetPercentDistanceFromNextBeat() < 0.75
                            Self.animOverride = 8
                        End If
                    Else
                        Self.DoShot()
                        Self.animOverride = 7
                    End If
                Default
                    Self.animOverride = -1
            End Select
        End If

        Super.Update()
    End Method

End Class
