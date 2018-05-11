Strict

Import monkey.math
Import point
Import rect
Import util

Class PortalSeg

    Function _EditorFix: Void() End

    Method New(x: Int, y: Int, faceDir_: Int, normalDir_: Int)
        Self.origin = New Point(x, y)
        Self.faceDir = faceDir_
        Self.normalDir = normalDir_
    End Method

    Field origin: Point
    Field faceDir: Int = -1
    Field normalDir: Int = -1
    Field length: Int

    Method GetBounds: Rect()
        Local vector := Self.GetFaceVector().Scale(Self.length)
        Local positionedVector := Self.origin.Add(vector)

        Local x := math.Min(Self.origin.x, positionedVector.x)
        Local y := math.Min(Self.origin.y, positionedVector.y)
        Local w := math.Max(Self.origin.x, positionedVector.x)
        Local h := math.Max(Self.origin.y, positionedVector.y)

        Return Rect.MakeBounds(x, y, w, h)
    End Method

    Method GetFaceVector: Point()
        Return Util.GetPointFromDir(Self.faceDir)
    End Method

    Method GetLength: Int()
        Return Self.length
    End Method

    Method GetNormal: Point()
        Return Util.GetPointFromDir(Self.normalDir)
    End Method

    Method GetOrigin: Point()
        Return Self.origin
    End Method

    Method GetTerminus: Point()
        Local scaledFaceVector := Self.GetFaceVector().Scale(Self.length)

        Return Self.GetOrigin().Add(scaledFaceVector)
    End Method

    Method Intersect: PortalSeg(other: PortalSeg)
        Local intersection := New PortalSeg(Self.origin.x, Self.origin.y, Self.faceDir, Self.normalDir)
        intersection.length = Self.length

        If intersection.length < 0 Then Return Null

        Local otherBounds := other.GetBounds()

        While Not otherBounds.Contains(intersection.GetOrigin())
            Local faceVector := intersection.GetFaceVector()
            intersection.origin = intersection.GetOrigin().Add(faceVector)
            intersection.length -= 1

            If intersection.length < 0 Then Return Null
        End While

        If intersection.length < 0 Then Return Null

        While Not otherBounds.Contains(intersection.GetTerminus())
            Assert(intersection.length >= 1)

            intersection.length -= 1
        End While

        Assert(intersection.length >= 0)

        Return intersection
    End Method

End Class
