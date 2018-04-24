'Strict

Import monkey.list
Import logger
Import particles
Import sprite
Import tweenable

Class ParticleSystem Extends Tweenable

    Global particlePool: List<Particle> = New List<Particle>()
    Global systems: List<ParticleSystem> = New List<ParticleSystem>()

    Function Init: Void()
        Debug.TraceNotImplemented("ParticleSystem.Init()")
    End Function

    Function Render: Void()
        Debug.TraceNotImplemented("ParticleSystem.Render()")
    End Function

    Function UpdateAll: Void()
        Debug.TraceNotImplemented("ParticleSystem.UpdateAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, data: ParticleSystemData, dir: Int, imagePath: Int)
        Debug.TraceNotImplemented("ParticleSystem.New(Int, Int, ParticleSystemData, Int, Int)")
    End Method

    Field visible: Bool = True
    Field active: Bool = True
    Field x: Int
    Field y: Int
    Field isOvular: Bool
    Field particles: List<Particle> = New List<Particle>()
    Field zOff: Int

    Method InitOvularParticles: Void()
        Debug.TraceNotImplemented("ParticleSystem.InitOvularParticles()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ParticleSystem.Update()")
    End Method

End Class

Class ParticleSystemData

    Global BLOOD: Object
    Global BLOOD_SACRIFICE: Object
    Global CONFUSION: Object
    Global DIG: Object
    Global DIG_ZONE4: Object
    Global GEYSER: Object
    Global HEAL_SPELL: Object
    Global LORD_CROWN: Object
    Global MOLE_APPEAR: Object
    Global MOLE_DIG: Object
    Global MONSTER_DEAD: Object
    Global MONSTER_HIT: Object
    Global MUSHROOM_SPORES: Object
    Global OCTOBOSS_SPLASH: Object
    Global SKELETON_HEAD: Object
    Global SKELETON_HELMET: Object
    Global SKELETON_SHIELD: Object
    Global TAR_SPLASH_IN: Object
    Global TAR_SPLASH_OUT: Object
    Global WATER_SPLASH_IN: Object
    Global WATER_SPLASH_OUT: Object

    Function Init: Void()
        Debug.TraceNotImplemented("ParticleSystemData.Init()")
    End Function

    Function _EditorFix: Void() End

    Method New(name: Int, num: Int, r: Float, h: Float, spread: Float, expl: Float, g: Float, bounce: Float, world: Bool, fd: Int, ft: Int, fg: Bool, xb: Float, yb: Float, minD: Int, maxD: Int, minS: Float, maxS: Float, minO: Float, maxO: Float)
        Debug.TraceNotImplemented("ParticleSystemData.New(Int, Int, Float, Float, Float, Float, Float, Float, Bool, Int, Int, Bool, Float, Float, Int, Int, Float, Float, Float, Float)")
    End Method

    Field xVelBias: Float
    Field numParticles: Int
    Field radius: Float
    Field spreadness: Float
    Field explosiveness: Float
    Field inWorld: Bool
    Field height: Float
    Field yVelBias: Float
    Field minDelay: Int
    Field maxDelay: Int
    Field gravity: Float
    Field bounciness: Float
    Field fadeDelay: Int
    Field fadeTime: Int
    Field fadeOnGround: Bool
    Field imageName: String
    Field minScale: Float
    Field maxScale: Float
    Field minOpacity: Float
    Field maxOpacity: Float

End Class

Class Particle

    Function _EditorFix: Void() End

    Field spr: Sprite
    Field system: ParticleSystem
    Field x: Float
    Field y: Float
    Field z: Float
    Field xVel: Float
    Field yVel: Float
    Field zVel: Float
    Field yAcc: Float
    Field bounciness: Float
    Field fadeDelay: Int
    Field fadeTime: Int
    Field fadeCounter: Int
    Field fading: Bool
    Field inWorld: Bool
    Field visible: Bool
    Field delay: Int
    Field active: Bool
    Field initialOpacity: Float
    Field theta: Float

    Method Init: Void(sys: Object, xVal: Float, yVal: Float, zVal: Float, xVelVal: Float, yVelVal: Float, zVelVal: Float, delayVal: Int, data: Object, imagePath: Int)
        Debug.TraceNotImplemented("Particle.Init(Object, Float, Float, Float, Float, Float, Float, Int, Object, Int)")
    End Method

    Method Update: Void(isOvular: Bool)
        Debug.TraceNotImplemented("Particle.Update(Bool)")
    End Method

End Class
