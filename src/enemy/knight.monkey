'Strict

Import enemy
Import logger
Import player_class
Import point
Import shrine
Import util

Class Knight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        If Shrine.warShrineActive
            l = 2
        End If

        Self.Init(xVal, yVal, l, "knight", "", -1, -1)

        Self.ActivateLight(0.01, 0.02)

        Self.overrideAttackSwipe = True

        Local swipePath := "swipes/swipe_knight.png"
        If l = 2
            swipePath = "swipes/swipe_knight_red.png"
        End If

        Self.customAttackSwipe = New Sprite(swipePath, 1)
        Self.customAttackSwipe.SetZOff(1000.0)
        Self.customAttackSwipe.SetHandle(12, 36)

        Self.hitTween = 0
        Self.hitShadowTween = 0

        Self.overrideAttackSound = "chessAttack"
        Self.overrideDeathSound = "chessDeath"

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Field customAttackSwipe: Sprite

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Knight.GetMovementDirection()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Knight.Render()")
    End Method

End Class
