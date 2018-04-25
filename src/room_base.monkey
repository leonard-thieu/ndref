'Strict

Import intpointstack
Import logger
Import point

Class RoomBase Abstract

    Function _EditorFix: Void() End

    Method GetFloor: IntPointStack()
        Debug.TraceNotImplemented("RoomBase.GetFloor()")
    End Method

    Method GetPortalSegs: Object()
        Debug.TraceNotImplemented("RoomBase.GetPortalSegs()")
    End Method

    Method GetRandPoint: Point()
        Debug.TraceNotImplemented("RoomBase.GetRandPoint()")
    End Method

End Class
