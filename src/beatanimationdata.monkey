Strict

Class BeatAnimationData

    Function _EditorFix: Void() End

    Method New(frame: Int, onFraction: Float, offFraction: Float, singleFrame: Bool)
        Self.frame = frame
        Self.onFraction = onFraction
        Self.offFraction = offFraction
        Self.singleFrame = singleFrame
    End Method

    Field frame: Int
    Field onFraction: Float
    Field offFraction: Float
    Field singleFrame: Bool

End Class
