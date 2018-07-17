Strict

Import enemy
Import level
Import audio2
Import camera
Import logger
Import point
Import shrine

Class BatMiniboss Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If Shrine.warShrineActive Then l = 2

        Self.Init(xVal, yVal, l, "bat_miniboss")

        Self.overrideAttackSound = "vampbatAttack"
        Self.overrideHitSound = "vampbatHit"
        Self.overrideDeathSound = "vampbatDeath"
    End Method

    Field hasRoared: Bool

    Method GetMovementDirection: Point()
        If Self.IsConfused()
            Return Self.BasicSeek()
        End If

        Return Super.GetMovementDirection()
    End Method

    Method Update: Void()
        If Self.IsVisible() And
           Camera.IsOnScreen(Self.x, Self.y) And
           Not Self.hasRoared And
           Not Level.isLevelEditor
            Audio.PlayGameSoundAt("vampbatCry", Self.x, Self.y, True, -1, False)
            Self.hasRoared = True
        End If

        If Self.lastX > Self.x
            Self.image.FlipX(True, True)
        Else If Self.lastX < Self.x
            Self.image.FlipX(False, True)
        End If

        Super.Update()
    End Method

End Class
