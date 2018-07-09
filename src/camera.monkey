'Strict

Import mojo.graphics
Import level
Import callback
Import logger
Import necrodancergame
Import sprite

Class Camera

    Global fadeInCallback: Callback
    Global fadeInCurrent: Int
    Global fadeInDuration: Int
    Global fadeOutCallback: Callback
    Global fadeOutCurrent: Int
    Global fadeOutDuration: Int
    Global fixed: Bool
    Global freezeFrameDelay: Int = -1
    Global freezeFrameNum: Int = -1
    Global freezeImage: Image
    Global lastFreezeFrameH: Int
    Global lastFreezeFrameW: Int
    Global overlayBlack: Sprite
    Global overlayRed: Sprite
    Global overlayRedDuration: Int
    Global overlayWhite: Sprite
    Global overlayWhiteDuration: Int
    Global seekX: Float
    Global seekY: Float
    Global shakeDuration: Int
    Global shakeDurationInitial: Int
    Global shakeOffX: Float
    Global shakeOffY: Float
    Global shakePower: Float
    Global x: Int
    Global y: Int

    Function CaptureFreezeFrame: Void()
        Debug.TraceNotImplemented("Camera.CaptureFreezeFrame()")
    End Function

    Function FadeOutThenExecute: Void(dur: Int, cBack: Callback)
        Camera.fadeOutCallback = cBack
        Camera.fadeOutDuration = dur
        Camera.fadeOutCurrent = dur
    End Function

    Function GetFixedHeight: Int()
        If Level.isReplaying
            Local curReplayData := Level.replay.curReplayData
            If curReplayData <> Null
                Return curReplayData.Value().cameraHeight
            End If
        End If

        Return necrodancergame.FIXED_HEIGHT
    End Function

    Function GetFixedWidth: Int()
        If Level.isReplaying
            Local curReplayData := Level.replay.curReplayData
            If curReplayData <> Null
                Return curReplayData.Value().cameraWidth
            End If
        End If

        Return necrodancergame.FIXED_WIDTH
    End Function

    Function GetX: Float()
        Return Camera.x + Camera.shakeOffX
    End Function

    Function GetY: Float()
        Return Camera.y + Camera.shakeOffY
    End Function

    Function Init: Void()
        Debug.TraceNotImplemented("Camera.Init()")
    End Function

    Function IsOnScreen: Bool(xVal: Int, yVal: Int)
        Local scaledXVal := 24 * xVal
        Local x := Camera.GetX() - (24 * xVal)
        Local cameraWidth := necrodancergame.FIXED_WIDTH
        
        If Level.isReplaying And
           Level.replay.curReplayData <> Null
            cameraWidth = Level.replay.curReplayData.Value().cameraWidth
        End If

        Local xMin := cameraWidth / -2
        Local xMax := (cameraWidth / 2) + 12
        If xMin < x And x < xMax
            Local scaledYVal := 24 * yVal
            Local y := Camera.GetY() - scaledYVal
            Local cameraHeight := necrodancergame.FIXED_HEIGHT
        
            If Level.isReplaying And
               Level.replay.curReplayData <> Null
                cameraHeight = Level.replay.curReplayData.Value().cameraHeight
            End If

            Local yMin := cameraHeight / -2
            Local yMax := (cameraHeight / 2) + 12
            If yMin < y And y < yMax
                Return True
            End If
        End If

        Return False
    End Function

    Function IsOnScreenStandardized: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.IsOnScreenStandardized(Int, Int)")
    End Function

    Function IsOnScreenStandardizedRelativeToPoint: Bool(xVal: Int, yVal: Int, pointX: Int, pointY: Int)
        Local pixelX := pointX - (24 * xVal)
        Local pixelY := pointY - (24 * yVal)

        Return (-239 <= pixelX And pixelX <= 251) And
               (-134 <= pixelY And pixelY <= 146)
    End Function

    Function SetFreezeFrames: Void(num: Int, delay: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.SetFreezeFrames(Int, Int, Int, Int)")
    End Function

    Function Shake: Void(type: Int, xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Camera.Shake(Int, Int, Int)")
    End Function

    Function Update: Void()
        Debug.TraceNotImplemented("Camera.Update()")
    End Function

    Function _EditorFix: Void() End

End Class
