'Strict

Import enemy
Import entity
Import logger
Import point
Import sprite

Class Pixie Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Pixie.New(Int, Int, Int)")
    End Method

    Field explosionImg: Sprite
    Field exploded: Bool
    Field dieCounter: Int
    Field explosionFrameCounter: Int
    Field explosionFrame: Int

    Method Die: Void()
        Debug.TraceNotImplemented("Pixie.Die()")
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
