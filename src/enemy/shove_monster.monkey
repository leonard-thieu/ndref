Strict

Import monkey.math
Import enemy
Import logger
Import shrine

Class ShoveMonster Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive
            l = math.Max(2, l)
        End If

        Self.Init(xVal, yVal, l, "shovemonster")

        Self.overrideDeathSound = "shovemonsterDeath"

        Self.isGentle = True
        Self.swarmCulprit = True
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("ShoveMonster.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        If Self.x < Self.lastX
            Self.image.FlipX(False, True)
        Else If Self.x > Self.lastX
            Self.image.FlipX(True, True)
        End If

        Super.Update()
    End Method

End Class
