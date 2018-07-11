'Strict

Import monkey.stack
Import controller
Import controller.controller_popup
Import gui.checkbox
Import gui.guiborder
Import gui.optionlist
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerMods Extends Controller

    Function GetModName: Int(modPath: Int)
        Debug.TraceNotImplemented("ControllerMods.GetModName(Int)")
    End Function

    Function _EditorFix: Void() End

    Method New(game: Object, publish: Bool)
        Debug.TraceNotImplemented("ControllerMods.New(Object, Bool)")
    End Method

    Field cGame: Controller
    Field isForPublishing: Bool
    Field overlayBlack: Sprite
    Field modText: TextSprite
    Field infoText: TextSprite
    Field publishingText: TextSprite
    Field modList: Stack<Object>
    Field gui: OptionList
    Field modStartIndex: Int
    Field modLabels: TextLabel[]
    Field modEndIndex: Int
    Field prevPageIndex: Int
    Field prevPageText: TextLabel
    Field nextPageIndex: Int
    Field nextPageText: TextLabel
    Field defaultBox: Checkbox
    Field exitIndex: Int
    Field exitText: TextLabel
    Field modListOffset: Int
    Field popUpController: ControllerPopUp
    Field wasPublishing: Bool
    Field publishedFrames: Int
    Field border: GuiBorder

    Method ActivateMod: Void(modName: Int)
        Debug.TraceNotImplemented("ControllerMods.ActivateMod(Int)")
    End Method

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerMods.Destructor()")
    End Method

    Method getModPath: Int(guiIndex: Int)
        Debug.TraceNotImplemented("ControllerMods.getModPath(Int)")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerMods.GUICallback(Int, Bool)")
    End Method

    Method Refresh: Void()
        Debug.TraceNotImplemented("ControllerMods.Refresh()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerMods.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerMods.Update()")
    End Method

    Method Zip: Void(modName: Int, folder: Int)
        Debug.TraceNotImplemented("ControllerMods.Zip(Int, Int)")
    End Method

End Class
