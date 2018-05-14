'Strict

Import monkey.list
Import enemy.conductor
Import enemy
Import entity
Import logger
Import sprite

Class ConductorProp Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("ConductorProp.New(Int, Int, Int)")
    End Method

    Field origXOff: Int
    Field shieldImage: Sprite
    Field parent: Conductor
    Field wireXs: List<Int>
    Field wireYs: List<Int>
    Field vibrateCounter: Int
    Field vibrateOffset: Float
    Field shieldFrameCounter: Int

    Method AddWireAt: Object(wireX: Int, wireY: Int)
        Debug.TraceNotImplemented("ConductorProp.AddWireAt(Int, Int)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("ConductorProp.Die()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("ConductorProp.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IsShielded: Bool()
        Debug.TraceNotImplemented("ConductorProp.IsShielded()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("ConductorProp.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("ConductorProp.Update()")
    End Method

End Class
