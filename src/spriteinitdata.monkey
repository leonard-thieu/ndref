'Strict

Import logger

Class SpriteInitData

    Function _EditorFix: Void() End

    Method New(frameWidth: Int, frameHeight: Int, frameCount: Int, flags: Int)
        Self.frameWidth = frameWidth
        Self.frameHeight = frameHeight
        Self.frameCount = frameCount
        Self.flags = flags
    End Method

    Field frameWidth: Int
    Field frameHeight: Int
    Field frameCount: Int
    Field flags: Int

End Class
