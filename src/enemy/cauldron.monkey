'Strict

Import enemy
Import level
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
        Select Self.level
            Case 2  Level.PlaceIceTileAt(Self.x, Self.y)
            Default Level.PlaceHotCoalTileAt(Self.x, Self.y)
        End Select

        Super.Die()
    End Method

    Method GetMovementDirection: Point()
        Return New Point(0, -1)
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Return 0
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Cauldron.Update()")
    End Method

End Class
