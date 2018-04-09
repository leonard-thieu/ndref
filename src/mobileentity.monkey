Strict

Import entity

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

End Class
