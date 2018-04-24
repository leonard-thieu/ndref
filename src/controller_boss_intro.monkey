'Strict

Import controller
Import controller_game
Import logger
Import sprite
Import textsprite

Class ControllerBossIntro Extends Controller

    Global showingBossIntro: Bool

    Function _EditorFix: Void() End

    Method New(game: Object, bossNum: Int)
        Debug.TraceNotImplemented("ControllerBossIntro.New(Object, Int)")
    End Method

    Field cGame: ControllerGame
    Field overlayBlack: Sprite
    Field bossNameStr: String
    Field bossImg: Sprite
    Field bgGradient: Sprite
    Field bgBottom: Sprite
    Field bgTop: Sprite
    Field bossName: TextSprite
    Field numFrames: Int
    Field isEnding: Bool
    Field numEndFrames: Int

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerBossIntro.Destructor()")
    End Method

    Method RegainFocus: Void()
        Debug.TraceNotImplemented("ControllerBossIntro.RegainFocus()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerBossIntro.Render()")
    End Method

    Method Suspend: Void()
        Debug.TraceNotImplemented("ControllerBossIntro.Suspend()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerBossIntro.Update()")
    End Method

End Class
