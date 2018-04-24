'Strict

Import enemy
Import logger

Class Sarcophagus Extends Enemy

    Global sarcophagi: Object

    Function DestroyAll: Void()
        Debug.TraceNotImplemented("Sarcophagus.DestroyAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Sarcophagus.New(Int, Int, Int)")
    End Method

    Field numEnemiesSpawned: Int
    Field spawnedEnemy: Enemy
    Field vibrateCounter: Int
    Field vibrateOffset: Float

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
