'Strict

Import controller
Import guiborder
Import logger
Import optionlist
Import sprite
Import textlabel
Import textsprite

Class ControllerSoundtrack Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerSoundtrack.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field optionsText: TextSprite
    Field gui: OptionList
    Field charBodies: Sprite[]
    Field charHeads: Sprite[]
    Field charLabels: TextLabel[]
    Field exitText: TextLabel
    Field border: GuiBorder

    Method ArtistToText: Int(id: Int)
        Debug.TraceNotImplemented("ControllerSoundtrack.ArtistToText(Int)")
    End Method

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerSoundtrack.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerSoundtrack.GUICallback(Int, Bool)")
    End Method

    Method ReloadLabel: Void(characterID: Int)
        Debug.TraceNotImplemented("ControllerSoundtrack.ReloadLabel(Int)")
    End Method

    Method ReloadSprites2: Void(characterID: Int)
        Debug.TraceNotImplemented("ControllerSoundtrack.ReloadSprites2(Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerSoundtrack.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerSoundtrack.Update()")
    End Method

End Class
