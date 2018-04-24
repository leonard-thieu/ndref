Strict

Import controller_game
Import gamedata
Import level
Import player_class

Const DEBUG_BUILD := False

Const DUMPMAP_ITERATIVE := True

Function Main: Int()
    GameData.LoadGameDataXML(True)

    controller_game.players[0] = New Player(0, Character.Cadence)
    controller_game.numPlayers = 1

    Level.NewLevel(1, 1, 0, False, Null, False)

    Return 0
End Function
