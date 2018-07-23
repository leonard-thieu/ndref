'Strict

Import mojo.graphics
Import controller.controller_game
Import level
Import trap
Import audio2
Import entity
Import item
Import logger
Import sprite
Import util

Class FireTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, d: Int, m: Bool)
        Super.New(xVal, yVal, TrapType.FireTrap)

        Self.xOff = 12.0
        Self.yOff = 7.0

        Self.fireDir = d

        Self.image = New Sprite("traps/firetrap.png", 34, 23, 6, Image.MidHandle)
        Self.image.SetZOff(10.0)

        Self.manual = m
    End Method

    Field fireDir: Int
    Field manual: Bool
    Field isReady: Bool
    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 0.7
    Field shootBeats: Int = -1
    Field retractBeats: Int

    Method CheckTriggerRadius: Bool(ent: Object)
        Debug.TraceNotImplemented("FireTrap.CheckTriggerRadius(Object)")
    End Method

    Method DoShot: Void()
        Debug.TraceNotImplemented("FireTrap.DoShot()")
    End Method

    Method GetFrameToShow: Int()
        Select Self.fireDir
            Case Direction.Right
                Self.image.FlipX(False, False)
            Default
                Self.image.FlipX(True, False)
        End Select

        If Self.isReady
            Return 2
        End If

        If Self.triggered
            Return 0
        End If
        
        Return 1
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("FireTrap.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Move: Void()
        If Self.shootBeats > 0
            Self.shootBeats -= 1
        End If

        If Self.shootBeats = 0
            Self.DoShot()
            Self.shootBeats = -1
        End If

        If Not Self.manual And
           Self.hasBeenVisible And
           (Self.IsVisible() Or
            (Util.GetDistFromClosestPlayer(Self.x, Self.y, False) <= 4.0 And
             Self.IsInAnyPlayerLineOfSight()))
            For Local i := 0 Until controller_game.numPlayers
                Local player := controller_game.players[i]
                If Not player.Perished And
                   player.GetItemInSlot("head", False) <> ItemType.NinjaMask And
                   Self.CheckTriggerRadius(player)
                    Self.triggeredOnBeat = Audio.GetClosestBeatNum(True)
                    Self.Trigger(player)
                End If
            End For
        End If

        Self.newTrap = False

        If Self.retractBeats > 0
            Self.retractBeats -= 1
            If Self.retractBeats = 0
                Self.triggered = False
            End If
        End If
    End Method

    Method Ready: Void()
        Debug.TraceNotImplemented("FireTrap.Ready()")
    End Method

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("FireTrap.Trigger(Entity)")
    End Method

    Method Unready: Void()
        Debug.TraceNotImplemented("FireTrap.Unready()")
    End Method

    Method Update: Void()
        Super.Update()

        If Self.GetFrameToShow() = 2
            Self.vibrateCounter -= 1
            If Self.vibrateCounter = 0
                Self.vibrateCounter = 3
                Self.xOff = Self.vibrateOffset + 12.0
                Self.vibrateOffset = -Self.vibrateOffset
            End If
        Else
            Self.xOff = 12.0
        End If

        Local frame := Self.GetFrameToShow()
        Self.image.SetFrame(frame)

        If Not Level.IsWallAt(Self.x, Self.y)
            Self.Die()
        End If
    End Method

End Class
