'Strict

Import monkey.list
Import enemy
Import logger
Import shrine

Class Sarcophagus Extends Enemy

    Global sarcophagi: List<Sarcophagus> = New List<Sarcophagus>()

    Function DestroyAll: Void()
        Debug.TraceNotImplemented("Sarcophagus.DestroyAll()")
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

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Sarcophagus.MoveFail()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Sarcophagus.Update()")
    End Method

End Class
