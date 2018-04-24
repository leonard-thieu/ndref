'Strict

Import enemy
Import entity
Import logger
Import point
Import sprite

Class Dragon Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Dragon.New(Int, Int, Int)")
    End Method

    Field iceBlast: Sprite
    Field seekDistance: Int
    Field lastFireballBeat: Int
    Field firstFrame: Bool
    Field hasRoared: Bool
    Field playerMoveOverride: Bool
    Field attackState: Int
    Field facingLeft: Bool
    Field iceBlastDuration: Int
    Field iceBlastFaceLeft: Bool
    Field failedLastMove: Bool
    Field hasEarthed: Bool

    Method ClearShot: Object()
        Debug.TraceNotImplemented("Dragon.ClearShot()")
    End Method

    Method DoShot: Void()
        Debug.TraceNotImplemented("Dragon.DoShot()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Dragon.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Dragon.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IceBall: Void()
        Debug.TraceNotImplemented("Dragon.IceBall()")
    End Method

    Method IceBy: Void(dx: Int, dy: Int)
        Debug.TraceNotImplemented("Dragon.IceBy(Int, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Dragon.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Dragon.MoveSucceed(Bool, Bool)")
    End Method

    Method RaiseWallAt: Void(xWall: Int, yWall: Int)
        Debug.TraceNotImplemented("Dragon.RaiseWallAt(Int, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Dragon.Render()")
    End Method

    Method Shoots: Bool()
        Debug.TraceNotImplemented("Dragon.Shoots()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Dragon.Update()")
    End Method

End Class
