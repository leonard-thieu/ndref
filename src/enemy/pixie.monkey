'Strict

Import controller.controller_level_editor
Import enemy
Import level
Import audio2
Import entity
Import gamedata
Import logger
Import point
Import sprite

Class Pixie Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "pixie")

        Self.hasSilhouette = False
        Self.canMoveOntoPlayer = True

        Self.explosionImg = New Sprite("items/3x3_explosion.png", 8)
        Self.explosionImg.SetZOff(1000.0)

        Self.overrideHitSound = "pixieAttack"

        Self.ActivateLight(0.01, 1.5)
    End Method

    Field explosionImg: Sprite
    Field exploded: Bool
    Field dieCounter: Int = -1
    Field explosionFrameCounter: Int = 3
    Field explosionFrame: Int

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Pixie.CanBeLord()")
    End Method

    Method Die: Void()
        If Not Level.isReplaying And
           ControllerLevelEditor.playingLevel = -1
            GameData.SetKilledEnemy(Self.xmlName, Self.level, True)
        End If

        Super.Die()
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Pixie.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Pixie.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Pixie.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Pixie.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Pixie.Render()")
    End Method

    Method Update: Void()
        If Self.dieCounter > 0
            Self.dieCounter -= 1
            If Self.dieCounter = 0
                Self.Die()
            End If

            Audio.PlayGameSoundAt("pixieDeath", Self.x, Self.y, False, -1, False)
        End If

        If Self.hasBeenVisible
            If Not Self.wasVisibleLastFrame
                Self.wasVisibleLastFrame = True
                Self.currentMoveDelay = 1
            End If
        Else
            Self.currentMoveDelay = 2
        End If

        Super.Update()
    End Method

End Class
