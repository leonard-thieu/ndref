Strict

Import intpointstack
Import point
Import portal_seg
Import rect
Import stack_ex

Class RoomBase Abstract

    Function _EditorFix: Void() End

    Method GetBounds: Rect() Abstract

    Method GetFloor: IntPointStack()
        Local floors := New IntPointStack()

        Local bounds := Self.GetBounds()
        For Local x := bounds.x To bounds.GetRight()
            For Local y := bounds.y To bounds.GetBottom()
                If Self.IsFloor(x, y)
                    floors.Push(New Point(x, y))
                End If
            End For
        End For

        Return floors
    End Method

    Method GetPortalSegs: StackEx<PortalSeg>()
        Local portalSegs := New StackEx<PortalSeg>()
        Local bounds := Self.GetBounds()
        Local portalSeg: PortalSeg

        For Local y := bounds.y - 1 To bounds.GetBottom() + 1
            For Local x := bounds.x - 1 To bounds.GetRight() + 1
                If Self.IsWall(x, y) And
                   Self.IsOutside(x, y - 1) And
                   Self.IsFloor(x, y + 1)
                    If portalSeg <> Null
                        portalSeg.length += 1
                    Else
                        portalSeg = New PortalSeg(x, y, 0, 3)
                    End If
                Else If portalSeg <> Null
                    portalSegs.Push(portalSeg)
                    portalSeg = Null
                End If
            End For
        End For

        For Local x := bounds.x - 1 To bounds.GetRight() + 1
            For Local y := bounds.y - 1 To bounds.GetBottom() + 1
                If Self.IsWall(x, y) And
                   Self.IsOutside(x + 1, y) And
                   Self.IsFloor(x - 1, y)
                    If portalSeg <> Null
                        portalSeg.length += 1
                    Else
                        portalSeg = New PortalSeg(x, y, 1, 0)
                    End If
                Else If portalSeg <> Null
                    portalSegs.Push(portalSeg)
                    portalSeg = Null
                End If
            End For
        End For

        For Local y := bounds.y - 1 To bounds.GetBottom() + 1
            For Local x := bounds.x - 1 To bounds.GetRight() + 1
                If Self.IsWall(x, y) And
                   Self.IsOutside(x, y + 1) And
                   Self.IsFloor(x, y - 1)
                    If portalSeg <> Null
                        portalSeg.length += 1
                    Else
                        portalSeg = New PortalSeg(x, y, 0, 1)
                    End If
                Else If portalSeg <> Null
                    portalSegs.Push(portalSeg)
                    portalSeg = Null
                End If
            End For
        End For

        For Local x := bounds.x - 1 To bounds.GetRight() + 1
            For Local y := bounds.y - 1 To bounds.GetBottom() + 1
                If Self.IsWall(x, y) And
                   Self.IsOutside(x - 1, y) And
                   Self.IsFloor(x + 1, y)
                    If portalSeg <> Null
                        portalSeg.length += 1
                    Else
                        portalSeg = New PortalSeg(x, y, 1, 2)
                    End If
                Else If portalSeg <> Null
                    portalSegs.Push(portalSeg)
                    portalSeg = Null
                End If
            End For
        End For

        Return portalSegs
    End Method

    Method GetRandPoint: Point()
        Return Self.GetFloor().ChooseRandom(True)
    End Method

    Method IsWall: Bool(x: Int, y: Int) Abstract

    Method IsOutside: Bool(x: Int, y: Int) Abstract

    Method IsFloor: Bool(x: Int, y: Int) Abstract

End Class
