Import image
Import sprite
Import trap

Class BombTrap Extends Trap

	Method New(xVal: Int, yVal: Int)
		Super.New()

		Self.type = 9
		Self.field_68 = 5.0
		Self.field_64 = 15.0

		Self.x = xVal
		Self.y = yVal

		Local sprite := new Sprite()
		sprite.InitSprite("traps/bombtrap.png", 14, 16, 4, Image.DefaultFlags)
		sprite.SetZ(-995.0)
		Self.sprite = sprite
	End Method

End Class
