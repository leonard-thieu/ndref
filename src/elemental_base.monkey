'Strict

Import enemy
Import logger

Class ElementalBase Extends Enemy

    Function _EditorFix: Void() End

    Method MoveFail: Void()
        Debug.TraceNotImplemented("ElementalBase.MoveFail()")
    End Method

End Class
