Import trap
Import util

Class BounceTrap Extends Trap

    Function _EditorFix() End

    Method New(xVal: Int, yVal: Int, d: Int)
        Super.New()

        Local dir := d

        Self.type = 1
        Self.x = xVal
        Self.field_68 = 12.0
        Self.y = yVal
        Self.field_64 = 18.0

        If d = -1
            Local i := 499
            While True
                Local dir2 := Util.RndIntRange(0, 3, True, -1)
                Self.direction = dir2

                If dir2 Then Exit

                Local tileRight := Level.GetTileAt(xVal + 1, yVal)
                If Not tileRight Or Not tileRight.IsWall(False, False, False, False)
                    'LABEL_27
                    dir = Self.direction
                    If Not dir = BounceTrapDirection.Spin
                        'goto LABEL_4
                    End If
                    'goto LABEL_28
                End If

                dir2 = Self.direction
                If dir2 = BounceTrapDirection.Left
                    'goto LABEL_24
                End If

                'LABEL_16
                If dir2 = BounceTrapDirection.Down
                    Local tileBelow := Level.GetTileAt(xVal, yVal + 1)
                    If Not tileBelow Or Not tileBelow.IsWall(False, False, False, False)
                        'goto LABEL_27
                    End If
                    dir2 = Self.direction
                End If

                If dir2 = BounceTrapDirection.Up
                    Local tileAbove := Level.GetTileAt(xVal, yVal - 1)
                    If Not tileAbove Or Not tileAbove.IsWall(False, False, False, False)
                        'goto LABEL_27
                    End If
                    dir2 = Self.direction
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
            dir2 = Self.direction
            'goto LABEL_16
        End If

        Self.direction = d

        'LABEL_3
        If dir = BounceTrapDirection.Spin
            'LABEL_28
            Self.direction = Util.RndIntRange(0, 3, True, -1)
            If Util.RndBool(True)
                Self.field_106 = True
            Else
                Self.field_107 = True
            End If
            dir = Self.direction
        End If

        'LABEL_4
        Self.sprite = New Sprite()
        If dir = BounceTrapDirection.Omni
            Self.sprite.InitSprite("traps/bouncetrap_omni.png", 14, 16, 12, 1)
        Else If (dir - 4) > 3
            Self.sprite.InitSprite("traps/bouncetrap.png", 14, 16, 12, 1)
        Else
            Self.sprite.InitSprite("traps/diagonal_bouncetrap.png", 14, 16, 16, 1)
        End If

        Self.sprite.SetZ(-995.0)
        Self.field_110 = Self.direction
    End Method

    Field field_106: Bool
    Field field_107: Bool
    Field direction: Int
    Field field_110: Int
    Field field_114: Int
    Field field_118: Int = -1

    Method GetFrameToShow: Int()
    End Method

    Method Rotate: Void()
    End Method

    Method RotateDir: Int(dir: Int, cw: Bool)
    End Method

    Method Trigger: Void(ent: Entity)
    End Method

    Method Update: Void()
    End Method

    Method NoTrim: Void()
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
    Const Spin: Int = 0

End Class
