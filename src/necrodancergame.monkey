'Strict

Import mojo.app
Import gui.controller_game
Import level
Import gamedata
Import logger
Import necrodancergame
Import player_class
Import xml

Global xmlData: XMLDoc
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
        GameData.LoadGameDataXML(True)

        controller_game.controllerGamePointer = New ControllerGame()

        controller_game.players[0] = New Player(controller_game.player1, Character.Cadence)
        controller_game.numPlayers = 1

        controller_game.currentLevel = LevelType.Lobby

        Level.randSeedString = "1"

        Level.NewLevel(LevelType.SeededAllZonesMode, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)

        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)

        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)

        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)

        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone, controller_game.player1, False, Null, False)
        
        Debug.TraceNotImplemented("NecroDancerGame.OnCreate()")

        app.EndApp()
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
