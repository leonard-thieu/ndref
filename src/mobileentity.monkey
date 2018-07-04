'Strict

Import level
Import audio2
Import entity
Import logger
Import particles
Import tile
Import util

Class MobileEntity Extends Entity Abstract

    Function _EditorFix: Void() End

    Method New()
        Super.New()

        Self.isMobile = True
    End Method

    Field gotOutOfTar: Bool
    Field moveTween: Int = 1
    Field moveShadowTween: Int = 2
    Field slidingDir: Int = -1
    Field isMassive: Bool
    Field ignoreLiquids: Bool
    Field wasKnockedBack: Bool
    Field wasInWater: Bool
    Field wasInDeepWater: Bool
    Field wasInTar: Bool
    Field distancePerMovement: Int = 1

    Method IsSlidingOnIce: Bool()
        Return Self.slidingDir <> Direction.None
    End Method

    Method IsStandingStill: Bool()
        If Self.image.GetTweenDurationRemaining() > 0
            Return False
        End IF

        Return Int(1000.0 * Self.image.renderX) = Int(1000.0 * Self.image.renderLastX) And
               Int(1000.0 * Self.image.renderY) = Int(1000.0 * Self.image.renderLastY) And
               Self.x = Self.lastFrameX And
               Self.y = Self.lastFrameY
    End Method

    Method IsStuckInLiquid: Bool()
        Debug.TraceNotImplemented("MobileEntity.IsStuckInLiquid()")
    End Method

    Method Splash: Void(destroyWater: Bool)
        Debug.TraceNotImplemented("MobileEntity.Splash(Bool)")
    End Method

    Method Update: Void()
        Local inWater: Bool
        If Level.GetTileTypeAt(Self.x, Self.y) = TileType.Water
            inWater = True
        End If

        Local inDeepWater: Bool
        If Level.GetTileTypeAt(Self.x, Self.y) = TileType.DeepWater And
           Not Self.gotOutOfTar
            inDeepWater = True
        End If

        Local inTar: Bool
        If Level.GetTileTypeAt(Self.x, Self.y) = TileType.Tar And
           Not Self.gotOutOfTar
            inTar = True
        End If

        If (inWater Or
            inDeepWater Or
            inTar) And
           Self.IsStandingStill()
            If Not Self.floating
                If Not Self.falling
                    Self.image.SetCutoffY(6)
                End If

                Self.waterOffset = 6
            End If
        Else
            If Not Self.falling
                Self.image.UnsetCutoffY()
            End If

            Self.waterOffset = 0
        End If

        If Not Self.floating
            If Not Self.wasInWater And
               inWater
                Audio.PlayGameSoundAt("waterIn", Self.x, Self.y, False, -1, False)

                Local particleSystemX := 24.0 * (Self.x + 0.5)
                Local particleSystemY := 24.0 * (Self.y + 1.5)
                New ParticleSystem(particleSystemX, particleSystemY, ParticleSystemData.WATER_SPLASH_IN, -1, "")
            End If

            Self.wasInWater = inWater

            If Not Self.wasInDeepWater And
               inDeepWater
                Audio.PlayGameSoundAt("waterIn", Self.x, Self.y, False, -1, False)

                Local particleSystemX := 24.0 * (Self.x + 0.5)
                Local particleSystemY := 24.0 * (Self.y + 1.5)
                New ParticleSystem(particleSystemX, particleSystemY, ParticleSystemData.WATER_SPLASH_IN, -1, "")
            End If

            Self.wasInDeepWater = inDeepWater

            If Not Self.wasInTar And
               inTar
                Audio.PlayGameSoundAt("tarIn", Self.x, Self.y, False, -1, False)

                Local particleSystemX := 24.0 * (Self.x + 0.5)
                Local particleSystemY := 24.0 * (Self.y + 1.5)
                New ParticleSystem(particleSystemX, particleSystemY, ParticleSystemData.TAR_SPLASH_IN, -1, "")
            End If

            Self.wasInTar = inTar
        End If

        Super.Update()
    End Method

End Class
