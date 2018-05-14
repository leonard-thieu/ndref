'Strict

Import brl.json
Import mojo.graphics
Import enemy
Import entity
Import item
Import logger
Import player_class
Import point
Import sprite
Import util

Class Poltergeist Extends Enemy

    Global theGhoul: Poltergeist

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "ghoul")

        Self.invisible = True
        Self.collides = False
        Self.blink_MIN = 120
        Self.blink_MAX = 240
        Self.blink_DUR = 10

        Self.overrideAttackSound = "ghoulAttack"
        Self.overrideDeathSound = "ghoulDeath"

        Self.image.SetZOff(18.0)

        Local enemyNode := Enemy.GetEnemyXML(Self.xmlName, Self.level)
        Local spritesheetNode := JsonObject(enemyNode.Get("spritesheet"))
        Local path := item.GetString(spritesheetNode, "path", "")
        Local frameW := item.GetInt(spritesheetNode, "frameW", 0)
        Local frameH := item.GetInt(spritesheetNode, "frameH", 0)
        Local numFrames := item.GetInt(spritesheetNode, "numFrames", 1)
        Self.alphaImage = New Sprite(path, frameW, frameH, numFrames, Image.DefaultFlags)
        Self.alphaImage.SetAlphaValue(0.6)
        Self.alphaImage.SetZOff(18.0)

        Self.isWraithLike = True

        Poltergeist.theGhoul = Self

        If Util.IsCharacterActive(Character.Eli)
            Self.coinsToDrop = 0
            Self.Die()
        End If
    End Method

    Field alphaImage: Sprite
    Field multiImage: Bool
    Field hitPlayer: Entity
    Field seeking: Bool
    Field teleporting: Bool
    Field skippedMove: Bool
    Field hasRoared: Bool
    Field beenHit: Bool

    Method BecomeCorporeal: Void(force: Bool)
        Debug.TraceNotImplemented("Poltergeist.BecomeCorporeal(Bool)")
    End Method

    Method CheckCorporeality: Void()
        Debug.TraceNotImplemented("Poltergeist.CheckCorporeality()")
    End Method

    Method Die: Void()
        If Poltergeist.theGhoul = Self
            Poltergeist.theGhoul = Null
        End If

        Super.Die()
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Poltergeist.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Poltergeist.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Poltergeist.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Poltergeist.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Poltergeist.Update()")
    End Method

End Class
