'Strict

Import mojo.graphics
Import entity
Import logger
Import trap
Import util

Class BounceTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, d: Int)
        Super.New(xVal, yVal, TrapType.BounceTrap)
        
        Self.xOff = 12.0
        Self.yOff = 18.0

        If d = BounceTrapDirection.None
            Const limit := 500

            For Local i := limit - 1 Until 0 Step -1
                Select Util.RndIntRangeFromZero(3, True)
                    Case BounceTrapDirection.Right
                        If Not Level.IsWallAt(xVal + 1, yVal, False, False) Then Exit
                    Case BounceTrapDirection.Left
                        If Not Level.IsWallAt(xVal - 1, yVal, False, False) Then Exit
                    Case BounceTrapDirection.Down
                        If Not Level.IsWallAt(xVal, yVal + 1, False, False) Then Exit
                    Case BounceTrapDirection.Up
                        If Not Level.IsWallAt(xVal, yVal - 1, False, False) Then Exit
                End Select
            End For
        End If

        If d = BounceTrapDirection.Spin
            Self.bounceDir = Util.RndIntRangeFromZero(3, True)

            If Util.RndBool(True)
                Self.isRotatingCW = True
            Else
                Self.isRotatingCCW = True
            End If
        Else
            Self.bounceDir = d
        End If

        Select Self.bounceDir
            Case BounceTrapDirection.Omni
                Self.image = New Sprite("traps/bouncetrap_omni.png", 14, 16, 12, Image.MidHandle)
            Case BounceTrapDirection.UpRight,
                 BounceTrapDirection.UpLeft,
                 BounceTrapDirection.DownLeft,
                 BounceTrapDirection.DownRight
                Self.image = New Sprite("traps/diagonal_bouncetrap.png", 14, 16, 16, Image.MidHandle)
            ' Covers spin and cardinal direction bounce traps.
            Default
                Self.image = New Sprite("traps/bouncetrap.png", 14, 16, 12, Image.MidHandle)
        End Select

        Self.image.SetZ(-995.0)

        Self.originalDir = Self.bounceDir
    End Method

    Field isRotatingCW: Bool
    Field isRotatingCCW: Bool
    Field bounceDir: Int
    Field originalDir: Int
    Field retractCounter: Int
    Field rotatedBeat: Int = -1

    Method GetFrameToShow: Int()
        Debug.TraceNotImplemented("BounceTrap.GetFrameToShow()")
    End Method

    Method Rotate: Void()
        Debug.TraceNotImplemented("BounceTrap.Rotate()")
    End Method

    Method RotateDir: Int(dir: Int, cw: Bool)
        Debug.TraceNotImplemented("BounceTrap.RotateDir(Int, Bool)")
    End Method

    Method Trigger: Void(ent: Entity)
        Debug.TraceNotImplemented("BounceTrap.Trigger(Entity)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("BounceTrap.Update()")
    End Method

End Class

Class BounceTrapDirection

    Const None: Int = -1
    Const Right: Int = 0
    Const Left: Int = 1
    Const Down: Int = 2
    Const Up: Int = 3
    Const DownRight: Int = 4
    Const DownLeft: Int = 5
    Const UpLeft: Int = 6
    Const UpRight: Int = 7
    Const Omni: Int = 8
    Const Spin: Int = 9

End Class
