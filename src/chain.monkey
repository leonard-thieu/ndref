'Strict

Import logger
Import necrodancergame

Class Chain

    Global GrooveText: Object
    Global kills: Int
    Global lastActor: Object
    Global lastGrooveColor: Int
    Global lastGrooveLevel: Int
    Global waitingForFirstMovement: Bool[necrodancergame.MAX_NUM_PLAYERS]

    Function Break: Void(player: Object, gotHit: Bool, plSound: Bool, lackOfMovement: Bool)
        Debug.TraceNotImplemented("Chain.Break(Object, Bool, Bool, Bool)")
    End Function

    Function GetDisplayMultiplierString: Int()
        Debug.TraceNotImplemented("Chain.GetDisplayMultiplierString()")
    End Function

    Function GetGrooveLevel: Int()
        Debug.TraceNotImplemented("Chain.GetGrooveLevel()")
    End Function

    Function GetMaxMultiplier: Float()
        Debug.TraceNotImplemented("Chain.GetMaxMultiplier()")
    End Function

    Function GetMultiplier: Float()
        Debug.TraceNotImplemented("Chain.GetMultiplier()")
    End Function

    Function Kill: Void(player: Object)
        Debug.TraceNotImplemented("Chain.Kill(Object)")
    End Function

    Function Render: Void()
        Debug.TraceNotImplemented("Chain.Render()")
    End Function

    Function _EditorFix: Void() End

End Class
