'Strict

Import bouncer
Import enemy
Import entity
Import logger
Import player_class
Import point
Import sprite

Class Gargoyle Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Gargoyle.New(Int, Int, Int)")
    End Method

    Field gustImage: Sprite
    Field determinedContents: Bool
    Field contents: String
    Field hasMoved: Bool
    Field active: Bool
    Field playerGusted: Player
    Field animStartAt: Int
    Field image2: Sprite
    Field bounce2: Bouncer

    Method DetermineContents: Void()
        Debug.TraceNotImplemented("Gargoyle.DetermineContents()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Gargoyle.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Gargoyle.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Gargoyle.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Gargoyle.MoveSucceed(Bool, Bool)")
    End Method

    Method OpenAsCrate: Void(enemyOK: Bool)
        Debug.TraceNotImplemented("Gargoyle.OpenAsCrate(Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Gargoyle.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Gargoyle.Update()")
    End Method

End Class
