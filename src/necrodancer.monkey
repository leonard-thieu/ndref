Strict

Import controller_game
Import gamedata
Import level
Import player_class

Const DEBUG_BUILD := True

Const DUMPMAP_ITERATIVE := True
Const TRACE_NOT_IMPLEMENTED := True
Const DUMP_ITEM_POOLS := False

Function Main: Int()
    GameData.LoadGameDataXML(True)

    controller_game.players[0] = New Player(controller_game.player1, Character.Cadence)
    controller_game.numPlayers = 1

    controller_game.currentLevel = LevelType.Lobby

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

    Return 0
End Function

Function Assert: Void(assertion: Bool)
    If Not assertion
        Debug.WriteLine("Assertion failed!")
        Error("Assertion failed!")
    End If
End Function
