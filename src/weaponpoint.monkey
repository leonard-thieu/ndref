'Strict

Import monkey.list
Import logger
Import point
Import weapon

Class WeaponPoint

    Function _EditorFix: Void() End

    Method New(x: Int, y: Int, wep: Object, strikes: Int, par: Object, dir: Int, sObs: Bool, swpImgNum: Int, dmgMult: Int)
        Debug.TraceNotImplemented("WeaponPoint.New(Int, Int, Object, Int, Object, Int, Bool, Int, Int)")
    End Method

    Field p: Point
    Field weapon: Weapon
    Field numStrikes: Int
    Field strikesThisHit: Int
    Field parent: WeaponPoint
    Field hitDir: Int
    Field stopOnObstruction: Bool
    Field swipeImageNum: Int
    Field damageMultiplier: Int
    Field children: List<Object>
    Field hitThisFrame: Bool

    Method DoesHit: Bool()
        Debug.TraceNotImplemented("WeaponPoint.DoesHit()")
    End Method

    Method GetDamage: Int()
        Debug.TraceNotImplemented("WeaponPoint.GetDamage()")
    End Method

End Class
