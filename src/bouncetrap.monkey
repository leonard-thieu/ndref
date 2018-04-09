Strict

Import trap
Import util

Class BounceTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, d: Int)
        Super.New()

        Local dir := d
        Local dir2: Int

        Self.trapType = TrapType.BounceTrap
        Self.x = xVal
        Self.xOff = 12.0
        Self.y = yVal
        Self.yOff = 18.0

        If d = -1
            Local i := 499
            While True
                dir2 = Util.RndIntRange(0, 3, True, -1)
                Self.bounceDir = dir2

                If dir2 Then Exit

                Local tileRight := Level.GetTileAt(xVal + 1, yVal)
                If Not tileRight Or Not tileRight.IsWall(False, False, False, False)
                    'LABEL_27
                    dir = Self.bounceDir
                    If Not dir = BounceTrapDirection.Spin
                        'goto LABEL_4
                    End If
                    'goto LABEL_28
                End If

                dir2 = Self.bounceDir
                If dir2 = BounceTrapDirection.Left
                    'goto LABEL_24
                End If

                'LABEL_16
                If dir2 = BounceTrapDirection.Down
                    Local tileBelow := Level.GetTileAt(xVal, yVal + 1)
                    If Not tileBelow Or Not tileBelow.IsWall(False, False, False, False)
                        'goto LABEL_27
                    End If
                    dir2 = Self.bounceDir
                End If

                If dir2 = BounceTrapDirection.Up
                    Local tileAbove := Level.GetTileAt(xVal, yVal - 1)
                    If Not tileAbove Or Not tileAbove.IsWall(False, False, False, False)
                        'goto LABEL_27
                    End If
                    dir2 = Self.bounceDir
                End If

                If dir2 - 8 <= 1
                    dir = dir2
                    'goto LABEL_3
                End If

                i -= 1
                If Not i
                    dir = dir2
                    'goto LABEL_4
                End If
            End While

            If Not dir2 = BounceTrapDirection.Right
                'goto LABEL_16
            End If

            'LABEL_24
            Local tileLeft := Level.GetTileAt(xVal - 1, yVal)
            If Not tileLeft Or Not tileLeft.IsWall(False, False, False, False)
                'goto LABEL_27
            End If
            dir2 = Self.bounceDir
            'goto LABEL_16
        End If

        Self.bounceDir = d

        'LABEL_3
        If dir = BounceTrapDirection.Spin
            'LABEL_28
            Self.bounceDir = Util.RndIntRange(0, 3, True, -1)
            If Util.RndBool(True)
                Self.isRotatingCW = True
            Else
                Self.isRotatingCCW = True
            End If
            dir = Self.bounceDir
        End If

        'LABEL_4
        Local image := New Sprite()

        If dir = BounceTrapDirection.Omni
            image.InitSprite("traps/bouncetrap_omni.png", 14, 16, 12, 1)
        Else If (dir - 4) > 3
            image.InitSprite("traps/bouncetrap.png", 14, 16, 12, 1)
        Else
            image.InitSprite("traps/diagonal_bouncetrap.png", 14, 16, 16, 1)
        End If
        
        image.SetZ(-995.0)
        Self.image = image

        Self.originalDir = Self.bounceDir
    End Method

    Field isRotatingCW: Bool
    Field isRotatingCCW: Bool
    Field bounceDir: Int
    Field originalDir: Int
    Field retractCounter: Int
    Field rotatedBeat: Int = -1

    Method GetFrameToShow: Int()
        Throw New Throwable()
    End Method

    Method Rotate: Void()
        Throw New Throwable()
    End Method

    Method RotateDir: Int(dir: Int, cw: Bool)
        Throw New Throwable()
    End Method

    Method Trigger: Void(ent: Entity)
        Throw New Throwable()
    End Method

    Method Update: Void()
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        Super.NoTrim()
        GetFrameToShow()
        Rotate()
        RotateDir(0, False)
        Trigger(Null)
        Update()
    End Method

End Class

Class BounceTrapDirection

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
