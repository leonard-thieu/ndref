'Strict

Import monkey.stack
Import logger

Class WeightedPicker

    Function _EditorFix: Void() End

    Field weights: Stack<Object>
    Field enabled: Stack<Object>

    Method Length: Int()
        Debug.TraceNotImplemented("WeightedPicker.Length()")
    End Method

    Method PickRandom: Int(useSeed: Bool)
        Debug.TraceNotImplemented("WeightedPicker.PickRandom(Bool)")
    End Method

    Method Push: Void(weight: Int)
        Debug.TraceNotImplemented("WeightedPicker.Push(Int)")
    End Method

    Method SetEnabled: Void(i: Int, en: Bool)
        Debug.TraceNotImplemented("WeightedPicker.SetEnabled(Int, Bool)")
    End Method

End Class
