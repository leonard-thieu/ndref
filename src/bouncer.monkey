Strict

Import monkey.random
Import util

Class Bouncer

    Function _EditorFix: Void() End

    Method New(minVal: Float, maxVal: Float, powerVal: Float, stepsVal: Int)
        Self.max = maxVal
        Self.steps = stepsVal
        Self.min = minVal
        Self.value = minVal
        Self.power = powerVal
        Self.currentSteps = random.Rnd(-stepsVal, stepsVal)
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

End Class
