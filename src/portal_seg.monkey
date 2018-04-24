'Strict

Import logger
Import point

Class PortalSeg

    Function _EditorFix: Void() End

    Method New(x: Int, y: Int, faceDir_: Int, normalDir_: Int)
        Debug.TraceNotImplemented("PortalSeg.New(Int, Int, Int, Int)")
    End Method

    Field origin: Point
    Field faceDir: Int
    Field normalDir: Int
    Field length: Int

    Method GetBounds: Object()
        Debug.TraceNotImplemented("PortalSeg.GetBounds()")
    End Method

    Method GetFaceVector: Object()
        Debug.TraceNotImplemented("PortalSeg.GetFaceVector()")
    End Method

    Method GetNormal: Object()
        Debug.TraceNotImplemented("PortalSeg.GetNormal()")
    End Method

    Method GetTerminus: Object()
        Debug.TraceNotImplemented("PortalSeg.GetTerminus()")
    End Method

    Method Intersect: Object(other: Object)
        Debug.TraceNotImplemented("PortalSeg.Intersect(Object)")
    End Method

End Class
