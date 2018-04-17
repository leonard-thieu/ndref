'Strict

Import monkey.list
Import entity
Import logger

Class FamiliarFixed Extends Entity Abstract

    Global debugTouchDamage: Bool
    Global familiarList: List<FamiliarFixed> = New List<FamiliarFixed>()

    Function GetFamiliarAt: FamiliarFixed(x: Int, y: Int)
        For Local familiar := EachIn FamiliarFixed.familiarList
            If x = familiar.x And
               y = familiar.y
                Return familiar
            End If
        End For

        Return Null
    End Function

    Function _EditorFix: Void() End

    Method Die: Void()
        Debug.TraceNotImplemented("FamiliarFixed.Die()")
    End Method

    Method Init2: Void(x_: Int, y_: Int, type_: Int)
        Debug.TraceNotImplemented("FamiliarFixed.Init2()")
    End Method

    Method MoveTo: Void(x_: Int, y_: Int)
        Debug.TraceNotImplemented("FamiliarFixed.MoveTo()")
    End Method

    Method TryPickup: Void() Abstract

    Method Update: Void()
        Debug.TraceNotImplemented("FamiliarFixed.Update()")
    End Method

    Method WarpTo: Void(x_: Int, y_: Int)
        Debug.TraceNotImplemented("FamiliarFixed.WarpTo()")
    End Method

    Method NoTrim: Void()
        GetFamiliarAt(0, 0)
        Die()
        Init2(0, 0, 0)
        MoveTo(0, 0)
        Update()
        WarpTo(0, 0)
    End Method

End Class
