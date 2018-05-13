'Strict

Import monkey.list
Import controller_game
Import enemy
Import entity
Import level
Import logger
Import player_class
Import point
Import shrine
Import tentacle
Import tile
Import util

Class Octoboss Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "coralriff")

        Self.initXOff = Self.xOff

        Local currentDepth := controller_game.currentDepth
        If Shrine.warShrineActive
            currentDepth = 5
        End If

        Self.healthMax += currentDepth - 1
        Self.health = Self.healthMax

        Local hornsLevel := 2
        Local stringsLevel := 3
        Local keytarLevel := 4

        If currentDepth >= 2 Then hornsLevel = 6
        If currentDepth >= 3 Then stringsLevel = 7
        If currentDepth >= 4 Then keytarLevel = 8

        Self.tentacle3 = New Tentacle(xVal - 5, yVal + 2, 5)
        Self.tentacle7 = New Tentacle(xVal - 4, yVal + 1, hornsLevel)
        Self.tentacle5 = New Tentacle(xVal - 3, yVal + 1, stringsLevel)
        Self.tentacle1 = New Tentacle(xVal - 2, yVal, keytarLevel)
        Self.tentacle2 = New Tentacle(xVal + 2, yVal, keytarLevel)
        Self.tentacle6 = New Tentacle(xVal + 3, yVal + 1, stringsLevel)
        Self.tentacle8 = New Tentacle(xVal + 4, yVal + 1, hornsLevel)
        Self.tentacle4 = New Tentacle(xVal + 5, yVal + 2, 5)

        Self.tentacle1.boss = Self
        Self.tentacle2.boss = Self
        Self.tentacle3.boss = Self
        Self.tentacle4.boss = Self
        Self.tentacle5.boss = Self
        Self.tentacle6.boss = Self
        Self.tentacle7.boss = Self
        Self.tentacle8.boss = Self

        Self.tentacle1.ActivateLight(0.01, 0.02)
        Self.tentacle2.ActivateLight(0.01, 0.02)
        Self.tentacle3.ActivateLight(0.01, 0.02)
        Self.tentacle4.ActivateLight(0.01, 0.02)
        Self.tentacle5.ActivateLight(0.01, 0.02)
        Self.tentacle6.ActivateLight(0.01, 0.02)
        Self.tentacle7.ActivateLight(0.01, 0.02)
        Self.tentacle8.ActivateLight(0.01, 0.02)

        Self.tentacle3.tentacleNum = 1
        Self.tentacle7.tentacleNum = 2
        Self.tentacle5.tentacleNum = 3
        Self.tentacle1.tentacleNum = 4
        Self.tentacle2.tentacleNum = 5
        Self.tentacle6.tentacleNum = 6
        Self.tentacle8.tentacleNum = 7
        Self.tentacle4.tentacleNum = 8

        Self.phaseOrder.AddLast(0)

        Local phase1: Int
        Local phase2: Int
        Local phase3: Int
        Local phase4: Int
        
        phase1 = Util.RndIntRange(1, 4, True)

        Repeat
            phase2 = Util.RndIntRange(1, 4, True)
        Until phase2 <> phase1

        Repeat
            phase3 = Util.RndIntRange(1, 4, True)
        Until phase3 <> phase2 And
              phase3 <> phase1

        Repeat
            phase4 = Util.RndIntRange(1, 4, True)
        Until phase4 <> phase3 And
              phase4 <> phase2 And
              phase4 <> phase1

        Self.phaseOrder.AddLast(phase1)
        Self.phaseOrder.AddLast(phase2)
        Self.phaseOrder.AddLast(phase3)
        Self.phaseOrder.AddLast(phase4)

        Local phase5Roll := Util.RndIntRangeFromZero(1, True)
        If phase5Roll = 0
            Self.phaseOrder.AddLast(5)
            Self.phaseOrder.AddLast(6)
        Else
            Self.phaseOrder.AddLast(6)
            Self.phaseOrder.AddLast(5)
        End If

        Self.phaseOrder.AddLast(7)

        Self.overrideAttackSound = "coralriffAttack"
        Self.overrideHitSound = "coralriffHit"
        Self.overrideDeathSound = "coralriffDeath"

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Field initXOff: Int
    Field tentacle3: Tentacle
    Field tentacle7: Tentacle
    Field tentacle5: Tentacle
    Field tentacle1: Tentacle
    Field tentacle2: Tentacle
    Field tentacle6: Tentacle
    Field tentacle8: Tentacle
    Field tentacle4: Tentacle
    Field phaseOrder: List<Int> = New List<Int>()
    Field phase: Int = -1
    Field showHeartsDelay: Int
    Field phaseChangeBeat: Int = 99999
    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 1.5
    Field runNum: Int

    Method BeginFinalPhase: Void(overrideSound: Bool)
        Debug.TraceNotImplemented("Octoboss.BeginFinalPhase(Bool)")
    End Method

    Method Die: Void()
        Enemy.SetEnemiesToDropNoCoinsOverride()
        Level.DryUpAllWater(TileType.BossFloor)
        Super.Die()
        Enemy.KillAllEnemies()
    End Method

    Method DoAttackSplash: Void()
        Debug.TraceNotImplemented("Octoboss.DoAttackSplash()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Octoboss.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Octoboss.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Octoboss.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Octoboss.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Octoboss.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Octoboss.Update()")
    End Method

End Class
