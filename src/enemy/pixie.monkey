'Strict

Import controller_level_editor
Import enemy
Import entity
Import gamedata
Import level
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

        Self.explosionImg = New Sprite("items/3x3_explosion.png", 8, Image.DefaultFlags)
        Self.explosionImg.SetZOff(1000.0)

        Self.overrideHitSound = "pixieAttack"

        Self.ActivateLight(0.01, 1.5)
    End Method

    Field explosionImg: Sprite
    Field exploded: Bool
    Field dieCounter: Int = -1
    Field explosionFrameCounter: Int = 3
    Field explosionFrame: Int

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
        Debug.TraceNotImplemented("Pixie.Update()")
    End Method

End Class
