'Strict

Import enemy
Import entity
Import logger

Class Bell Extends Enemy

    Global bells: Object

    Function GetBellAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Bell.GetBellAt(Int, Int)")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, num: Int)
        Debug.TraceNotImplemented("Bell.New(Int, Int, Int)")
    End Method

    Field bellNum: Int
    Field isBig: Bool
    Field beingSought: Bool
    Field rungOnBeat: Int
    Field enemy: Enemy

    Method Die: Void()
        Debug.TraceNotImplemented("Bell.Die()")
    End Method

    Method HasBeenRung: Bool()
        Debug.TraceNotImplemented("Bell.HasBeenRung()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Bell.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Ring: Void(makeEnemy: Bool)
        Debug.TraceNotImplemented("Bell.Ring(Bool)")
    End Method

    Method Ringable: Bool()
        Debug.TraceNotImplemented("Bell.Ringable()")
    End Method

    Method SpawnEnemy: Object(xVal: Int, yVal: Int, enemyType: Int)
        Debug.TraceNotImplemented("Bell.SpawnEnemy(Int, Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Bell.Update()")
    End Method

End Class
