'Strict

Import callback
Import logger

Class Stairs_callback Implements Callback

    Global continuedRun: Bool
    Global levelVal: Int
    Global playerVal: Int
    Global zoneVal: Int

    Function _EditorFix: Void() End

    Field cutscenePlaying: Bool

    Method Execute: Void(args: Int)
        Debug.TraceNotImplemented("Stairs_callback.Execute(Int)")
    End Method

    Method PlayCutscene: Void(charId: Int, cutsceneId: Int)
        Debug.TraceNotImplemented("Stairs_callback.PlayCutscene(Int, Int)")
    End Method

    Method ShouldPlayFinalCutscene: Bool()
        Debug.TraceNotImplemented("Stairs_callback.ShouldPlayFinalCutscene()")
    End Method

    Method ShouldPlayIntroCutscene: Bool()
        Debug.TraceNotImplemented("Stairs_callback.ShouldPlayIntroCutscene()")
    End Method

    Method ShouldPlayZoneEndCutscene: Bool()
        Debug.TraceNotImplemented("Stairs_callback.ShouldPlayZoneEndCutscene()")
    End Method

End Class

Class AdvanceLevel_callback Implements Callback

    Function _EditorFix: Void() End

    Method Execute: Void(args: Int)
        Debug.TraceNotImplemented("AdvanceLevel_callback.Execute(Int)")
    End Method

End Class
