Strict

Import controller_game
Import gamedata
Import level
Import player_class

Const DEBUG_BUILD := True

Const DUMPMAP_ITERATIVE := False
Const TRACE_NOT_IMPLEMENTED := True
Const DUMP_ITEM_POOLS := False

Function Main: Int()
    GameData.LoadGameDataXML(True)

    controller_game.players[0] = New Player(controller_game.player1, Character.Cadence)
    controller_game.numPlayers = 1

    controller_game.currentLevel = LevelType.Lobby

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

    Return 0
End Function

Function Assert: Void(assertion: Bool)
    If Not assertion
        Error("Assertion failed!")
    End If
End Function
