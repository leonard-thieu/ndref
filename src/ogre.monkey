'Strict

Import enemy
Import logger
Import point
Import sprite

Class Ogre Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Ogre.New(Int, Int, Int)")
    End Method

    Field imageStandard: Sprite
    Field imageSmashLeft: Sprite
    Field imageSmashDown: Sprite
    Field imageSmashUp: Sprite
    Field smashingDir: Int
    Field justSmashed: Bool
    Field smashedDir: Int
    Field smashCounter: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Ogre.GetMovementDirection()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Ogre.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Ogre.Update()")
    End Method

End Class
