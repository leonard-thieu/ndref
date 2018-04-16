'Strict

Import enemy
Import logger

Class FakeWall Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("TextSprite.new()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("TextSprite.Die()")
    End Method

    Method DropItem2: Void()
        Debug.TraceNotImplemented("TextSprite.DropItem2()")
    End Method

    Method GetMovementDirection: Object()
        Debug.TraceNotImplemented("TextSprite.GetMovementDirection()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TextSprite.Update()")
    End Method

    Method NoTrim: Void()
        Die()
        DropItem2()
        GetMovementDirection()
        Update()
    End Method

End Class
