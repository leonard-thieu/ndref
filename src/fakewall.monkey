'Strict

Import enemy
Import logger
Import point

Class FakeWall Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "fakewall")

        Self.stealth = True

        If Self.level = 2
            Self.containsItem = True
        End If

        Self.overrideMoveSound = "wallMonsterChase"
        Self.overrideDeathSound = "wallMonsterDeath"
        Self.overrideHitSound = "wallMonsterHit"
        Self.overrideAttackSound = "wallMonsterAttack"
    End Method

    Field hasMoved: Bool
    Field goldDropped: Bool

    Method Die: Void()
        Debug.TraceNotImplemented("FakeWall.Die()")
    End Method

    Method DropItem2: Void()
        Debug.TraceNotImplemented("FakeWall.DropItem2()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("FakeWall.GetMovementDirection()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("FakeWall.Update()")
    End Method

End Class
