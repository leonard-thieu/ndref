'Strict

Import enemy
Import entity
Import logger
Import player_class
Import point
Import util

Class Wraith Extends Enemy

    Global theCursedWraith: Wraith

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "wraith")

        If l = 2 Then Self.isGentle = True
        Self.invisible = True
        Self.collides = False
        Self.blink_MIN = 120
        Self.blink_MAX = 240
        Self.blink_DUR = 10

        Select l
            Case 1
                Self.overrideAttackSound = "wraithAttack"
                Self.overrideDeathSound = "wraithDeath"
                Self.crySound = "wraithCry"
            Default
                Self.overrideDeathSound = "cursewraithDeath"
                Self.crySound = "cursewraithCry"
        End Select

        Self.image.SetZOff(18.0)
        Self.isWraithLike = True

        If l = 2 Then Wraith.theCursedWraith = Self

        If Util.IsCharacterActive(Character.Eli)
            Self.coinsToDrop = 0
            Self.Die()
        End If
    End Method

    Field crySound: String
    Field seeking: Bool
    Field hasRoared: Bool

    Method AfterHitPlayer: Void(p: Object)
        Debug.TraceNotImplemented("Wraith.AfterHitPlayer(Object)")
    End Method

    Method BecomeCorporeal: Void(force: Bool)
        Debug.TraceNotImplemented("Wraith.BecomeCorporeal(Bool)")
    End Method

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Wraith.CanBeDamaged(Bool, Bool)")
    End Method

    Method CheckCorporeality: Void()
        Debug.TraceNotImplemented("Wraith.CheckCorporeality()")
    End Method

    Method Die: Void()
        If Wraith.theCursedWraith = Self
            Wraith.theCursedWraith = Null
        End If

        Super.Die()
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Wraith.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Wraith.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Wraith.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Wraith.Update()")
    End Method

End Class
