Strict

Import image
Import sprite
Import trap

Class BombTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New()

        Self.trapType = TrapType.BombTrap
        Self.xOff = 5.0
        Self.yOff = 15.0

        Self.x = xVal
        Self.y = yVal

        Local image := new Sprite()
        image.InitSprite("traps/bombtrap.png", 14, 16, 4, Image.DefaultFlags)
        image.SetZ(-995.0)
        Self.image = image
    End Method

    Field field_10C: Int

End Class
