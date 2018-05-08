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
        Debug.TraceNotImplemented("Sarcophagus.Delete()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Sarcophagus.Die()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Sarcophagus.MoveFail()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Sarcophagus.Update()")
    End Method

End Class
