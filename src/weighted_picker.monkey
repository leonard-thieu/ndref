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
        'AssertImpl(Self.weights.Length() = Self.enabled.Length())

        Local totalWeight := 0
        For Local i := 0 Until Self.weights.Length()
            If Self.enabled.Get(i)
                totalWeight += Self.weights.Get(i)
            End If
        End For

        'AssertImpl(totalWeight > 0)

        Local rnd := Util.RndIntRangeFromZero(totalWeight - 1, useSeed)
        Local rndIndex := 0
        
        Repeat
            For Local en := EachIn Self.enabled
                rndIndex += 1

                'AssertImpl(rndIndex < Self.weights.Length())
            End For

            Local weight := Self.weights.Get(rndIndex)
            If rnd < weight Then Exit

            rnd -= weight
        Forever

        'AssertImpl(rnd < Self.weights.Get(rndIndex))

        Return rndIndex
    End Method

    Method Push: Void(weight: Int)
        Self.weights.Push(weight)
        Self.enabled.Push(True)
    End Method

    Method SetEnabled: Void(i: Int, en: Bool)
        Self.enabled.Set(i, en)
    End Method

End Class
