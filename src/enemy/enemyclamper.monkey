'Strict

Import enemy
Import logger

Class EnemyClamper Extends Enemy Abstract

    Function _EditorFix: Void() End

    Method DislodgeAttempt: Bool() Abstract

    Method AttemptClamp: Void() Abstract

End Class
