'Strict

Import logger

Global g_SteamLeaderboards: Object

Function SteamApps: ISteamApps()
    Debug.TraceNotImplemented("SteamApps()")
End Function

Function SteamInit: Void()
    Debug.TraceNotImplemented("SteamInit()")
End Function

Function SteamShutdown: Void()
    Debug.TraceNotImplemented("SteamShutdown()")
End Function

Interface ISteamApps

    Method BIsDlcInstalled: Bool(appID: Int)

End Interface
