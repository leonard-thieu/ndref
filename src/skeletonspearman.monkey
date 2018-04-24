'Strict

Import enemy
Import entity
Import logger
Import point
Import sprite

Class SkeletonSpearman Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("SkeletonSpearman.New(Int, Int, Int)")
    End Method

    Field spearImage: Sprite
    Field hasHead: Bool
    Field directionHitFrom: Int
    Field hasSpear: Bool
    Field spearStart: Point
    Field spearEnd: Point
    Field spearDir: Int
    Field spearDist: Int
    Field spearRenderTime: Int

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("SkeletonSpearman.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("SkeletonSpearman.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method InitSpearSwipe: Void(origX: Int, origY: Int, tmpXOff: Int, tmpYOff: Int, tmpDir: Int)
        Debug.TraceNotImplemented("SkeletonSpearman.InitSpearSwipe(Int, Int, Int, Int, Int)")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("SkeletonSpearman.MoveImmediate(Int, Int, String)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("SkeletonSpearman.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SkeletonSpearman.Update()")
    End Method

End Class
