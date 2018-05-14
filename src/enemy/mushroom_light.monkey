'Strict

Import mojo.graphics
Import gui.controller_game
Import enemy
Import entity
Import logger
Import sprite
Import util

Class MushroomLight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int, forceNonExploding: Bool, forceExploding: Bool)
        Self.InitMushroom(xVal, yVal, l, forceNonExploding, forceExploding)
    End Method

    Method New(xVal: Int, yVal: Int, l: Int, forceNonExploding: Bool)
        Self.InitMushroom(xVal, yVal, l, forceNonExploding, False)
    End Method

    Method New(xVal: Int, yVal: Int, l: Int)
        Self.InitMushroom(xVal, yVal, l, False, False)
    End Method

    Field isExploding: Bool
    Field explosionImg: Sprite
    Field exploded: Bool
    Field beatsUntilExplosion: Int = -1
    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 0.7
    Field explosionFrameCounter: Int = 3
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
        Local explodingRoll := Util.RndIntRangeFromZero(25, True)
        If explodingRoll = 0
            Self.isExploding = True
        End If

        If forceExploding
            Self.isExploding = True
        End If

        If controller_game.currentLevel > 2
            Local explodingRoll2 := Util.RndIntRangeFromZero(25, True)
            If explodingRoll2 = 0
                Self.isExploding = True
            End If
        End If

        If forceNonExploding
            Self.isExploding = False
        End If

        If Self.isExploding
            Self.Init(xVal, yVal, l, "mushroom_exploding", "", -1, -1)
        Else
            Self.Init(xVal, yVal, l, "mushroom_light", "", -1, -1)
        End If

        Local flipXRoll := Util.RndBool(True)
        If flipXRoll
            Self.image.FlipX(True, True)
        End If

        Local animOverrideRoll := Util.RndBool(True)
        If animOverrideRoll
            Self.animOverride = True
        End If

        Self.ActivateLight(0.5, 3.0)

        Self.overrideDeathSound = "mushroomLightHit"

        Self.explosionImg = New Sprite("items/3x3_explosion.png", 8, Image.DefaultFlags)
        Self.explosionImg.SetZOff(1000.0)

        If Util.IsCharacterActive(Character.Monk) Or
           Util.IsCharacterActive(Character.Coda)
            Self.coinsToDrop = 1
        End If
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
