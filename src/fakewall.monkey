'Strict

Import enemy
Import item
Import level
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
        Self.DropItem()

        Super.Die()
    End Method

    Method DropItem: Void()
        If Not Level.isTrainingMode Or
           Self.level = 2 And
           Not Self.goldDropped
            Self.goldDropped = True

            New Item(Self.x, Self.y, "resource_coin10", False, -1, False)
        End If
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("FakeWall.GetMovementDirection()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("FakeWall.Update()")
    End Method

End Class
