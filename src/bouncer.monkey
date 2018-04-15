'Strict

Import logger
Import util

Class Bouncer

    Function _EditorFix: Void() End

    Method New(minVal: Float, maxVal: Float, powerVal: Float, stepsVal: Int)
        Self.min = minVal
        Self.max = maxVal
        Self.power = powerVal
        Self.value = minVal
        Self.steps = stepsVal
        Self.currentSteps = Util.RndIntRange(-stepsVal, stepsVal - 1, False, -1)
        Self.goingUp = Util.RndBool(False)
    End Method

    Field min: Float
    Field max: Float
    Field power: Float
    Field value: Float
    Field steps: Int
    Field currentSteps: Int
    Field goingUp: Bool = True
    Field enabled: Bool = True

    Method Disable: Void()
        Debug.TraceNotImplemented("TextSprite.Disable()")
    End Method

    Method Enable: Void()
        Debug.TraceNotImplemented("TextSprite.Enable()")
    End Method

    Method GetVal: Float()
        Debug.TraceNotImplemented("TextSprite.GetVal()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TextSprite.Update()")
    End Method

    Method NoTrim: Void()
        Disable()
        Enable()
        GetVal()
        Update()
    End Method

End Class
