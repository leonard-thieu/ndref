'Strict

Import monkey.list
Import logger
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
        Debug.TraceNotImplemented("ParticleSystem.new()")
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

    Method NoTrim: Void()
        Init()
        Render()
        UpdateAll()
        InitOvularParticles()
        Update()
    End Method

End Class

Class Particle

End Class

Class ParticleSystemData

End Class
