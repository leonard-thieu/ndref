'Strict

Import logger

Class Tweenable Abstract

    Global tweenPoint: Object

    Function _EditorFix: Void() End

    Field alphaTweenDuration: Int
    Field alphaTweenCurrentStep: Float
    Field alphaTweenInitial: Float
    Field alphaTweenFinal: Float
    Field tweenDuration: Int
    Field tweenCurrentStep: Float
    Field tweenType: Int
    Field tweenX: Float
    Field tweenY: Float
    Field bufferedType: Int
    Field bufferedX: Float
    Field bufferedY: Float
    Field tweenPointOffX: Int
    Field tweenPointOffY: Int

    Method CancelTween: Void()
        Debug.TraceNotImplemented("Tweenable.CancelTween()")
    End Method

    Method GetTweenDurationRemaining: Int()
        Debug.TraceNotImplemented("Tweenable.GetTweenDurationRemaining()")
    End Method

    Method ProcessAlphaTween: Float()
        Debug.TraceNotImplemented("Tweenable.ProcessAlphaTween()")
    End Method

    Method ProcessTween: Object()
        Debug.TraceNotImplemented("Tweenable.ProcessTween()")
    End Method

    Method SetAlphaTween: Void(initialVal: Float, finalVal: Float, duration: Int)
        Self.alphaTweenCurrentStep = 0.0
        Self.alphaTweenDuration = duration
        Self.alphaTweenInitial = initialVal
        Self.alphaTweenFinal = finalVal
    End Method

    Method SetCutoffY: Void(cY: Int)
        Debug.TraceNotImplemented("Tweenable.SetCutoffY(Int)")
    End Method

    Method Tween: Void(xVal: Float, yVal: Float, type: Int, buffer: Bool)
        Debug.TraceNotImplemented("Tweenable.Tween(Float, Float, Int, Bool)")
    End Method

End Class
