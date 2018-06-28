'Strict

Import monkey.list
Import enemy
Import logger

Class Doppelganger

    Global doppelgangers: List<Doppelganger> = New List<Doppelganger>()

    Function UpdateAll: Void()
        For Local doppelganger := EachIn Doppelganger.doppelgangers
            doppelganger.Update()
        End For
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Doppelganger.New(Int, Int, Int)")
    End Method

    Field x: Int
    Field y: Int
    Field coinsToDrop: Int
    Field lastDoppelBeat: Int
    Field enemy: Enemy
    Field hasBeenHit: Bool

    Method Doppel: Void()
        Debug.TraceNotImplemented("Doppelganger.Doppel()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Doppelganger.Update()")
    End Method

End Class
