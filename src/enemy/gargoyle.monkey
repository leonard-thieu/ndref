'Strict

Import mojo.graphics
Import controller.controller_game
Import enemy
Import enemy.crate
Import enemy.necrodancer_enemy
Import level
Import audio2
Import bouncer
Import entity
Import item
Import logger
Import player_class
Import point
Import sprite
Import tile
Import util

Class Gargoyle Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If l = 5
            If controller_game.currentLevel = 3
                l = 6
            Else If Necrodancer.necrodancer <> Null
                l = 7
            End If
        End If

        Self.Init(xVal, yVal, l, "gargoyle")

        If Self.level = 1
            Self.gustImage = New Sprite("particles/wind_gust.png", 7, Image.MidHandle)
        End If

        If Self.level >= 5 And
           Level.randSeed <> -1
            Self.DetermineContents()
        End If

        Self.isCrate = True
        Self.containsItem = True

        Self.overrideAttackSound = "gargoyleAttack"
        Self.overrideDeathSound = "gargoyleDeath"
    End Method

    Field gustImage: Sprite
    Field determinedContents: Bool
    Field contents: String
    Field hasMoved: Bool
    Field active: Bool
    Field playerGusted: Player
    Field animStartAt: Int
    Field image2: Sprite
    Field bounce2: Bouncer

    Method DetermineContents: Void()
        If Not Self.determinedContents And
           Self.level <> 7
            Self.contents = Crate.SelectItem(controller_game.currentLevel)
            Self.determinedContents = True
        End If
    End Method

    Method Die: Void()
        If Not Self.dead
            If Crate.fallenGargoyles.Contains(Self)
                Self.x = -9999
                Self.y = -9999
            Else
                Super.Die()
            End If
        End If 
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Gargoyle.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Gargoyle.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Gargoyle.MoveSucceed(Bool, Bool)")
    End Method

    Method OpenAsCrate: Void(enemyOK: Bool)
        Debug.TraceNotImplemented("Gargoyle.OpenAsCrate(Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Gargoyle.Render()")
    End Method

    Method Update: Void()
        Local distToClosestPlayer := Util.GetDistFromClosestPlayer(Self.x, Self.y, True)

        Select Self.level
            Case 7
                If Not Level.IsWallAt(Self.x, Self.y)
                    Self.Die()
                End If
            Case 5,
                 6
                If Self.IsVisible() And
                   Tile.AnyPlayerHaveMonocle() And
                   Self.image2 = Null
                    Self.DetermineContents()

                    Local itemNode := Item.GetItemXML(Self.contents)
                    Local framePath := "items/" + itemNode.value
                    Local frameW := itemNode.GetAttribute("imageW", 24)
                    Local frameH := itemNode.GetAttribute("imageH", 24)
                    Local numFrames := itemNode.GetAttribute("numFrames", 1)
                    Self.image2 = New Sprite(framePath, frameW, frameH, 2 * numFrames)
                    Self.image2.SetZOff(17.0)
                    Self.image2.SetAlphaValue(0.6)

                    Self.bounce2 = New Bouncer(-2.5, 0.0, 1.5, 40)
                End If
        end Select

        If Self.bounce2 <> Null
            Self.bounce2.Update()
        End If

        If distToClosestPlayer <= 1.0 And
           Not Self.active
            Select Self.level
                Case 2,
                     3
                    Self.currentMoveDelay = 2
                    If Enemy.EnemiesHaveMovedClosestBeat() Or
                       (Audio.IsFixedBeatSet() And
                        Not controller_game.incrementFixedBeatNum)
                        Self.currentMoveDelay = 1
                    End If

                    Self.active = True

                    Audio.PlayGameSoundAt("gargoyleAwaken", Self.x, Self.y, False, -1, False)
            End Select
        End If

        If Self.level <= 3 And
           Self.active
            If distToClosestPlayer > 2.5
                Self.animOverride = 2
            Else
                Self.animOverride = Audio.GetBeatAnimFrame2() + 2
            End If
        Else If Self.level >= 5 Or
                distToClosestPlayer > 2.5
            Self.animOverride = 0
        Else
            Self.animOverride = -1
        End If

        Super.Update()
    End Method

End Class
