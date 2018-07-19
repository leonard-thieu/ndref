'Strict

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

        Self.image = New Sprite("entities/mole_dirt.png", 24, 24, 2)
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

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Return False
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("MoleDirt.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("MoleDirt.Render()")
    End Method

    Method Unoccupy: Void()
        Self.occupied = False
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("MoleDirt.Update()")
    End Method

    Method UpdateFade: Void()
        Debug.TraceNotImplemented("MoleDirt.UpdateFade()")
    End Method

End Class
