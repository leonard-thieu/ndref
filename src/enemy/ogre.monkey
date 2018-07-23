'Strict

Import enemy
Import logger
Import point
Import sprite
Import util

Class Ogre Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "ogre")

        Self.imageStandard = Self.image
        Self.imageSmashLeft = New Sprite("entities/ogre_left.png", 124, 72, 16)
        Self.imageSmashDown = New Sprite("entities/ogre_down.png", 46, 142, 16)
        Self.imageSmashUp = New Sprite("entities/ogre_up.png", 47, 100, 16)

        Self.overrideAttackSound = "ogreAttack"
        Self.overrideHitSound = "ogreHit"
        Self.overrideDeathSound = "ogreDeath"
    End Method

    Field imageStandard: Sprite
    Field imageSmashLeft: Sprite
    Field imageSmashDown: Sprite
    Field imageSmashUp: Sprite
    Field smashingDir: Int = Direction.None
    Field justSmashed: Bool
    Field smashedDir: Int = Direction.None
    Field smashCounter: Int

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Ogre.CanBeLord()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Ogre.GetMovementDirection()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Ogre.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Ogre.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Ogre.Update()")
    End Method

End Class
