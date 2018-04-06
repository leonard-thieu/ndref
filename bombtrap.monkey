Import image
Import sprite
Import trap

Class BombTrap Extends Trap

	Method New(xVal: Int, yVal: Int)
		Super.New()

		Self.type = TrapType.BombTrap
		Self.xOff = 5.0
		Self.yOff = 15.0

		Self.x = xVal
		Self.y = yVal

		Local sprite := new Sprite()
		sprite.InitSprite("traps/bombtrap.png", 14, 16, 4, Image.DefaultFlags)
		sprite.SetZ(-995.0)
		Self.sprite = sprite
	End Method

	Field field_10C: Int

End Class
