'Strict

Import monkey.list
Import monkey.map
Import monkey.stack
Import gui.controller
Import gui.controller_input_popup
Import gui.controller_load_dungeon
Import gui.controller_popup
Import gui.optionlist
Import gui.textlabel
Import entity
Import logger
Import sprite
Import textsprite

Class ControllerLevelEditor Extends Controller

    Global playingLevel: Int = -1
    Global storedEditor: Object

    Function _EditorFix: Void() End

    Field numLevels: Int
    Field levels: IntMap<Object>
    Field charNum: Int
    Field floorNames: StringStack
    Field floorTypes: IntStack
    Field wallNames: StringStack
    Field wallTypes: IntStack
    Field enemyNames: StringStack
    Field weaponNames: StringStack
    Field armorNames: StringStack
    Field footwearNames: StringStack
    Field headgearNames: StringStack
    Field ringNames: StringStack
    Field scrollNames: StringStack
    Field otherItemNames: StringStack
    Field trapNames: StringStack
    Field trapTypes: IntStack
    Field shrineNames: StringStack
    Field overlayBlack: Sprite
    Field cursorImg: Sprite
    Field pickupCursorImg: Sprite
    Field gui: OptionList
    Field nameText: TextLabel
    Field charText: TextLabel
    Field levelText: TextLabel
    Field addLevelText: TextLabel
    Field deleteLevelText: TextLabel
    Field musicText: TextLabel
    Field randomText: TextLabel
    Field generateText: TextLabel
    Field viewText: TextLabel
    Field optionTextStart: Int
    Field optionText: TextLabel[]
    Field testText: TextLabel
    Field playText: TextLabel
    Field loadText: TextLabel
    Field publishText: TextLabel
    Field saveText: TextLabel
    Field saveAndExitText: TextLabel
    Field exitText: TextLabel
    Field submenus: List<Object>
    Field bossNum: Int
    Field tileset: Int
    Field optionIncrement: Int
    Field optionListBase: Int
    Field optionIndex: Int
    Field placementMode: Bool
    Field cursorX: Int
    Field cursorY: Int
    Field placementType: Int
    Field placementSubtype: Int
    Field placementSubtype2: String
    Field pickedUpEntity: Entity
    Field popUpController: ControllerPopUp
    Field popupIndex: Int
    Field editorLevel: Int
    Field musicType: Int
    Field randomType: Int
    Field loadController: ControllerLoadDungeon
    Field doPublish: Bool
    Field dungeonName: String
    Field savedFrames: Int
    Field lastSavedDungeonXML: String
    Field doExit: Bool
    Field nameController: ControllerInputPopup
    Field wasPublishing: Bool
    Field publishedFrames: Int
    Field levelImage: TextSprite
    Field helperImage: TextSprite
    Field helperImage2: TextSprite
    Field helperImage3: TextSprite
    Field msgImage: TextSprite
    Field levelImage2: TextSprite

    Method ActuallyDoSave: Void()
        Debug.TraceNotImplemented("ControllerLevelEditor.ActuallyDoSave()")
    End Method

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerLevelEditor.Destructor()")
    End Method

    Method DoDelete: Void(cursorX: Int, cursorY: Int)
        Debug.TraceNotImplemented("ControllerLevelEditor.DoDelete(Int, Int)")
    End Method

    Method DoLoad: Void(filename: Int, fromWorkshop: Bool)
        Debug.TraceNotImplemented("ControllerLevelEditor.DoLoad(Int, Bool)")
    End Method

    Method DoSave: Void()
        Debug.TraceNotImplemented("ControllerLevelEditor.DoSave()")
    End Method

    Method ExecuteOption: Void(option: Int)
        Debug.TraceNotImplemented("ControllerLevelEditor.ExecuteOption(Int)")
    End Method

    Method GetTilesetText: Int()
        Debug.TraceNotImplemented("ControllerLevelEditor.GetTilesetText()")
    End Method

    Method GUICallback: Void(index: Int, left: Bool)
        Debug.TraceNotImplemented("ControllerLevelEditor.GUICallback(Int, Bool)")
    End Method

    Method RegainFocus: Void()
        Debug.TraceNotImplemented("ControllerLevelEditor.RegainFocus()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerLevelEditor.Render()")
    End Method

    Method RenderPlacementGhost: Void()
        Debug.TraceNotImplemented("ControllerLevelEditor.RenderPlacementGhost()")
    End Method

    Method ResetPlayers: Void(characterID: Int)
        Debug.TraceNotImplemented("ControllerLevelEditor.ResetPlayers(Int)")
    End Method

    Method SetCharText: Void()
        Debug.TraceNotImplemented("ControllerLevelEditor.SetCharText()")
    End Method

    Method SetMusicText: Void()
        Debug.TraceNotImplemented("ControllerLevelEditor.SetMusicText()")
    End Method

    Method SetRandomText: Void()
        Debug.TraceNotImplemented("ControllerLevelEditor.SetRandomText()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerLevelEditor.Update()")
    End Method

    Method UpdateMultiPageList: Void(names: Object, prevOption: Int, nextOption: Int)
        Debug.TraceNotImplemented("ControllerLevelEditor.UpdateMultiPageList(Object, Int, Int)")
    End Method

    Method UpdateOptions: Void(setIndex: Bool)
        Debug.TraceNotImplemented("ControllerLevelEditor.UpdateOptions(Bool)")
    End Method

End Class
