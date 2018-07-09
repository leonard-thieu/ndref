'Strict

Import gui.controller
Import gui.guiborder
Import gui.optionlist
Import gui.textlabel
Import logger
Import sprite
Import textsprite

Class ControllerChangeLog Extends Controller

    Function _EditorFix: Void() End

    Method New()
        Debug.TraceNotImplemented("ControllerChangeLog.New()")
    End Method

    Field numPages: Int
    Field pageNum: Int
    Field overlayBlack: Sprite
    Field headerText: TextSprite
    Field footerText: TextSprite
    Field line1Text: TextSprite
    Field line2Text: TextSprite
    Field line3Text: TextSprite
    Field line4Text: TextSprite
    Field line5Text: TextSprite
    Field line6Text: TextSprite
    Field line7Text: TextSprite
    Field line8Text: TextSprite
    Field line9Text: TextSprite
    Field line10Text: TextSprite
    Field line11Text: TextSprite
    Field gui: OptionList
    Field previousPageText: TextLabel
    Field nextPageText: TextLabel
    Field doneText: TextLabel
    Field border: GuiBorder

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerChangeLog.Destructor()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerChangeLog.GUICallback(Int, Bool)")
    End Method
    
    Method RegainFocus: Void()
        Debug.TraceNotImplemented("ControllerChangeLog.RegainFocus()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerChangeLog.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerChangeLog.Update()")
    End Method

End Class
