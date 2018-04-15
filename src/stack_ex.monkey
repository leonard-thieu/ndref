'Strict

Import monkey.stack
Import util

Class StackEx<T> Extends Stack<T>

    Function _EditorFix: Void() End

    Method ChooseRandom: Int(useSeed: Bool)
        Debug.TraceNotImplemented("StackEx.ChooseRandom()")
    End Method

    Method Find: Int(value: Int)
        Debug.TraceNotImplemented("StackEx.Find()")
    End Method

    Method Shuffle: Void(useSeed: Bool)
        For Local i := 1 Until Self.Length()
            Local randomValue := Util.RndIntRangeFromZero(i, useSeed)
            If Not (i = randomValue)
                Local value_at_i := Self.Get(i)
                Local value_at_randomValue := Self.Get(randomValue)

                Self.Set(i, value_at_randomValue)
                Self.Set(randomValue, value_at_i)
            End If
        End For
    End Method

    Method NoTrim: Void()
        ChooseRandom(False)
        Find(0)
        Shuffle(False)
    End Method

End
