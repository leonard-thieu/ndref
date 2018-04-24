'Strict

Import enemy
Import entity
Import logger
Import sprite

Class MushroomLight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, forceNonExploding: Bool, forceExploding: Bool)
        Debug.TraceNotImplemented("MushroomLight.New(Int, Int, Int, Bool, Bool)")
    End Method

    Method New(xVal: Int, yVal: Int, l: Int, forceNonExploding: Bool)
        Debug.TraceNotImplemented("MushroomLight.New(Int, Int, Int, Bool)")
    End Method

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("MushroomLight.New(Int, Int, Int)")
    End Method

    Field isExploding: Bool
    Field explosionImg: Sprite
    Field exploded: Bool
    Field beatsUntilExplosion: Int
    Field vibrateCounter: Int
    Field vibrateOffset: Float
    Field explosionFrameCounter: Int
    Field explosionFrame: Int

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("MushroomLight.CanBeDamaged(Bool, Bool)")
    End Method

    Method Explode: Void()
        Debug.TraceNotImplemented("MushroomLight.Explode()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("MushroomLight.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method InitMushroom: Void(xVal: Int, yVal: Int, l: Int, forceNonExploding: Bool, forceExploding: Bool)
        Debug.TraceNotImplemented("MushroomLight.InitMushroom(Int, Int, Int, Bool, Bool)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("MushroomLight.MoveFail()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("MushroomLight.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("MushroomLight.Update()")
    End Method

End Class
