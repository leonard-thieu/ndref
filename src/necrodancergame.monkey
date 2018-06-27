'Strict

Import mojo.app
Import mojo.graphics
Import gui.controller
Import gui.controller_game
Import level
Import gamedata
Import input2
Import logger
Import necrodancergame
Import os
Import player_class
Import util
Import xml

Global CHRISTMAS_MODE: Bool
Global DEBUG_DISABLE_CLOUD_SAVES: Bool
Global DEBUG_DISCOFLOOR_ON: Bool
Global DEBUG_GO_STRAIGHT_TO_GAMEPLAY: Bool
Global DEBUG_LOG_OUTPUT: Bool
Global DEBUG_OUTPUT: Bool
Global DEBUG_STOP_ENEMY_MOVEMENT: Bool
Global FIXED_HEIGHT: Int
Global FIXED_WIDTH: Int
Global FRAMES_PER_SEC: Int = 60
Global GLOBAL_SCALE_FACTOR: Float = 1.0

Global globalFrameCounter: Int
Global lastFPS: Int
Global lastFPSUpdate: Int
Global lastFrameCount: Int
Global lastFrameCountUpdate: Int
Global lastFrameTime: Int
Global lastFrameTimeUpdate: Int
Global lastGCAllocCount: Int
Global lastGCS: Int
Global lastReportedFPS: Int
Global lastReportedFPSUpdate: Int
Global uncapFrameRate: Bool
Global xmlData: XMLDoc

Class NecroDancerGame Extends App

    Global lastDeviceHeight: Int = -1
    Global lastDeviceWidth: Int = -1
    Global lastViewMultiplier: Int = -1
    Global textFont: Image

    Function UpdateScreenSize: Void(force: Bool)
        Debug.TraceNotImplemented("NecroDancerGame.UpdateScreenSize(Bool)")
    End Function

    Function _EditorFix: Void() End

    Method OnCreate: Int()
        GameData.LoadGameDataXML(True)

        New ControllerGame()
        
        Debug.TraceNotImplemented("NecroDancerGame.OnCreate()")

        Return 0
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
        If app.Millisecs() - necrodancergame.lastFrameTimeUpdate > 999
            necrodancergame.lastFrameTimeUpdate = app.Millisecs()
            necrodancergame.lastFPSUpdate = necrodancergame.globalFrameCounter - necrodancergame.lastFrameCountUpdate
            necrodancergame.lastFrameCountUpdate = necrodancergame.globalFrameCounter
        End If

        Input.Update()

        If Controller.currentController <> Null
            Self.TestSeededAllZonesMode(Character.Cadence, "1")
            
            Controller.currentController.Update()
        End If

        Debug.TraceNotImplemented("NecroDancerGame.OnUpdate() (FMOD)")
        Debug.TraceNotImplemented("NecroDancerGame.OnUpdate() (Steam API)")

        app.EndApp()

        Return 0
    End Method

    Method TestSeededAllZonesMode: Void(character: Int, randSeedString: String)
        controller_game.players[0] = New Player(0, character)

        Level.randSeedString = randSeedString

        Level.NewLevel(LevelType.SeededAllZonesMode, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)

        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)

        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)

        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)

        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
        
        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
    End Method

    Method TestSeededRandomizerMode: Void(character: Int, randSeedString: String)
        controller_game.players[0] = New Player(0, character)

        Level.randSeedString = randSeedString

        Level.NewLevel(LevelType.SeededRandomizerMode, controller_game.currentZone)
        
        ' Dump all enemies
        os.SaveString(Enemy.randomizerXML.Export(0), "randomizer-" + Level.randSeed + ".xml")
        
        Local blackSkullXML := Enemy.GetEnemyXML("skull", 3)
        Local blackSkullStats := blackSkullXML.GetChild("stats")
        Local blackSkullBeatsPerMove := blackSkullStats.GetAttribute("beatsPerMove", -1)
        Local blackSkullHealth := blackSkullStats.GetAttribute("health", -1)

        Debug.WriteLine("Black Skull")
        Debug.WriteLine("  Beats per move: " + blackSkullBeatsPerMove)
        Debug.WriteLine("  Health: " + blackSkullHealth)
    End Method

End Class
