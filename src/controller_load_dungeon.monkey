'Strict

Import monkey.list
Import checkbox
Import controller
Import logger
Import optionlist
Import sprite
Import textlabel
Import textsprite

Class ControllerLoadDungeon Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerLoadDungeon.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field dungeonText: TextSprite
    Field dungeonList: List<Object>
    Field workshopDungeonList: List<Object>
    Field gui: OptionList
    Field pgUpText: TextLabel
    Field dungeonLabels: TextLabel[]
    Field pgDownText: TextLabel
    Field workshopBox: Checkbox
    Field exitText: TextLabel
    Field workshopToggle: Bool
    Field dungeonIndex: Int
    Field dungeonFilenames: String[]
    Field chosenDungeon: String

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerLoadDungeon.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerLoadDungeon.GUICallback(Int, Bool)")
    End Method

    Method Refresh: Void()
        Debug.TraceNotImplemented("ControllerLoadDungeon.Refresh()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerLoadDungeon.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerLoadDungeon.Update()")
    End Method

End Class
