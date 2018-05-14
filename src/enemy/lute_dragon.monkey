'Strict

Import enemy.lute_head
Import enemy
Import entity
Import firetrap
Import logger
Import point
Import sprite

Class LuteDragon Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("LuteDragon.New(Int, Int, Int)")
    End Method

    Field head: LuteHead
    Field startX: Int
    Field startY: Int
    Field initialXOff: Int
    Field normalImg: Sprite
    Field magicImg: Sprite
    Field neckSegments: Sprite[]
    Field neckOutlines: Sprite[]
    Field fireTrapsLeft: FireTrap[]
    Field fireTrapsRight: FireTrap[]
    Field retreating: Bool
    Field hasRoared: Bool
    Field justMoved: Bool
    Field vibrateCounter: Int
    Field vibrateOffset: Float
    Field fireSpellUntil: Int
    Field fireTrapIndex: Int

    Method DoFireSpell: Void()
        Debug.TraceNotImplemented("LuteDragon.DoFireSpell()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("LuteDragon.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("LuteDragon.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsDoingFireSpell: Bool()
        Debug.TraceNotImplemented("LuteDragon.IsDoingFireSpell()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("LuteDragon.MoveSucceed(Bool, Bool)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("LuteDragon.PerformMovement(Int, Int)")
    End Method

    Method PerformTween: Void(xVal: Int, yVal: Int, oldX: Int, oldY: Int, tweenType: Int, shadowTweenType: Int, bufferTween: Bool)
        Debug.TraceNotImplemented("LuteDragon.PerformTween(Int, Int, Int, Int, Int, Int, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("LuteDragon.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("LuteDragon.Update()")
    End Method

End Class
