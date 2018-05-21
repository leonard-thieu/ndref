Strict

Import gui.controller_game
Import level
Import gamedata
Import player_class

Const DEBUG_BUILD := True

Const DUMPMAP_ITERATIVE := False
Const TRACE_NOT_IMPLEMENTED := True
Const DUMP_ITEM_POOLS := False

Function Main: Int()
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

    Return 0
End Function
