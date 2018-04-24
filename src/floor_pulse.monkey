'Strict

Import entity
Import logger
Import sprite

Class FloorPulse Extends Entity

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int)
        Debug.TraceNotImplemented("FloorPulse.New(Int, Int)")
    End Method

    Field pulseDownWarning: Sprite
    Field pulseWarning: Sprite
    Field pulseHideFrame: Int
    Field frameCounter: Int
    Field pulse: Sprite
    Field pulseDown: Sprite
    Field pulseMoveWarning: Sprite

    Method Hide: Void()
        Debug.TraceNotImplemented("FloorPulse.Hide()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("FloorPulse.Render()")
    End Method

    Method ShowMoveWarning: Void()
        Debug.TraceNotImplemented("FloorPulse.ShowMoveWarning()")
    End Method

    Method ShowPulse: Void(down: Bool)
        Debug.TraceNotImplemented("FloorPulse.ShowPulse(Bool)")
    End Method

    Method ShowWarning: Void(large: Bool, down: Bool)
        Debug.TraceNotImplemented("FloorPulse.ShowWarning(Bool, Bool)")
    End Method

End Class
