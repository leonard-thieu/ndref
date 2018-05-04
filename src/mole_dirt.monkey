'Strict

Import mojo.graphics
Import entity
Import logger
Import particles
Import sprite

Class MoleDirt Extends Entity

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New()

        Self.x = xVal
        Self.y = yVal

        Self.image = New Sprite("entities/mole_dirt.png", 24, 24, 2, Image.DefaultFlags)
        Self.image.SetZ(-997.0)

        Local particleSystemX := (Self.x * 24) + 12
        Local particleSystemY := (Self.y * 24) + 24
        New ParticleSystem(particleSystemX, particleSystemY, ParticleSystemData.MOLE_DIG, -1, "")
    End Method

    Field occupied: Bool = True
    Field vibrate: Bool
    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 0.7
    Field preFadeCounter: Int
    Field PREFADE_TIME: Int = 34
    Field fadeCounter: Int
    Field FADE_TIME: Int = 60

    Method Render: Void()
        Debug.TraceNotImplemented("MoleDirt.Render()")
    End Method

    Method Unoccupy: Void()
        Debug.TraceNotImplemented("MoleDirt.Unoccupy()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("MoleDirt.Update()")
    End Method

    Method UpdateFade: Void()
        Debug.TraceNotImplemented("MoleDirt.UpdateFade()")
    End Method

End Class
