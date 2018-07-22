'Strict

Import monkey.list
Import enemy
Import logger
Import point
Import shrine

Class Sarcophagus Extends Enemy

    Global sarcophagi: List<Sarcophagus> = New List<Sarcophagus>()

    Function DestroyAll: Void()
        Debug.TraceNotImplemented("Sarcophagus.DestroyAll()")
    End Function

    Function GetNumSarcophagi: Void()
        Debug.TraceNotImplemented("Sarcophagus.GetNumSarcophagi()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = 3
        End If

        Self.Init(xVal, yVal, l, "sarcophagus")

        Sarcophagus.sarcophagi.AddLast(Self)

        Self.overrideHitSound = "sarcophagusHit"
        Self.overrideDeathSound = "sarcophagusDeath"
    End Method

    Field numEnemiesSpawned: Int
    Field spawnedEnemy: Enemy
    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 0.7

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Sarcophagus.CanBeLord()")
    End Method

    Method Delete: Void()
        Sarcophagus.sarcophagi.RemoveEach(Self)

        Super.Delete()
    End Method

    Method Die: Void()
        If Self.coinsToDrop > 0
            If Self.numEnemiesSpawned <= 1
                Self.coinsToDrop = (5 * Self.level) + 15
            Else If Self.numEnemiesSpawned = 2
                Self.coinsToDrop = (2 * Self.level) + 6
            Else
                Self.coinsToDrop = (1 * Self.level) + 4
            End If
        End If

        Sarcophagus.sarcophagi.RemoveEach(Self)

        Super.Die()
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Sarcophagus.GetMovementDirection()")
    End Method

    Method ImmuneToFear: Bool()
        Debug.TraceNotImplemented("Sarcophagus.ImmuneToFear()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Sarcophagus.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Sarcophagus.MoveSucceed(Bool, Bool)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Sarcophagus.PerformMovement(Int, Int)")
    End Method

    Method Update: Void()
        If Self.currentMoveDelay > 1
            Self.xOff = 0.0
        Else
            Self.vibrateCounter -= 1
            If Self.vibrateCounter = 0
                Self.xOff = Self.vibrateOffset
                Self.vibrateOffset = -Self.vibrateOffset
                Self.vibrateCounter = 3
            End If
        End If

        Super.Update()
    End Method

End Class
