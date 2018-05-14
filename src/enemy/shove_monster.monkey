'Strict

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
        Debug.TraceNotImplemented("ShoveMonster.Update()")
    End Method

End Class
