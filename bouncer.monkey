Import monkey.random
Import util

Class Bouncer

    Method New(minVal: Float, maxVal: Float, powerVal: Float, stepsVal: Int)
        Self.max = maxVal
        Self.steps = stepsVal
        Self.min = minVal
        Self.field_1C = minVal
        Self.power = powerVal
        Self.field_24 = random.Rnd(-stepsVal, stepsVal)
        Self.field_28 = Util.RndBool(False)
    End Method

    Field min: Float
    Field max: Float
    Field power: Float
    Field field_1C: Float
    Field steps: Int
    Field field_24: Int
    Field field_28: Bool = True
    Field field_29: Bool = True

End Class
