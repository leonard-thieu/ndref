'Strict

Import monkey.list
Import enemy
Import entity
Import logger
Import point
Import sprite

Class KingConga Extends Enemy

    Global theKing: Object

    Function DestroyThrone: Void()
        Debug.TraceNotImplemented("KingConga.DestroyThrone()")
    End Function

    Function MissedBeat: Void()
        Debug.TraceNotImplemented("KingConga.MissedBeat()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("KingConga.New(Int, Int, Int)")
    End Method

    Field state: Int
    Field throneDestroyed: Bool
    Field initX: Int
    Field initY: Int
    Field initialXOff: Int
    Field image2: Sprite
    Field zombieFriends: List<Object>
    Field lastBeatNum: Int
    Field lastBeatAnim: Int

    Method AddZombieFriend: Void(z: Object)
        Debug.TraceNotImplemented("KingConga.AddZombieFriend(Object)")
    End Method

    Method CheckZombieFriends: Void()
        Debug.TraceNotImplemented("KingConga.CheckZombieFriends()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("KingConga.Die()")
    End Method

    Method EnterFinalState: Void(playCry: Bool)
        Debug.TraceNotImplemented("KingConga.EnterFinalState(Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("KingConga.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("KingConga.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImmuneToFear: Bool()
        Debug.TraceNotImplemented("KingConga.ImmuneToFear()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("KingConga.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("KingConga.Render()")
    End Method

    Method TeleportBack: Void()
        Debug.TraceNotImplemented("KingConga.TeleportBack()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("KingConga.Update()")
    End Method

End Class
