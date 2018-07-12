'Strict

Import monkey.list
Import controller.controller_game
Import enemy
Import audio2
Import entity
Import item
Import logger
Import mobileentity
Import player_class
Import util

Class Trap Extends Entity Abstract

    Global trapList: TrapList = New TrapList()

    Function FindRandomTrap: Trap()
        If Trap.trapList.Count() < 1 Then Return Null

        Local trapIndex := Util.RndIntRangeFromZero(Trap.trapList.Count() - 1, True)
        Local trapArray := Trap.trapList.ToArray()

        Return trapArray[trapIndex]
    End Function

    Function GetTrapAt: Trap(xVal: Int, yVal: Int)
        For Local trap := EachIn trapList
            If trap.x = xVal And
               trap.y = yVal
                Return trap
            End If
        End For

        Return Null
    End Function

    Function GetTrapTypeAt: Int(xVal: Int, yVal: Int)
        Local trap := Trap.GetTrapAt(xVal, yVal)
        If trap <> Null Then Return trap.trapType

        Return TrapType.None
    End Function

    Function IsLiveTrapAt: Bool(xVal: Int, yVal: Int)
        Local trap := Trap.GetTrapAt(xVal, yVal)
        If trap <> Null Then Return trap.IsLive()

        Return False
    End Function

    Function MoveAll: Void()
        Trap.trapList.Sort()

        For Local trap := EachIn Trap.trapList
            trap.Move()
        End For
    End Function

    Function RemoveAll: Void()
        Debug.TraceNotImplemented("Trap.RemoveAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, type: Int)
        Super.New()

        Self.x = xVal
        Self.y = yVal
        Self.trapType = type

        Self.isTrap = True

        Trap.trapList.AddLast(Self)

        Local displayName := TrapType.ToDisplayName(Self.trapType)
        Debug.WriteLine("Placed " + displayName + " at " + (New Point(Self.x, Self.y)).ToString())
    End Method

    Field trapType: Int
    Field triggeredOnBeat: Int = -1
    Field willTriggerOn: Entity
    Field triggeredOn: Entity
    Field triggered: Bool
    Field isRune: Bool
    Field indestructible: Bool
    Field canBeReplacedByTempoTrap: Bool = True
    Field newTrap: Bool = True
    Field playerWasClose: Bool

    Method Die: Void()
        If Not Self.dead
            Trap.trapList.RemoveEach(Self)

            Super.Die()
        End If
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Trap.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsLive: Bool()
        Return Self.triggeredOn = Null
    End Method

    Method Move: Void()
        If Not Player.AllPlayersPerished()
            For Local i := 0 Until controller_game.numPlayers
                Local player := controller_game.players[i]
                If Self.x = player.x And
                   Self.y = player.y And
                   Self.triggeredOn <> player And
                   (Self.isRune Or
                    (Not player.floating And
                     Not player.IsLordCrownActive() And
                     player.GetItemInSlot("head", False) <> ItemType.NinjaMask))
                    Self.triggeredOnBeat = Audio.GetClosestBeatNum(True)

                    If Self.trapType <> TrapType.BounceTrap And
                       (Not player.IsStandingStill() Or
                        (Not Enemy.EnemiesHaveMovedClosestBeat() And
                         Not Audio.PastLastBeat())) And
                       Not Self.newTrap
                        Self.willTriggerOn = player
                    Else
                        Self.Trigger(player)
                    End If
                End If
            End For

            Local enemy := Enemy.GetEnemyAt(Self.x, Self.y, False)
            If enemy <> Null
                Self.triggeredOnBeat = Audio.GetClosestBeatNum(True)

                If Not enemy.floating And
                   Not enemy.isMassive And
                   Self.triggeredOn <> enemy 
                    If Self.trapType = TrapType.BounceTrap Or
                       enemy.IsStandingStill() Or
                       Self.newTrap
                        Self.Trigger(enemy)
                    Else If Self.trapType <> TrapType.BounceTrap And
                            Self.willTriggerOn = Null
                        Self.willTriggerOn = enemy
                    End If
                End If
            End If
        End If

        Self.newTrap = False
    End Method

    Method Trigger: Void(ent: Entity)
        Self.willTriggerOn = Null
        Self.triggeredOn = ent
        Self.triggered = True
    End Method

    Method Update: Void()
        Local isInTrapSightRange := False
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            If player.trapSight >= Util.GetDist(Self.x, Self.y, player.x, player.y)
                isInTrapSightRange = True

                Exit
            End If
        End For

        If isInTrapSightRange Or
           Self.triggered Or
           Self.playerWasClose
            Self.playerWasClose = True
            Self.image.SetAlphaValue(1.0)
        Else
            Self.image.SetAlphaValue(0.0)
        End If

        Local triggeredOn := MobileEntity(Self.willTriggerOn)
        If triggeredOn <> Null
            If triggeredOn.IsStandingStill()
                Self.Trigger(Self.willTriggerOn)
            End If
        End If

        If Self.triggeredOn <> Null And
           (Self.triggeredOn.dead Or
            Self.triggeredOn.x <> Self.x Or
            Self.triggeredOn.y <> Self.y)
            Self.triggeredOn = Null
        End If

        Super.Update()
    End Method

End Class

Class TrapList Extends List<Trap>

    Function _EditorFix: Void() End

    Method Compare: Int(a: Trap, b: Trap)
        If a.trapType = TrapType.FireTrap
            If b.trapType <> TrapType.FireTrap
                Return -1
            End If

            Return 0
        End If

        If b.trapType = TrapType.FireTrap
            Return 1
        End If

        If a.trapType = TrapType.BounceTrap
            If b.trapType <> TrapType.BounceTrap
                Return -1
            End If

            Return 0
        End If

        If b.trapType = TrapType.BounceTrap
            Return 1
        End If

        If a.trapType = TrapType.TeleportTrap
            If b.trapType <> TrapType.TeleportTrap
                Return -1
            End If

            Return 0
        End If

        If b.trapType = TrapType.TeleportTrap
            Return 1
        End If

        Return 0
    End Method

End Class

Class TrapType

    Const None: Int = 0
    Const BounceTrap: Int = 1
    Const SpikeTrap: Int = 2
    Const TrapDoor: Int = 3
    Const ConfuseTrap: Int = 4
    Const TeleportTrap: Int = 5
    Const SlowDownTrap: Int = 6
    Const SpeedUpTrap: Int = 7
    Const TravelRune: Int = 8
    Const BombTrap: Int = 9
    Const FireTrap: Int = 10
    Const ABTeleportTrap: Int = 11
    Const Switch: Int = 12
    Const DecorativeFireTrap: Int = 13
    Const ScatterTrap: Int = 14

    Function ToDisplayName: String(type: Int)
        Select type
            Case TrapType.BounceTrap Return "Bounce Trap"
            Case TrapType.SpikeTrap Return "Spike Trap"
            Case TrapType.TrapDoor Return "Trap Door"
            Case TrapType.ConfuseTrap Return "Confuse Trap"
            Case TrapType.TeleportTrap Return "Teleport Trap"
            Case TrapType.SlowDownTrap Return "Slow Down Trap"
            Case TrapType.SpeedUpTrap Return "Speed Up Trap"
            Case TrapType.TravelRune Return "Travel Rune"
            Case TrapType.BombTrap Return "Bomb Trap"
            Case TrapType.FireTrap Return "Wall Pig"
            Case TrapType.ABTeleportTrap Return "AB Teleport Trap"
            Case TrapType.Switch Return "Switch"
            Case TrapType.DecorativeFireTrap Return "Decorative Fire Trap"
            Case TrapType.ScatterTrap Return "Scatter Trap"
        End Select

        Return "Unknown trap (" + type + ")"
    End Function

End Class
