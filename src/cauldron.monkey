'Strict

Import enemy
Import logger
Import player_class
Import util

Class Cauldron Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "cauldron")

        Self.ActivateLight(0.5, 3.0)

        Local flipXRoll := Util.RndBool(True)
        If flipXRoll
            Self.image.FlipX(True, True)
        End If

        Self.overrideDeathSound = "cauldronHit"

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Cauldron.Die()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Cauldron.Update()")
    End Method

End Class
