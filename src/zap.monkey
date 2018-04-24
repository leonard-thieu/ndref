'Strict

Import intpointmap
Import logger
Import player_class

Class Zap

    Global zapGenerationAlloc: Int

    Function _EditorFix: Void() End

    Method New(player_: Object, playerX_: Int, playerY_: Int, electricStrength_: Int)
        Debug.TraceNotImplemented("Zap.New(Object, Int, Int, Int)")
    End Method

    Field player: Player
    Field playerX: Int
    Field playerY: Int
    Field electricStrength: Int
    Field zapGeneration: Int
    Field open: Bool
    Field parents: IntPointMap
    Field attackDir: Int

    Method Add11: Void(nme: Object, x: Int, y: Int, dir: Int)
        Debug.TraceNotImplemented("Zap.Add11(Object, Int, Int, Int)")
    End Method

    Method Commit: Void()
        Debug.TraceNotImplemented("Zap.Commit()")
    End Method

End Class
