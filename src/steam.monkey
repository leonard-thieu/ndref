'Strict

Import logger

Global g_SteamLeaderboards: Object

Function GetCloudSaveTimestamp: Int()
    Debug.TraceNotImplemented("GetCloudSaveTimestamp()")
End Function

Function GetPlayerID: String()
    Debug.TraceNotImplemented("GetPlayerID()")
End Function

Function LoadCloudSave: String()
    Debug.TraceNotImplemented("LoadCloudSave()")
End Function

Function SteamApps: ISteamApps()
    Debug.TraceNotImplemented("SteamApps()")
End Function

Function SteamInit: Void()
    Debug.TraceNotImplemented("SteamInit()")
End Function

Function SteamPump: Void()
    Debug.TraceNotImplemented("SteamPump()")
End Function

Function SteamShutdown: Void()
    Debug.TraceNotImplemented("SteamShutdown()")
End Function

Interface ISteamApps

    Method BIsDlcInstalled: Bool(appID: Int)

End Interface
