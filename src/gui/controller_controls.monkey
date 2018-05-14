'Strict

Import gui.checkbox
Import gui.controller
Import gui.guiborder
Import gui.optionlist
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerControls Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerControls.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field reassignText: TextSprite
    Field gui: OptionList
    Field playerText: TextLabel
    Field keyLabels: TextLabel[]
    Field defaultsText: TextLabel
    Field defaultsBox: Checkbox
    Field playerNum: Int
    Field multiBox: Checkbox
    Field exitText: TextLabel
    Field keyIndex: Int
    Field border: GuiBorder

    Method AllCombosBound: Bool()
        Debug.TraceNotImplemented("ControllerControls.AllCombosBound()")
    End Method

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerControls.Destructor()")
    End Method

    Method GetControlName: Int(index: Int)
        Debug.TraceNotImplemented("ControllerControls.GetControlName(Int)")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerControls.GUICallback(Int, Bool)")
    End Method

    Method KeyFromProfile: Int(key: Int)
        Debug.TraceNotImplemented("ControllerControls.KeyFromProfile(Int)")
    End Method

    Method RefreshControlText: Void()
        Debug.TraceNotImplemented("ControllerControls.RefreshControlText()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerControls.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerControls.Update()")
    End Method

End Class
