'Strict

Import controller
Import controller_game
Import logger
Import optionlist
Import sprite
Import textlabel
Import textsprite

Class ControllerPostGame Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object, hardcore: Bool, daily: Bool, allChars: Bool, deathless: Bool, died: Bool, coinVal: Int, timeVal: Int)
        Debug.TraceNotImplemented("ControllerPostGame.New(Object, Bool, Bool, Bool, Bool, Bool, Int, Int)")
    End Method

    Field cGame: ControllerGame
    Field playerDied: Bool
    Field isDaily: Bool
    Field isHardcore: Bool
    Field isDeathless: Bool
    Field overlayBlack: Sprite
    Field headerText: TextSprite
    Field resultImage: TextSprite
    Field scoreImage: TextSprite
    Field speedImage: TextSprite
    Field deathlessImage: TextSprite
    Field gui: OptionList
    Field lobbyText: TextLabel
    Field replayText: TextLabel
    Field quickRestartText: TextLabel
    Field highscoreText: TextLabel
    Field speedrunText: TextLabel
    Field diamondText: TextSprite
    Field coinText: TextSprite
    Field seedText: TextSprite
    Field lowPercentText: TextSprite

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerPostGame.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerPostGame.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerPostGame.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerPostGame.Update()")
    End Method

End Class
