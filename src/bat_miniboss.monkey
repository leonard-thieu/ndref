'Strict

Import enemy
Import logger
Import point
Import shrine

Class BatMiniboss Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive Then l = 2

        Self.Init(xVal, yVal, l, "bat_miniboss", "", -1, -1)

        Self.overrideAttackSound = "vampbatAttack"
        Self.overrideHitSound = "vampbatHit"
        Self.overrideDeathSound = "vampbatDeath"
    End Method

    Field hasRoared: Bool

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("BatMiniboss.GetMovementDirection()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("BatMiniboss.Update()")
    End Method

End Class
