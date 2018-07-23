'Strict

Import monkey.list
Import enemy
Import audio2
Import entity
Import logger
Import point

Class Bell Extends Enemy

    Global bells: List<Bell> = New List<Bell>()

    Function GetBellAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Bell.GetBellAt(Int, Int)")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, num: Int)
        Super.New()

        Self.bellNum = num
        Local l := 1
        If num = 5
            l = 2
            Self.isBig = True
        End If

        Self.isCrate = True

        Self.Init(xVal, yVal, l, "bell")

        Self.overrideDeathSound = "deadRingerBell" + Self.bellNum

        Bell.bells.AddLast(Self)
    End Method

    Field bellNum: Int = -1
    Field isBig: Bool
    Field beingSought: Bool
    Field rungOnBeat: Int = -1
    Field enemy: Enemy

    Method Die: Void()
        If Not Self.dead
            Bell.bells.RemoveEach(Self)
            Super.Die()

            If Self.isBig
                Enemy.KillAllEnemies()
            End If
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Bell.GetMovementDirection()")
    End Method

    Method HasBeenRung: Bool()
        Return Self.rungOnBeat <> -1
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Bell.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImmuneToEarth: Bool()
        Debug.TraceNotImplemented("Bell.ImmuneToEarth()")
    End Method

    Method ImmuneToFear: Bool()
        Debug.TraceNotImplemented("Bell.ImmuneToFear()")
    End Method

    Method Ring: Void(makeEnemy: Bool)
        Debug.TraceNotImplemented("Bell.Ring(Bool)")
    End Method

    Method Ringable: Bool()
        Debug.TraceNotImplemented("Bell.Ringable()")
    End Method

    Method SpawnEnemy: Object(xVal: Int, yVal: Int, enemyType: Int)
        Debug.TraceNotImplemented("Bell.SpawnEnemy(Int, Int, Int)")
    End Method

    Method Update: Void()
        Select Self.level
            Case 1
                ' Not 100% sure this is correct but it probably doesn't matter.
                If Self.HasBeenRung() And
                   Audio.GetClosestBeatNum(True) - Self.rungOnBeat <= 15
                    Self.animOverride = -1
                Else If Not Self.HasBeenRung() And
                        Audio.GetClosestBeatNum(True) - Self.rungOnBeat > 15
                    Self.animOverride = 2
                Else If Self.beingSought
                    Self.animOverride = 3
                Else
                    Self.animOverride = 0
                End If
        End Select

        Super.Update()
    End Method

End Class
