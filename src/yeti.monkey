'Strict

Import enemy
Import level
Import logger

Class Yeti Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "yeti")

        Self.overrideAttackSound = "yetiAttack"
        Self.overrideDeathSound = "yetiDeath"

        Self.swarmCulprit = True
    End Method

    Field lastNonVisibleBeat: Int = -1
    Field animState: Int

    Method Die: Void()
        If Self.enableDeathEffects
            Level.PlaceIceTileAt(Self.x, Self.y)
        End If

        Super.Die()
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Yeti.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Yeti.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Yeti.Update()")
    End Method

End Class
