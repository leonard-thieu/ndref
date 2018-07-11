'Strict

Import controller
Import controller.controller_game
Import controller.controller_leaderboard
Import gui.checkbox
Import gui.guiborder
Import gui.optionlist
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class LeaderboardRow

    Function _EditorFix: Void() End

    Field rankText: TextSprite
    Field nameText: TextSprite
    Field scoreText: TextSprite
    Field zoneText: TextSprite
    Field levelText: TextSprite
    Field killedByText: TextSprite
    Field replayText: TextLabel
    Field addedToGUI: Bool
    Field replayVersion: Int

    Method Discard: Void()
        Debug.TraceNotImplemented("LeaderboardRow.Discard()")
    End Method

End Class

Class ControllerLeaderboard Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object, speed: Bool, hard: Bool, seeded: Bool)
        Debug.TraceNotImplemented("ControllerLeaderboard.New(Object, Bool, Bool, Bool)")
    End Method

    Field cGame: ControllerGame
    Field isSpeedrun: Bool
    Field isHardcore: Bool
    Field isSeeded: Bool
    Field isDaily: Bool
    Field overlayBlack: Sprite
    Field titleText: TextSprite
    Field loadingText: TextSprite
    Field leaderboardData: LeaderboardRow[]
    Field leaderboardHeader: LeaderboardRow
    Field leaderboardFooter: LeaderboardRow
    Field gui: OptionList
    Field friendsOnlyBox: Checkbox
    Field previousPageText: TextLabel
    Field nextPageText: TextLabel
    Field previousDayText: TextLabel
    Field nextDayText: TextLabel
    Field doneText: TextLabel
    Field leaderboardBaseStr: String
    Field dayOffset: Int
    Field gettingPlayersScore: Bool
    Field border: GuiBorder
    Field subtitleText: TextSprite
    Field rankOffset: Int

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerLeaderboard.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerLeaderboard.GUICallback(Int, Bool)")
    End Method

    Method RefreshScores: Void()
        Debug.TraceNotImplemented("ControllerLeaderboard.RefreshScores()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerLeaderboard.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerLeaderboard.Update()")
    End Method

End Class
