'Strict

Import entity
Import logger

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
        Debug.TraceNotImplemented("TextSprite.IsSlidingOnIce()")
    End Method

    Method IsStandingStill: Bool()
        Debug.TraceNotImplemented("TextSprite.IsStandingStill()")
    End Method

    Method IsStuckInLiquid: Bool()
        Debug.TraceNotImplemented("TextSprite.IsStuckInLiquid()")
    End Method

    Method Splash: Void(destroyWater: Bool)
        Debug.TraceNotImplemented("TextSprite.Splash()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("TextSprite.Update()")
    End Method

    Method NoTrim: Void()
        IsSlidingOnIce()
        IsStandingStill()
        IsStuckInLiquid()
        Splash(False)
        Update()
    End Method

End Class
