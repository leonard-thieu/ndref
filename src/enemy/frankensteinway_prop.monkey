'Strict

Import enemy.frankensteinway
Import enemy
Import entity
Import logger

Class FrankensteinwayProp Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("FrankensteinwayProp.New(Int, Int)")
    End Method

    Field parent: Frankensteinway
    Field frameCounter: Int
    Field curFrame: Int

    Method Activate2: Void()
        Debug.TraceNotImplemented("FrankensteinwayProp.Activate2()")
    End Method

    Method Deactivate: Void()
        Debug.TraceNotImplemented("FrankensteinwayProp.Deactivate()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("FrankensteinwayProp.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("FrankensteinwayProp.Update()")
    End Method

End Class
