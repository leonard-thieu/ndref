'Strict

Import monkey.list
Import controller
Import gui.textlabel
Import logger
Import sprite

Class ControllerBeat Extends Controller

    Function _EditorFix: Void() End

    Method New(fName: Int, songIndex: Int, playlistIndex: Int)
        Debug.TraceNotImplemented("ControllerBeat.New(Int, Int, Int)")
    End Method

    Field retval: Int
    Field beatTarget: Sprite
    Field beats: List<Int>
    Field filename: String
    Field songName: String
    Field state: Int
    Field beatFrames: Int
    Field title: TextLabel
    Field instructions: TextLabel
    Field instructions2: TextLabel
    Field instructions3: TextLabel

    Method Destructor: Void()
        Debug.TraceNotImplemented("ControllerBeat.Destructor()")
    End Method

    Method DirWasHit: Bool()
        Debug.TraceNotImplemented("ControllerBeat.DirWasHit()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ControllerBeat.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ControllerBeat.Update()")
    End Method

    Method WriteBeatFile: Void()
        Debug.TraceNotImplemented("ControllerBeat.WriteBeatFile()")
    End Method

End Class
