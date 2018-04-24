'Strict

Import brl.json
Import mojo.app
Import logger

Global xmlData: JsonObject
Global FRAMES_PER_SEC: Int

Class NecroDancerGame Extends App

    Global lastDeviceHeight: Int
    Global lastDeviceWidth: Int
    Global lastViewMultiplier: Int
    Global textFont: Object

    Function UpdateScreenSize: Void(force: Bool)
        Debug.TraceNotImplemented("NecroDancerGame.UpdateScreenSize(Bool)")
    End Function

    Function _EditorFix: Void() End

    Method OnCreate: Int()
        Debug.TraceNotImplemented("NecroDancerGame.OnCreate()")
    End Method

    Method OnRender: Int()
        Debug.TraceNotImplemented("NecroDancerGame.OnRender()")
    End Method

    Method OnResume: Int()
        Debug.TraceNotImplemented("NecroDancerGame.OnResume()")
    End Method

    Method OnSuspend: Int()
        Debug.TraceNotImplemented("NecroDancerGame.OnSuspend()")
    End Method

    Method OnUpdate: Int()
        Debug.TraceNotImplemented("NecroDancerGame.OnUpdate()")
    End Method

End Class
