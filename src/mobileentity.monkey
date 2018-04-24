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
        Debug.TraceNotImplemented("MobileEntity.IsSlidingOnIce()")
    End Method

    Method IsStandingStill: Bool()
        Debug.TraceNotImplemented("MobileEntity.IsStandingStill()")
    End Method

    Method IsStuckInLiquid: Bool()
        Debug.TraceNotImplemented("MobileEntity.IsStuckInLiquid()")
    End Method

    Method Splash: Void(destroyWater: Bool)
        Debug.TraceNotImplemented("MobileEntity.Splash(Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("MobileEntity.Update()")
    End Method

End Class
