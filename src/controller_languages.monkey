'Strict

Import monkey.list
Import checkbox
Import controller
Import guiborder
Import logger
Import optionlist
Import sprite
Import textlabel
Import textsprite

Class ControllerLanguages Extends Controller

    Function _EditorFix: Void() End

    Method New(game: Object)
        Debug.TraceNotImplemented("ControllerLanguages.New(Object)")
    End Method

    Field cGame: Controller
    Field overlayBlack: Sprite
    Field optionsText: TextSprite
    Field gui: OptionList
    Field languageText: TextLabel
    Field subtitlesBox: Checkbox
    Field exitText: TextLabel
    Field origLanguage: String
    Field curLanguage: String
    Field curLanguageIndex: Int
    Field languageList: List<Object>
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerLanguages.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerLanguages.GUICallback(Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerLanguages.Render()")
    End Method

    Method UpdateLanguageText: Void()
        Debug.TraceNotImplemented("ControllerLanguages.UpdateLanguageText()")
    End Method

End Class
