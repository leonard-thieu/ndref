'Strict

Import monkey.stack
Import logger
Import util

Class WeightedPicker

    Function _EditorFix: Void() End

    Field weights: Stack<Int> = New Stack<Int>()
    Field enabled: Stack<Bool> = New Stack<Bool>()

    Method Length: Int()
        Return Self.weights.Length()
    End Method

    Method PickRandom: Int(useSeed: Bool)
        Debug.Assert(Self.weights.Length() = Self.enabled.Length())

        Local totalWeight := 0
        For Local i := 0 Until Self.weights.Length()
            If Self.enabled.Get(i)
                totalWeight += Self.weights.Get(i)
            End If
        End For

        Debug.Assert(totalWeight > 0)

        Local rnd := Util.RndIntRangeFromZero(totalWeight - 1, useSeed)
        Local rndIndex := Self._IndexOfEnabled(-1)

        While rnd >= Self.weights.Get(rndIndex)
            rnd -= Self.weights.Get(rndIndex)

            rndIndex = Self._IndexOfEnabled(rndIndex)
        End While

        Debug.Assert(rnd < Self.weights.Get(rndIndex))

        Return rndIndex
    End Method

    Method _IndexOfEnabled: Int(startIndex: Int)
        Local i := startIndex
        
        Repeat
            i += 1

            Debug.Assert(i < Self.weights.Length())
        Until Self.enabled.Get(i)

        Return i
    End Method

    Method Push: Void(weight: Int)
        Self.weights.Push(weight)
        Self.enabled.Push(True)
    End Method

    Method SetEnabled: Void(i: Int, en: Bool)
        Self.enabled.Set(i, en)
    End Method

End Class
