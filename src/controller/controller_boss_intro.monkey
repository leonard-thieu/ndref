'Strict

Import controller
Import controller.controller_game
Import level
Import logger
Import sprite
Import textsprite

Class ControllerBossIntro Extends Controller

    Global showingBossIntro: Bool

    Function _EditorFix: Void() End

    Method New(game: ControllerGame, bossNum: Int)
        Super.New()

        Self.cGame = game
        ControllerBossIntro.showingBossIntro = True

        Self.overlayBlack = New Sprite("gui/TEMP_overlay_black.png", 1)
        Self.overlayBlack.SetZ(20001.0)
        Self.overlayBlack.InWorld = False

        Select bossNum
            Case BossBattleType.CongaLine
                Self.bossNameStr = "|1301|KING CONGA|"
                Audio.PlayGameSound("announceKingConga", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_kingconga.png", 1)
            Case BossBattleType.DeathMetal
                Self.bossNameStr = "|1302|DEATH METAL|"
                Audio.PlayGameSound("announceDeathMetal", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_deathmetal.png", 1)
            Case BossBattleType.DeepBlues
                Self.bossNameStr = "|1303|DEEP BLUES|"
                Audio.PlayGameSound("announceDeepBlues", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_deepblues.png", 1)
            Case BossBattleType.CoralRiff
                Self.bossNameStr = "|1304|CORAL RIFF|"
                Audio.PlayGameSound("announceCoralRiff", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_coralriff.png", 1)
            Case BossBattleType.DeadRinger
                Self.bossNameStr = "|1305|DEAD RINGER|"
                Audio.PlayGameSound("announceDeadRinger", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_deadringer.png", 1)
            Case BossBattleType.NecroDancer2
                Self.bossNameStr = "|1300|THE NECRODANCER|"
                Audio.PlayGameSound("announceNecroDancer2", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_necrodancer2.png", 1)
            Case BossBattleType.LuteDragon
                Self.bossNameStr = "|1306|THE GOLDEN LUTE|"
                Audio.PlayGameSound("announceGoldenLute", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_lutedragon.png", 1)
            Case BossBattleType.Fortissimole
                Self.bossNameStr = "|15200|FORTISSIMOLE|"
                Audio.PlayGameSound("announceFortissimole", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_fortissimole.png", 1)
            Case BossBattleType.Frankensteinway
                Self.bossNameStr = "|15201|FRANKENSTEINWAY|"
                Audio.PlayGameSound("announceFrankensteinway", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_frankensteinway.png", 1)
            Case BossBattleType.Conductor
                Self.bossNameStr = "|15202|THE CONDUCTOR|"
                Audio.PlayGameSound("announceConductor", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_conductor.png", 1)
            Default
                Self.bossNameStr = "|1300|THE NECRODANCER|"
                Audio.PlayGameSound("announceNecroDancer", -1, 1.0)
                Self.bossImg = New Sprite("gui/bosscreen_necrodancer.png", 1)
        End Select

        Self.bossImg.SetZ(20003.0)
        Self.bossImg.InWorld = False

        Self.bgGradient = New Sprite("gui/bg_gradient.png", 1)
        Self.bgGradient.SetZ(20002.0)
        Self.bgGradient.InWorld = False
        
        Self.bgBottom = New Sprite("gui/bg_bottomblade.png", 1)
        Self.bgBottom.SetZ(20002.0)
        Self.bgBottom.InWorld = False

        Self.bgTop = New Sprite("gui/bg_topblade.png", 1)
        Self.bgTop.SetZ(20002.0)
        Self.bgTop.InWorld = False

        Self.bossName = New TextSprite(2, 3.0, $FFFFFFFF, 10000, True, $FF000000, 1, 1)
        Self.bossName.zVal = 20003
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
