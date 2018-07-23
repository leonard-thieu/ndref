'Strict

Import mojo.graphics
Import enemy
Import enemy.sarcophagus
Import level
Import trap
Import audio2
Import entity
Import item
Import logger
Import player_class
Import point
Import sprite

Class Necrodancer Extends Enemy

    Global necrodancer: Necrodancer
    Global wallsStep: Int

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "necrodancer")

        Self.isNecroDancer = True

        Necrodancer.necrodancer = Self

        Self.iceBlast = New Sprite("spells/ice_blast.png", 8, Image.MidHandle)
        Self.iceBlast.SetHandle(-2, 59)
        Self.iceBlast.SetZOff(1000.0)

        Self.shieldImage = New Sprite("entities/necroshield.png", 1)
        Self.shieldImage.SetZOff(Self.storedZOff + 10)

        Necrodancer.wallsStep = 0

        Self.origXOff = Self.xOff

        Select Self.level
            Case 1
                Self.MakeDancer()
            Case 2
                Self.actionTime = 10
        End Select

        Self.overrideHitSound = "necrodancerHit"
        Self.overrideDeathSound = "necrodancerDeath"
        Self.overrideAttackSound = "necrodancerAttack"
    End Method

    Field bombStep: Int
    Field saidLutePhrase: Bool
    Field iceBlast: Sprite
    Field shieldImage: Sprite
    Field origXOff: Int = -1
    Field actionTime: Int = 12
    Field theLute: Item
    Field doingTransition: Bool
    Field lastAction: Int
    Field actionDelay: Int = -1
    Field phase: Int
    Field summonCount: Int
    Field didCry: Bool
    Field actionDelayTime: Int = 3
    Field spellNum: Int
    Field iceBlastDuration: Int
    Field lastSpell: Int = -1
    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 1.0
    Field madeLava: Bool

    Method CastIce: Void()
        Debug.TraceNotImplemented("Necrodancer.CastIce()")
    End Method

    Method ChooseSpell: Void()
        Debug.TraceNotImplemented("Necrodancer.ChooseSpell()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Necrodancer.Die()")
    End Method

    Method GetEnemyTypeFromBombStep: Int()
        Debug.TraceNotImplemented("Necrodancer.GetEnemyTypeFromBombStep()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Necrodancer.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Necrodancer.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IceAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Necrodancer.IceAt(Int, Int)")
    End Method

    Method InitFinalForm: Void()
        Debug.TraceNotImplemented("Necrodancer.InitFinalForm()")
    End Method

    Method MakeLava: Void()
        Debug.TraceNotImplemented("Necrodancer.MakeLava()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Necrodancer.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Necrodancer.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Necrodancer.Render()")
    End Method

    Method SummonAndTeleport: Void(doTeleport: Bool)
        Debug.TraceNotImplemented("Necrodancer.SummonAndTeleport(Bool)")
    End Method

    Method SummonEnemy: Void(enemyType: Int)
        Debug.TraceNotImplemented("Necrodancer.SummonEnemy(Int)")
    End Method

    Method SummonMiniboss: Void()
        Debug.TraceNotImplemented("Necrodancer.SummonMiniboss()")
    End Method

    Method SummonSarcophagi: Void()
        Debug.TraceNotImplemented("Necrodancer.SummonSarcophagi()")
    End Method

    Method TakeAction: Void()
        Debug.TraceNotImplemented("Necrodancer.TakeAction()")
    End Method

    Method Teleport: Void()
        Debug.TraceNotImplemented("Necrodancer.Teleport()")
    End Method

    Method TriggeredWalls: Void()
        Debug.TraceNotImplemented("Necrodancer.TriggeredWalls()")
    End Method

    Method Update: Void()
        Self.frozenDuration = 0

        If Self.level = 2 And
           Self.phase = 2
            If Self.currentMoveDelay <= 1
                Enemy.SetAllNonNecroDancerEnemyMoveDelays(1)
            Else
                Enemy.SetAllNonNecroDancerEnemyMoveDelays(999)
            End If
        End If

        If Enemy.enemiesPaused
            Self.actionDelay = -1
            Self.lastAction = Audio.GetClosestBeatNum(True)
        End If

        If Self.level = 2 And
           Not Self.didCry And
           Not Enemy.enemiesPaused
            Self.didCry = True

            Audio.PlayGameSound("necrodancerLuteIsMine", 5, 1.0)
        End If

        If Player.AllPlayersPerished()
            Return
        End If

        If Self.level = 2
            If Self.health = 1 And
               Self.phase <= 1
                Self.TriggeredWalls()
            End If

            If Level.IsWallAt(Self.x, Self.y)
                Self.Teleport()
            End If
        End If

        If Audio.GetClosestBeatNum(True) - Self.actionDelay >= Self.actionDelayTime
            If Self.actionDelay > 0
                Self.TakeAction()
            End If
        End If

        If Audio.GetClosestBeatNum(True) - Self.lastAction >= Self.actionTime
            Self.lastAction = Audio.GetClosestBeatNum(True)
            Self.actionDelay = Audio.GetClosestBeatNum(True)
            Self.actionDelayTime = 2

            Self.ChooseSpell()
            If Self.spellNum = 1
                If Self.health >= 4
                    Self.actionDelayTime = 5
                Else
                    Self.actionDelayTime = 4
                End If
            End If
        End If

        If Self.actionDelay < 0
            Self.animOverride = -1
        Else
            Select Self.level
                Case 1
                    If Self.phase <> 0
                        Select Self.spellNum
                            Case 0
                                Self.animOverride = 5
                            Case 1
                                Self.animOverride = 6
                            Case 2
                                Self.animOverride = 7
                            Case 3
                                Self.animOverride = 4
                        End Select
                    End If
                Default
                    Self.animOverride = 7

                    Select Self.phase
                        Case 0
                            If Sarcophagus.GetNumSarcophagi() > 5
                                Self.animOverride = 4
                            End If
                        Case 1
                            If Sarcophagus.GetNumSarcophagi() > 3
                                Self.animOverride = 6
                            End If
                    End Select
            End Select
        End If

        If Self.spellNum = 1 And
           Self.actionDelay > 0 And
           Audio.GetClosestBeatNum(True) - Self.actionDelay >= Self.actionDelayTime - 2
            Self.vibrateCounter -= 1
            If Self.vibrateCounter = 0
                Self.vibrateCounter = 3
                Self.xOff = Self.origXOff + Self.vibrateOffset
                Self.vibrateOffset = -Self.vibrateOffset
            End If
        Else
            Self.xOff = Self.origXOff
        End If

        Select Self.level
            Case 1
                Select Self.phase
                    Case 0
                        If Not Level.IsWallAt(Self.x, Self.y)
                            Self.actionTime = 8
                            Self.phase = 1
                            Self.spellNum = 0

                            Audio.StartNecrodancerTransition(Self)
                            Audio.PlayGameSound("necrodancerCurseYou", 5, 1.0)

                            Self.SummonMiniboss()

                            Self.lastSpell = 2
                        End If
                    Case 1
                        If Self.theLute <> Null
                            If Self.theLute.dead Or
                               Not Level.IsWallAt(Self.x, Self.y)
                                Trap.RemoveAll()
                            End If
                        End If
                End Select
        End Select

        Super.Update()

        Self.frozenDuration = 0
    End Method

End Class
