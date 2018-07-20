'Strict

Import monkey.math
Import mojo.app
Import mojo.graphics
Import os
Import controller
Import controller.controller_game
Import controller.controller_mainmenu
Import level
Import fmod
Import gamedata
Import input2
Import logger
Import player_class
Import steam
Import textlog
Import util
Import xml

Const MAX_NUM_PLAYERS: Int = 4

Global CHRISTMAS_MODE: Bool
Global DEBUG_DISABLE_CLOUD_SAVES: Bool
Global DEBUG_DISCOFLOOR_ON: Bool
Global DEBUG_GO_STRAIGHT_TO_GAMEPLAY: Bool
Global DEBUG_LOG_OUTPUT: Bool = True
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
        Local viewMultiplierChanged: Bool
        If GameData.playerDataLoaded And
           GameData.GetViewMultiplier() <> NecroDancerGame.lastViewMultiplier
            viewMultiplierChanged = True
            NecroDancerGame.lastViewMultiplier = GameData.GetViewMultiplier()
        End If

        If force Or
           viewMultiplierChanged Or
           NecroDancerGame.lastDeviceHeight <> app.DeviceHeight() Or
           NecroDancerGame.lastDeviceWidth <> app.DeviceWidth()
            Local scaleFactorY := math.Floor(app.DeviceHeight() / 270.0)
            Local scaleFactorX := math.Floor(app.DeviceWidth() / 480.0)

            necrodancergame.GLOBAL_SCALE_FACTOR = math.Min(scaleFactorX, scaleFactorY)

            If GameData.playerDataLoaded
                If GameData.GetViewMultiplier() <> 0
                    necrodancergame.GLOBAL_SCALE_FACTOR = GameData.GetViewMultiplier()
                End If
            End If

            necrodancergame.GLOBAL_SCALE_FACTOR = math.Max(1.0, necrodancergame.GLOBAL_SCALE_FACTOR)

            necrodancergame.FIXED_WIDTH = app.DeviceWidth() / necrodancergame.GLOBAL_SCALE_FACTOR
            necrodancergame.FIXED_HEIGHT = app.DeviceHeight() / necrodancergame.GLOBAL_SCALE_FACTOR

            NecroDancerGame.lastDeviceHeight = app.DeviceHeight()
            NecroDancerGame.lastDeviceWidth = app.DeviceWidth()

            textlog.MessageGlobal("Updating screen size: " + app.DeviceWidth() + "x" + app.DeviceHeight(), True)
        End If
    End Function

    Function _EditorFix: Void() End

    Method OnCreate: Int()
        TextLog.Message("NecroDancer version " + Util.GetVersionString() + " loading...")

        TextLog.Message("OnCreate: Initializing Steam")

        Util.SetAppFolder()
        os.CreateDir(textlog.GetAppFolder() + "downloaded_dungeons")
        os.CreateDir(textlog.GetAppFolder() + "mods")
        os.CreateDir(textlog.GetAppFolder() + "downloaded_mods")
        steam.SteamInit()

        TextLog.Message("OnCreate: Updating screen size")
        NecroDancerGame.UpdateScreenSize(False)

        TextLog.Message("OnCreate: Starting FMOD")
        fmod.StartFMOD()

        TextLog.Message("OnCreate: Setting update rate")
        app.SetUpdateRate(necrodancergame.FRAMES_PER_SEC)

        TextLog.Message("GLOBAL_SCALE_FACTOR: " + necrodancergame.GLOBAL_SCALE_FACTOR)

        TextLog.Message("Loading ControllerMainMenu...")
        New ControllerMainMenu()
        TextLog.Message("ControllerMainMenu LOADED")

        ' For testing only
        GameData.SetTutorialComplete()
        GameData.SetEnableBossIntros(False)

        Return 0
    End Method

    Method OnRender: Int()
        NecroDancerGame.UpdateScreenSize(False)

        If Camera.freezeFrameDelay > 0
            Camera.freezeFrameDelay -= 1
        End If

        If Camera.freezeFrameDelay >= 0 Or
           Camera.freezeFrameNum <= 0
            'graphics.Cls()
            Camera.Update()

            If Controller.currentController <> Null
                Controller.currentController.Render()
            End If

            Camera.CaptureFreezeFrame()
        Else
            If Camera.freezeImage <> Null
                'graphics.DrawImage(Camera.freezeImage, 0.0, 0.0)
            End If

            Camera.freezeFrameNum -= 1
        End If

        ' Important: Many functions rely on this.
        necrodancergame.globalFrameCounter += 1

        If app.Millisecs() - necrodancergame.lastFrameTime >= 1000
            necrodancergame.lastFrameTime = app.Millisecs()
            necrodancergame.lastFPS = necrodancergame.globalFrameCounter - necrodancergame.lastFrameCount
            necrodancergame.lastFrameCount = necrodancergame.globalFrameCounter
            necrodancergame.lastGCS = -necrodancergame.lastGCAllocCount
            necrodancergame.lastGCAllocCount = 0
        End If

        ' SKIPPED: Uncap frame rate.

        Return 0
    End Method

    Method OnResume: Int()
        Debug.TraceNotImplemented("NecroDancerGame.OnResume()")
    End Method

    Method OnSuspend: Int()
        Debug.TraceNotImplemented("NecroDancerGame.OnSuspend()")
    End Method

    Field ranUpdate: Bool

    Method OnUpdate: Int()
        If app.Millisecs() - necrodancergame.lastFrameTimeUpdate >= 1000
            necrodancergame.lastFrameTimeUpdate = app.Millisecs()
            necrodancergame.lastFPSUpdate = necrodancergame.globalFrameCounter - necrodancergame.lastFrameCountUpdate
            necrodancergame.lastFrameCountUpdate = necrodancergame.globalFrameCounter
        End If

        Input.Update()

        If Controller.currentController <> Null
            Controller.currentController.Update()
        End If

        fmod.UpdateFMOD()
        steam.SteamPump()
        Util.Pump()

        ' For testing only.
        If ControllerGame(Controller.currentController) <> Null
            If Not Self.ranUpdate
                Select controller_game.currentLevel
                    Case LevelType.Lobby
                        Level.randSeedString = "1"
                        Level.NewLevel(LevelType.SeededAllZonesMode, controller_game.currentZone)
                    Default
                        Level.NewLevel(LevelType.NextLevel, controller_game.currentZone)
                End Select
            Else
                If controller_game.currentDepth = 3 And
                   controller_game.currentLevel = LevelType.Level1
                    app.EndApp()
                End If
            End If

            Self.ranUpdate = Not Self.ranUpdate
        End If

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
